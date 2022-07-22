<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8288AStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8288A"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8288-A"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8288AStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8288A">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="margin-top:2mm;border-style:solid;border-color:black;border-width:1px 0px 1px 1px;overflow:visible;">
						<!-- Left Section -->
						<div style="float:left;width:87mm;border-right:1px solid black;">
							<!-- Withholding agent section -->
							<div style="width:100%;height:30.5mm;border-bottom:1px solid black;padding-left:1px;">
								<span style="font-family:Arial;display:inline;">Withholding agent's name, street address, city, state, and ZIP code</span><br />
								<xsl:choose>
									<xsl:when test="$FormData/TransfereePersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TransfereePersonNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="$FormData/TransfereeName/BusinessNameLine2Txt">
											<br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
								<br />
								<xsl:choose>
									<xsl:when test="$FormData/TransfereeUSAddress">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/TransfereeUSAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/TransfereeForeignAddress"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<!-- TIN section -->
							<div style="width:100%;border-bottom:1px solid black;">
								<div style="width:39%;height:12.4mm;border-right:1px solid black;padding-left:2px;">
									<span style="font-family:Arial;display:inline;">Withholding agent's Federal identification number</span> <br /><br />
									<span style="width:100%;text-align:center;">
										<xsl:choose>
											<xsl:when test="$FormData/TransfereeSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$FormData/TransfereeSSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$FormData/TransfereeEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
								<div style="width:60%;height:12.4mm;padding-left:1px;">
									<span style="font-family:Arial;display:inline;">Identification number of foreign person <br />subject to withholding (see instructions)</span> <br /><br />
									<span style="width:100%;text-align:center;">
										<xsl:choose>
											<xsl:when test="normalize-space($FormData/ForeignPersonSubjectToWthldGrp/SSN)!= ''">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SSN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="normalize-space($FormData/ForeignPersonSubjectToWthldGrp/EIN)!= ''">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/EIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</div>
							</div>
							<!-- Withholdee name -->
							<div style="width:100%;height:15.5mm;border-bottom:1px solid black;padding-left:2px;">
								<span style="font-family:Arial;display:inline;">Name of person subject to withholding</span> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/InCareOfNm"/>
									<xsl:with-param name="Desc">Person subject to withholding - In Care Of Name</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:choose>
									<xsl:when test="normalize-space($FormData/ForeignPersonSubjectToWthldGrp/PersonFullName)!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/PersonFullName/PersonFirstNm"/>
										</xsl:call-template>
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/PersonFullName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($FormData/ForeignPersonSubjectToWthldGrp/BusinessName/BusinessNameLine1Txt)!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										 <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
									</xsl:call-template>		
											<br/>
									</xsl:otherwise>
								</xsl:choose>								
							</div>
							<!-- Withholdee street address -->
							<div style="width:100%;height:10mm;border-bottom:1px solid black;padding-left:2px;">
								<span style="font-family:Arial;display:inline;">Foreign address (number, street, and apt. or suite no.)</span> <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerForeignAddressGrp/ForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerForeignAddressGrp/ForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</div>
							<!-- Withholdee city/province/country -->
							<div style="width:100%;">
								<div style="width:82%;height:18mm;padding-left:2px;border-right:1px solid black;">
									<span style="font-family:Arial;">City, province or state, postal code, and country (not U.S.)</span> <br />
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="/.."/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerForeignAddressGrp/ForeignAddress"/>
									</xsl:call-template>
									<span style="width:3mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerForeignAddressGrp/ForeignAddress/CountryCd"/>
									</xsl:call-template>
						
		</div>
								<div style="width:17%;height:18mm;">
									<span style="font-weight:bold;padding-left:2px;padding-right:2px;height:4mm;float:left;">7</span>
									<span style="font-family:Arial;display:inline;">Country code</span><br />
									<span style="width:100%;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerForeignAddressGrp/CountryCd"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/SellerSeparateMailingAddrGrp/CountryCd"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- Right Section -->
						<div style="float:left;width:99.7mm;">
							<!-- 1 & 2 -->
							<div style="width:36.2mm;border-right:1px solid black;float:left;">
								<!-- Box 1 -->
								<div style="width:100%;height:15mm;border-bottom:1px solid black;">
									<span style="font-weight:bold;width:5mm;padding-left:1.5mm;">1</span>
									<span style="font-family:Arial;display:inline;">Date of transfer</span><br /><br />
									<span style="width:100%;text-align:center;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/TransferDt"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- Box 2 -->
								<div style="width:100%;height:15.5mm;border-bottom:1px solid black;">
									<span style="font-weight:bold;width:5mm;padding-left:1.5mm;">2</span>
									<span style="font-family:Arial;display:inline;">Federal income tax withheld</span> <br /><br /><br /><br />
									<span style="float:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Title -->
							<div style="width:62.8mm;height:30.5mm;font-size:9pt;font-weight:bold;text-align:right;float:left;border-bottom:1px solid black;">
								Statement of Withholding on <br />Dispositions by Foreign Persons <br />of U.S. Real Property Interests<br /><br />
								<span style="width:100%;text-align:center;font-size:7pt;font-weight:normal;">OMB No. 1545-0902</span>
							</div>
							<div style="width:100%;border:none;">
								<div style="width:72mm;float:left;border-right:1px solid black;">
									<!-- Box 3 -->
									<div style="width:36.2mm;height:12.7mm;border-right:1px solid black;border-bottom:1px solid black;float:left;">
										<span style="font-weight:bold;width:5mm;padding-left:1.5mm;">3</span>
										<span style="font-family:Arial;display:inline;">Amount realized</span> <br /><br /><br />
										<span style="float:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/RealizedAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<!-- Box 4 -->
									<div style="width:35.5mm;height:12.7mm;border-bottom:1px solid black;float:left;">
										<span style="font-weight:bold;width:5mm;height:4mm;float:left;padding-left:1.5mm;">4</span>
										<span style="font-family:Arial;display:inline;">Gain recognized by foreign corporation</span> <br /><br />
										<span style="float:right;padding-right:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/GainRecognizedOnTransferAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<!-- Box 5 -->
									<div style="width:100%;height:15.5mm;border-bottom:1px solid black;word-break:break-all;">
										<span style="font-weight:bold;width:5mm;height:9mm;float:left;padding-left:1.5mm;">5</span>
										<span style="font-family:Arial;display:inline;">Description of property transferred</span> <br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/PropertyDesc"/>
										</xsl:call-template>
									</div>
									<!-- Box 6 -->
									<div style="width:100%;height:9.9mm;border-bottom:1px solid black;">
										<span style="font-weight:bold;width:5mm;height:4mm;float:left;padding-left:1.5mm;">6</span>
										<span style="font-family:Arial;width:40mm;">Person subject to withholding is: </span>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8288A/IndividualInd</xsl:with-param>
											</xsl:call-template>An individual</label> 
										<input type="checkbox" class="styCkboxNM" style="margin-top:1px;margin-left:2px;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/IndividualInd"/>
												<xsl:with-param name="BackupName">IRS8288A/IndividualInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<br />
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8288A/CorporationInd</xsl:with-param>
											</xsl:call-template>A corporation</label>
										<input type="checkbox" class="styCkboxNM" style="margin-top:4px;margin-left:2px;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/CorporationInd"/>
												<xsl:with-param name="BackupName">IRS8288A/CorporationInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2.5mm;"/>
										Other (specify) &#9658; 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/OtherWithholdingTypeCd"/>
										</xsl:call-template>
									</div>
									<!-- Separate Mailing box -->
									<div style="width:100%;height:18mm;padding-left:2px;">
										<span style="font-family:Arial;">Mailing address of person subject to withholding (if different)</span><br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress//AddressLine1Txt"/>
										</xsl:call-template><br />
										<xsl:if test="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress//AddressLine2Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress//AddressLine2Txt"/>
											</xsl:call-template><br />
										</xsl:if>
										<xsl:call-template name="PopulateCityStateInfo">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress/USAddress"/>
											<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress/ForeignAddress"/>
										</xsl:call-template>
										<span style="width:3mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp//SeparateMailingAddress/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:27mm;float:right;text-align:right;font-size:8pt;">
									<span style="display:inline;font-weight:bold;font-size:9pt;">
										Copy B <br /> Send to <br /> Internal <br /> Revenue <br /> Service Center <br /> (For Use by <br /> Person <br /> Subject to <br /> Withholding)
									</span>
									<br /><br /><br />
									This information is <br /> being furnished to <br /> the Internal <br /> Revenue Service.
								</div>
							</div>
						</div>
					</div>
					<!-- End page and form -->
					<div class="styStdDiv" style="margin-bottom:2mm;border-top:2px solid black;font-family:Arial;"> <!-- Removed class pageEnd -->
						Form <span style="font-weight:bold;font-size:8pt;">8288-A</span> (Rev. 6-2011)
						<span style="float:right;">Department of the Treasury - Internal Revenue Service</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/ForeignPersonSubjectToWthldGrp/InCareOfNm"/>
							<xsl:with-param name="Desc">Person subject to withholding - In Care Of Name</xsl:with-param>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>