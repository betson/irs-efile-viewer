<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/DisposOfPropWithSect179DedStmt"/>
	<!-- 1120 Common - Disposition of Property with Section 179 Deductions Statement -->
	<xsl:template name="ShowDependencyData">		
		<table id="DependencyDataTbl" class="styDepTblLandscape" style="font-size: 6pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col">Description of Property</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Gross Sales Price</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Cost or Expense of Sale</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Depreciation Allowed</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Date Property was Acquired</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Date Property was Sold</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Section 179 Deduction</th>
					<th class="styDepTblCell" scope="col">Corporation Tax Years in which the Amount was Passed Through</th>
					<th class="styDepTblCell" scope="col">An Indication if the Disposition is from Casualty or Theft</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Installments Received for Sales in Future Tax Years</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Installments Received for Sales in Prior Tax Years</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Installments Received - Current Tax Year</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/DisposOfPropWithSect179DedGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CostOfSaleAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 17mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="AcquiredDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 17mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="SaleOrExchangeDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Section179DeductionAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="YearsTxt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DispositionMethodDesc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InstalReceivedFutureTaxYrsAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InstalReceivedPriorTaxYearsAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="InstalReceivedCurrentTaxYrAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- *********************************************************************************************** -->
	<!-- ********************************************************************************************* -->
	<!-- Template to display table items -->
	<xsl:template name="ShowDependencyData1">
		<!-- Itemized Other Income Schedule Data -->
		<table id="DependencyDataTbl1" class="styDepTblLandscape" style="font-size: 6pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col">EIN / SSN Of Related Party</th>
					<th class="styDepTblCell" scope="col">Related Party Resold Or Disposed Of The Property</th>
					<th class="styDepTblCell" scope="col">Second Disposition Was More Than 2 Years After The First Disposition</th>
					<th class="styDepTblCell" scope="col">Date Of Disposition</th>
					<th class="styDepTblCell" scope="col">The First Disposition Was A Sale Or Exchange Of Stock To The Issuing Corporation</th>
					<th class="styDepTblCell" scope="col">The Second Disposition Was An Involuntary Conversion And The Threat Of Conversion Occurred After The First Disposition</th>
					<th class="styDepTblCell" scope="col">The Second Disposition Occurred After The Death Of The Original Seller Or Buyer</th>
					<th class="styDepTblCell" scope="col">It Can Be Established To The Satisfaction Of The IRS That Tax Avoidance Was Not A Principal Purpose For Either Of The Dispositions</th>
					<th class="styDepTblCell" scope="col">Selling Price Of Property Sold By Related Party</th>
					<th class="styDepTblCell" scope="col">Related Party Installment Information</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/DisposOfPropWithSect179DedGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;width: 16mm;">
							<xsl:choose>
								<xsl:when test="RelatedPartyEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="RelatedPartyEIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="RelatedPartySSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="RelatedPartySSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:left; width: 26mm;text-align:center">
						<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="SecondDispositionInd"/>
									<xsl:with-param name="BackupName">PropertySoldOrDisposed</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;text-align:left;"/>Yes
							</label>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="SecondDispositionInd"/>
									<xsl:with-param name="BackupName">PropertySoldOrDisposed</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="SecondDispositionInd"/>
										<xsl:with-param name="BackupName">PropertySoldOrDisposed</xsl:with-param>
									</xsl:call-template>
									<span style="width:2mm;text-align:left;"/>No
							   </label>
							<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="SecondDispositionInd"/>
											<xsl:with-param name="BackupName">PropertySoldOrDisposed</xsl:with-param>
										</xsl:call-template>
									</input>
							</td>
						<td class="styDepTblCell" style="text-align:center; width: 22mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="SndDisposMore2YrsAftrFirstInd"/>
									<xsl:with-param name="BackupName">SecondDisposMore2YrsThanFirst</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="SndDisposMore2YrsAftrFirstInd"/>
									<xsl:with-param name="BackupName">SecondDisposMore2YrsThanFirst</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 22mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="DispositionDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 28mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="FirstDisposSaleExchangeStkInd"/>
									<xsl:with-param name="BackupName">FirstDisposSaleExchange</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="FirstDisposSaleExchangeStkInd"/>
									<xsl:with-param name="BackupName">FirstDisposSaleExchange</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 30mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="SecondDisposInvlntryCnvrtInd"/>
									<xsl:with-param name="BackupName">SecondDisposInvoluntaryCnvrt</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="SecondDisposInvlntryCnvrtInd"/>
									<xsl:with-param name="BackupName">SecondDisposInvoluntaryCnvrt</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:center; width: 30mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="SecondDisposAfterDeathSellrInd"/>
									<xsl:with-param name="BackupName">SecondDisposAfterDeathSeller</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width: 2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="SecondDisposAfterDeathSellrInd"/>
									<xsl:with-param name="BackupName">SecondDisposAfterDeathSeller</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:center;width: 30mm">
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="NotToAvoidTaxInd"/>
									<xsl:with-param name="BackupName">DispositionNotToAvoidTax</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="NotToAvoidTaxInd"/>
									<xsl:with-param name="BackupName">DispositionNotToAvoidTax</xsl:with-param>
								</xsl:call-template>
							</label>
						</td>
						<td class="styDepTblCell" style="text-align:right;width: 22mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RealizedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RelatedPartyInstalInfoDesc"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- *******************************************************************************************  -->
	<!-- ********************************************************************************************* -->
	<!-- Template to display table items -->
	<xsl:template name="ShowDependencyData2">
		<!-- Itemized Other Income Schedule Data -->
		<table id="DependencyDataTbl2" class="styDepTblLandscape" style="font-size: 6pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col">Name Of Related Party</th>
					<th class="styDepTblCell" scope="col">Address Of Related Party</th>
					<th class="styDepTblCell" scope="col">Contract Price From Year Of First Sale</th>
					<th class="styDepTblCell" scope="col">The Smaller Selling Price Of Property Sold Or Contract Price From Year Of First Sale</th>
					<th class="styDepTblCell" scope="col">Total Payments Received By The End Of Your Current Tax Year</th>
					<th class="styDepTblCell" scope="col">Total Payments Received Subtracted From The Smaller, Selling Price Or Contract Price</th>
					<th class="styDepTblCell" scope="col">Total Payments Received Less Price Multiplied By The Gross Profit Percentage</th>
					<th class="styDepTblCell" scope="col">Ordinary Income Under The Rrecapture Rules</th>
					<th class="styDepTblCell" scope="col">Payment Price Less Ordinary Income</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/DisposOfPropWithSect179DedGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;width: 47.5mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RelatedPartyName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RelatedPartyName/BusinessNameLine2"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left; width: 47.5mm">
							<xsl:if test="RelatedPartyUSAddress != ' ' ">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="RelatedPartyUSAddress"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="RelatedPartyForeignAddress != ' ' ">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="RelatedPartyForeignAddress"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="FirstYearContractPriceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SmllrRealizedOrContractPrcAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalPaymentsReceivedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalPaymentsRcvdLessPrcAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right; width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotPymtPrcTimesGroPrftPctAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OrdinaryIncmUndRecaptureRlsAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width: 22mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PaymentPriceLessOrdnryIncmAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- *******************************************************************************************  -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<html lang="EN-US">
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
				<meta name="Author" content="Jason Iozzo"/>
				<meta name="Desc" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle" style="width:163mm;">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!-- *********************************************************************************************  -->
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowDependencyData"/>
				<br/>
				<br/>
				<xsl:call-template name="ShowDependencyData1"/>
				<br/>
				<br/>
				<xsl:call-template name="ShowDependencyData2"/>
				<br/>
				<br/>
				<!-- ************************************************************************************************ -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
