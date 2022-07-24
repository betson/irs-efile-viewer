<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/18/2019 - Changes made for UWR 217968 - Jeremy Nichols -->
<!-- 08/23/2019 - Changes made for defect 128233 - Jeremy Nichols -->
<!-- 09/23/2019 - Changes made for UWR 219393 - Jeremy Nichols -->
<!-- 09/10/2019 - Changes made for UWR 230467 - Jeremy Nichols -->
<!-- 01/15/2020 - Changes made for KISAM IM0924271 - Jeremy Nichols -->
<!-- 01/31/2020 - Changes made for defect 129172 - Jeremy Nichols -->
<!-- 01/31/2020 - Changes made for defect 129175 - Jeremy Nichols -->
<!-- 02/13/2020 - Changes made for defect 129401 - Jeremy Nichols -->
<!-- 03/02/2020 - Additional changes made for KISAM IM0924271 - Jeremy Nichols -->
<!-- 03/09/2020 - Additional changes made for KISAM IM01010106 - Jeremy Nichols -->
<!-- 05/07/2020 - Changes made for UWR 230731 - Jeremy Nichols -->
<!-- 09/18/2020 - Changes made for UWR 235481 - Jeremy Nichols -->
<!-- 11/17/2020 - Changes made for defect 66024 - Jeremy Nichols -->
<!-- 11/19/2020 - Changes made for defect 66091 - Jeremy Nichols -->
<!-- 04/23/2021 - Changes made for UWR 243365 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8865ScheduleK1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8865ScheduleK1"/>
	<xsl:template name="RowWriterCore">
		<tr>
			<td class="styLeftNumBox">
				<span style="width:1px;"/>
			</td>
			<td height="10px;" style="height:4.5mm;font-size:7pt;text-align:left;width:172mm;" class="styIRS8865ScheduleK1BBtable">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="AddBlankFillerRows">
		<xsl:param name="NumOfTotRows"/>
		<xsl:param name="CurrentRowCount"/>
		<!-- Test condition to populate a blank row -->
		<xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
			<tr>
				<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
					<span class="styTableCellPad"/>
				</td>
				<td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<!--  Recursive call to itself after incrementing the CurrentRowCount. -->
			<xsl:call-template name="AddBlankFillerRows">
				<xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
				<xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="DisplayCodeAndAmountTable">
		<xsl:param name="TargetNode"/>
		<xsl:param name="CodeAndAmountTableTitle"/>
		<xsl:param name="DisplayPushPin">false</xsl:param>
		<xsl:if test="count($TargetNode) &gt; 0">
			<br/>
			<span class="styRepeatingDataTitle">
				<xsl:value-of select="$CodeAndAmountTableTitle"/>
			</span>
			<table class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableTHead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col">Code</th>
						<th class="styDepTblCell" scope="col">Amount</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<!--Define background colors to the rows -->
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--First column -->
							<td class="styDepTblCell" style="text-align:middle;width:50mm;">
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 11')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 13')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 14')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1SelfEmploymentEarnLossCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 15')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 17')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 18')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 19')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 20')">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
									</xsl:call-template>
								</xsl:if>
							</td>
							<!-- Second Column -->
							<xsl:choose>
								<xsl:when test="$DisplayPushPin = 'true'">
									<td class="styDepTblCell" style="text-align:right;padding-right:1mm;width:136mm;">
										<span style="float:left;padding-left:2px;">
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 11')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 13')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 14')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1SelfEmploymentEarnLossCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 15')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 17')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 18')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 19')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="contains($CodeAndAmountTableTitle, 'Line 20')">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
												</xsl:call-template>
											</xsl:if>
										</span>
										<span style="float:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</span>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styDepTblCell" style="text-align:right;padding-right:1mm;width:136mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amt"/>
										</xsl:call-template>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- This template displays a line or lines of data for the IRS8865 Schedule K1 Part III Code/Amount fields -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table. -->
	<xsl:template name="DisplayPart3CodeAmountLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<span class="IRS8865ScheduleK1_codeCell">
						<xsl:call-template name="PopulateText">
	<!--						<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>  -->
							<xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
						</xsl:call-template>
					</span>
					<span class="IRS8865ScheduleK1_amountCell">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="Amt"/>
						</xsl:call-template>
					</span>
					<br/>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
				<span class="IRS8865ScheduleK1_codeCell"/>
				<span class="IRS8865ScheduleK1_amountCell" style="text-align:left;">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</span>
				<br/>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- This template is the same as DisplayPart3CodeAmountLine with additional display of the pushpin in the amount field. -->
	<!-- This template displays a line or lines of data for the IRS8865 Schedule K1 Part III Code/Amount fields     -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is              -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table.              -->
	<!--Donna's invention-->
	<xsl:template name="Part3AddlDataLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:param name="Line"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<tr>
						<td style="width:5mm;height:6mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:1px;vertical-align:bottom;">
							<xsl:if test="$Line = 11">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 13">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 14">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1SelfEmploymentEarnLossCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 15">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 17">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 18">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 19">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 20">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td style="width:45mm;font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:6mm;text-align:right;padding-top:2mm;">
							<span style="width:45mm;">
							<xsl:if test="$Line = 11">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 13">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 14"><br/></xsl:if>
							<xsl:if test="$Line = 15">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 17">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 19">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Line = 20">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
				<tr>
					<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
						<span class="styTableCellPad"/>
					</td>
					<td colspan="2" style="float:right;font-size:7pt;width:45mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</td>
				</tr>
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DisplayPart3CodeAmountAddlDataLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<span class="IRS8865ScheduleK1_codeCell">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
						</xsl:call-template>
					</span>
					<span class="IRS8865ScheduleK1_amountCell">
						<span style="float:left;padding-left:2px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
							</xsl:call-template>
						</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</span>
					</span>
					<br/>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
				<span class="IRS8865ScheduleK1_codeCell"/>
				<span class="IRS8865ScheduleK1_amountCell" style="text-align:left;">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</span>
				<br/>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
				<meta name="Description" content="IRS Form 8865 ScheduleK-1"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865ScheduleK1Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Standard Warning Line -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- FORM DISPLAY STUFF STARTS HERE -->
				<!--
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
|  Top row: td                                                           |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  Middle row:                  |                                         |
|  one td                           |  second td                       |
|  +~~~~~~~~~~~~~~~~+ | +~~~~~~~~~~~~~~~~~+  |
|   |   with new table      |  |  |   with new tables      |  |
|   |       Header              |  |  |      header                  |  |
|   |       Part I                  |  |  |      Part III                    |  | 
|   |       Part II                 |  |  |      +~~~~~~~~~~~~+ |  |
|   |                                 |  |  |      | 1-14   |  15-20  |  |  |
|   |                                 |  |  |      +~~~~~~~~~~~~+ |  |
|  +~~~~~~~~~~~~~~~~+ |  +~~~~~~~~~~~~~~~~~+ |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  Bottom row: td                                                      | 
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
-->
				<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana; font-size: 7pt;">
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;border-left:1px solid black;">
							<span style="width: 186mm;">
								<span style="float: right;">
									<input type="checkbox" class="styckbox" name="checkbox" id="finalId">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
											<xsl:with-param name="BackupName">IRS8865ScheduleK1FinalK1</xsl:with-param>
										</xsl:call-template>
             Final K-1<span style="width: 11mm;"/>
									</label>
									<input type="checkbox" class="styckbox" name="checkbox" id="amdId">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1Ind"/>
										</xsl:call-template>
										<!--onclick="return false;">-->
										<!-- No schema data to match this checkbox, remove onclick="return false;" when data is available. -->
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1Ind"/>
											<xsl:with-param name="BackupName">IRS8865ScheduleK1AmendedK1
</xsl:with-param>
										</xsl:call-template>
     
          Amended K-1<span style="width: 11mm;"/>
									</label>
          OMB No. 1545-1668</span>
							</span>
						</td>
					</tr>
					<tr>
						<td style="width: 92.75mm;border-left:1px solid black;" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" style="border-right:1px;">
								<!-- Inner table - Header, Part I, Part II -->
								<tr>
									<td style="width: 40mm;">
										<!-- Width necessary to prevent table from shrinking -->
										<!-- Set year -->
										<span class="styFormNumber" style="font-size: 12pt; float: left; clear: none;">Schedule K-1<br/>(Form 8865)</span>
										<span style="display:inline;">Department of the Treasury</span>
										<span style="display:inline;"> Internal Revenue Service</span>
									</td>
									<td style="width: 52.75mm;font-size: 7pt;">		
										<div class="styTY" style="float: right; clear: none; padding-right: 2mm;">20<span class="styTYColor">21</span>
											<span style="font: normal normal 7pt Verdana; padding-left: 1mm;">
												<span style="width: 5mm;"/>
											</span>
										</div>
										<span style="width:52mm;text-align:right;padding-right:1mm;">For calendar year 2021, or tax<br/></span>
									   <span style="width: 52mm;  text-align: right;">year beginning 
										    <xsl:choose>
												<xsl:when test="($FormData/TaxYearBeginDt)">
													<span style="width:20mm;border-bottom: 1px solid black;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginDt"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:10mm;border-bottom: 1px solid black;">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginDt"/>
														</xsl:call-template>
													</span> 2021
												</xsl:otherwise>
											</xsl:choose>
										</span>
										<span style="width:52mm;text-align:right; ">ending
										<span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/TaxYearEndDt"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="width:92.5mm;">
										<br/>
										<span class="styMainTitle" style="font-size: 12pt;">Partner's Share of Income, Deductions,</span>
										<br/>
										<span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits, etc.</span>
									</td>
								</tr>
							</table>
							<table border="0" cellspacing="0" cellpadding="0" style="border-right:1px;">
								<tr>
									<td class="IRS8865ScheduleK1_tdPart" style="height: 8mm;border-left:0;">
										<!-- Part I header -->
										<span class="IRS8865ScheduleK1_partName">Part I</span>
										<span class="IRS8865ScheduleK1_partDesc">Information About the Partnership</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 8mm;border-left:0;">
										<!-- Line A -->
										<span style="font-weight: bold;display:inline;">A1</span>
										<span style="width: 1mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">Partnership's employer identification number</span>
										<br/>
										<span style="width: 5mm;"/>
										<xsl:choose>
											<xsl:when test="$FormData/PartnershipsEIN != ''">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipMissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 8mm;border-left:0;">
										<!-- Line A -->
										<span style="font-weight: bold;display:inline;">A2</span>
										<span style="width: 1mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">Reference ID number (see instr.)</span>
										<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
											<br/>
											<span style="width: 5mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</xsl:for-each>
									</td>
								</tr>							
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 24mm;border-left:0;">
										<!-- Line B -->
										<span style="font-weight: bold;display:inline;">B</span>
										<span style="width: 2.5mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">Partnership's name, address, city, state, and ZIP code</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 75mm;">
											<span style="font-size:6pt;font-family:verdana;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipName/BusinessNameLine2txt='' or not($FormData/PartnershipsName/BusinessNameLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<xsl:if test="$FormData/PartnershipsUSAddress/AddressLine1Txt and $FormData/PartnershipsUSAddress/AddressLine1Txt!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipsUSAddress/AddressLine2Txt='' or not($FormData/PartnershipsUSAddress/AddressLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/AddressLine2Txt"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/CityNm and $FormData/PartnershipsUSAddress/CityNm!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/CityNm"/>
												</xsl:call-template>,
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/StateAbbreviationCd and $FormData/PartnershipsUSAddress/StateAbbreviationCd  !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/StateAbbreviationCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/ZIPCd and $FormData/PartnershipsUSAddress/ZIPCd !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/ZIPCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/AddressLine1Txt and $FormData/PartnershipsForeignAddress/AddressLine1Txt!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipsForeignAddress/AddressLine2Txt='' or not($FormData/PartnershipsForeignAddress/AddressLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/CityNm and $FormData/PartnershipsForeignAddress/CityNm !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/CityNm"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/ProvinceOrStateNm and $FormData/PartnershipsForeignAddress/ProvinceOrStateNm !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/ForeignPostalCd and $FormData/PartnershipsForeignAddress/ForeignPostalCd !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/CountryCd and $FormData/PartnershipsForeignAddress/CountryCd !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/CountryCd"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdPart" style="border-left:0;">
										<!-- Part II header -->
										<span class="IRS8865ScheduleK1_partName">Part II</span>
										<span class="IRS8865ScheduleK1_partDesc">Information About the Partner</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 8mm;border-left:0;">
										<!-- Line C -->
										<span style="font-weight: bold;display:inline;">C</span>
										<span style="width: 3mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">Partner's SSN or TIN (Do not use TIN of a disregarded entity). See instructions.</span>
										<br/>
										<span style="width: 5mm;"/>
										<!-- If EIN exists -->
										<xsl:if test="not($FormData/ShareholderEIN='' or not($FormData/PartnerEIN))">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerEIN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else if SSN exists -->
										<xsl:if test="not($FormData/ShareholderSSN='' or not($FormData/PartnerSSN))">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerSSN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else reason for no EIN/SSN -->
										<xsl:if test="not($FormData/MissingEINReasonCd='' or not($FormData/MissingEINReasonCd))">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 24mm;border-left:0;">
										<!-- Line D -->
										<span style="font-weight: bold;display:inline;">D1</span>
										<span style="width: 3mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">Name, address, city, state, and ZIP code for partner entered in C. See Instructions.</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 75mm;">
											<span style="font-size:6pt;font-family:verdana;">
											<xsl:choose>
											<xsl:when test="$FormData/PartnerName/BusinessNameLine1Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnerName/BusinessNameLine2Txt='' or not($FormData/PartnerName/BusinessNameLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnerPersonNm"/>
												</xsl:call-template>
											</xsl:otherwise>
											</xsl:choose>	
											</span>
											<br/>
											<xsl:if test="$FormData/PartnersUSAddress/AddressLine1Txt and $FormData/PartnersUSAddress/AddressLine1Txt!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnersUSAddress/AddressLine2Txt='' or not($FormData/PartnersUSAddress/AddressLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/AddressLine2Txt"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/CityNm and $FormData/PartnersUSAddress/CityNm!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/CityNm"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/StateAbbreviationCd and $FormData/PartnersUSAddress/StateAbbreviationCd  !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/StateAbbreviationCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/ZIPCd and $FormData/PartnersUSAddress/ZIPCd !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/ZIPCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/AddressLine1Txt and $FormData/PartnersForeignAddress/AddressLine1Txt!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnersForeignAddress/AddressLine2Txt='' or not($FormData/PartnersForeignAddress/AddressLine2Txt))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/AddressLine2Txt"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/CityNm and $FormData/PartnersForeignAddress/CityNm !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/CityNm"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/ProvinceOrStateNm and $FormData/PartnersForeignAddress/ProvinceOrStateNm !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/ProvinceOrStateNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/ForeignPostalCd and $FormData/PartnersForeignAddress/ForeignPostalCd !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/ForeignPostalCd"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/CountryCd and $FormData/PartnersForeignAddress/CountryCd !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/CountryCd"/>
												</xsl:call-template>
											</xsl:if>
										</span><br/>
										<span style="font-weight: bold;display:inline;">D2</span>
										<span style="width: 3mm;display:inline;"/>
										<span style="width: 80mm;display:inline;">
											<input type="checkbox" class="styckbox" name="checkbox" id="amdId">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntityInd"/>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntityInd"/>
													<xsl:with-param name="BackupName">IRS8865ScheduleK1DisregardedEntityInd</xsl:with-param>
												</xsl:call-template>
												If partnership interest is owned through a disregarded entity (DE), enter DE's: <br/>
												<span style="width:5mm;"/>TIN:<span style="width:0.4mm;"/>
												<span style="width: 20mm; border-bottom: 1px solid black; text-align:left;">
													<!-- If EIN exists -->
													<xsl:if test="($FormData/DisregardedEntityEIN)">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntityEIN"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<!-- Else if SSN exists -->
													<xsl:if test="($FormData/DisregardedEntitySSN)">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntitySSN"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<!-- Else reason for no EIN/SSN -->
													<xsl:if test="($FormData/AppliedForEINReasonCd)">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/AppliedForEINReasonCd"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
												</span><span style="width:0.4mm;"/>
												Name:<span style="width:0.4mm;"/>
												<span style="width: 42mm; border-bottom: 1px solid black; text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntityName/BusinessNameLine1Txt"/>
													</xsl:call-template><span style="width:0.4mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/DisregardedEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</span>
											</label>
										</span>
									</td>
								</tr>
								<!-- Line E -->
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 12mm;border-left:0;">
										<span style="font-weight: bold;">E</span>
										<span style="width: 3mm;"/>
										 Partner's share of profit, loss, capital, and deductions:<br/>
										<span style="width: 5mm;"/>
										 (see Partner's Instr. (Form 1065))<br/>
										<table cellpadding="0" cellspacing="0" style="margin-left: 5mm;">
											<tbody>
												<tr>
													<td class="IRS8865ScheduleK1_lineETH" style="width: 20mm;"/>
													<td class="IRS8865ScheduleK1_lineETH">Beginning</td>
													<td class="IRS8865ScheduleK1_lineETH">Ending</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Profit</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersInterestInProfitsBOYRt"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersInterestInProfitsEOYRt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Loss</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersLossesBOYRt"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersLossesEOYRt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Capital</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalBOYRt"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalEOYRt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Deductions</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersDeductionsBOYRt"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersDeductionsEOYRt"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
										<span style="width: 5mm;"/>
										<span style="padding-top:0.5mm;">
											<label id="DSEPPInd">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/DecrSaleExchPrtnrPrtshpIntInd"/>
													<xsl:with-param name="BackupName">IRS8865ScheduleK1DecrSaleExchPrtnrPrtshpIntInd</xsl:with-param>
												</xsl:call-template>
												Check if decrease is due to sale or exchange of partnership <br/>interest
											</label>
											<span style="font-weight: bold;">
												<span style="width: 6px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
												<span style="width: 12px;"/>.
											</span>
											<input type="checkbox" class="styckbox" name="checkbox" id="DSEPPInd">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/DecrSaleExchPrtnrPrtshpIntInd"/>
												</xsl:call-template>
											</input>
										</span>
									</td>
								</tr>
								<!-- Line F -->
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 12mm;border-left:0;">
										<span style="font-weight: bold;">F</span>
										<span style="width: 9mm;"/>
										 <b>Partner's capital account analysis:</b><br/>
										<table style="font-family: Verdana; font-size: 7pt; margin-left: 4.5mm;">
											<tbody>
												<tr>
													<td style="width: 52mm;">
														<span style="width:52mm;"/>
													</td>
													<td style="border-bottom: 0px solid black;font-size:6pt;text-align:center;width:35mm;" colspan="2">
														<b>Tax Basis Capital</b>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;"><b>Beginning capital account</b></span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
														  <span style="width: 12px;"/>.
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;width:35mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalAccountBOYAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;font-size:7pt;display:inline;">Capital contributed during the year
														<span style="height:2mm;font-weight: bold;display:inline;">
															<span style="width: 6px;"/>.
															<span style="width: 12px;"/>.
														</span></span>
													</td>
													<td style="padding-top:2mm;">$</td>
													<td style="border-bottom: 1px solid black;padding-top:2mm;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalContributedDuringYrAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Current year net income (loss)</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 12px;"></span>.
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CurrentYearNetIncomeOrLossAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Other increase (decrease)<br/>(attach explanation)
															<span style="height:2mm;font-weight: bold;display:inline;">
																<span style="width: 2px;"/>.
																<span style="width: 12px;"/>.
																<span style="width: 12px;"/>.
																<span style="width: 12px;"/>.
															</span>
															<xsl:call-template name="SetFormLinkInline">
																<xsl:with-param name="TargetNode" select="$FormData/OtherIncreaseDecreaseAmt"/>
															</xsl:call-template>
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;padding-top:2mm;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/OtherIncreaseDecreaseAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Withdrawals &amp; distributions</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
														  <span style="width: 12px;"/>.
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
                    (<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/WithdrawalsAndDstrbtnsAmt"/>
														</xsl:call-template>)
                  </td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;"><b>Ending capital account</b></span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
                      <span style="width: 12px;"/>.
                      <span style="width: 12px;"/>.
                    </span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalAccountEOYAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<!-- Line G -->
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 12mm;border-left:0;">
										<span style="font-weight: bold;">G</span>
										<span style="width: 5mm;"/>
										<b>Partner’s Share of Net Unrecognized Section 704(c) 
										<br/><span style="width: 25mm;"/>Gain or (Loss)</b><br/>
										<table style="font-family: Verdana; font-size: 7pt; margin-left: 4.5mm;">
											<tbody>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Beginning</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;width:35mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NetUnrcgnzd704cGainLossBOYAmt"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Ending</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
														  <span style="width: 12px;"/>.
														  <span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
															<span style="width: 12px;"/>.
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NetUnrcgnzd704cGainLossEOYAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr style="height:100%;">
									<td class="IRS8865ScheduleK1_tdLeft" style="vertical-align: middle;border-left:0;">
										<!-- IRS Use Only box -->
										<img src="{$ImagePath}/8865SchK1_For_IRS_Use_Only.gif" width="20" height="142" alt="For IRS Use Only" style="position: relative; left: -2mm;"/>
									</td>
								</tr>
								<tr>
								</tr>
							</table>
							<!-- End inner table - Header, Part I, Part II -->
						</td>
						<!-- Beginning of border-right-width:1px;, header and lines 1-20 -->
						<td style="width: 100mm;" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" style="width:100mm;border-top: 1px solid black; border-bottom: 0px; border-left:1px solid black; border-right:1px solid black;">
								<!-- Inner table - Part III -->
								<tr>
									<td colspan="2">
										<!-- Part III header -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td class="IRS8865ScheduleK1_tdPart" style="height:13mm; width:100mm;border-top:0px; border-right:0px; border-left:0px;" colspan="2">
													<!-- Part III header -->
													<span class="IRS8865ScheduleK1_partName" style="margin: 1mm;  position: relative: top: -5mm;display:inline;">Part III</span>
													<span class="IRS8865ScheduleK1_partDesc" style="width: 93mm; display:inline;">Partner's Share of Current Year Income,<br/><span style="width:19mm;"/>Deductions, Credits, and Other Items</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<table width="50mm" border="0" cellpadding="0" cellspacing="0" style="border-right: 0px solid black;">
											<!-- Part III columns 1-14 -->
											<!-- Line 1 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													1
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Ordinary business income (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 2 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													2
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Net rental real estate income (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 3 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													3
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Other net rental income (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/OtherRentalIncomeAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/OtherRentalIncomeAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4a -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													4a
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Guaranteed payments for services
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPaymentsServicesAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPaymentsServicesAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4b -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													4b
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Guaranteed payments for capital
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPaymentsCapitalAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPaymentsCapitalAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4c -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													4c
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Total guaranteed payments
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPymtsToPartnerAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPymtsToPartnerAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 5 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													5
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Interest income
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 6a -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													6a
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Ordinary dividends
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 6b -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													6b
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Qualified dividends
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 6b -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													6c
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Dividend equivalents
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/DividendEquivalentsAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/DividendEquivalentsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 7 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													7
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Royalties
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRyltsAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRyltsAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 8 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													8
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Net short-term capital gain (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 9a -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													9a
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Net long-term capital gain (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 9b -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													9b
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Collectibles (28%) gain (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 9c -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													9c
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Unrecaptured section 1250 gain
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 10 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													10
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Net section 1231 gain (loss)
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/NetSection1231GainLossAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NetSection1231GainLossAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 11 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													11
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Other income (loss)
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/IRS8865SchK1OtherIncmLoss"/>
												<xsl:with-param name="NumOfTotalRows" select="4"/>
												<xsl:with-param name="Line" select="11"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
											<!-- Line 12 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													12
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Section 179 deduction
												</td>
											</tr>
											<tr>
												<td style="height:6mm;width:5mm;border-right:1px solid black;border-bottom:1px solid black;">
													<span style="width:5mm;"/>
												</td>
												<td colspan="2" style="width:45mm;font-size:7pt;text-align:right;padding-right:0.5mm;padding-left:0.5mm;border-bottom:1px solid black;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
													</xsl:call-template>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 13 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;">
													13
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;">
													Other deductions
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1OtherDeductionsGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="5"/>
												<xsl:with-param name="Line" select="13"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
											<!-- Line 14 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													14
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Self-employment earnings (loss)
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1SelfEmploymentEarnLossGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="5"/>
												<xsl:with-param name="Line" select="14"/>
											</xsl:call-template>
										</table>
									</td>
									<!-- Part III columns 15-20 -->
									<td style="width:100mm;border-left:1px solid black;" valign="top">
										<table width="50mm" border="0" cellpadding="0" cellspacing="0" style="border-left: 0;">
											<!-- Line 15 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													15
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Credits
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1CreditsAndCrRcptrGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="4"/>
												<xsl:with-param name="Line" select="15"/>
											</xsl:call-template>
											
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1CreditsAndCrRcptrGrp)"/>
											</xsl:call-template>
											<!-- Line 16 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													16
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Foreign transactions
												</td>
											</tr>
											<xsl:choose>
												<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
												<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
												<xsl:when test="($Print != $Separated) or (count($FormData/SchK1ForeignTransactionsGrp) &lt;= 6) ">
													<xsl:for-each select="$FormData/SchK1ForeignTransactionsGrp">
														<xsl:choose>
															<!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
															<!-- display Country/Possession Code + Country/Possession Name-->
															<xsl:when test="CountryOrPossessionCd or ForeignCountryOrUSPossessionCd">
																<tr>
																	<td style="width:5mm;height:6mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:2mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
																		</xsl:call-template>
																	</td>
																	<td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:6mm;padding-top:2mm;text-align:right;padding-left:3px;">
																		<xsl:call-template name="SetFormLinkInline">
																			<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
																		</xsl:call-template>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</xsl:when>
															<!-- Otherwise, display Code + Amount -->
															<xsl:otherwise>
																<tr>
																	<td style="width:5mm;height:6mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:2mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
																		</xsl:call-template>
																	</td>
																	<td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:6mm;padding-top:2mm;text-align:right;padding-left:3px;">
																		<xsl:call-template name="SetFormLinkInline">
																			<xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
																		</xsl:call-template>
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="Amt"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
													<!-- Add blank rows -->
													<xsl:call-template name="AddBlankFillerRows">
														<xsl:with-param name="NumOfTotRows" select="'6'"/>
														<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
													</xsl:call-template>
												</xsl:when>
												<!-- For separated print where the number of data elements exceed container height, -->
												<!-- display message directing user to additional data table. -->
												<xsl:otherwise>
													<tr>
														<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
															<span class="styTableCellPad"/>
														</td>
														<td colspan="2" style="float:right;font-size:7pt;width:45mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$FormData/SchK1ForeignTransactionsGrp"/>
															</xsl:call-template>
														</td>
													</tr>
													<xsl:call-template name="AddBlankFillerRows">
														<xsl:with-param name="NumOfTotRows" select="'6'"/>
														<xsl:with-param name="CurrentRowCount" select="1"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<!-- Line 17 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													17
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Alternative minimum tax (AMT) items
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1AMTItemsGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="5"/>
												<xsl:with-param name="Line" select="17"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
											<!-- Line 18 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													18
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Tax-exempt income and nondeductible expenses
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1TxExmptNondedExpnsGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="4"/>
												<xsl:with-param name="Line" select="18"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
											<!-- Line 19 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													19
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Distributions
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1DistributionsGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="4"/>
												<xsl:with-param name="Line" select="19"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'6'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
											<!-- Line 20 -->
											<tr>
												<td style="width:5mm;font-weight:bold;text-align:center;border-right:1px solid black;border-top:1px solid black;">
													20
												</td>
												<td colspan="2" style="width:45mm;font-size:6pt;text-align:left;padding-left:0.5mm;border-top:1px solid black;">
													Other information
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/SchK1OtherInformationGrp"/>
												<xsl:with-param name="NumOfTotalRows" select="5"/>
												<xsl:with-param name="Line" select="20"/>
											</xsl:call-template>
											<!-- Add blank rows -->
											<xsl:call-template name="AddBlankFillerRows">
												<xsl:with-param name="NumOfTotRows" select="'7'"/>
												<xsl:with-param name="CurrentRowCount" select="count($FormData/SchK1ForeignTransactionsGrp)"/>
											</xsl:call-template>
										</table>
									</td>
								</tr>
							</table>
							<!-- End inner table - Part III -->
						</td>
					</tr>
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm; font-family: Verdana; font-size: 6pt; font-weight: bold; border-top: 1px solid black;">
							<span style="width: 85mm;">For Paperwork Reduction Act Notice, see Instructions for Form 8865.</span>
							<span style="width: 3mm;"/>
							<span style="font-weight: normal; width: 24mm;">www.IRS.gov/Form8865</span>
							<span style="width: 5mm;"/>
							<span style="font-weight: normal; width: 24mm;">Cat. No. 28396B</span>
							<span style="width: 1mm;"/>
							<span style="width: 39mm;">Schedule K-1 (Form 8865) 2021</span>
						</td>
					</tr>
				</table>
				<!-- FORM DISPLAY STUFF  ENDS  HERE -->
				<br/>
				<div class="pageEnd"/>
				<!-- From 8865 form -->
				<!-- BEGIN Left Over Table -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
    Additional Data        
  </div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 8865 Schedule K-1, Top Left Margin - Content model for Form 8865 Schedule K1</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/Section1377a2Election"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 8865 Schedule K-1, Line G - Shareholder Name Control</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ShareholderNameControl"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!-- Populate left over row for the pen image on Line F. Used this code instead of calling the template in order to set the style attribute to top align the description label. -->
					<xsl:if test="$FormData/OtherInd/@shortExplanationTxt">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;vertical-align:top;" scope="row">Form 8865 Schedule K-1, Line F - Other (explain):</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@shortExplanationTxt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<!--
  <xsl:call-template name="PopulateLeftoverRow">
    <xsl:with-param name="Desc">Form 8865 Schedule K-1, Line F - Shareholder SSN</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$FormData/ShareholderSSN" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>

  <xsl:call-template name="PopulateLeftoverRow">
    <xsl:with-param name="Desc">Form 8865 Schedule K-1, Line F - Missing SSN/EIN Reason</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReason" />
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
-->
				</table>
				<!-- END Left Over Table -->
				<!-- Begin Separated Repeating data -->
				<!-- Line 11 - If Separate Print Option is ON and there is more than 4 data set for "Other Income (losses)"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS8865SchK1OtherIncmLoss) &gt; 4)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS8865SchK1OtherIncmLoss"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 11 - Other income (loss):
	  </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 13 - If Separate Print Option is ON and there is more than 4 data set for "Other deductions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1OtherDeductionsGrp) &gt; 4)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1OtherDeductionsGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 13 - Other deductions:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 14 - If Separate Print Option is ON and there is more than 2 data set for "Self employment earnings (loss)"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1SelfEmploymentEarnLossGrp) &gt; 2)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1SelfEmploymentEarnLossGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 14 - Self-employment earnings (loss):
	   </xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 15 - If Separate Print Option is ON and there is more than 3 data set for "Credits & credit recapture"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1CreditsAndCrRcptrGrp) &gt; 3)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1CreditsAndCrRcptrGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 15 - Credits:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 16 - If Separate Print Option is ON and there is more than 6 data set for "Foreign transactions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1ForeignTransactionsGrp) &gt; 6) ">
					<br/>
					<span class="styRepeatingDataTitle">Form 8865 Schedule K1, Part III, Line 16 - Foreign transactions:</span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableTHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col">Code OR Country/Possession Code</th>
								<th class="styDepTblCell" scope="col">Amount OR Country/Possession Name</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/SchK1ForeignTransactionsGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
									<!-- display Country/Possession Code + Country/Possession Name-->
									<xsl:choose>
										<xsl:when test="SchK1CountryOrPossessionCd or ForeignCountryOrUSPossessionCd">
											<!--First column -->
											<td class="styDepTblCell" style="text-align:center;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
												</xsl:call-template>
											</td>
											<!--Second column-->
											<td class="styDepTblCell" style="text-align:right;padding-right:1mm;width:136mm;">
												<span style="float:left;padding-left:2px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
													</xsl:call-template>
												</span>
												<span style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</span>
											</td>
										</xsl:when>
										<!-- Otherwise, display Code + Amount -->
										<xsl:otherwise>
											<!--First Column-->
											<td class="styDepTblCell" style="text-align:center;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
												</xsl:call-template>
											</td>
											<!-- Second Column -->
											<td class="styDepTblCell" style="text-align:right;padding-right:1mm;width:136mm;">
												<span style="float:left;padding-left:2px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
													</xsl:call-template>
												</span>
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Amt"/>
													</xsl:call-template>
												</span>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- Line 17 - If Separate Print Option is ON and there is more than 3 data set for "Alternative minimum tax
(AMT) items"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1AMTItemsGrp) &gt; 3)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1AMTItemsGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 17 - Alternative minimum tax (AMT) <br/>items:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 18 - If Separate Print Option is ON and there is more than 2 data set for "Tax-exempt income and
nondeductible expenses"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1TxExmptNondedExpnsGrp) &gt; 2)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1TxExmptNondedExpnsGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 18 - Tax-exempt income and <br/>nondeductible expenses:
	   </xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 19 - If Separate Print Option is ON and there is more than 1 data set for "Distributions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1DistributionsGrp) &gt; 1)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1DistributionsGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 19 - Distributions:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 20 - If Separate Print Option is ON and there is more than 1 data set for "Distributions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SchK1OtherInformationGrp) &gt; 1)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SchK1OtherInformationGrp"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 20 - Other Information:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>