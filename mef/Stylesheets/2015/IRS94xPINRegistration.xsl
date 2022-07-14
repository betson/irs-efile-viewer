<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="IRS94xPINRegistrationStyle.xsl"/>


	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form94xPINDataRegistration" select="$RtnDoc/IRS94xPINRegistration"/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form94xPINDataRegistration)"/>
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
				<meta name="Description" content="IRS Form 94x PIN Registration"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:call-template name="IRS94xPINRegistrationStyle"/>
				</style>
			
			</head>
			<body  style="width:740px">
					
					<div style="width:738px;border-style:solid;border-color:gold;border-bottom-width:2px;border-top-width:0px;border-right-width:0px;margin-left:5px;margin-right:auto;margin-top:20px;">
						<span style="background-color:gold;width:520px;height:20px;font-size:16px;">
							<b>94x On-Line e-Filer Signature PIN Registration</b>
						</span>
					</div>
					<div style="height:35px;"></div>
					
			
					<table class="formattedTable">
								<tr>
									<td class="label">EIN: </td>
									<td>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
										</xsl:call-template>
									</td>
								</tr>	
								<tr>
									<td class="label" >Employer Name 1: </td>
									<td class="wrapable">	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="label">Employer Name 2: </td>
									<td class="wrapable">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</td>
								</tr>
						<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/USAddress">
								<tr>
									<td class="label">Employer Address Line 1: </td>
									<td class="wrapable">
										<!-- Max: 35 characters -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="label">Employer Address Line 2: </td>
									<td class="wrapable">
										<!-- Max: 35 characters -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
										<td class="label" >City:</td>
										<td class="wrapable">
											<!-- Max: 22 characters -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
											</xsl:call-template>
										</td>
								</tr>
								<tr>
									
								
										<td class="label" >State: </td>
										<td>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
											</xsl:call-template>
										</td>
								</tr>
								<tr>
										<td class="label" >ZIP Code: </td>
										<td>
											<!-- Max: 12 characters -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
											</xsl:call-template>
										</td>
								</tr>
						</xsl:when>
						
						<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
								<tr>
									<td class="label">Employer Address Line 1: </td>
									<td class="wrapable">
										<!-- Max: 35 characters -->
										<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="label">Employer Address Line 2: </td>
									<td class="wrapable">
										<!-- Max: 35 characters -->
										<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
										<td class="label" >City:</td>
										<td class="wrapable">
											<!-- Max: 50 characters -->
											<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
											</xsl:call-template>
										</td>
								</tr>
								<tr>
										<td class="label" >Province/State: </td>
										<td>
											<!-- Max: 17 characters -->
											<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>
										</td>
								</tr>
								<tr>
										<td class="label" >Country:</td>
										<td class="wrapable">
										      <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
											  <xsl:call-template name="PopulateText">
												  <xsl:with-param name="TargetNode" select="$countryname/country[@id=$RtnHdrData/Filer/ForeignAddress/CountryCd]" />
											  </xsl:call-template>
										</td>
								</tr>
								<tr>
										<td class="label" >Postal Code: </td>
										<td>
											<!-- Max: 16 characters -->
											<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
										</td>
								</tr>
						</xsl:when>
						<xsl:otherwise/>
						</xsl:choose>
						<tr>
							<td class="label">Contact Name: </td>
							<td class="wrapable">
								<!-- Max: 35 characters -->
								<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegContactGrp/PersonNm"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="label">Contact Title: </td>
							<td class="wrapable">
								<!-- Max: 35 characters -->
								<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegContactGrp/PersonTitleTxt"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="label">Contact Phone: </td>
							<td>
								<!-- Max: 10 characters -->
								<xsl:choose>
									<xsl:when test="$Form94xPINDataRegistration/PINRegContactGrp/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegContactGrp/PhoneNum"/>
										</xsl:call-template>									
									</xsl:when>
									<xsl:when test="$Form94xPINDataRegistration/PINRegContactGrp/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegContactGrp/ForeignPhoneNum"/>
										</xsl:call-template>									
									</xsl:when>									
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="label">Authorized Signer SSN: </td>
							<td>
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegAuthorizedSignerGrp/SSN"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="label">Authorized Signer Name: </td>
							<td>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegAuthorizedSignerGrp/PersonNm"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="label">Authorized Signer Title: </td>
							<td>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegAuthorizedSignerGrp/PersonTitleTxt"/>
								</xsl:call-template>
							</td>
						</tr>
					<tr>
							<td class="label">Email Address 1: </td>
							<td class="wrapable">
								
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegAuthorizedSignerGrp/EmailAddressTxt[1]"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="label">Email Address 2: </td>
							<td class="wrapable">
						
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form94xPINDataRegistration/PINRegAuthorizedSignerGrp/EmailAddressTxt[2]"/>
								</xsl:call-template>
							</td>
							</tr>
				</table>
					
				<div style="height:35px;"></div>


			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>