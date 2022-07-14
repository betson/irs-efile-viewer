<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8854Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8854Data" select="$RtnDoc/IRS8854"/>
	<xsl:param name="Form8854ScheduleA" select="$RtnDoc/IRS8854/IRS8854ScheduleA"/>
	<xsl:param name="Form8854ScheduleB" select="$RtnDoc/IRS8854/IRS8854ScheduleB"/>
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Begin Template 	-->
	<xsl:template name="PopulateForeignAddressInline">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Delimiter">,</xsl:param>
		<xsl:param name="SpanWidth">width:2px;</xsl:param>
		<xsl:variable name="addressLine2" select="$TargetNode/AddressLine2Txt"/>
		<span>
			<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
		</span>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine1Txt"/>
		</xsl:call-template>
		<!-- Only create line space for AddressLine 2 if it exists -->
		<xsl:if test="$addressLine2 != ''">
			<xsl:value-of select="$Delimiter"/>
			<span>
				<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
			</span>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Only create line space for the City, State, ForeignPostalCd if they exist -->
		<xsl:if test="$TargetNode/CityNm != '' or $TargetNode/ProvinceOrStateNm != '' or $TargetNode/ForeignPostalCd != ''">
			<xsl:value-of select="$Delimiter"/>
			<span>
				<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
			</span>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/CityNm"/>
			</xsl:call-template>
			<!-- Only display a comma between city and state if both city and state exist -->
			<xsl:if test="$TargetNode/CityNm != '' and $TargetNode/ProvinceOrStateNm != ''">,<span style="width:2px;"/>
			</xsl:if>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ProvinceOrStateNm"/>
			</xsl:call-template>
			<span style="width:7px;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ForeignPostalCd"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:value-of select="$Delimiter"/>
		<span>
			<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
		</span>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$TargetNode/CountryCd"/>
		</xsl:call-template>
		<span style="width:6px"/>
	</xsl:template>
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| End Template 	-->
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Begin Template 	-->
	<xsl:template name="CreateDataRowPartVSchA">
		<xsl:param name="A"/>
		<xsl:param name="AStyle"/>
		<xsl:param name="BStyle"/>
		<xsl:param name="CStyle"/>
		<xsl:param name="DStyle"/>
		<xsl:param name="TargetNode" select="/.."/>
		<xsl:param name="Width">28mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div style="float:right;">
			<div class="styLNAmountBox">
				<xsl:attribute name="style">
					width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
					<xsl:if test="$AStyle">
						<xsl:value-of select="$AStyle"/>
					</xsl:if>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$A">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$A"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$A"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$TargetNode/FairMarketValueAmt"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="styLNAmountBox">
				<xsl:attribute name="style">
					width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
					<xsl:if test="$BStyle">
						<xsl:value-of select="$BStyle"/>
					</xsl:if>
				</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/USAdjustedBasisAmt"/>
				</xsl:call-template>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$TargetNode/USAdjustedBasisAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox">
				<xsl:attribute name="style">
					width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
					<xsl:if test="$CStyle">
						<xsl:value-of select="$CStyle"/>
					</xsl:if>
				</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/GainOrLossAmt"/>
				</xsl:call-template>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$TargetNode/GainOrLossAmt"/>
				</xsl:call-template>
			</div>
			<div class="styLNAmountBox">
				<xsl:attribute name="style">
					width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
					<xsl:if test="$DStyle">
						<xsl:value-of select="$DStyle"/>
					</xsl:if>
				</xsl:attribute>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode/FMVBegngDtUSResAmt"/>
				</xsl:call-template>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$TargetNode/FMVBegngDtUSResAmt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| End Template 	-->
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Begin Template 	-->
	<xsl:template name="SetPageEndFooter">
		<xsl:param name="Info"/>
		<xsl:param name="CatNumber"/>
		<xsl:param name="CatNumberSpanWidth">width:30mm;</xsl:param>
		<xsl:param name="PageNumber"/>
		<!-- Page Break and Footer-->
		<div class="pageEnd" style="width:187mm;padding-top:1mm;">
			<xsl:if test="$Info">
				<div style="float:left;">
					<span class="styBoldText">
						<xsl:value-of select="$Info"/>
					</span>
				</div>
			</xsl:if>
			<div style="float:right;">
				<span style="width:40px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">8854</span> (2016)
			</div>
			<xsl:if test="$CatNumber">
				<div style="float:right;">
					<span>
						<xsl:attribute name="style"><xsl:value-of select="$CatNumberSpanWidth"/></xsl:attribute>
						<xsl:value-of select="$CatNumber"/>
					</span>
				</div>
			</xsl:if>
		</div>
		<!-- END Page Break and Footer-->
		<!-- BEGIN Page Header -->
		<div class="styTBB" style="width:187mm;padding-top:.5mm;float:none;clear:both;">
			<div style="float:left;">
				Form 8854 (2016)<span style="width:148mm;"/>
			</div>
			<div style="float:right;">
				Page <span style="font-weight:bold;font-size:8pt;">
					<xsl:value-of select="$PageNumber"/>
				</span>
			</div>
		</div>
		<!-- END Page Header -->
	</xsl:template>
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| End Template 	-->
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Begin Template 	-->
	<xsl:template name="PopulateUSAddressInline">
		<xsl:param name="TargetNode"/>
		<xsl:param name="Delimiter">,</xsl:param>
		<xsl:param name="SpanWidth">width:2px;</xsl:param>
		<xsl:variable name="addressLine2" select="$TargetNode/AddressLine2Txt"/>
		<span>
			<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
		</span>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine1Txt"/>
		</xsl:call-template>
		<!-- Only create line space for AddressLine 2 if it exists -->
		<xsl:if test="$addressLine2 != ''">
			<xsl:value-of select="$Delimiter"/>
			<span>
				<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
			</span>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Only create line space for the City, State, and ForeignPostalCd if they exist -->
		<xsl:if test="$TargetNode/CityNm != '' or $TargetNode/StateAbbreviationCd != '' or $TargetNode/ZIPCd != ''">
			<xsl:value-of select="$Delimiter"/>
			<span>
				<xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute>
			</span>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/CityNm"/>
			</xsl:call-template>
			<!-- Only display a comma between city and state if both city and state exist -->
			<xsl:if test="$TargetNode/CityNm != '' and $TargetNode/StateAbbreviationCd != ''">,<span style="width:2px;"/>
			</xsl:if>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/StateAbbreviationCd"/>
			</xsl:call-template>
			<span style="width:7px;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ZIPCd"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| End Template 	-->
	<!-- /////////////////////////////////////////// (Template:							CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Number"/>
		<xsl:param name="Width">28mm</xsl:param>
		<xsl:param name="Height">4.3mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:26mm;
				height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
				<xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$TargetNode">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
				</xsl:call-template>
				<xsl:if test="$TargetNode/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:3px 0px 0px 0px;
				border-right-width:0px;
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
						<xsl:with-param name="RootElement" select="local-name($Form8854Data)"/>
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
				<meta name="Description" content="IRS Form 8854"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8854Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8854">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;height:auto;">
						<div class="styFNBox" style="width:27mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:0mm;font-size:8pt;">
								Form <span class="styFormNumber">8854</span>
							</div><br />
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8854Data"/>
							</xsl:call-template>
							<br/><br />
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<!-- BEGIN:	Header Title-->
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div class="styFTBox" style="width:130mm;height:22mm;">
							<div class="styMainTitle" style="height:10mm;padding-top:2mm;">Initial and Annual Expatriation Statement</div>
							<div class="styIRS8854LineItem" style="width:100%;height:4mm;">
								<div class="styIRS8854LNDesc" style="width:85mm;padding-left:5mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											For calendar year 2016 or other tax year beginning
											<span style="width:3px;"/>
											<span style="border-bottom:1px dashed black;min-width:10mm;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
											</span>
										</span>
									</span>
								</div>
								<div class="styIRS8854LNDesc" style="width:40mm;padding-left:2mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											, and ending
											<span style="width:3px;"/>
											<span style="border-bottom:1px dashed black;min-width:10mm;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
											</span>
										</span>
									</span>
								</div>
							</div>
							<!-- BEGIN:	2nd Title -->
							<div class="styFST" style="height:7mm;font-size:7pt;margin-left:0.5mm;margin-top:1mm;text-align:center;">
								<span style="width:100%;text-align:center;">
									<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">Information about Form 8854 and its separate instructions is at <span style="font-style:italic;">www.irs.gov/form8854</span>.</span>
									<br />
									<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">Please print or type.</span>
								</span>
							</div>
							<!-- END:	2nd Title -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- END:	Header Title-->
						<div class="styTYBox" style="width:29mm;border-left-width:2px;height:22mm;">
							<div class="styOMB" style="height:auto;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">16</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">112</span>
							</div>
						</div>
					</div>
					<!-- BEGIN: Header section 1 -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styNameBox" style="width:132mm;height:8mm;font-size:7pt;">
							Name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:54.8mm;height:8mm;font-size:7pt;padding-left:2mm;">
							<span class="styNormalText">Identifying number (see instructions)</span>
							<br/>
							<span class="styEINFld" style="width:100%; text-align:left;font-weight:normal;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"></xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END: Header section 1 -->
					<!-- BEGIN: Part I (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							General Information.  <span class="styNormalText">For all filers.</span>
						</div>
					</div>
					<!-- END: Part I (Header)-->
					<!-- BEGIN: Part I (Body) -->
					<!-- ################################################################################# -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">1</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Mailing address and telephone number where you can be reached after expatriation
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp//AddressLine1Txt"/>
									</xsl:call-template><br />
									<xsl:if test="$Form8854Data/AfterExptrtMailAddrPhoneGrp//AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp//AddressLine2Txt"/>
										</xsl:call-template><br />
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp/ForeignAddress"/>
									</xsl:call-template>
									<span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp/ForeignAddress/CountryCd"/>
									</xsl:call-template>
									<br />
									<xsl:if test="$Form8854Data/AfterExptrtMailAddrPhoneGrp/USTelephoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp/USTelephoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$Form8854Data/AfterExptrtMailAddrPhoneGrp/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExptrtMailAddrPhoneGrp/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">2</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Address of principal foreign residence (if different from line 1)<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignResidenceAddress/AddressLine1Txt"/>
									</xsl:call-template><br />
									<xsl:if test="$Form8854Data/ForeignResidenceAddress/AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignResidenceAddress/AddressLine2Txt"/>
										</xsl:call-template><br />
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$Form8854Data/ForeignResidenceAddress"/>
									</xsl:call-template>
									<span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignResidenceAddress/CountryCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:3mm;">
							<div class="styIRS8854LNLeftNumBox">3</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Country of tax residence (if different from line 2)
								<span style="width:3px;"/>
								<span style="width:113.2mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignTaxResidenceCountryCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3 -->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:3mm;">
							<div class="styIRS8854LNLeftNumBox">4</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								<span class="styBoldText">Expatriation date.</span> Check the box that applies (see instructions).
								<br/>
								<br/>
								<!-- ++++++++++++++ 1st Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriod1Ind"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJune42004June162008Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriod1Ind"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJune42004June162008Ind</xsl:with-param>
									</xsl:call-template>
									June 4, 2004 - June 16, 2008. Complete Parts II and V
								</label>
								<br/>
								<!-- ++++++++++++++ 2nd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriod2Ind"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJune172008Dec312008Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriod2Ind"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJune172008Dec312008Ind</xsl:with-param>
									</xsl:call-template>
									June 17, 2008 - December 31, 2015. Complete Part III if:
								</label>
								<!-- ++++++++++++++ Explanation +++++++++++++ -->
								<span style="width:7mm;"/>
								<br/>
								<span style="width:9mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You made an election to defer the payment of tax on a prior year Form 8854,<br/>
								<span style="width:9mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You have an item of eligible deferred compensation, or<br/>
								<span style="width:9mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You have an interest in a nongrantor trust.<br/>
								<span style="width:8mm;"/>
								Otherwise, you don't need to file Form 8854.<br/>
								<!-- ++++++++++++++ 3rd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriodPYInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJanuary12009Dec312009Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtDatePeriodPYInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtJanuary12009Dec312009Ind</xsl:with-param>
									</xsl:call-template>
									January 1, 2016 - December 31, 2016. Complete Parts IV and V
								</label>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4 -->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">5</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Date of notification of expatriating act, termination of residency, or claim of treaty benefits (see instructions).
								<br/>
								<br/>
								<!-- ++++++++++++++ 1st Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotificationCitizenInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotificationCitizenGrpExptrtNotificationCitizenInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotificationCitizenInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotificationCitizenGrpExptrtNotificationCitizenInd</xsl:with-param>
									</xsl:call-template>
									Citizen. Date notification given to Department of State
								</label>
								<span style="width:3mm;"/>
								<span style="width:95mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotifToDeptOfStateDt"/>
									</xsl:call-template>
								</span>
								<br/>
								<!-- ++++++++++++++ 2nd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifLongTermResidentInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermResidentGrpExptrtNotifLongTermResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifLongTermResidentInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermResidentGrpExptrtNotifLongTermResidentInd</xsl:with-param>
									</xsl:call-template>
									Long-term resident. Date notification given to Department of Homeland Security
								</label>
								<span style="width:3mm;"/>
								<span style="width:63mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifToDeptHomelandSecDt"/>
									</xsl:call-template>
								</span>
								<br/>
								<!-- ++++++++++++++ 3rd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermDualResGrpExptrtNotifLongTermDualResInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResInd"/>
										<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermDualResGrpExptrtNotifLongTermDualResInd</xsl:with-param>
									</xsl:call-template>
									Long-term resident with dual residency in a treaty country. Date commencing to be treated, for tax purposes, as a
								</label>
								<br/>
								<span style="width:7mm;"/>
								resident of the treaty country
								<span style="width:3mm;"/>
								<span style="width:40mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResDt"/>
									</xsl:call-template>
								</span>
								<br/>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5 -->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:3mm;">
							<div class="styIRS8854LNLeftNumBox">6</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Number of days you were physically present in the United States in the current year
								<span style="width:3px;"/>
								<span style="width:68.5mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PhysicallyPresUSPYDayCnt"/>
									</xsl:call-template>
								</span>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6 -->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:2mm;">
							<div class="styIRS8854LNLeftNumBox">7</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								List all countries (other than the United States) of which you are a citizen.
							</div>
						</div>
						<div class="styIRS8854LineItem" style="margin-bottom:2mm;">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5mm;">a</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Name of country
								<span style="width:1mm;"/>
								<span style="width:152mm;border-bottom:1px dashed black;">
									<xsl:for-each select="$Form8854Data/CountryCitizenshipGrp">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CountryCd"/>
										</xsl:call-template>
										<span style="width:7mm;"/>
									</xsl:for-each>
								</span>
							</div>
						</div>
						<div class="styIRS8854LineItem" style="margin-bottom:2mm;">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5mm;">b</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Date you became a citizen of each country listed in line 7a
								<span style="width:1mm;"/>
								<span style="width:100mm;border-bottom:1px dashed black;">
									<xsl:for-each select="$Form8854Data/CountryCitizenshipGrp">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="CitizenshipDt"/>
										</xsl:call-template>
										<span style="width:7mm;"/>
									</xsl:for-each>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7 -->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:2mm;">
							<div class="styIRS8854LNLeftNumBox" style="padding-top:2mm;">8</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								How you became a U.S. citizen
								<!-- ++++++++++++++ 1st Checkbox +++++++++++++ -->
								<span style="width:12mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByBirthInd"/>
										<xsl:with-param name="BackupName">IRS8854USCitizenByBirthInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByBirthInd"/>
										<xsl:with-param name="BackupName">IRS8854USCitizenByBirthInd</xsl:with-param>
									</xsl:call-template>
									By birth
								</label>
								<!-- ++++++++++++++ 2nd Checkbox +++++++++++++ -->
								<span style="width:18mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByNaturalizationInd"/>
										<xsl:with-param name="BackupName">IRS8854USCitizenByNaturalizationInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByNaturalizationInd"/>
										<xsl:with-param name="BackupName">IRS8854USCitizenByNaturalizationInd</xsl:with-param>
									</xsl:call-template>
									By naturalization
								</label>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8 -->
					</div>
					<!-- ################################################################################# -->
					<!-- END: Part I (Body) -->
					<!-- BEGIN: Part II (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							For Persons Who Expatriated After June 3, 2004, and Before June 17, 2008
						</div>
					</div>
					<!-- END: Part II (Header)-->
					<!-- BEGIN: Part II (Body) -->
					<!-- ################################################################################# -->
					<div class="styTBB" style="width:187mm;">
						<br/>
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:3mm;">
							<div class="styIRS8854LNLeftNumBox">1</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Did you complete Form 8854 for any period after June 3, 2004, and before June 17, 2008?<br/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="float:left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledDurPeriodNoInd"/>
											<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:168mm;float:left;padding-left:2mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledDurPeriodNoInd"/>
										<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No.</span> 
								</label>
									If you expatriated for immigration purposes after June 3, 2004, and before June 17, 2008, but have not previously 
									filed a Form 8854, you continue to be treated as a U.S. citizen or U.S. lawful permanent resident for U.S. income tax 
									purposes until the day that you file this form.  Because you didn't file Form 8854 for the year of expatriation for 
									immigration purpose, you are subject to the alternative tax in section 877(b) for the 10-year period beginning on the date
									that you file this form (see instructions).
								</span>
								<br />
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span style="float:left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/Form8854FiledDurPeriodYesInd"/>
											<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:168mm;float:left;padding-left:2mm;padding-top:1mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/Form8854FiledDurPeriodYesInd"/>
										<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes. </span></label> 
									Tax year for which Form 8854 first filed
									<span style="width:20mm;border-bottom:1px dashed black;text-align:center;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/Form8854FiledTaxYr"/>
										</xsl:call-template>
									</span>
									. Go to line 2.
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">2</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Were you physically present in the United States for more than 30 days but not more than 60 days<br/>
								during the tax year?
								<span style="width:1px"/>
								<span class="styBoldText" style="float:right;text-align:right;">
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
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
											<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
										<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
											<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/USPresence30To60DaysInd"/>
										<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 2a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">a</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								If you checked "<span class="styBoldText">Yes</span>" to line 2, were you performing services for an unrelated employer?
								<span style="width:6px"/>
								<span class="styBoldText" style="float:right;text-align:right;">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
											<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
										<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
											<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/UnrelatedEmployerServicesInd"/>
										<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2a -->
						<!-- Begin (Line) 2b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="margin-bottom:2mm;">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">b</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								If you checked "<span class="styBoldText">Yes</span>" to line 2a, are you a citizen or resident, fully liable for income tax, in the country in<br/>
								which you were born, your spouse was born, or either of your parents was born?
								<span class="styBoldText" style="float:right;text-align:right;">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
								<br />
								Next: Go to Part V.
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
										<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod1Grp/Form8854FiledGrp/CitizenOrResCountryOfBirthInd"/>
										<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2b -->
					</div>
					<!-- ################################################################################# -->
					<!-- END: Part II (Body) -->
					<!-- END PREPARER SIGNATURE SECTION -->
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="Info">For Paperwork Reduction Act Notice, see separate instructions.</xsl:with-param>
						<xsl:with-param name="CatNumber">Cat. No. 24126N</xsl:with-param>
						<xsl:with-param name="CatNumberSpanWidth">width:53mm;</xsl:with-param>
						<xsl:with-param name="PageNumber">2</xsl:with-param>
					</xsl:call-template>
					<!-- END Page Header -->
					<!-- BEGIN: Part III (Header)-->
					<div style="width:187mm;float:none;clear:both;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							For Persons Who Expatriated After June 16, 2008, and Before January 1, 2016
						</div>
					</div>
					<!-- END: Part III (Header)-->
					<!-- BEGIN: Part III (Body) -->
					<!-- ################################################################################# -->
					<div class="styBB" style="width:187mm;float:none;display:block;">
						<!-- Begin Instructions -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<!-- ++++++++++++++ Explanation +++++++++++++ -->
						<span style="width:5mm;"/>
						<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
						<span style="width:1mm;"/>
								If you made an election to defer the payment of tax, complete line 1.<br/>
						<span style="width:5mm;"/>
						<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
						<span style="width:1mm;"/>
								If you have an item of eligible deferred compensation, complete line 2.<br/>
						<span style="width:5mm;"/>
						<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
						<span style="width:1mm;"/>
								If you have an interest in a nongrantor trust, complete line 3.<br/>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End Instructions -->
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">1</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Complete columns (a), (b), and (c) for all property on which you deferred tax on a prior year Form 8854. Complete<br/>
								column (d) for any property you disposed of in 2016 and see the instructions for Part III.
								<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
								<xsl:if test="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<div class="styGenericDiv" style="width:3.2mm;float:right;">
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp"/>
											<xsl:with-param name="containerHeight" select="7"/>
											<xsl:with-param name="containerID" select=" 'TaxDeferredPropertyPYF8854GrpDiv' "/>
										</xsl:call-template>
										<!-- end button display logic -->
									</div>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								</xsl:if>
							</div>
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<div class="styTableContainerNBB" id="TaxDeferredPropertyPYF8854GrpDiv" style="height:auto;">
							<xsl:call-template name="SetInitialState"/>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--													Table Start																	-->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<table class="styTable" cellspacing="0" style="">
								<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;vertical-align:top;border-top:1px solid black;" scope="col">
											<span class="styBoldText">(a)</span>
											<br/>
											<span class="styNormalText">
												Description of property
											</span>
										</th>
										<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:28%;vertical-align:top;border-top:1px solid black;" scope="col">
											<span class="styBoldText">(b)</span>
											<br/>
											<span class="styNormalText">
												Amount of mark-to-market gain or<br/>(loss) reported on prior year<br/>Form 8854
											</span>
										</th>
										<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:22%;vertical-align:top;border-top:1px solid black;" scope="col">
											<span class="styBoldText">(c)</span>
											<br/>
											<span class="styNormalText">
												Amount of tax deferred on <br/>prior year Form 8854
											</span>
										</th>
										<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;vertical-align:top;border-top:1px solid black;border-right-width:0px;" scope="col">
											<span class="styBoldText">(d)</span>
											<br/>
											<span class="styNormalText">
												Date of disposition (if any)
											</span>
										</th>
									</tr>
								</thead>
								<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
								<tfoot/>
								<tbody>
									<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
									<xsl:if test="($Print != $Separated) or (count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt;= 7)">
										<xsl:for-each select="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp">
											<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
											<!--container height (4), execute-->
											<tr style="font-size: 7pt;vertical-align:top;">
												<!--++++++++++++++++++++++++++++++++++++++-->
												<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PropertyDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<!--++++++++++++++++++++++++++++++++++++++-->
												<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MarkToMarketGainOrLossAmt"/>
													</xsl:call-template>
												</td>
												<!--++++++++++++++++++++++++++++++++++++++-->
												<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
													</xsl:call-template>
												</td>
												<!--++++++++++++++++++++++++++++++++++++++-->
												<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DispositionDt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Table Filler Rows -->
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 1 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
												<xsl:if test="((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 2 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 3 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 4 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 5 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 6 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &lt; 7 or ((count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt;7) and ($Print = $Separated))">
										<tr>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
												<span style="width:4px"/>
											</td>
											<!--++++++++++++++++++++++++++++++++++++++-->
											<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
								</tbody>
							</table>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--													Table End																	    -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp"/>
							<xsl:with-param name="containerHeight" select="7"/>
							<xsl:with-param name="containerID" select=" 'TaxDeferredPropertyPYF8854GrpDiv' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">2</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Did you receive any distributions of eligible deferred compensation items for 2016?
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
											<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
										<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
											<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionReceivedInd"/>
										<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<!-- ++++++++++++++ Other Data+++++++++++++ -->
							<br />
							<div style="width:8mm;float:left;height:4mm;"> </div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								If "Yes," Amount of distribution:
								<span style="width:2mm;"/>
								<span style="width:32mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/DistributionAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:16mm"/>
								Amount withheld at source, if any:
								<span style="width:2mm"/>
								<span style="width:32mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/EligDeferredCompItemsDistriGrp/TotalTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">3</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Did you receive any distributions from a nongrantor trust for 2016?
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
											<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
										<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
											<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionReceivedInd"/>
										<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<!-- ++++++++++++++ Other Data+++++++++++++ -->
							<span style="width:8mm;float:left;height:4mm;"/>
							<div class="styIRS8854LNDesc" style="width:179mm">
								If "Yes," Amount of distribution:
								<span style="width:2mm;"/>
								<span style="width:32mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/DistributionAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:16mm"/>
								Amount withheld at source, if any:
								<span style="width:2mm"/>
								<span style="width:32mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtPeriod2Grp/NongrantorTrustDistriGrp/TotalTaxWithheldAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<br/>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3 -->
					</div>
					<!-- ################################################################################# -->
					<!-- END: Part III (Body) -->
					<!-- BEGIN: Part IV (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							For Persons Who Expatriated During 2016
						</div>
					</div>
					<!-- END: Part IV (Header)-->
					<!-- BEGIN: Section A (Header)-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LNDesc" style="width:18mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Section A</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:50mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Expatriation Information</span>
						</div>
					</div>
					<!-- END: Section A (Header)-->
					<!-- BEGIN: Part IV (Body) -->
					<!-- ################################################################################# -->
					<div class="styTBB" style="width:187mm;float:none;display:block;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">1</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Enter your U.S. income tax liability (after foreign tax credits) for the 5 tax years ending before the date of expatriation.<br/>
								<!-- +++++++++++++++++++++++++++++++ -->
								<div class="styIRS8854LNDesc" style="width:19.5%;padding-left:0px;">
									<div class="styIRS8854LNDesc" style="width:100%;float:none;text-align:center;padding-left:0px;">
										1st Year<br/>Before Expatriation
									</div>
									<div class="styIRS8854LNDesc" style="width:100%;float:none;padding-left:0px;">
										<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
											$<span style="width:2px;"/>
										</div>
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USIncomeTax1stYearBfrExptrtAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- +++++++++++++++++++++++++++++++ -->
								<div class="styIRS8854LNDesc" style="width:19.5%;padding-left:0px;">
									<div class="styIRS8854LNDesc" style="width:100%;float:none;text-align:center;padding-left:0px;">
										2nd Year<br/>Before Expatriation
									</div>
									<div class="styIRS8854LNDesc" style="width:100%;float:none;padding-left:0px;">
										<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
											$<span style="width:2px;"/>
										</div>
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USIncomeTax2ndYearBfrExptrtAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<span style="width:3px;float:left;"/>
								<!-- +++++++++++++++++++++++++++++++ -->
								<div class="styIRS8854LNDesc" style="width:19.5%;padding-left:0px;">
									<div class="styIRS8854LNDesc" style="width:100%;float:none;text-align:center;padding-left:0px;">
										3rd Year<br/>Before Expatriation
									</div>
									<div class="styIRS8854LNDesc" style="width:100%;float:none;padding-left:0px;">
										<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
											$<span style="width:2px;"/>
										</div>
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USIncomeTax3rdYearBfrExptrtAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<span style="width:3px;float:left;"/>
								<!-- +++++++++++++++++++++++++++++++ -->
								<div class="styIRS8854LNDesc" style="width:19.5%;padding-left:0px;">
									<div class="styIRS8854LNDesc" style="width:100%;float:none;text-align:center;padding-left:0px;">
										4th Year<br/>Before Expatriation
									</div>
									<div class="styIRS8854LNDesc" style="width:100%;float:none;padding-left:0px;">
										<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
											$<span style="width:2px;"/>
										</div>
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USIncomeTax4thYearBfrExptrtAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<span style="width:3px;float:left;"/>
								<!-- +++++++++++++++++++++++++++++++ -->
								<div class="styIRS8854LNDesc" style="width:19.5%;padding-left:0px;">
									<div class="styIRS8854LNDesc" style="width:100%;float:none;text-align:center;padding-left:0px;">
										5th Year<br/>Before Expatriation
									</div>
									<div class="styIRS8854LNDesc" style="width:100%;float:none;padding-left:0px;">
										<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
											$<span style="width:2px;"/>
										</div>
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USIncomeTax5thYearBfrExptrtAmt"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<span style="width:3px;float:left;"/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">2</div>
							<div class="styIRS8854LNDesc" style="width:143mm">
								Enter your net worth on the date of your expatriation for tax purposes
								<span style="width:3px"/>
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
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:3mm;padding-left:0px;">
								$<span style="width:2px;"/>
							</div>
							<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/NetWorthOnExptrtDateAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">3</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Did you become at birth a U.S. citizen and a citizen of another country, and do you continue to be a citizen<br/>of, and taxed as a resident of, that other country?
								<span style="width:1px"/>
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
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
											<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
										<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
											<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/DualCitizenBirthUSOthCntryInd"/>
										<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3 -->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">4</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								If you answered "Yes" to question 3, have you been a resident of the United States for not more than 10 of<br/>
								the last 15 tax years?
								<span style="width:1px"/>
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
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
											<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
										<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
											<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/USResNoMoreThan10Of15YrInd"/>
										<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4 -->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">5</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Were you under age 18&#189; on the date you expatriated and have you been a U.S. resident for not more than<br/>
								10 years?
								<span class="styBoldText">
									<span style="width:6px"/>.
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
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
											<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
										<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
											<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/Under18USResLessThan10YrInd"/>
										<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5 -->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">6</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Do you certify under penalties of perjury that you have complied with all of your tax obligations for the 5<br/>
								preceding tax years (see instructions)?
								<span class="styBoldText">
									<span style="width:14px"/>.
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
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
											<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
										<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
											<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExpatriationInformationGrp/InCompliance5PrecTaxYearInd"/>
										<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6 -->
					</div>
					<!-- ################################################################################# -->
					<!-- END: Part IV (Body) -->
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="PageNumber">3</xsl:with-param>
					</xsl:call-template>
					<!-- BEGIN Section B Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LNDesc" style="width:18mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Section B</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:100mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Property Owned on Date of Expatriation</span>
						</div>
					</div>
					<!-- END Section B Header -->
					<!-- BEGIN Section B Body -->
					<!-- ################################################################################# -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin Instructions -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<!-- ++++++++++++++ Explanation +++++++++++++ -->
						<span style="width:3mm;"/>
						<span class="styBoldText">Don't</span> complete Section B if:<br/>
						<div class="styIRS8854LNDesc" style="width:180mm;padding-left:12mm;">
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
								Your average net income tax liability for the 5 tax years immediately before expatriation (see line 1 in Section A) wasn't<br/>
							<span style="width:12px;"/>
								more than $161,000, your net worth (see line 2 in Section A) was under $2 million, and you checked "<span class="styBoldText">Yes</span>" on line 6 in<br/>
							<span style="width:12px;"/>
								Section A;<br/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
									In Section A, you checked "<span class="styBoldText">Yes</span>" on lines 3, 4, and 6; or<br/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
									In Section A, you checked "<span class="styBoldText">Yes</span>" on lines 5 and 6.<br/>
							<br/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End Instructions -->
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 7a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">7a</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Do you have any <b>eligible deferred compensation items?</b> Checking the "Yes" box is an irrevocable waiver<br/>
								of any right to claim any reduction in withholding for such eligible deferred compensation item under any<br/>
								treaty with the United States 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:14px"/>.
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
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:26px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
										<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/EligibleDeferredCompItemsInd"/>
										<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7a -->
						<!-- Begin (Line) 7b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">b</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Do you have any <span class="styBoldText">ineligible deferred compensation items?</span> If "Yes," you must include in income the<br/>
								present value of your account on the day before your expatriation date
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:13px"/>.
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
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
										<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/IneligibleDeferredCompItemsInd"/>
										<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7b -->
						<!-- Begin (Line) 7c -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">c</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Do you have any <span class="styBoldText">specified tax deferred accounts?</span> If "Yes," you must include in income the entire<br/>
								account balance on the day before your expatriation date
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:13px"/>.
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
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
											<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
										<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
											<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/SpecifiedTaxDeferredAccountInd"/>
										<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7c -->
						<!-- Begin (Line) 7d -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">d</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Do you have an interest in a <span class="styBoldText">nongrantor trust?</span> Checking the "Yes" box is a waiver of any right to claim<br/>
								any reduction in withholding on any distribution from such trust under any treaty with the United States<br/>
								unless you make the election below
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:17px"/>.
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
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:26px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
											<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
										<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
											<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/NongrantorTrustInterestInd"/>
										<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<br/>
							<br/>
							<!-- ++++++++++++++ Checkbox Section +++++++++++++ -->
							<span style="width:8mm;float:left;height:4mm;"/>
							<div class="styIRS8854LNDesc" style="width:179mm;">
								<div class="styIRS8854LNDesc" style="width:4mm;padding-left:0px;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/Section877AElectionInd"/>
											<xsl:with-param name="BackupName">IRS8854Section877AElectionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8854LNDesc" style="width:170mm;padding-left:3px;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/Section877AElectionInd"/>
											<xsl:with-param name="BackupName">IRS8854Section877AElectionInd</xsl:with-param>
										</xsl:call-template>
										Check this box to elect under section 877A(f)(4)(B) to be treated as having received the value of your entire interest in the<br/>
										trust (as determined for purposes of section 877A) as of the day before your expatriation date. Attach a copy of your<br/>
										valuation letter ruling issued by the IRS (see instructions).
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/Section877AElectionInd"/>
										</xsl:call-template>
										<br/>
									</label>
								</div>
							</div>
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7d -->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">8</div>
							<div class="styIRS8854LNDesc" style="width:179mm;margin-bottom:2mm;">
								Recognition of gain or loss on the deemed sale of mark-to-market property. <span class="styBoldText">Caution</span>. Don't include in column (a) any property<br/>
								described on line 7a, 7b, 7c, or 7d.
							</div>
							<br/>
							<br/>
							<span style="width:170mm;padding-left:3px;float:left;">
								Complete column (g) only if you are deferring tax on gain from any property listed in column (a).
							</span>
							<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
							<xsl:if test="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styGenericDiv" style="width:3.2mm;float:right;">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp"/>
										<xsl:with-param name="containerHeight" select="7"/>
										<xsl:with-param name="containerID" select=" 'MarkToMarketPropertySaleGrpDiv' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</xsl:if>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styTableContainerNBB" id="MarkToMarketPropertySaleGrpDiv" style="height:auto;">
									<xsl:call-template name="SetInitialState"/>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<!--													Table Start																	-->
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<table class="styTable" cellspacing="0">
										<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
										<thead class="styTableThead">
											<tr>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:100mm;border-top-width:1px;" scope="col">
													<span class="styBoldText">(a)</span><br/>
													<span class="styNormalText">
														Description of property<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:14%;border-top-width:1px;" scope="col">
													<span class="styBoldText">(b)</span><br/>
													<span class="styNormalText">
														Fair market value<br/>on day before date<br/>of expatriation<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:12%;border-top-width:1px;" scope="col">
													<span class="styBoldText">(c)</span><br/>
													<span class="styNormalText">
														Cost or other<br/>basis*<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:12%;border-top-width:1px;" scope="col">
													<span class="styBoldText">(d)</span><br/>
													<span class="styNormalText">
														<span class="styBoldText">Gain or (loss).</span>
														<br/>Subtract (c)<br/>from (b)<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:14%;border-top-width:1px;" scope="col">
													<span class="styBoldText">(e)</span><br/>
													<span class="styNormalText">
														Gain after<br/>allocation of the<br/>exclusion amount<br/>(see instructions)<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:15%;border-top-width:1px;" scope="col">
													<span class="styBoldText">(f)</span><br/>
													<span class="styNormalText">
														Form or Schedule<br/>on which gain<br/>or loss is reported<br/>
													</span>
												</th>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;vertical-align:top;font-size: 7pt; width:13%;border-top-width:1px;border-right-width:0px;" scope="col">
													<span class="styBoldText">(g)</span><br/>
													<span class="styNormalText">
														Amount of tax<br/>deferred (attach<br/>computations)<br/>
													</span>
												</th>
											</tr>
										</thead>
										<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
										<tfoot/>
										<tbody>
											<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
											<xsl:if test="($Print != $Separated) or (count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt;=4)">
												<xsl:for-each select="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp">
												<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
												<!--container height (4), execute-->
													<tr style="font-size: 7pt;vertical-align:top;">
														<!--+++++++++++++++++++A+++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PropertyDesc"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
														<!--++++++++++++++++++++B++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="FairMarketValueDayBfrExptrtAmt"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
														<!--++++++++++++++++++++C++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
															<span class="styIRS8854TableCellPad"/>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisGrp/CostOrOtherBasisAmt"/>
															</xsl:call-template>
															<xsl:if test="CostOrOtherBasisGrp/BasisIrrevocableElectionCd">
																<br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="CostOrOtherBasisGrp/BasisIrrevocableElectionCd"/>
																</xsl:call-template>
															</xsl:if>
														</td>
														<!--+++++++++++++++++++++D+++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
														<!--++++++++++++++++++++++E++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
															<span style="float:left;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="GainAfterAllocationExclAmt"/>
																</xsl:call-template>
															</span>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="GainAfterAllocationExclAmt"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
														<!--+++++++++++++++++++++++F+++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="FormOrSchGainAssetReportedCd"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
														<!--+++++++++++++++++++++++G+++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
															<span style="float:left;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
																</xsl:call-template>
															</span>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
															</xsl:call-template>
															<span class="styIRS8854TableCellPad"/>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 1 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
														<xsl:if test="((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp"/>
															</xsl:call-template>
														</xsl:if>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 2 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 3 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 4 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 5 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 6 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &lt; 7 or ((count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++B++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++C++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++D+++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++E++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++F+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
													</td>
													<!--+++++++++++++++++++++++G+++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;border-right-width:0px;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
										</tbody>
									</table>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<!--													Table End																	    -->
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!-- Set Initial Height of Above Table -->
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp"/>
									<xsl:with-param name="containerHeight" select="7"/>
									<xsl:with-param name="containerID" select=" 'MarkToMarketPropertySaleGrpDiv' "/>
								</xsl:call-template>
								<!-- End Set Initial Height of Above Table -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8 -->
						<!-- Begin (Line) 9 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-top:3mm;">
								9
							</div>
							<div class="styIRS8854LNDesc" style="width:179mm;padding-left:0mm;padding-top:0px;padding-bottom:0px;min-height:6mm;">
								<div class="styIRS8854LNDesc" style="width:75.6mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<span class="stySmallText" style="float:left;padding-top:3.5mm;">
										<span class="styBoldText">Total</span>. Add the amounts in column (d) and column (e)
										<span class="styBoldText">
											<span style="width:12px"/>.
											<span style="width:11px"/>.
										</span>
									</span>
								</div>
								<div class="styIRS8854LNDesc" style="width:103.4mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<div class="styLNAmountBoxNBB" style="width:22.8mm;height:7mm;padding-top:4mm;font-size:6pt;padding-right:2px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/TotalGainOrLossAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBoxNBB" style="width:26.5mm;height:7mm;padding-top:4mm;font-size:6pt;padding-right:2px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/TotGainAfterAllocationExclAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBoxNBB" style="width:28.2mm;height:7mm;background-color:lightgrey;">
										<span class="styIRS8854TableCellPad"/>
									</div>
									<div class="styLNAmountBoxNBB" style="width:24.9mm;height:7mm;background-color:lightgrey;">
										<span class="styIRS8854TableCellPad"/>
									</div>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 9 -->
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 10 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;padding-top:0px;">10</div>
							<div class="styIRS8854LNDesc" style="width:179mm;padding-left:0mm;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNDesc" style="width:75.6mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<span class="stySmallText" style="float:left;padding-top:0px;">
										<span class="styBoldText">Total tax deferred.</span> Add the amounts in column (g). Enter here<br/>and on line 15
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
										</span>
									</span>
								</div>
								<div class="styIRS8854LNDesc" style="width:103.4mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<div class="styLNAmountBoxNBB" style="width:22.8mm;height:7mm;background-color:lightgrey;">
										<span class="styIRS8854TableCellPad"/>
									</div>
									<div class="styLNAmountBoxNBB" style="width:26.5mm;height:7mm;background-color:lightgrey;">
										<span class="styIRS8854TableCellPad"/>
									</div>
									<div class="styLNAmountBoxNBB" style="width:28.2mm;height:7mm;background-color:lightgrey;">
										<span class="styIRS8854TableCellPad"/>
									</div>
									<div class="styLNAmountBoxNBB" style="width:24.9mm;height:7mm;padding-top:4mm;font-size:6pt;">
										<span class="styIRS8854TableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/TotalTaxDeferredAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 10 -->
					</div>
					<div class="styTBB" style="width:187mm;">
						<span style="padding-top:7px;"/>
						<span class="stySmallText" style="padding-left:3px;">
							*You must identify as "(h)(2)" any property for which you are making the special basis election under section 877A(h)(2). 
							This election is irrevocable.<br />
							See the instructions for Part IV, Section B, line 8, column (c).
						</span>
						<br/>
						<br/>
					</div>
					<!-- ################################################################################# -->
					<!-- END Section B Body -->
					<!-- Page Break and Footer-->
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="PageNumber">4</xsl:with-param>
					</xsl:call-template>
					<!-- BEGIN Section C Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LNDesc" style="width:18mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Section C</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:100mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Deferral of Tax</span>
						</div>
					</div>
					<!-- END Section C Header -->
					<!-- BEGIN Section C Body -->
					<!-- ################################################################################# -->
					<!-- Begin (Line) 11 -->
					<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
					<div class="styTBB" style="width:187mm;">
						<div class="styIRS8854LineItem">
							<span style="width:8mm;float:left;height:4mm;"/>
							<div class="styIRS8854LNDesc" style="width:179mm">
								<span class="styBoldText" style="display:inline;">Election to defer tax. </span>
								<span class="styItalicText" style="font-size:7pt;display:inline;"> You can defer tax only if you have provided adequate security. </span>
								Adequate security is described in the instructions.
							</div>
						</div>
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">11</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Are you electing to defer tax under section 877A(b)?<br/>
								Checking the "Yes" box is an irrevocable waiver of any right under any treaty of the<br/>
								United States that would prevent assessment or collection of any tax imposed because of section 877A.<br/>
								<br/>
								<br/>
								If you checked the "Yes" box, continue to line 12. Otherwise, don't complete lines 12 through 15.<br/>
								<br/>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:6mm;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
											<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
										<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
											<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxDeferSect877AbElectionInd"/>
										<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
						</div>
					</div>
					<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					<!-- End (Line) 11 -->
					<div class="styTBB" style="width:187mm;">
						<!-- Begin (Line) 12 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">12</div>
							<div class="styIRS8854LNDesc" style="height:auto;">
									Enter the total tax you would have reported on Form 1040, line 63, for the part of the year<br/>
									including the day before the expatriation date absent the deferral election
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;"><br />12</div>
							<div class="styLNAmountBox" style="width:33mm;height:8mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TotalTaxWithSect877AaAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:4mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4mm;border-bottom-width:0px;float:right;"/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 12-->
						<!-- Begin (Line) 13 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">13</div>
							<div class="styIRS8854LNDesc" style="height:4mm;">
									Enter the total tax for the same part of the tax year determined without regard to the amounts<br/>
									attributable to section 877A(a). Attach computation
									<span style="width:3px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:18px"/>.
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
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:3mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:3mm;width:33mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:4mm;">13</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TotalTaxWithoutSect877AaAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:3mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:3mm;border-bottom-width:0px;float:right;"/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 13-->
						<!-- Begin (Line) 14 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">14</div>
							<div class="styIRS8854LNDesc" style="height:4mm;">
									Subtract line 13 from line 12. <span class="styBoldText">This is the amount of tax eligible for deferral</span>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:13px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">14</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtTaxDeferralGrp/TaxEligibleForDeferralAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:3mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:3mm;border-bottom-width:0px;float:right;"/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14-->
						<!-- Begin (Line) 15 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">15</div>
							<div class="styIRS8854LNDesc" style="height:auto;">
									Enter the total tax deferred from line 10, column (g)
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
									</span>
								<br/>
								<br/>
								<br/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:3px;"/>
									If you are filing Form 1040, enter this amount in brackets to the left of the entry space for line<br/>
									63. Identify as "EXP."<br/>
								<br/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:3px;"/>
									If you are filing Form 1040NR, enter this amount in brackets to the left of the entry space for line<br/>
									61. Identify as "EXP."<br/>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">15</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/PropertyOwnedDtExpatriationGrp/TotalTaxDeferredAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;height:24mm;width:33mm;border-left-width:0px;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:24mm;border-right-width:0px;border-bottom-width:0px;float:right;"/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 15-->
					</div>
					<!-- ################################################################################# -->
					<!-- END Section C Body -->
					<!-- Page Break and Footer-->
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="PageNumber">5</xsl:with-param>
					</xsl:call-template>
					<!-- BEGIN: Part V (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Balance Sheet and Income Statement
						</div>
					</div>
					<!-- END: Part IV (Header)-->
					<!-- BEGIN: Section A (Header)-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LNDesc" style="width:22mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Schedule A</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:50mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Balance Sheet</span>
						</div>
					</div>
					<!-- END: Section A (Header)-->
					<!-- BEGIN: Part V (Body) -->
					<!-- ################################################################################# -->
					<!-- +++++++++++++++ Explanation +++++++++++++++-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem">
							<span style="width:2mm;"/>
								List in U.S. dollars the fair market value (column (a)) and the U.S. adjusted basis (column (b)) of your assets and liabilities as of<br/>
							<span style="width:2mm;"/>
								the following date.<br/>
							<span style="width:3mm;"/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								Part II filers - the end of the tax year for which you are filing the form<br />
							<span style="width:3mm;"/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								Part IV filers - your expatriation date. <strong>Note: </strong> Part IV filers don't complete column (d).<br />
							<span style="width:2mm;"/>
								For more details, see the separate instructions.
						</div>
					</div>
					<!-- +++++++++++++++ Assets Headers +++++++++++++++-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem">
							<!-- Assets -->
							<div class="styIRS8854LNDesc" style="width:40%;height:11mm;float:left;text-align:center;border-right-width:0px;">
								<br/><span class="styBoldText" style="font-size:9pt;">Assets
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA"/>
									</xsl:call-template>
								</span><br/><br/>
							</div>
							<div style="float:right;">
								<!-- Part A -->
								<div class="styIRS8854LNDesc" style="width:28mm;height:11mm;border-left-width:1px;float:left;padding-left:20px;text-align:center;padding-top:2mm;">
									<span class="stySmallText" style="text-align:center;">
										<span class="styBoldText">(a)</span>
										Fair market<br/>value (FMV)<br/>
									</span>
									<br/>
								</div>
								<!-- Part B -->
								<div class="styIRS8854LNDesc" style="width:28mm;height:11mm;border-left-width:1px;float:left;text-align:center;padding-top:2mm;">
									<span class="stySmallText" style="text-align:center;">
										<span class="styBoldText">(b)</span>
										U.S. adjusted<br/>basis<br/>
									</span>
									<br/>
								</div>
								<!-- Part C -->
								<div class="styIRS8854LNDesc" style="width:28mm;height:11mm;border-left-width:1px;float:left;text-align:center;padding-top:1mm;">
									<span class="stySmallText" style="text-align:center;">
										<span class="styBoldText">(c)</span>
										Gain or (loss).<br/>Subtract column (b)<br/>from column (a)<br/>
									</span>
									<br/>
								</div>
								<!-- Part D -->
								<div class="styIRS8854LNDesc" style="width:28mm;height:11mm;border-left-width:1px;float:left;padding:0px 0px 0px 3px;text-align:center;">
									<span class="stySmallText" style="text-align:center;padding-left:0px;">
										<span class="styBoldText">(d)</span>
										FMV on beginning<br/>date of U.S. residency<br/>(optional, for long-term<br/>residents only)<br/>
									</span>
									<br/>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">1</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Cash, including bank deposits
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/CashIncludingBankDepositsGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1-->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">2</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Marketable stock and securities issued by<br/>
									U.S. companies
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/MrktblStockSecIssdByUSCoGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2-->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">3</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Marketable stock and securities issued by<br/>
									foreign companies
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/MrktblStockSecIssdFrgnCoGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3-->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">4</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Nonmarketable stock and securities issued<br/>
									by U.S. companies
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/NonmrktblStockSecIssdUSCoGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4-->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">5</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Nonmarketable stock and securities issued<br/>
									by foreign companies
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/NonmrktblStockSecIssdFrgnCoGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5-->
						<!-- Begin (Line) 5a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" >a</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Separately state stock issued by foreign<br/>
									companies that would be controlled foreign<br/>
									corporations if you were still a U.S. citizen or<br/>
									permanent resident (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">10mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:choose>
								<xsl:when test="count($Form8854ScheduleA/SepStateStockIssdFrgnCoGrp) &gt; 1">
									<div style="float:right;">
										<div class="styLNAmountBox" style="width:28mm;height:4mm;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;">
											See additional data
										</div>
										<div class="styLNAmountBox" style="width:28mm;height:4mm;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;">
											<span class="styTableCellPad"/>
										</div>
										<div class="styLNAmountBox" style="width:28mm;height:4mm;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;">
											<span class="styTableCellPad"/>
										</div>
										<div class="styLNAmountBox" style="width:28mm;height:4mm;border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;">
											<span class="styTableCellPad"/>
										</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="CreateDataRowPartVSchA">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/SepStateStockIssdFrgnCoGrp"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5a-->
						<!-- Begin (Line) 5b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:15mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;">b</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Provide the name, address, and EIN, if any,<br/>
									of any such company 
									<span style="border-bottom:1px solid black;width:30mm;height:3mm;"></span><br />
									<span style="border-bottom:1px solid black;width:96%;min-height:3mm;">
										<xsl:variable name="feiCount" select="(count($Form8854ScheduleA/SepStateStockIssdFrgnCoGrp))"/>
										<xsl:choose>
											<xsl:when test="$feiCount = 1">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/SepStateStockIssdFrgnCoGrp/ForeignEntityDesc"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$feiCount &gt; 1">
												See additional data
											</xsl:when>
											<xsl:otherwise>&#8194;</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">15mm</xsl:with-param>
								<xsl:with-param name="AStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5b-->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:2mm;">6</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Pensions from services performed in the<br/>
									United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/PensionFromSrvcPerfInUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6-->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:2mm;">7</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Pensions from services performed outside<br/>
									the United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/PensionFromSrvcPerfOutsdUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7-->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:2mm;">8</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;height:4mm;">
									Partnership interests (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotalPartnershipInterestGrp"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotalPartnershipInterestGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8-->
						<!-- Begin (Line) 9 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="padding-bottom:0px;">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:2mm;">9</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;padding-bottom:0px;">
									Assets held by trusts you own under<br/>
									sections 671 through 679 (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotAssetsHeldByTrSect671679Grp"/>
									</xsl:call-template>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotAssetsHeldByTrSect671679Grp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 9-->
						<!-- Begin (Line) 10 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">10</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;height:7mm;">
									Beneficial interests in nongrantor trusts (see<br/>
									instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotNongrantorTrBnfclIntGrp"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">2mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotNongrantorTrBnfclIntGrp"/>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="Height">5mm</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 10-->
						<!-- Begin (Line) 11 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">11</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Intangibles used in the United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/IntangiblesUsedInUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 11-->
						<!-- Begin (Line) 12 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">12</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Intangibles used outside the United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/IntangiblesUsedOutsideUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 12-->
						<!-- Begin (Line) 13 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">13</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Loans to U.S. persons
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/LoansToUSPersonsGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 13-->
						<!-- Begin (Line) 14 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">14</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Loans to foreign persons
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/LoansToForeignPersonsGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14-->
						<!-- Begin (Line) 15 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">15</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Real property located in the United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/RealPropertyLocatedInUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 15-->
						<!-- Begin (Line) 16 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">16</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Real property located outside the United States
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/RealPropertyLocatedOutsdUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 16-->
						<!-- Begin (Line) 17 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">17</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Business property located in the United States
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BusinessPropertyInUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 17-->
						<!-- Begin (Line) 18 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">18</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Business property located outside the United States
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BusinessPropertyOutsideUSGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 18-->
						<!-- Begin (Line) 19 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">19</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Other assets (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotalOtherAssetsNotIncludedGrp"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotalOtherAssetsNotIncludedGrp"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 19-->
						<!-- Begin (Line) 20 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">20</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Total assets. Add lines 1 through 5 and lines 6 through 19. Don't include amounts on line 5a in this total
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">7.5mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="TargetNode" select="$Form8854ScheduleA/TotalAssetsDetail"/>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 20-->
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styIRS8854LineItem" style="height:4mm;">
							<!-- Assets -->
							<div class="styIRS8854LNDesc" style="width:40%;height:100%;float:left;text-align:center;border-bottom-width:1px;border-color:black;padding-top:0px;">
								<span class="styBoldText" style="font-size:9pt;">Liabilities</span>
							</div>
							<!-- Part D -->
							<div class="styIRS8854LNDesc" style="width:28mm;height:100%;border-left-width:1px;float:right;padding:0px 0px 0px 3px;text-align:center;background-color:lightgrey;"/>
							<!-- Part C -->
							<div class="styIRS8854LNDesc" style="width:28mm;height:100%;border-left-width:1px;float:right;text-align:center;background-color:lightgrey;"/>
							<!-- Part B -->
							<div class="styIRS8854LNDesc" style="width:28mm;height:100%;border-left-width:1px;float:right;text-align:center;background-color:lightgrey;"/>
							<!-- Part A -->
							<div class="styIRS8854LNDesc" style="width:28mm;height:100%;border-left-width:1px;float:right;padding-left:20px;text-align:center;border-bottom-width:1px;padding-top:0px;">
								<span class="stySmallText" style="text-align:center;">
									<span class="styBoldText" style="font-size:9pt;">Amount</span>
								</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 21 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">21</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Installment obligations
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/InstallmentObligLiabilityAmt"/>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 21-->
						<!-- Begin (Line) 22 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">22</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Mortgages, etc.
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/MortgageLiabilityAmt"/>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 22-->
						<!-- Begin (Line) 23 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:5.2mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">23</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Other liabilities (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/OtherLiabilityAmt"/>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="Height">5.2mm</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 23-->
						<!-- Begin (Line) 24 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4.5mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">24</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Total liabilities. Add lines 21 through 23
									<!--Dotted Line-->
									<span class="styBoldText" style="float:right;">
										.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/TotalLiabilityAmt"/>
								<xsl:with-param name="Height">4.5mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 24-->
					</div>
					<div class="styTBB" style="width:187mm;">
						<!-- Begin (Line) 25 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">25</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									<b>Net worth.</b> Subtract line 24 from line 20, column (a)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:9px"/>.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">3.5mm;</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/NetWorthAmt"/>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 25-->
					</div>
					<xsl:call-template name="SetPageEndFooter">
						<xsl:with-param name="PageNumber">6</xsl:with-param>
					</xsl:call-template>
					<!-- BEGIN: Section B (Header)-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LNDesc" style="width:22mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Schedule B</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:50mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Income Statement</span>
						</div>
					</div>
					<!-- END: Section B (Header)-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem" style="">
							<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;"/>
							<div class="styIRS8854LNDesc" style="height:auto;width:auto;padding-left:3mm;">
								Provide income information for the following period.<br />
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/><span style="width:4px;"/>Part II filers - the tax year for which you are filing the form<br />
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/><span style="width:4px;"/>Part IV filers - the part of the tax year that ends with the day before your expatiration date; but enter -0- for lines 5 through 7.
							</div>
						</div>
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">1</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding-left:0px;">
									U.S. source gross income not effectively connected with the conduct of a U.S. trade or business.
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1-->
						<!-- Begin (Line) 1a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">a</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Interest
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 10px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/InterestAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1a-->
						<!-- Begin (Line) 1b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">b</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Dividends
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 10px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/DividendAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1b-->
						<!-- Begin (Line) 1c -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">c</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Royalties
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 10px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/RoyaltyAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1c-->
						<!-- Begin (Line) 1d -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">d</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Pension distributions
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 10px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1d</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/PensionDistributionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1d-->
						<!-- Begin (Line) 1e -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">e</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Other
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 10px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1e</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/OtherAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1e-->
						<!-- Begin (Line) 1f -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">f</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										<b>Total.</b> Add lines a through e
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 18px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">1f</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncmNECUSTrdBusGrp/TotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1f-->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">2</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Gross income that is effectively connected with the conduct of a U.S. trade or business
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 18px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">2</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncomeEffCnnctUSAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2-->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">3</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Income from the performance of services in the United States
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 18px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">3</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/IncomeFromPerfServiceAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3-->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">4</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Gains from the sale or exchange of:
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 18px 0px 0px;float:right;"/>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4-->
						<!-- Begin (Line) 4a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:100%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">a</div>
								<div class="styIRS8854LNDesc" style="width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="width:auto;padding:0px 0px 0px 0px;">
										Property (other than stock or debt obligations) located in the United
										<br/>States
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;">
											.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:7mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">4a</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainFromSalePropertyInUSAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4a-->
						<!-- Begin (Line) 4b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">b</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Stock issued by a U.S. domestic corporation
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 7px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;">.
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
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">4b</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainFromSaleStockIssueInUSAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4b-->
						<!-- Begin (Line) 4c -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:100%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">c</div>
								<div class="styIRS8854LNDesc" style="width:108mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="width:100%;padding:0px 7px 0px 0px;">
										Debt obligations of U.S. persons or of the United States, a state or<br/>
										political subdivision thereof, or the District of Columbia
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;">.
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
								<div class="styIRS8854LNDesc" style="height:7mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3mm</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">4c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainSaleDebtObligNotCnnctUSAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4c-->
						<!-- Begin (Line) 4d -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-right:7px;text-align:right;">d</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:2px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										<b>Total.</b> Add lines a through c
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 17px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">4d</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/TotGainsFromSaleOrExchangeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4d-->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:auto;">
							<div class="styIRS8854LNDesc" style="width:100%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:auto;padding-left:2mm;">5</div>
								<div class="styIRS8854LNDesc" style="width:142mm;padding:2px 16px 0px 0px;">
									<!--<div class="styIRS8854LNDesc" style="width:100%;padding:2px 0px 0px 0px;">-->
										Income or gain derived from certain foreign corporations to the extent of your share of earnings<br/>
										and profits earned or accumulated before the date of expatriation (see instructions)
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right;">
											.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									<!--</div>-->
								</div>
								<div class="styIRS8854LNDesc" style="height:auto;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Height">3.5mm</xsl:with-param>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">5</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/IncomeOrGainFromForeignCorpAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5-->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">6</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Gains on certain exchanges of property that ordinarily wouldn't be recognized (see instructions)
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 16px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">6</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainCertainExchangePropAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6-->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">7</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Income received or accrued by certain foreign corporations (see instructions)
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 16px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">7</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/IncmRcvdOrAccrCrtnFrgnCorpAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7-->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">8</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Add lines 1f, 2, 3, 4d, 5, 6, and 7
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 16px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">8</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/SumOfIncomeOnSchBAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8-->
						<!-- Begin (Line) 9 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:2mm;">9</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Gross income from all other sources
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 16px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">9</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncomeFromOtherSourcesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 9-->
						<!-- Begin (Line) 10 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">10</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										<b>Total.</b> Add lines 8 and 9
									</div>
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 16px 0px 0px;float:right;">
										<!--Dotted Line-->
										<span class="styBoldText">.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
								</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:34mm;padding:0px 0px 0px 0px;float:right;">
									<xsl:call-template name="CreateBox">
										<xsl:with-param name="Number">10</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/TotalIncomeOnIncomeStmtAmt"/>
										<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
										<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 10-->
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Signature																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem" style="height:26mm;">
							<div class="styIRS8854LNDesc" style="width:20mm;height:100%;padding:0px 0px 0px 0px;border-right-width:1px;border-color:black;">
								<span class="styBoldText" style="font-size:10pt;padding:16px 0px 16px 0px;height:100%">
									Sign Here
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:165.75mm;height:100%;padding:0px 0px 0px 0px;">
								<div class="styIRS8854LNDesc" style="padding:0px 0px 0px 5px;width:100%;height:10mm;">
									Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the 
									best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than filer) is based on all information 
									of which preparer has any knowledge.
									<br/><br/>
								</div>
								<div class="styIRS8854LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:auto;">
									<div class="styIRS8854LNDesc" style="padding:0px 0px 0px 5px;width:90mm;height:16mm;">
										Your signature
									</div>
									<div class="styIRS8854LNDesc" style="padding:0px 0px 0px 5px;width:73mm;height:16mm;border-left-width:1px;border-color:black;">
										Date
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Section																					 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty1040NRIndentSection" style="width:19.8mm;height:16mm;font-weight:bold;font-size:8pt;float:left;clear:left;">
							Paid Preparer Use Only
						</div>
						<div style="width:167.2mm;float:left;border-left:1px solid black;">
							<div style="width:62mm;border-right:1px solid black;padding-left:3px;float:left;">
								Print/Type preparer's name <br />
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:32mm;border-right:1px solid black;padding-left:3px;float:left;">
								Preparer's signature <br />
								&#8194;
							</div>
							<div style="width:24mm;border-right:1px solid black;padding-left:3px;float:left;">
								Date <br />
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:20mm;border-right:1px solid black;padding-left:3px;float:left;">
								<label>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/SelfEmployedLabel</xsl:with-param>
									</xsl:call-template>
									Check 
									<input type="checkbox" class="styCkbox" style="height:10px;width:10px;margin:-2px 4px 0px 1px;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">IRS1040NR/SelfEmployedCheckbox</xsl:with-param>
										</xsl:call-template>
									</input>
									if <br />self-employed
								</label>
							</div>
							<div style="width:28mm;padding-left:3px;float:left;">
								PTIN <br />
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div style="width:167.2mm;float:left;border-top:1px solid black;border-left:1px solid black;">
							<div style="width:130mm;border-right:1px solid black;padding-left:3px;padding-bottom:1px;float:left;">
								<span style="width:19mm;height:3.2mm;float:left;">Firm's name &#9658; </span>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName">
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
							</div>
							<div style="width:36.8mm;padding-left:3px;float:left;">
								Firm's EIN &#9658; 
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:167.2mm;float:left;border-top:1px solid black;border-left:1px solid black;">
							<div style="width:130mm;border-right:1px solid black;padding-left:3px;float:left;">
								<span style="width:22mm;height:6.2mm;float:left;">Firm's address &#9658; </span>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp//AddressLine2Txt"><br />
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:if><br />
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:36.8mm;padding-left:3px;float:left;word-break:break-all;">
								Phone no. <span style="width:6px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8854</span> (2016)
						</div>
					</div>
					<!--END Page Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8854Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- ################################################################################# -->
					<!-- Separated Data for Part I, Line 7a and 7b-->
					<xsl:if test="($Print = $Separated) and  (count($Form8854Data/CountryCitizenshipGroup) &gt; 3)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part I, Line 7a and 7b - List all countries (other than the United States) of which you are a citizen.
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:50%;" scope="col">
										<span class="styBoldText">(a)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Name of country</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:50%;" scope="col">
										<span class="styBoldText">(b)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Date you became a citizen of each country listed in line 7a</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form8854Data/CountryCitizenshipGroup">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
											<xsl:if test="NameofCountry">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameofCountry"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
											<xsl:if test="CitizenshipDt">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CitizenshipDt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
					<!-- Separated Data for Part III, Line 1 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp) &gt; 7)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part III, Line 1 - Property Tax Deferred From Prior Year Form 8854
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;" scope="col">
										<span class="styBoldText">(a)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Description of property<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:28%;" scope="col">
										<span class="styBoldText">(b)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Amount of mark-to-market gain or<br/>(loss) reported on prior year<br/>Form 8854
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:22%;" scope="col">
										<span class="styBoldText">(c)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Amount of tax deferred on<br/>prior year Form 8854<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;" scope="col">
										<span class="styBoldText">(d)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Date of disposition (if any)<br/>
											<br/>
										</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form8854Data/ExptrtPeriod2Grp/PropTaxDeferredPYFrm8854Grp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="MarkToMarketGainOrLossAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DispositionDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
					<!-- Separated Data for Part IV, Section B, Line 8 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp) &gt; 7)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part IV, Section B, Line 8 - Mark To Market Property Sale
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:19%;" scope="col">
										<span class="styBoldText">(a)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Description of property<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:14%;" scope="col">
										<span class="styBoldText">(b)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Fair market value<br/>on day before date<br/>of expatriation<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:12%;" scope="col">
										<span class="styBoldText">(c)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Cost or other<br/>basis*<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:12%;" scope="col">
										<span class="styBoldText">(d)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>
											<span class="styBoldText">Gain or (loss).</span>
											<br/>Subtract (c)<br/>from (b)<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:14%;" scope="col">
										<span class="styBoldText">(e)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Gain after<br/>allocation of the<br/>exclusion amount<br/>(see instructions)<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:15%;" scope="col">
										<span class="styBoldText">(f)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Form or Schedule<br/>on which gain<br/>asset is reported<br/>
										</span>
									</th>
									<!-- +++++++++++++++++++++++++++++++++++-->
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:13%;" scope="col">
										<span class="styBoldText">(g)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Amount of tax<br/>deferred (attach<br/>computations)<br/>
										</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form8854Data/PropertyOwnedDtExpatriationGrp/MarkToMarketPropertySaleGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--+++++++++++++++++++A+++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<!--++++++++++++++++++++B++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueDayBfrExptrtAmt"/>
											</xsl:call-template>
										</td>
										<!--++++++++++++++++++++C++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisGrp/CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<xsl:if test="CostOrOtherBasisGrp/BasisIrrevocableElectionCd">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisGrp/BasisIrrevocableElectionCd"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++++D+++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
											</xsl:call-template>
										</td>
										<!--++++++++++++++++++++++E++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAfterAllocationExclAmt"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="GainAfterAllocationExclAmt"/>
											</xsl:call-template>
										</td>
										<!--+++++++++++++++++++++++F+++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormOrSchGainAssetReportedCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
										</td>
										<!--+++++++++++++++++++++++G+++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="DeferredTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
					<!-- Separated Data for Part V, Schedule A, Line 5b-->
					<xsl:if test="(count($Form8854ScheduleA/SepStateStockIssdFrgnCoGrp) &gt; 1)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part V, Schedule A, Line 5a/b - Separate State Stock Issued By Foreign Companies
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="">
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:60mm;color:white;border-color:black;" scope="col">
										<span class="styBoldText">5b</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Foreign Entity Information</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:32mm;color:white;border-color:black;" scope="col">
										<span class="styBoldText">5a(a)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Fair market value (FMV)</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:32mm;color:white;border-color:black;" scope="col">
										<span class="styBoldText">5a(b)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>U.S. adjusted basis</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:32mm;color:white;border-color:black;" scope="col">
										<span class="styBoldText">5a(c)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Gain or (loss). <br />Subtract column (b) from column (a)</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:32mm;color:white;border-color:black;" scope="col">
										<span class="styBoldText">5a(d)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>FMV on beginning date of U.S. residency</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form8854ScheduleA/SepStateStockIssdFrgnCoGrp">
									<tr style="border-color:black;vertical-align:top;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:60mm;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styIRS8854TableCell" style="width:32mm;font-size: 7pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS8854TableCell" style="width:32mm;font-size: 7pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USAdjustedBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS8854TableCell" style="width:32mm;font-size: 7pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS8854TableCell" style="width:32mm;font-size: 7pt; text-align:right;">
											<span class="styTableCellPad"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVBegngDtUSResAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
