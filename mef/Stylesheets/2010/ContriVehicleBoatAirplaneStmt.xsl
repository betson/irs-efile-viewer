<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ContriVehicleBoatAirplaneStmt"/>
<!-- 8281-Display Name is Contributions of Motor Vehicles, Boats, and Airplanes Statement -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
                  </style>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="width:163mm;">
						<span>
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Corrected Box Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorrectedBoxInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee Name:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DoneeName/BusinessNameLine1"/>
						</xsl:call-template>
						<xsl:choose>
							<xsl:when test="$DependencyData/DoneeName/BusinessNameLine2 != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/DoneeName/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<xsl:choose>
					<xsl:when test="$DependencyData/USAddressOfDonee">
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">US Address of Donee:</div>
							<div style="float:left;clear:none;width:118mm;">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddressOfDonee"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<!-- ============================  OR  ======================================= -->
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">Foreign Address of Donee:</div>
							<div style="float:left;clear:none;width:118mm;">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee Telephone Number:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$DependencyData/DoneeTelephoneNumber"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee EIN:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/DoneeEIN"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donor Identification Number:</div>
							<div style="float:left;clear:none;width:118mm;">
							<xsl:choose>
					<xsl:when test="$DependencyData/DonorEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorEIN"/>
								</xsl:call-template>
					</xsl:when>
								<xsl:otherwise>
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorSSN"/>
								</xsl:call-template>
					</xsl:otherwise>
</xsl:choose>
							</div>
						</div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donor Name:</div>
					<div style="float:left;clear:none;width:118mm;">
					
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DonorName/PersonFirstName"/>
						</xsl:call-template>
						<span style="width:0.5mm;"> </span>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DonorName/PersonLastName"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<xsl:choose>
					<xsl:when test="$DependencyData/DonorUSAddress">
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">US Address of Donor:</div>
							<div style="float:left;clear:none;width:118mm;">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorUSAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<!-- ============================  OR  ======================================= -->
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">Foreign Address of Donor:</div>
							<div style="float:left;clear:none;width:118mm;">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Date of the Contribution:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$DependencyData/DateOfTheContribution"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Description - Year, Make, and Model of Vehicle:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehicleDescription"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Identification Number:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehicleIdentificationNumber"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Vehicle Sold to Unrelated Party Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehSoldToUnrltPrtyInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Date of Sale:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$DependencyData/DateOfSale"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Gross Proceeds from Sale of Vehicle Amount:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/GrossProceedsFromSaleOfVehAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Vehicle not Transferred Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehicleNotTrnsfrInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Vehicle Transferred to Needy Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehTrnsfrToNeedyInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Detailed Description of Improvement:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesDetailedDescOfImprv"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Goods and Services Indicator:</div>
			
<xsl:choose>
	<xsl:when test="$DependencyData/GoodsAndServicesInd = 'true'">
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateYesBoxText">
							<xsl:with-param name="TargetNode" select="$DependencyData/GoodsAndServicesInd"/>
						</xsl:call-template>
					</div>
</xsl:when>
<xsl:otherwise>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateNoBoxText">
							<xsl:with-param name="TargetNode" select="$DependencyData/GoodsAndServicesInd"/>
						</xsl:call-template>
					</div>
</xsl:otherwise>
</xsl:choose>


				
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Value of Goods and Services for Vehicle Amount:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/ValueOfGoodsAndSrvcForVehAmt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Intangible Religious Benefits Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/IntangibleReligiousBenefitsInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Description of Goods and Services:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DescriptionOfGoodsAndServices"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Claim Deduction Under Specifed Amount Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehClaimDedUnderSpcfdAmtInd"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
