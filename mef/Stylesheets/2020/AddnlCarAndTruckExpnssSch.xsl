<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="ACATESData" select="$RtnDoc/AddnlCarAndTruckExpnssSch"/>
	<!-- Template to display Additional Car And Truck Expenses Schedule-->
	<xsl:template name="ShowACATES">
		<table id="ACATESTbl" class="styDepTbl" style="font-size:7pt;width:187mm;table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:20mm;">Date Vehicle<br/>Placed In Service</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Business<br/>Miles Count</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Commuting<br/>Miles Count</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Other<br/>Miles Count</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Available For Off<br/>Duty Hours</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Another Vehicle</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Evidence To<br/>Support Deduction</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Evidence<br/>Written</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$ACATESData/AddnlCarAndTruckInfo">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:20mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
							</xsl:call-template>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:20mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
							</xsl:call-template>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:20mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
							</xsl:call-template>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:20mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
							</xsl:call-template>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:25mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="VehicleAvailableOffDutyHrsInd">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAvailableForOffDutyHoursInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="VehicleAvailableOffDutyHrsInd">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								No
							</label>
							<span style="width:2px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="VehicleAvailableOffDutyHrsInd">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAvailableForOffDutyHoursInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="VehicleAvailableOffDutyHrsInd">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAvailableForOffDutyHoursInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								Yes
							</label>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:25mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="AnotherVehicleForPrsnlUseInd">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAnotherVehicleInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="AnotherVehicleForPrsnlUseInd">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								No
							</label>
							<span style="width:2px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="AnotherVehicleForPrsnlUseInd">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAnotherVehicleInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="AnotherVehicleForPrsnlUseInd">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleAnotherVehicleInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								Yes
							</label>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:25mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="EvidenceToSupportDeductionInd">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceToSupportDeductionInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="EvidenceToSupportDeductionInd">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceToSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								No
							</label>
							<span style="width:2px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="EvidenceToSupportDeductionInd">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceToSupportDeductionInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="EvidenceToSupportDeductionInd">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceToSupportDeductionInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								Yes
							</label>
						</td>
						<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
						<td class="styDepTblCell" style="text-align:center;width:25mm;padding:0px 0px 0px 0px;font-size:6.5pt;font-family:arial;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="EvidenceWrittenInd">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceWrittenInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="EvidenceWrittenInd">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								No
							</label>
							<span style="width:2px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:if test="EvidenceWrittenInd">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
											<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceWrittenInd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</input>
							</span>
							<span style="width:2px;"/>
							<label>
								<xsl:if test="EvidenceWrittenInd">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
										<xsl:with-param name="BackupName">AdditionalCarAndTruckScheduleEvidenceWrittenInd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								Yes
							</label>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$ACATESData"/>
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
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="width:92mm">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$ACATESData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowACATES"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>