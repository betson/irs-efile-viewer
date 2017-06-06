<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ContriVehicleBoatAirplaneStmt"/>
<!-- 8283-Display Name is - Contributions of Motor Vehicles, Boats, and Airplanes Statement -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
			<body class="styBodyClass" style="width:187mm">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
				<span class="styDepTitle"  style="padding-right:2mm;">
				<xsl:value-of select="$depDocTitle"/>
				</span>        
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Corrected Box Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
            <input type="checkbox" alt="Corrected Box Indicator" class="styCkbox" name="Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$DependencyData/CorrectedInd"/>
                <xsl:with-param name="BackupName">DependencyDataCorrectedBoxInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorrectedInd"/>
								<xsl:with-param name="BackupName">DependencyDataCorrectedBoxInd</xsl:with-param>
							</xsl:call-template>
						</label>									
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee Name:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DoneeName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:choose>
							<xsl:when test="$DependencyData/DoneeName/BusinessNameLine2Txt != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/DoneeName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
				<xsl:choose>
					<xsl:when test="$DependencyData/DoneeUSAddress">
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">US Address of Donee:</div>
							<div style="float:left;clear:none;width:118mm;">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$DependencyData/DoneeUSAddress"/>
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
									<xsl:with-param name="TargetNode" select="$DependencyData/DoneeForeignAddress"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<!-- ========================================================================== -->
	 		    <!-- ========================================================================== -->
				<xsl:choose>
					<xsl:when test="$DependencyData/USTelephoneNum">
						<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee Telephone Number:</div>
							<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$DependencyData/USTelephoneNum"/>
						</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<!-- ============================  OR  ======================================= -->
						<div class="styTopSectionLine" style="width:187mm;">
							<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donee Foreign Telephone Number:</div>
							<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignTelephoneNum"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
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
				<xsl:choose>
					<xsl:when test="$DependencyData/DonorPersonNm">
						<div class="styTopSectionLine" style="width:187mm;">
					      <div class="styTopSectionLineLbl" style="float:left;clear:none;">Donor Person Name:</div>
							<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DonorPersonNm/PersonFirstNm"/>
						</xsl:call-template>
						<span style="width:0.5mm;"> </span>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DonorPersonNm/PersonLastNm"/>
						</xsl:call-template>
							</div>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<!-- ============================  OR  ======================================= -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Donor business name:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/DonorBusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:choose>
							<xsl:when test="$DependencyData/DonorBusinessName/BusinessNameLine2Txt != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/DonorBusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</div>
				</div>
					</xsl:otherwise>
				</xsl:choose>
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
							<xsl:with-param name="TargetNode" select="$DependencyData/ContributionDt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<!-- ========================Per UWR 153032 R9.6D3=============================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Odometer mileage:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/OdometerMileageQty"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Description - Year, Make, and Model of Vehicle:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehicleDescriptionGrp/VehicleModelYr"/>
						</xsl:call-template>
                        <span style="width:7px"/> 
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
						</xsl:call-template>
                       <span style="width:7px"/> 
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VehicleDescriptionGrp/VehicleModelNameTxt"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Identification Number:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/VIN"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Vehicle Sold to Unrelated Party Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
            <input type="checkbox" alt="Certifies Vehicle Sold Unrelated Party Indicator" class="styCkbox" name="Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehSoldToUnrltPrtyInd"/>
                <xsl:with-param name="BackupName">DependencyDataCertifiesVehSoldToUnrltPrtyInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehSoldToUnrltPrtyInd"/>
								<xsl:with-param name="BackupName">DependencyDataCertifiesVehSoldToUnrltPrtyInd</xsl:with-param>
							</xsl:call-template>
						</label>						
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Date of Sale:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$DependencyData/SaleDt"/>
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
						<input type="checkbox" alt="Certifies Vehicle not Transferred Indicator" class="styCkbox" name="Checkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehicleNotTrnsfrInd"/>
								<xsl:with-param name="BackupName">DependencyDataCertifiesVehicleNotTrnsfrInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehicleNotTrnsfrInd"/>
								<xsl:with-param name="BackupName">DependencyDataCertifiesVehicleNotTrnsfrInd</xsl:with-param>
							</xsl:call-template>
						</label>			            	
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Vehicle Transferred to Needy Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
            <input type="checkbox" alt="Certifies Vehicle Transferred to Needy Indicator" class="styCkbox" name="Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehTrnsfrToNeedyInd"/>
                <xsl:with-param name="BackupName">DependencyDataCertifiesVehTrnsfrToNeedyInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesVehTrnsfrToNeedyInd"/>
								<xsl:with-param name="BackupName">DependencyDataCertifiesVehTrnsfrToNeedyInd</xsl:with-param>
							</xsl:call-template>
						</label>									
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Certifies Detailed Description of Improvement:</div>
					<div style="float:left;clear:none;width:187">
					
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CertifiesDetailedImprvDesc"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Goods and Services Indicator:</div>
						<xsl:choose>
							<xsl:when test="$DependencyData/GoodsAndServicesInd = '1'">
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
            <input type="checkbox" alt="Intangible Religious Benefits Indicator" class="styCkbox" name="Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$DependencyData/IntangibleReligiousBenefitsInd"/>
                <xsl:with-param name="BackupName">DependencyDataIntangibleReligiousBenefitsInd</xsl:with-param>
				  </xsl:call-template>
					</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/IntangibleReligiousBenefitsInd"/>
								<xsl:with-param name="BackupName">DependencyDataIntangibleReligiousBenefitsInd</xsl:with-param>
							</xsl:call-template>
						</label>													
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Description of Goods and Services:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/GoodsAndServicesDesc"/>
						</xsl:call-template>
					</div>
				</div>
				<!-- ========================================================================== -->
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Vehicle Claim Deduction Under Specified Amount Indicator:</div>
					<div style="float:left;clear:none;width:118mm;">
						<br/>
            <input type="checkbox" alt="Vehicle Claim Deduction Under Specified Amount Indicator" class="styCkbox" name="Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$DependencyData/VehClaimDedUnderSpcfdAmtInd"/>
                <xsl:with-param name="BackupName">DependencyDataVehClaimDedUnderSpcfdAmtInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/VehClaimDedUnderSpcfdAmtInd"/>
								<xsl:with-param name="BackupName">DependencyDataVehClaimDedUnderSpcfdAmtInd</xsl:with-param>
							</xsl:call-template>
						</label>											
					</div>
				</div>
				<!-- ========================================================================== -->
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>