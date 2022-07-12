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
		<xsl:param name="B"/>
		<xsl:param name="BStyle"/>
		<xsl:param name="C"/>
		<xsl:param name="CStyle"/>
		<xsl:param name="D"/>
		<xsl:param name="DStyle"/>
		<xsl:param name="Width">28mm</xsl:param>
		<xsl:param name="Height">4mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
				<xsl:if test="$DStyle">
					<xsl:value-of select="$DStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$D">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$D"/>
				</xsl:call-template>
				<xsl:if test="$D/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$D"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
				<xsl:if test="$CStyle">
					<xsl:value-of select="$CStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$C">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$C"/>
				</xsl:call-template>
				<xsl:if test="$C/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$C"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
				<xsl:if test="$BStyle">
					<xsl:value-of select="$BStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$B">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$B"/>
				</xsl:call-template>
				<xsl:if test="$B/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$B"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;
				<xsl:if test="$AStyle">
					<xsl:value-of select="$AStyle"/>
				</xsl:if>
			</xsl:attribute>
			<xsl:if test="$A">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$A"/>
				</xsl:call-template>
				<xsl:if test="$A/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$A"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
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
				Form <span class="styBoldText" style="font-size:8pt;">8854</span> (2011)
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
		<div class="styTBB" style="width:187mm;padding-top:.5mm;">
			<div style="float:left;">
				Form 8854 (2011)<span style="width:148mm;"/>
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
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;font-size:8pt;">
								Form<span class="styFormNumber">  8854</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8854Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<!-- BEGIN:	Header Title-->
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div class="styFTBox" style="width:125mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">Initial and Annual Expatriation Statement</div>
							<div class="styIRS8854LineItem" style="width:100%;height:4mm;">
								<div class="styIRS8854LNDesc" style="width:85mm;padding-left:5mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											For calendar year 2011 or other tax year beginning
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
										</span>
									</span>
								</div>
								<div class="styIRS8854LNDesc" style="width:40mm;padding-left:2mm;">
									<span class="stySmallText">
										<span class="styBoldText">
											, and ending
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
										</span>
									</span>
								</div>
							</div>
							<!-- BEGIN:	2nd Title -->
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="width:120mm;text-align:left;">
									<span style="width:25mm;"/>
									<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">See separate instructions.</span>
									<span style="width:2mm"/>
									<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:3px;"/>
									<span class="styBoldText">Please print or type.</span>
								</span>
							</div>
							<!-- END:	2nd Title -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- END:	Header Title-->
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:auto;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">11</span>
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
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
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
								<xsl:call-template name="PopulateForeignAddressInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExpatriationMailAddress"/>
								</xsl:call-template>
								<span style="width:4px">-</span>
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$Form8854Data/AfterExpatriationTelephoneNum"/>
								</xsl:call-template>
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
								<xsl:choose>
									<xsl:when test="$Form8854Data/ForeignResidenceAddress">
										<xsl:call-template name="PopulateForeignAddressInline">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignResidenceAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">3</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Country of tax residence (if different from line 2)
								<span style="width:3px;"/>
								<xsl:if test="$Form8854Data/ForeignTaxResidenceCountry">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ForeignTaxResidenceCountry"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3 -->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">4</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								<span class="styBoldText">Expatriation date.</span> Check the box that applies (see instructions).
								<br/>
								<br/>
								<!-- ++++++++++++++ 1st Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/ExptrtJune42004June162008Ind">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJune42004June162008Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJune42004June162008Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:2mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/ExptrtJune42004June162008Ind">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJune42004June162008Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJune42004June162008Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									June 4, 2004 - June 16, 2008. Complete Parts II and V
								</label>
								<br/>
								<br/>
								<!-- ++++++++++++++ 2nd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/ExptrtJune172008Dec312008Ind">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJune172008Dec312008Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJune172008Dec312008Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:2mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/ExptrtJune172008Dec312008Ind">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJune172008Dec312008Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJune172008Dec312008Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									June 17, 2008 - December 31, 2009. Complete Part III
								</label>
								<br/>
								<!-- ++++++++++++++ Explanation +++++++++++++ -->
								<span style="width:7mm;"/>
								if:<br/>
								<span style="width:7mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You made an election to defer the payment of tax in 2008 or 2009,<br/>
								<span style="width:7mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You have an item of eligible deferred compensation, or<br/>
								<span style="width:7mm;"/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:1mm;"/>
								You have an interest in a nongrantor trust.<br/>
								<span style="width:7mm;"/>
								Otherwise, you do not need to file Form 8854.<br/>
								<br/>
								<!-- ++++++++++++++ 3rd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/ExptrtJanuary12009Dec312009Ind">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJanuary12009Dec312009Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJanuary12009Dec312009Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:2mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/ExptrtJanuary12009Dec312009Ind">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtJanuary12009Dec312009Ind"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtJanuary12009Dec312009Ind</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									January 1, 2010 - December 31, 2010. Complete Parts IV and V
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
									<xsl:if test="$Form8854Data/ExptrtNotificationCitizenGrp">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotificationCitizenInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotificationCitizenGrpExptrtNotificationCitizenInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
								<span style="width:2mm;"/>
								<label>
									<xsl:if test="$Form8854Data/ExptrtNotificationCitizenGrp">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotificationCitizenInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotificationCitizenGrpExptrtNotificationCitizenInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									Citizen. Date notification given to Department of State
								</label>
								<span style="width:3mm;"/>
								<xsl:if test="$Form8854Data/ExptrtNotificationCitizenGrp">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotificationCitizenGrp/ExptrtNotifToDeptOfStateDt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<br/>
								<!-- ++++++++++++++ 2st Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/ExptrtNotifLongTermResidentGrp">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifLongTermResidentInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermResidentGrpExptrtNotifLongTermResidentInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:2mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/ExptrtNotifLongTermResidentGrp">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifLongTermResidentInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermResidentGrpExptrtNotifLongTermResidentInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									Long-term resident. Date notification given to Department of Homeland Security
								</label>
								<span style="width:3mm;"/>
								<xsl:if test="$Form8854Data/ExptrtNotifLongTermResidentGrp">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermResidentGrp/ExptrtNotifToDeptHomelandSecDt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<br/>
								<!-- ++++++++++++++ 3rd Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/ExptrtNotifLongTermDualResGrp">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermDualResGrpExptrtNotifLongTermDualResInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:2mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/ExptrtNotifLongTermDualResGrp">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResInd"/>
											<xsl:with-param name="BackupName">IRS8854ExptrtNotifLongTermDualResGrpExptrtNotifLongTermDualResInd</xsl:with-param>
										</xsl:call-template>
								<!--	</xsl:if>-->
									Long-term resident with dual residency in a treaty country. Date commencing to be treated, for tax purposes, as a
								</label>
								<br/>
								<span style="width:7mm;"/>
								resident of the treaty country
								<span style="width:3mm;"/>
								<xsl:if test="$Form8854Data/ExptrtNotifLongTermDualResGrp">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ExptrtNotifLongTermDualResGrp/ExptrtNotifLongTermDualResDt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5 -->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">6</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Number of days you were physically present in the United States in the current year
								<span style="width:3px;"/>
								<xsl:if test="$Form8854Data/NumberOfDaysInUSCnt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8854Data/NumberOfDaysInUSCnt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6 -->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">7</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								List all countries (other than the United States) of which you are a citizen.
								<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
								<xsl:if test="$Form8854Data/CountryCitizenshipGroup">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<div class="styGenericDiv" style="width:3.2mm;float:right;">
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form8854Data/CountryCitizenshipGroup"/>
											<xsl:with-param name="containerHeight" select="3"/>
											<xsl:with-param name="containerID" select=" 'CountryCitizenshipGroupDiv' "/>
										</xsl:call-template>
										<!-- end button display logic -->
									</div>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								</xsl:if>
							</div>
							<xsl:if test="$Form8854Data/CountryCitizenshipGroup">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styTableContainerNBB" id="CountryCitizenshipGroupDiv" style="height:auto;">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<!--													Table Start																	-->
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<xsl:call-template name="SetInitialState"/>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<table class="styTable" cellspacing="0">
										<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;" scope="col">
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
												<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
												<!--container height (4), execute-->
												<xsl:if test="($Print != $Separated) or (count($Form8854Data/CountryCitizenshipGroup) &lt;=3)">
													<tr style="font-size: 7pt;">
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
												</xsl:if>
											</xsl:for-each>
											<!-- Table Filler Rows -->
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/CountryCitizenshipGroup) &lt; 1 or ((count($Form8854Data/CountryCitizenshipGroup) &gt;3) and ($Print = $Separated))">
												<tr>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
														<xsl:if test="((count($Form8854Data/CountryCitizenshipGroup) &gt;3) and ($Print = $Separated))">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$Form8854Data/CountryCitizenshipGroup"/>
															</xsl:call-template>
														</xsl:if>
													</td>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/CountryCitizenshipGroup) &lt; 2 or ((count($Form8854Data/CountryCitizenshipGroup) &gt;3) and ($Print = $Separated))">
												<tr>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/CountryCitizenshipGroup) &lt; 3 or ((count($Form8854Data/CountryCitizenshipGroup) &gt;3) and ($Print = $Separated))">
												<tr>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:50%;font-size: 7pt; text-align:center;">
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
									<xsl:with-param name="TargetNode" select="$Form8854Data/CountryCitizenshipGroup"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'CountryCitizenshipGroupDiv' "/>
								</xsl:call-template>
								<!-- End Set Initial Height of Above Table -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</xsl:if>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7 -->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">8</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								How you became a U.S. citizen
								<!-- ++++++++++++++ 1st Checkbox +++++++++++++ -->
								<span style="width:12mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/USCitizenByBirthInd">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854USCitizenByBirthInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:1mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/USCitizenByBirthInd">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854USCitizenByBirthInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									By birth
								</label>
								<!-- ++++++++++++++ 2nd Checkbox +++++++++++++ -->
								<span style="width:18mm;"/>
								<input type="checkbox" class="styCkbox">
									<!--<xsl:if test="$Form8854Data/USCitizenByNaturalizationInd">-->
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByNaturalizationInd"/>
											<xsl:with-param name="BackupName">IRS8854USCitizenByNaturalizationInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
								</input>
								<span style="width:1mm;"/>
								<label>
									<!--<xsl:if test="$Form8854Data/USCitizenByNaturalizationInd">-->
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USCitizenByNaturalizationInd"/>
											<xsl:with-param name="BackupName">IRS8854USCitizenByNaturalizationInd</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
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
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">1</div>
							<div class="styIRS8854LNDesc" style="width:179mm">
								Did you complete Form 8854 for any period after June 3, 2004, and before June 17, 2008?<br/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/Form8854AftrJune04BfrJune08Ind">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
												<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:if test="$Form8854Data/Form8854AftrJune04BfrJune08Ind">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
											<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">No. STOP.</span> You must complete Form 8854 for the year in which you expatriated for immigration
									<br/>
									<span style="width:7mm;"/>
									purposes before filing this form (see instructions).
									<br/>
								</label>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span style="width:1mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/Form8854AftrJune04BfrJune08Ind">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
												<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:if test="$Form8854Data/Form8854AftrJune04BfrJune08Ind">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854AftrJune04BfrJune08Ind"/>
											<xsl:with-param name="BackupName">IRS8854Form8854AftrJune04BfrJune08Ind</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes.</span> Tax year for which Form 8854 first filed
									<span style="width:2mm;"/>
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8854Data/Form8854FiledTaxYr"/>
									</xsl:call-template>
									<span style="width:2mm;"/>
									. Go to line 2.
									<br/>
								</label>
							</div>
						</div>
						<br/>
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
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/USPresence30To60DaysInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
												<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/USPresence30To60DaysInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
											<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/USPresence30To60DaysInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
												<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/USPresence30To60DaysInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USPresence30To60DaysInd"/>
											<xsl:with-param name="BackupName">IRS8854USPresence30To60DaysInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								If you checked “<span class="styBoldText">Yes</span>” to line 2, were you performing services for an unrelated employer?
								<span style="width:6px"/>
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/UnrelatedEmployerServicesBoInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
												<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/UnrelatedEmployerServicesBoInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
											<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/UnrelatedEmployerServicesBoInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
												<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/UnrelatedEmployerServicesBoInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/UnrelatedEmployerServicesBoInd"/>
											<xsl:with-param name="BackupName">IRS8854UnrelatedEmployerServicesBoInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:5.5mm;">b</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								If you checked “<span class="styBoldText">Yes</span>” to line 2a, are you a citizen or resident, fully liable for income tax, in the country in<br/>
								which you were born, your spouse was born, or either of your parents was born?
								<span style="width:14px"/>
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
								<br/>
								Next: Go to Part V.
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:14px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/CitizenOrResCountryOfBirthInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
												<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/CitizenOrResCountryOfBirthInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/CitizenOrResCountryOfBirthInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
												<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/CitizenOrResCountryOfBirthInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/CitizenOrResCountryOfBirthInd"/>
											<xsl:with-param name="BackupName">IRS8854CitizenOrResCountryOfBirthInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
							For Persons Who Expatriated After June 16, 2008, and Before January 1, 2010
						</div>
					</div>
					<!-- END: Part III (Header)-->
					<!-- BEGIN: Part III (Body) -->
					<!-- ################################################################################# -->
					<div class="styBB" style="width:187mm;">
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
								Complete columns (a), (b), and (c) for all property on which you deferred tax on your 2008 or 2009 Form 8854. Complete<br/>
								column (d) for any property you disposed of in 2010 and see the instructions for Part III.
								<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
								<xsl:if test="$Form8854Data/TaxDeferredPropertyPYF8854Grp/TaxDeferredAmt">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<div class="styGenericDiv" style="width:3.2mm;float:right;">
										<!-- button display logic -->
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$Form8854Data/TaxDeferredPropertyPYF8854Grp"/>
											<xsl:with-param name="containerHeight" select="7"/>
											<xsl:with-param name="containerID" select=" 'TaxDeferredPropertyPYF8854GrpDiv' "/>
										</xsl:call-template>
										<!-- end button display logic -->
									</div>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								</xsl:if>
							</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styTableContainerNBB" id="TaxDeferredPropertyPYF8854GrpDiv" style="height:auto;">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<!--													Table Start																	-->
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<xsl:call-template name="SetInitialState"/>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<table class="styTable" cellspacing="0">
										<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;" scope="col">
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
														<span style="width:1mm;"/>Amount of mark-to-market gain or<br/>(loss) reported in 2008 or 2009<br/>
														<br/>
													</span>
												</th>
												<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:22%;" scope="col">
													<span class="styBoldText">(c)<br/>
													</span>
													<span class="styNormalText">
														<span style="width:1mm;"/>Amount of tax deferred in<br/>2008 or 2009<br/>
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
											<xsl:for-each select="$Form8854Data/TaxDeferredPropertyPYF8854Grp">
												<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
												<!--container height (4), execute-->
												<xsl:if test="($Print != $Separated) or (count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt;=7)">
													<tr style="font-size: 7pt;">
														<!--++++++++++++++++++++++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
															<xsl:if test="PropertyDescription">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PropertyDescription"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
															<xsl:if test="MarkToMarketGainOrLossAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="MarkToMarketGainOrLossAmt"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
															<xsl:if test="TaxDeferredAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="TaxDeferredAmt"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
															<xsl:if test="DateOfDisposition">
																<xsl:call-template name="PopulateMonthDayYear">
																	<xsl:with-param name="TargetNode" select="DateOfDisposition"/>
																</xsl:call-template>
																<span class="styTableCellPad"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
											<!-- Table Filler Rows -->
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 1 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--++++++++++++++++++++++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
														<span style="width:4px"/>
														<xsl:if test="((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$Form8854Data/TaxDeferredPropertyPYF8854Grp"/>
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 2 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 3 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 4 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 5 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 6 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &lt; 7 or ((count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
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
									<xsl:with-param name="TargetNode" select="$Form8854Data/TaxDeferredPropertyPYF8854Grp"/>
									<xsl:with-param name="containerHeight" select="7"/>
									<xsl:with-param name="containerID" select=" 'TaxDeferredPropertyPYF8854GrpDiv' "/>
								</xsl:call-template>
								<!-- End Set Initial Height of Above Table -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<br/>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox">2</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Did you receive any distributions of eligible deferred compensation items for 2010?
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/DeferdCompItemsDistriInCYInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
												<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/DeferdCompItemsDistriInCYInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
											<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/DeferdCompItemsDistriInCYInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
												<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/DeferdCompItemsDistriInCYInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYInd"/>
											<xsl:with-param name="BackupName">IRS8854DeferdCompItemsDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<!-- ++++++++++++++ Other Data+++++++++++++ -->
							<span style="width:8mm;float:left;"/>
							<div class="styIRS8854LNDesc" style="width:179mm">
								If “Yes,” Amount of distribution:
								<span style="width:2mm;"/>
								<span style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompItemsDistriInCYAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:16mm"/>
								Amount withheld at source, if any:
								<span style="width:2mm"/>
								<span style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/DeferdCompDistriWthldAtSrcAmt"/>
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
								Did you receive any distributions from a nongrantor trust for 2010?
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/NongrantorTrustDistriInCYInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
												<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/NongrantorTrustDistriInCYInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
											<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/NongrantorTrustDistriInCYInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
												<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/NongrantorTrustDistriInCYInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYInd"/>
											<xsl:with-param name="BackupName">IRS8854NongrantorTrustDistriInCYInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<!-- ++++++++++++++ Other Data+++++++++++++ -->
							<span style="width:8mm;float:left;"/>
							<div class="styIRS8854LNDesc" style="width:179mm">
								If “Yes,” Amount of distribution:
								<span style="width:2mm;"/>
								<span style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriInCYAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:16mm"/>
								Amount withheld at source, if any:
								<span style="width:2mm"/>
								<span style="width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/NongrantorTrustDistriWthldAmt"/>
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
							For Persons Who Expatriated During 2010
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
					<div class="styTBB" style="width:187mm;">
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
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USIncomeTax1stYearBfrExptrtAmt"/>
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
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USIncomeTax2ndYearBfrExptrtAmt"/>
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
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USIncomeTax3rdYearBfrExptrtAmt"/>
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
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USIncomeTax4thYearBfrExptrtAmt"/>
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
										<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USIncomeTax5thYearBfrExptrtAmt"/>
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
							<div class="styIRS8854LNDesc" style="width:30mm;padding-left:0px;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/NetWorthOnExptrtDateAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/DualCitizenAtBirthAndContInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
												<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/DualCitizenAtBirthAndContInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
											<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/DualCitizenAtBirthAndContInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
												<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/DualCitizenAtBirthAndContInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/DualCitizenAtBirthAndContInd"/>
											<xsl:with-param name="BackupName">IRS8854DualCitizenAtBirthAndContInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								If you answered “Yes” to question 3, have you been a resident of the United States for not more than 10 of<br/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/USResForNoMoreThan10Of15YrInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
												<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/USResForNoMoreThan10Of15YrInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
											<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/USResForNoMoreThan10Of15YrInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
												<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/USResForNoMoreThan10Of15YrInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/USResForNoMoreThan10Of15YrInd"/>
											<xsl:with-param name="BackupName">IRS8854USResForNoMoreThan10Of15YrInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								Were you under age 18<span style="font-size: 6pt;">1/2</span> on the date you expatriated and have you been a U.S. resident for not more than<br/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/Under18AndUSResLessThan10YrInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
												<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/Under18AndUSResLessThan10YrInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
											<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/Under18AndUSResLessThan10YrInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
												<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/Under18AndUSResLessThan10YrInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/Under18AndUSResLessThan10YrInd"/>
											<xsl:with-param name="BackupName">IRS8854Under18AndUSResLessThan10YrInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/InComplianceFor5PrecTaxYearInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/InComplianceFor5PrecTaxYearInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
											<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/InComplianceFor5PrecTaxYearInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
												<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/InComplianceFor5PrecTaxYearInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/InComplianceFor5PrecTaxYearInd"/>
											<xsl:with-param name="BackupName">IRS8854InComplianceFor5PrecTaxYearInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
						<span class="styBoldText">Do not</span> complete Section B if:<br/>
						<div class="styIRS8854LNDesc" style="width:180mm;padding-left:12mm;">
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
								Your average net income tax liability for the 5 tax years immediately before expatriation (see line 1 in Section A) was not<br/>
							<span style="width:12px;"/>
								more than $145,000, your net worth (see line 2 in Section A) was under $2 million, and you checked “<span class="styBoldText">Yes</span>” on line 6 in<br/>
							<span style="width:12px;"/>
								Section A;<br/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
									In Section A, you checked “<span class="styBoldText">Yes</span>” on lines 3, 4, and 6; or<br/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
									In Section A, you checked “<span class="styBoldText">Yes</span>” on lines 5 and 6.<br/>
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
								Do you have any <b>eligible deferred compensation items?</b> Checking the “Yes” box is an irrevocable waiver<br/>
								of any right to claim any reduction in withholding for such eligible deferred compensation item under any<br/>
								treaty with the United States 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/EligibleDeferredCompItemsInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
												<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/EligibleDeferredCompItemsInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/EligibleDeferredCompItemsInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
												<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/EligibleDeferredCompItemsInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/EligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854EligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								Do you have any <span class="styBoldText">ineligible deferred compensation items?</span> If “Yes,” you must include in income the<br/>
								present value of your account on the day before your expatriation date
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/IneligibleDeferredCompItemsInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
												<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/IneligibleDeferredCompItemsInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/IneligibleDeferredCompItemsInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
												<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/IneligibleDeferredCompItemsInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/IneligibleDeferredCompItemsInd"/>
											<xsl:with-param name="BackupName">IRS8854IneligibleDeferredCompItemsInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								Do you have any <span class="styBoldText">specified tax deferred accounts?</span> If “Yes,” you must include in income the entire<br/>
								account balance on the day before your expatriation date
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/SpecifiedTaxDeferredAccountInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
												<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/SpecifiedTaxDeferredAccountInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
											<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/SpecifiedTaxDeferredAccountInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
												<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/SpecifiedTaxDeferredAccountInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/SpecifiedTaxDeferredAccountInd"/>
											<xsl:with-param name="BackupName">IRS8854SpecifiedTaxDeferredAccountInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
								Do you have an interest in a <span class="styBoldText">nongrantor trust?</span> Checking the “Yes” box is a waiver of any right to claim<br/>
								any reduction in withholding on any distribution from such trust under any treaty with the United States<br/>
								unless you make the election below
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/InterestInNongrantorTrustInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
												<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/InterestInNongrantorTrustInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
											<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/InterestInNongrantorTrustInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
												<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/InterestInNongrantorTrustInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/InterestInNongrantorTrustInd"/>
											<xsl:with-param name="BackupName">IRS8854InterestInNongrantorTrustInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">No</span>
								</label>
								<br/>
							</div>
							<br/>
							<br/>
							<!-- ++++++++++++++ Checkbox Section +++++++++++++ -->
							<span style="width:8mm;float:left;"/>
							<div class="styIRS8854LNDesc" style="width:179mm;">
								<div class="styIRS8854LNDesc" style="width:4mm;padding-left:0px;">
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/Section877AElectionInd">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Section877AElectionInd"/>
												<xsl:with-param name="BackupName">IRS8854Section877AElectionInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</div>
								<div class="styIRS8854LNDesc" style="width:170mm;padding-left:3px;">
									<label>
										<xsl:if test="$Form8854Data/Section877AElectionInd">
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8854Data/Section877AElectionInd"/>
												<xsl:with-param name="BackupName">IRS8854Section877AElectionInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										Check this box to elect under section 877A(f)(4)(B) to be treated as having received the value of your entire interest in the<br/>
										trust (as determined for purposes of section 877A) as of the day before your expatriation date. Attach a copy of your<br/>
										valuation letter ruling issued by the IRS (see instructions).<br/>
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
							<div class="styIRS8854LNDesc" style="width:179mm">
								Recognition of gain or loss on the deemed sale of mark-to-market property. <span class="styBoldText">Caution</span>. Do not include in column (a) any property<br/>
								described on line 7a, 7b, 7c, or 7d.
							</div>
							<br/>
							<br/>
							<span style="width:170mm;padding-left:3px;float:left;">
								Complete column (g) only if you are deferring tax on gain from any property listed in column (a).
							</span>
							<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
							<xsl:if test="$Form8854Data/MarkToMarketPropertySaleGrp/PropertyDescription">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styGenericDiv" style="width:3.2mm;float:right;">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form8854Data/MarkToMarketPropertySaleGrp"/>
										<xsl:with-param name="containerHeight" select="7"/>
										<xsl:with-param name="containerID" select=" 'MarkToMarketPropertySaleGrpDiv' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</xsl:if>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styTableContainerNBB" id="MarkToMarketPropertySaleGrpDiv" style="height:auto;">
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<!--													Table Start																	-->
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<xsl:call-template name="SetInitialState"/>
									<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
									<table class="styTable" cellspacing="0">
										<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
										<thead class="styTableThead">
											<tr>
												<!-- +++++++++++++++++++++++++++++++++++-->
												<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;" scope="col">
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
											<xsl:for-each select="$Form8854Data/MarkToMarketPropertySaleGrp">
												<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
												<!--container height (4), execute-->
												<xsl:if test="($Print != $Separated) or (count($Form8854Data/MarkToMarketPropertySaleGrp) &lt;=4)">
													<tr style="font-size: 7pt;">
														<!--+++++++++++++++++++A+++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
															<xsl:if test="PropertyDescription">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="PropertyDescription"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++B++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
															<xsl:if test="FairMarketValueDayBfrExptrtAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="FairMarketValueDayBfrExptrtAmt"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++C++++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
															<xsl:if test="CostOrOtherBasisAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--+++++++++++++++++++++D+++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
															<xsl:if test="GainOrLossAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--++++++++++++++++++++++E++++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
															<xsl:if test="GainAfterAllocationOfExclAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="GainAfterAllocationOfExclAmt"/>
																</xsl:call-template>
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="GainAfterAllocationOfExclAmt"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--+++++++++++++++++++++++F+++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
															<xsl:if test="FormOrSchGainAssetReported">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="FormOrSchGainAssetReported"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
														<!--+++++++++++++++++++++++G+++++++++++++++-->
														<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
															<xsl:if test="TaxDeferredAmt">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="TaxDeferredAmt"/>
																</xsl:call-template>
																<span class="styIRS8854TableCellPad"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
											<!-- Table Filler Rows -->
											<!-- JMI: added: or.... -->
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 1 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
												<tr>
													<!--+++++++++++++++++++A+++++++++++++++++++-->
													<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
														<span style="width:4px"/>
														<xsl:if test="((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$Form8854Data/MarkToMarketPropertySaleGrp"/>
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 2 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 3 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 4 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 5 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 6 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
														<span style="width:4px"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($Form8854Data/MarkToMarketPropertySaleGrp) &lt; 7 or ((count($Form8854Data/MarkToMarketPropertySaleGrp) &gt;7) and ($Print = $Separated))">
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
													<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
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
									<xsl:with-param name="TargetNode" select="$Form8854Data/MarkToMarketPropertySaleGrp"/>
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
							<div class="styIRS8854LNLeftNumBox" style="padding-top:5px;">
								9
							</div>
							<div class="styIRS8854LNDesc" style="width:179mm;padding-left:0mm;padding-top:0px;padding-bottom:0px;height:6mm;">
								<div class="styIRS8854LNDesc" style="width:75.6mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<span class="stySmallText" style="float:left;padding-top:7px;">
										<span class="styBoldText">Total</span>. Add the amounts in column (d) and column (e)
										<span class="styBoldText">
											<span style="width:12px"/>.
											<span style="width:11px"/>.
										</span>
									</span>
								</div>
								<div class="styIRS8854LNDesc" style="width:103.4mm;padding-left:1mm;padding-top:0px;padding-bottom:0px;">
									<div class="styLNAmountBoxNBB" style="width:25mm;height:2mm;float:right;padding-top:0px;background-color:lightgrey;border-top-width:1px;border-right-width:1px;border-color:#000000;"/>
									<div class="styLNAmountBoxNBB" style="width:28mm;height:2mm;float:right;padding-top:0px;background-color:lightgrey;border-top-width:1px;border-color:#000000;"/>
									<div class="styLNAmountBoxNBB" style="width:26.5mm;height:2mm;float:right;padding-top:0px;border-top-width:1px;border-color:#000000;"/>
									<div class="styLNAmountBoxNBB" style="width:23mm;height:2mm;float:right;padding-top:0px;border-top-width:1px;border-color:#000000;"/>
									<div class="styLNAmountBoxNBB" style="width:25mm;height:4mm;border-color:#000000;float:right;padding-top:0px;background-color:lightgrey;border-right-width:1px;border-color:"/>
									<div class="styLNAmountBoxNBB" style="width:28mm;height:4mm;border-color:#000000;float:right;padding-top:0px;background-color:lightgrey;"/>
									<span style="font-size:6pt;">
										<div class="styLNAmountBoxNBB" style="width:26.5mm;height:4mm;border-color:#000000;float:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/TotalGainAfterAllocnOfExclAmt"/>
											</xsl:call-template>
										</div>
										<div class="styLNAmountBoxNBB" style="width:22.9mm;height:4mm;border-color:#000000;float:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/TotalGainOrLossAmt"/>
											</xsl:call-template>
										</div>
									</span>
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
									<div class="styLNAmountBoxNBB" style="width:25mm;height:2mm;float:right;padding-top:0px;border-right-width:1px;"/>
									<div class="styLNAmountBoxNBB" style="width:28mm;height:2mm;float:right;padding-top:0px;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="width:26.5mm;height:2mm;float:right;padding-top:0px;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="width:22.9mm;height:2mm;float:right;padding-top:0px;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="width:25mm;height:4mm;border-color:#000000;float:right;border-bottom:0px;border-right-width:1px;padding-right:2px;">
										<span style="font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form8854Data/TotalTaxDeferredAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styLNAmountBoxNBB" style="width:28mm;height:4mm;border-color:#000000;float:right;background-color:lightgrey;border-bottom:0px;"/>
									<div class="styLNAmountBoxNBB" style="width:26.5mm;height:4mm;border-color:#000000;float:right;padding-right:4px;background-color:lightgrey;border-bottom:0px;"/>
									<div class="styLNAmountBoxNBB" style="width:22.9mm;height:4mm;border-color:#000000;float:right;padding-right:4px;background-color:lightgrey;border-bottom:0px;"/>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 10 -->
					</div>
					<div class="styTBB" style="width:187mm;">
						<span style="padding-top:7px;"/>
						<span class="stySmallText" style="padding-left:3px;">
							*You must designate any property for which you are electing to figure basis without regard to section 877A(h)(2). 
							Identify as “(h)(2).” This election is irrevocable.
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
							<span style="width:8mm;float:left;"/>
							<div class="styIRS8854LNDesc" style="width:179mm">
								<span class="styBoldText">Election to defer tax.</span>
								<span class="styItalicText" style="font-size:7pt;"> You can defer tax only if you have provided adequate security. </span>
								Adequate security is described on page 6 of the instructions.
							</div>
						</div>
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">11</div>
							<div class="styIRS8854LNDesc" style="width:144mm">
								Are you electing to defer tax under section 877A(b)?<br/>
								Checking the “Yes” box is an irrevocable waiver of any right under any treaty of the<br/>
								United States that would prevent assessment or collection of any tax imposed because of section 877A<br/>
								<br/>
								<br/>
								If you checked the “Yes” box, continue to line 12. Otherwise, do not complete lines 12 through 15.<br/>
								<br/>
							</div>
							<div class="styIRS8854LNDesc" style="width:35mm;padding-top:26px;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/ElectionToDeferTaxSect877AbInd">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
												<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/ElectionToDeferTaxSect877AbInd">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
											<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<span class="styBoldText">Yes</span>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span style="width:10mm;"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:if test="$Form8854Data/ElectionToDeferTaxSect877AbInd">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
												<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</input>
								</span>
								<span style="width:1mm;"/>
								<label>
									<xsl:if test="$Form8854Data/ElectionToDeferTaxSect877AbInd">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8854Data/ElectionToDeferTaxSect877AbInd"/>
											<xsl:with-param name="BackupName">IRS8854ElectionToDeferTaxSect877AbInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
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
							<div class="styIRS8854LNDesc" style="height:4mm;">
									Enter the total tax you would have reported on Form 1040, line 60, for the part of the year<br/>
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
							<span style="padding-top:0px;width:41mm;">
								<div class="styLNRightNumBox" style="height:2mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">12</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/TotalTaxWithSect877AaAmt"/>
									</xsl:call-template>
								</div>
							</span>
							<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;float:right;"/>
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
							<span style="padding-top:0px;width:41mm;">
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;"/>
								<div class="styLNRightNumBox" style="height:4mm;">13</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8854Data/TotalTaxWithoutSect877AaAmt"/>
									</xsl:call-template>
								</div>
							</span>
							<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;float:right;"/>
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
									<xsl:with-param name="TargetNode" select="$Form8854Data/TaxEligibleForDeferralAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:2mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:2mm;border-bottom-width:0px;float:right;"/>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 14-->
						<!-- Begin (Line) 15 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNLeftNumBox" style="padding-left:9px;">15</div>
							<div class="styIRS8854LNDesc" style="height:4mm;">
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
									60. Identify as “EXP.”<br/>
								<br/>
								<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
								<span style="width:3px;"/>
									If you are filing Form 1040NR, enter this amount in brackets to the left of the entry space for line<br/>
									59. Identify as “EXP.”<br/>
								<br/>
								<br/>
								<br/>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">15</div>
							<div class="styLNAmountBox" style="width:33mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8854Data/TotalTaxDeferredAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;height:32mm;width:33mm;border-bottom-width:0px;float:right;"/>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:32mm;border-right-width:0px;border-bottom-width:0px;float:right;"/>
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
						<div class="styIRS8854LNDesc" style="width:18mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Section A</span>
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
							<span style="width:7mm;"/>
							<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/>
							<span style="width:1mm;"/>
								List in U.S. dollars the fair market value (column (a)) and the U.S. adjusted basis (column (b)) of your assets and liabilities as of<br/>
							<span style="width:10mm;"/>
								the end of the tax year for which you are filing this form.<br/>
							<span style="width:10mm;"/>
								For more details, see the separate instructions.
						</div>
					</div>
					<!-- +++++++++++++++ Assets Headers +++++++++++++++-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem">
							<!-- Assets -->
							<div class="styIRS8854LNDesc" style="width:40%;height:100%;float:left;text-align:center;">
								<br/><span class="styBoldText" style="font-size:9pt;">Assets</span><br/><br/>
							</div>
							<!-- Part D -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;padding:0px 0px 0px 3px;text-align:center;">
								<br/>
								<span class="stySmallText" style="text-align:center;padding-left:0px;">
									<span class="styBoldText">(d)</span>
									FMV on beginning<br/>date of U.S. residency<br/>(optional, for long-term<br/>residents only)<br/>
								</span>
								<br/>
							</div>
							<!-- Part C -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;text-align:center;">
								<br/>
								<span class="stySmallText" style="text-align:center;">
									<span class="styBoldText">(c)</span>
									Gain or (loss).<br/>Subtract column (b)<br/>from column (a)<br/>
								</span>
								<br/>
							</div>
							<!-- Part B -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;text-align:center;">
								<br/>
								<span class="stySmallText" style="text-align:center;">
									<span class="styBoldText">(b)</span>
									U.S. adjusted<br/>basis<br/>
								</span>
								<br/>
							</div>
							<!-- Part A -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;padding-left:20px;text-align:center;">
								<br/>
								<span class="stySmallText" style="text-align:center;">
									<span class="styBoldText">(a)</span>
									Fair market<br/>value (FMV)<br/>
								</span>
								<br/>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">1</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Cash, including bank deposits
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/CashIncludingBankDepositsAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/CashIncludingBankDepositsAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/CashIncludingBankDepositsAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/CashIncludingBankDepositsAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1-->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">2</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Marketable stock and securities issued by<br/>
									U.S. companies
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/MrktblStockAndSecIssdByUSCoAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/MrktblStockAndSecIssdByUSCoAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/MrktblStockAndSecIssdByUSCoAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/MrktblStockAndSecIssdByUSCoAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2-->
						<!-- Begin (Line) 3 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">3</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Marketable stock and securities issued by<br/>
									foreign companies
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:19px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/MrktblStockAndSecIssdFrgnCoAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/MrktblStockAndSecIssdFrgnCoAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/MrktblStockAndSecIssdFrgnCoAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/MrktblStockAndSecIssdFrgnCoAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3-->
						<!-- Begin (Line) 4 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">4</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Nonmarketable stock and securities issued<br/>
									by U.S. companies
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:18px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/NonMrktblStockSecIssdFrgnCoAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/NonMrktblStockSecIssdFrgnCoAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/NonMrktblStockSecIssdFrgnCoAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/NonMrktblStockSecIssdFrgnCoAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4-->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">5</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Nonmarketable stock and securities issued<br/>
									by foreign companies
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:21px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA"/>
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
									<span class="styBoldText">
										<span style="width:5px"/>.
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
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/SepStateStockIssdFrgnCoAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/SepStateStockIssdFrgnCoAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/SepStateStockIssdFrgnCoAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/SepStateStockIssdFrgnCoAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5a-->
						<!-- Begin (Line) 5b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:14mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;">b</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Provide the name, address, and EIN, if any,<br/>
									of any such company: 
									<xsl:variable name="feiCount" select="(count($Form8854ScheduleA/BalanceSheetFairMarketValueGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetGainOrLossGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/ForeignEntityInformation))"/>
									<xsl:choose>
										<xsl:when test="$feiCount = 1">
											<xsl:choose>
												<xsl:when test="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/ForeignEntityInformation"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/ForeignEntityInformation"/></xsl:call-template></xsl:when>
												<xsl:when test="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/ForeignEntityInformation"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/ForeignEntityInformation"/></xsl:call-template></xsl:when>
												<xsl:when test="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/ForeignEntityInformation"><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/ForeignEntityInformation"/></xsl:call-template></xsl:when>
												<xsl:otherwise><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/ForeignEntityInformation"/></xsl:call-template></xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when test="$feiCount &gt; 1">
											<br/>See Additional Data Table
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">100%</xsl:with-param>
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
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">6</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Pensions from services performed in the<br/>
									United States
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:8px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/PensionFromServicesPerfInUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/PensionFromServicesPerfInUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/PensionFromServicesPerfInUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/PensionFromServicesPerfInUSAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6-->
						<!-- Begin (Line) 7 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">7</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Pensions from services performed outside<br/>
									the United States
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:7px"/>.
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
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/PensionFromSrvcPerfOutUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/PensionFromSrvcPerfOutUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/PensionFromSrvcPerfOutUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/PensionFromSrvcPerfOutUSAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 7-->
						<!-- Begin (Line) 8 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">8</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Partnership interests (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/PartnershipInterestsAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/PartnershipInterestsAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/PartnershipInterestsAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/PartnershipInterestsAmt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 8-->
						<!-- Begin (Line) 9 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="padding-bottom:0px;">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">9</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;padding-bottom:0px;">
									Assets held by trusts you own under<br/>
									sections 671 through 679 (see instructions)
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="Height">2mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/AssestHeldByTrustSect671679Amt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/AssestHeldByTrustSect671679Amt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/AssestHeldByTrustSect671679Amt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/AssestHeldByTrustSect671679Amt"/>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 9-->
						<!-- Begin (Line) 10 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem">
							<div class="styIRS8854LNDesc" style="width:40%;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="padding-left:0px;">10</div>
								<div class="styIRS8854LNDesc" style="width:60mm;padding-left:0px;">
									Beneficial interests in nongrantor trusts (see<br/>
									instructions)
									<!--Dotted Line-->
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/InterestsInNongrantorTrustAmt"/>
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
									<span class="styBoldText">
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/IntangiblesUsedinUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/IntangiblesUsedinUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/IntangiblesUsedinUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/IntangiblesUsedinUSAmt"/>
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
									<span class="styBoldText">.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/IntangiblesUsedOutsideUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/IntangiblesUsedOutsideUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/IntangiblesUsedOutsideUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/IntangiblesUsedOutsideUSAmt"/>
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
									<span class="styBoldText">
										<span style="width:3px"/>.
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/LoansToUSPersonsAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/LoansToUSPersonsAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/LoansToUSPersonsAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/LoansToUSPersonsAmt"/>
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
									<span class="styBoldText">
										<span style="width:7px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/LoansToForeignPersonsAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/LoansToForeignPersonsAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/LoansToForeignPersonsAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/LoansToForeignPersonsAmt"/>
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
									<span class="styBoldText">
										<span style="width:6px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/RealPropertyLocatedInUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/RealPropertyLocatedInUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/RealPropertyLocatedInUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/RealPropertyLocatedInUSAmt"/>
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
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:12px"/>.
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
								<xsl:with-param name="Height">2mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/RealPropertyLocatedOutsdUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/RealPropertyLocatedOutsdUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/RealPropertyLocatedOutsdUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/RealPropertyLocatedOutsdUSAmt"/>
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
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:12px"/>.
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
								<xsl:with-param name="Height">2mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/BusinessProperyInUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/BusinessProperyInUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/BusinessProperyInUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/BusinessProperyInUSAmt"/>
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
									<span class="styBoldText">
										<span style="width:12px"/>.
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
								<xsl:with-param name="Height">2mm</xsl:with-param>
								<xsl:with-param name="AStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="BStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="CStyle">border-bottom-width:0px;</xsl:with-param>
								<xsl:with-param name="DStyle">border-bottom-width:0px;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/BusinessPropertyOutsideUSAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/BusinessPropertyOutsideUSAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/BusinessPropertyOutsideUSAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/BusinessPropertyOutsideUSAmt"/>
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
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:7px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/OtherAssetsAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/OtherAssetsAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/OtherAssetsAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/OtherAssetsAmt"/>
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
									Total assets. Add lines 1 through 5 and lines 6 through 19. Do not include amounts on line 5a in this total
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/TotalFairMarketValueAmt"/>
								<xsl:with-param name="B" select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/TotalFairMarketValueAmt"/>
								<xsl:with-param name="C" select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/TotalFairMarketValueAmt"/>
								<xsl:with-param name="D" select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/TotalFairMarketValueAmt"/>
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
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;padding:0px 0px 0px 3px;text-align:center;background-color:lightgrey;"/>
							<!-- Part C -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;text-align:center;background-color:lightgrey;"/>
							<!-- Part B -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;text-align:center;background-color:lightgrey;"/>
							<!-- Part A -->
							<div class="styIRS8854LNDesc" style="width:106px;height:100%;border-left-width:1px;float:right;padding-left:20px;text-align:center;border-bottom-width:1px;padding-top:0px;">
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
									<span class="styBoldText">
										<span style="width:4x"/>.
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/InstallmentObligLiabilityAmt"/>
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
									<span class="styBoldText">
										<span style="width:4px"/>.
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/MortgageLiabilityAmt"/>
								<xsl:with-param name="BStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="CStyle">background-color:lightgrey;</xsl:with-param>
								<xsl:with-param name="DStyle">background-color:lightgrey;</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 22-->
						<!-- Begin (Line) 23 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">23</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Other liabilities (see instructions)
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:14px"/>.
										<span style="width:11px"/>.
										<span style="width:11px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/OtherLiabilityAmt"/>
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
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:40%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">24</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:60mm;padding-left:0px;">
									Total liabilities. Add lines 21 through 23
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:15px"/>.
									</span>
								</div>
							</div>
							<xsl:call-template name="CreateDataRowPartVSchA">
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/TotalLiabilityAmt"/>
								<xsl:with-param name="Height">4.5mm;</xsl:with-param>
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
								<xsl:with-param name="A" select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/NetWorthAmt"/>
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
						<div class="styIRS8854LNDesc" style="width:18mm;border-top-width:0px;border-bottom-width:0px;border-right-width:1px;border-left-width:0px;border-color:#000000;">
							<span class="styBoldText">Section B</span>
						</div>
						<div class="styIRS8854LNDesc" style="width:50mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;">
							<span class="styBoldText">Income Statement</span>
						</div>
					</div>
					<!-- END: Section B (Header)-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;"/>
								<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding-left:0px;">
									<img src="{$ImagePath}/8854_Bullet_Round.gif" alt="Bullet Round"/><span style="width:4px;"/>Provide income information for the tax year for which you are filing the form.
								</div>
							</div>
						</div>
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS8854LineItem" style="height:4mm;">
							<div class="styIRS8854LNDesc" style="width:100%;height:4mm;border-right-width:0px;float:left;padding-top:0px;padding-bottom:0px;">
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">1</div>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/InterestEffNotCnnctUSAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/DividendEffNotCnnctUSAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/RoyaltyEffNotCnnctUSAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/PensionDistriEffNotCnnctUSAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/OtherIncomeEffNotCnnctUSAmt"/>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/TotalGrossIncEffNotCnnctUSAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">2</div>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncEffConnectedUSAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">3</div>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/IncomeFromPerfOfServicesAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">4</div>
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
										<span class="styBoldText">
											<span style="width:1px"/>.
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
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainFromSaleOfPropertyInUSAmt"/>
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
										<span class="styBoldText">.
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
									<div class="styIRS8854LNDesc" style="width:auto;padding:0px 0px 0px 0px;">
										Debt obligations of U.S. persons or of the United States, a state or<br/>
										political subdivision thereof, or the District of Columbia
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
								<div class="styIRS8854LNDesc" style="height:4mm;width:68mm;padding:0px 0px 0px 0px;float:right;">
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
										<xsl:with-param name="Number">4d</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/TotalGrossIncEffConnectedUSAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:auto;padding-left:0px;">5</div>
								<div class="styIRS8854LNDesc" style="width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="width:auto;padding:2px 0px 0px 0px;">
										Income or gain derived from certain foreign corporations to the extent of your share of earnings<br/>
										and profits earned or accumulated before the date of expatriation (see instructions)
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
									</div>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">6</div>
								<div class="styIRS8854LNDesc" style="height:4mm;width:142mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8854LNDesc" style="height:4mm;width:auto;padding:0px 0px 0px 0px;">
										Gains on certain exchanges of property that ordinarily would not be recognized (see instructions)
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GainsOnCertainExchangOfPropAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">7</div>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/IncRecvOrAccruCerForgnCorpAmt"/>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">8</div>
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
								<div class="styIRS8854LNLeftNumBox" style="height:4mm;padding-left:0px;">9</div>
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
										<xsl:with-param name="TargetNode" select="$Form8854ScheduleB/GrossIncomeFormOtherSourcesAmt"/>
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
							<div class="styIRS8854LNDesc" style="width:22.75mm;height:100%;padding:0px 0px 0px 0px;border-right-width:1px;border-color:black;">
								<span class="styBoldText" style="font-size:10pt;padding:16px 0px 16px 0px;height:100%">
									Sign Here
								</span>
							</div>
							<div class="styIRS8854LNDesc" style="width:163mm;height:100%;padding:0px 0px 0px 0px;">
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
					<div class="styTBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:auto;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
									<img src="{$ImagePath}/8854_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8854</span> (2010)
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
					<xsl:if test="($Print = $Separated) and  (count($Form8854Data/TaxDeferredPropertyPYF8854Grp) &gt; 7)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part III, Line 1 - Complete columns (a), (b), and (c) for all property on which you deferred tax on your 2008 or 2009 Form 8854. 
							Complete column (d) for any property you disposed of in 2010 and see the instructions for Part III.
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
											<span style="width:1mm;"/>Amount of mark-to-market gain or<br/>(loss) reported in 2008 or 2009<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:22%;" scope="col">
										<span class="styBoldText">(c)<br/>
										</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Amount of tax deferred in<br/>2008 or 2009<br/>
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
								<xsl:for-each select="$Form8854Data/TaxDeferredPropertyPYF8854Grp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:if test="PropertyDescription">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:28%;font-size: 7pt; text-align:right;">
											<xsl:if test="MarkToMarketGainOrLossAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MarkToMarketGainOrLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:22%;font-size: 7pt; text-align:right;">
											<xsl:if test="TaxDeferredAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeferredAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:25%;font-size: 7pt; text-align:center;">
											<xsl:if test="DateOfDisposition">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DateOfDisposition"/>
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
					<!-- Separated Data for Part IV, Section B, Line 8 -->
					<xsl:if test="($Print = $Separated) and  (count($Form8854Data/MarkToMarketPropertySaleGrp) &gt; 7)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part IV, Section B, Line 8 - Recognition of gain or loss on the deemed sale of 
							mark-to-market property. Caution. Do not include in column (a) any property described on line 7a, 7b, 7c, or 7d.
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
								<xsl:for-each select="$Form8854Data/MarkToMarketPropertySaleGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--+++++++++++++++++++A+++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:19%;font-size: 6pt; text-align:left;">
											<xsl:if test="PropertyDescription">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDescription"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++B++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
											<xsl:if test="FairMarketValueDayBfrExptrtAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueDayBfrExptrtAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++C++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
											<xsl:if test="CostOrOtherBasisAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++++D+++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:12%;font-size: 6pt; text-align:right;">
											<xsl:if test="GainOrLossAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--++++++++++++++++++++++E++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:14%;font-size: 6pt; text-align:right;">
											<xsl:if test="GainAfterAllocationOfExclAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainAfterAllocationOfExclAmt"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="GainAfterAllocationOfExclAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++++++F+++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:15%;font-size: 6pt; text-align:left;">
											<xsl:if test="FormOrSchGainAssetReported">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormOrSchGainAssetReported"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++++++G+++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:13%;font-size: 6pt; text-align:right;">
											<xsl:if test="TaxDeferredAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxDeferredAmt"/>
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
					<!-- Separated Data for Part V, Schedule A, Line 5b-->
					<xsl:if test="(count($Form8854ScheduleA/BalanceSheetFairMarketValueGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetGainOrLossGrp/ForeignEntityInformation) + 
					count($Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/ForeignEntityInformation) &gt; 1)">
						<span class="styRepeatingDataTitle">
							Form 8854, Part V, Schedule A, Line 5b - Provide the name, address, and EIN, if any, of any such company
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="text-align:left;font-size: 7pt; width:100%;" scope="col">
										<span class="styBoldText">(a)</span>
										<span class="styNormalText">
											<span style="width:1mm;"/>Foreign Entity Information</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form8854ScheduleA/BalanceSheetFairMarketValueGrp/ForeignEntityInformation">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:100%;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="$Form8854ScheduleA/BalanceSheetUSAdjustedBasisGrp/ForeignEntityInformation">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:100%;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="$Form8854ScheduleA/BalanceSheetGainOrLossGrp/ForeignEntityInformation">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:100%;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="$Form8854ScheduleA/BalanceSheetFMVBeginOfUSResGrp/ForeignEntityInformation">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--++++++++++++++++++++++++++++++++++++++-->
										<td class="styIRS8854TableCell" style="width:100%;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
