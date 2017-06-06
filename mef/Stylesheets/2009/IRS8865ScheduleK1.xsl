<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
	<!-- This template is called to fill in blank filler rows in Part III where multiple of rows of data -->
	<!-- may be applicable. The parameter NumOfTotRows is the set number of rows required to display on the page -->
	<!-- even if no data is populated. The parameter CurrentRowCount is the current number of rows already -->
	<!-- populated with data or blank row(s). When this template is called, a new blank row is populated in the -->
	<!-- form and the CurrentRowCount is incremented by 1. It will keep popoulating blank rows as long as -->
	<!-- CurrentRowCount is less than NumOfTotRows and stop when these two numbers are equal. -->
	<xsl:template name="AddBlankFillerRows">
		<xsl:param name="NumOfTotRows"/>
		<xsl:param name="CurrentRowCount"/>
		<!-- Test condition to populate a blank row -->
		<xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
			<tr>
				<td style="width:4.9mm;height:8mm;border-right:1px solid black;border-bottom:1px solid lightgrey;border-left:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td style="border-bottom:1px solid lightgrey;width:5mm;height:8mm;">
					<span class="styTableCellPad"/>
				</td>
				<td style="float:right;width:36.5mm;border-bottom:1px solid lightgrey;">
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
	<!-- This template displays tables populated with data of the CodeAndAmountType data types      -->
	<!-- The data is displayed in a dependency data style table. There is an optional parameter     -->
	<!-- that indicates whether to display the associated push pin that comes from the Code element -->
	<!-- By default, this field is set to false unless the caller set it to true.  -->
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
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Code"/>
								</xsl:call-template>
							</td>
							<!-- Second Column -->
							<xsl:choose>
								<xsl:when test="$DisplayPushPin = 'true'">
									<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
										<span style="float:left;padding-left:2px;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="Code"/>
											</xsl:call-template>
										</span>
										<span style="float:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</span>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amount"/>
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
							<xsl:with-param name="TargetNode" select="Code"/>
						</xsl:call-template>
					</span>
					<span class="IRS8865ScheduleK1_amountCell">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="Amount"/>
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
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<tr>
						<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Code"/>
							</xsl:call-template>
						</td>
						<td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="Code"/>
							</xsl:call-template>
						</td>
						<td style="float:right;font-size:7pt;width:36.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amount"/>
							</xsl:call-template>
						</td>
					</tr>
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
				<tr>
					<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
						<span class="styTableCellPad"/>
					</td>
					<td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
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
							<xsl:with-param name="TargetNode" select="Code"/>
						</xsl:call-template>
					</span>
					<span class="IRS8865ScheduleK1_amountCell">
						<span style="float:left;padding-left:2px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="Code"/>
							</xsl:call-template>
						</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amount"/>
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
		<html>
			<head>
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
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="width: 186mm;">
								<span style="float: right;">
									<input type="checkbox" class="styckbox" name="checkbox" id="finalId">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
											<xsl:with-param name="BackupName">IRS8865ScheduleK1FinalK1</xsl:with-param>
										</xsl:call-template>
             Final K-1<span style="width: 11mm;"/>
									</label>
									<input type="checkbox" class="styckbox" name="checkbox" id="amdId">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1"/>
										</xsl:call-template>
										<!--onclick="return false;">-->
										<!-- No schema data to match this checkbox, remove onclick="return false;" when data is available. -->
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1"/>
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
						<td style="width: 93mm;" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" style="border-right:1px;">
								<!-- Inner table - Header, Part I, Part II -->
								<tr>
									<td style="width: 93mm;">
										<div style="width: 93mm;">
											<!-- Width necessary to prevent table from shrinking -->
											<span class="styFormNumber" style="font-size: 12pt; float: left; clear: none;">Schedule K-1<br/>(Form 8865)</span>
											<div class="styTY" style="float: right; clear: none; padding-right: 2mm;">20<span class="styTYColor">09</span>
												<span style="font: normal normal 7pt Verdana; padding-left: 1mm;">
													<span style="width: 5mm;"/>
												</span>
											</div>
											<!-- 2004 -->
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 7pt;">
										<span style="float: left; clear: none;">Department of the Treasury</span>
										<span style="float: right; clear: none; padding-right: 1mm;">For calendar year 2009, or tax year beginning
               <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginning"/>
												</xsl:call-template>
											</span>
										</span>
										<br/>
             Internal Revenue Service<br/>
										<span style="width:85mm;padding-left:49mm; ">ending
                <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/TaxYearEnding"/>
												</xsl:call-template>
											</span>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="styMainTitle" style="font-size: 12pt;">Partner's Share of Income, Deductions,</span>
										<br/>
										<span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits, etc.</span>
										<span style="float: right; clear: none; font-weight: bold; font-size: 7pt; padding-right: 1mm; padding-top: 0.5mm;">
											<img src="{$ImagePath}/8865SchK1_Bullet_Lg.gif" width="4" height="7" alt="Right arrow image" border="0"/> See back of form and separate instructions.</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdPart" style="height: 8mm;">
										<!-- Part I header -->
										<span class="IRS8865ScheduleK1_partName">Part I</span>
										<span class="IRS8865ScheduleK1_partDesc">Information About the Partnership</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 8mm;">
										<!-- Line A -->
										<span style="font-weight: bold;">A</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partnership's employer identification number</span>
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
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipMissingEINReason"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line B -->
										<span style="font-weight: bold;">B</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partnership's name, address, city, state, and ZIP code</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 75mm;">
											<span style="font-size:6pt;font-family:verdana;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipName/BusinessNameLine2='' or not($FormData/PartnershipsName/BusinessNameLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsName/BusinessNameLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</span>
											<xsl:if test="$FormData/PartnershipsUSAddress/AddressLine1 and $FormData/PartnershipsUSAddress/AddressLine1!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/AddressLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipsUSAddress/AddressLine2='' or not($FormData/PartnershipsUSAddress/AddressLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/AddressLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/City and $FormData/PartnershipsUSAddress/City!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/City"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/State and $FormData/PartnershipsUSAddress/State  !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/State"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsUSAddress/ZIPCode and $FormData/PartnershipsUSAddress/ZIPCode !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsUSAddress/ZIPCode"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/AddressLine1 and $FormData/PartnershipsForeignAddress/AddressLine1!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/AddressLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnershipsForeignAddress/AddressLine2='' or not($FormData/PartnershipsForeignAddress/AddressLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/AddressLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/City and $FormData/PartnershipsForeignAddress/City !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/City"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/ProvinceOrState and $FormData/PartnershipsForeignAddress/ProvinceOrState !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/ProvinceOrState"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/PostalCode and $FormData/PartnershipsForeignAddress/PostalCode !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/PostalCode"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/PartnershipsForeignAddress/Country and $FormData/PartnershipsForeignAddress/Country !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnershipsForeignAddress/Country"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdPart">
										<!-- Part II header -->
										<span class="IRS8865ScheduleK1_partName">Part II</span>
										<span class="IRS8865ScheduleK1_partDesc">Information About the Partner</span>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 8mm;">
										<!-- Line C -->
										<span style="font-weight: bold;">C</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partner's identifying number</span>
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
										<xsl:if test="not($FormData/MissingSSNEINReason='' or not($FormData/MissingSSNEINReason))">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReason"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line D -->
										<span style="font-weight: bold;">D</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partner's name, address, city, state, and ZIP code</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 75mm;">
											<span style="font-size:6pt;font-family:verdana;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnerName/BusinessNameLine2='' or not($FormData/PartnerName/BusinessNameLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnerName/BusinessNameLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</span>
											<xsl:if test="$FormData/PartnersUSAddress/AddressLine1 and $FormData/PartnersUSAddress/AddressLine1!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/AddressLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnersUSAddress/AddressLine2='' or not($FormData/PartnersUSAddress/AddressLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/AddressLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/City and $FormData/PartnersUSAddress/City!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/City"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/State and $FormData/PartnersUSAddress/State  !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/State"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersUSAddress/ZIPCode and $FormData/PartnersUSAddress/ZIPCode !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersUSAddress/ZIPCode"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/AddressLine1 and $FormData/PartnersForeignAddress/AddressLine1!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/AddressLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="not($FormData/PartnersForeignAddress/AddressLine2='' or not($FormData/PartnersForeignAddress/AddressLine2))">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/AddressLine2"/>
													</xsl:call-template>
													<br/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/City and $FormData/PartnersForeignAddress/City !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/City"/>
												</xsl:call-template>,
                 </xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/ProvinceOrState and $FormData/PartnersForeignAddress/ProvinceOrState !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/ProvinceOrState"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/PostalCode and $FormData/PartnersForeignAddress/PostalCode !=''">
												<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/PostalCode"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/PartnersForeignAddress/Country and $FormData/PartnersForeignAddress/Country !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PartnersForeignAddress/Country"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<!-- Line E -->
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 12mm;">
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
															<xsl:with-param name="TargetNode" select="$FormData/PartnersInterestInProfitsBOY"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersInterestInProfitsEOY"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Loss</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersLossesBOY"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersLossesEOY"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Capital</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalBOY"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalEOY"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="IRS8865ScheduleK1_lineETD" style="text-align: left; width: 20mm;">Deductions</td>
													<td class="IRS8865ScheduleK1_lineETD" style="border-right: 1px solid black;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersDeductionsBOY"/>
														</xsl:call-template>
													</td>
													<td class="IRS8865ScheduleK1_lineETD">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$FormData/PartnersDeductionsEOY"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<!-- Line F -->
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 12mm;">
										<span style="font-weight: bold;">F</span>
										<span style="width: 3mm;"/>
             Partner's capital account analysis:<br/>
										<table style="font-family: Verdana; font-size: 7pt; margin-left: 4.5mm;">
											<tbody>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Beginning capital account</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
                      <span style="width: 12px;"/>.
                    </span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;width:35mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalAccountBOY"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;font-size:7pt;">Capital contributed during the year</span>
														<!--span style="float: right; clear: none; font-weight: bold;">
                      <span style="width: 12px;"></span>.
                    </span-->
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalContributedDuringYear"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Current year increase (decrease)</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<!--span style="width: 2px;"></span>.
                      <span style="width: 12px;"></span>.-->
														</span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CurrentYearIncreaseDecrease"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Withdrawals &#38; distributions</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
                      <span style="width: 12px;"/>.
                    </span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
                    (<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/WithdrawalsAndDistributions"/>
														</xsl:call-template>)
                  </td>
												</tr>
												<tr>
													<td style="width: 52mm;">
														<span style="float: left; clear: none;">Ending capital account</span>
														<span style="float: right; clear: none; font-weight: bold;">
															<span style="width: 2px;"/>.
                      <span style="width: 12px;"/>.
                      <span style="width: 12px;"/>.
                    </span>
													</td>
													<td>$</td>
													<td style="border-bottom: 1px solid black;font-size:6pt;text-align:right;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/CapitalAccountAtEndOfYear"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
										<table style="font-family: Verdana; font-size: 7pt; margin-left: 4.5mm;">
											<tbody>
												<tr>
													<td>
														<input type="checkbox" class="styCKbox" name="checkbox" id="taxbasisId">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/TaxBasis"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/TaxBasis"/>
																<xsl:with-param name="BackupName">IRS8865ScheduleK1TaxBasis</xsl:with-param>
															</xsl:call-template>
                   	Tax basis    
                   </label>
														<span style="width: 4mm;"/>
													</td>
													<td>
														<input type="checkbox" class="styCKbox" name="checkbox" id="gaapId">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/GAAP"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/GAAP"/>
																<xsl:with-param name="BackupName">IRS8865ScheduleK1GAAP</xsl:with-param>
															</xsl:call-template>
                     GAAP
                   </label>
														<span style="width: 4mm;"/>
													</td>
													<td>
														<input type="checkbox" class="styCKbox" name="checkbox" id="sbkId">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/Section704bBook"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/Section704bBook"/>
																<xsl:with-param name="BackupName">IRS8865ScheduleK1Section704bBook</xsl:with-param>
															</xsl:call-template>
                     Section 704(b) book
                   </label>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<input type="checkbox" class="styCKbox" name="checkbox" id="othId">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/Other"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/Other"/>
																<xsl:with-param name="BackupName">IRS8865ScheduleK1Other</xsl:with-param>
															</xsl:call-template>                   
                     Other (explain)
                   </label>
														<span style="width:3px;"/>
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Form 8865 Schedule K-1, Line F - Other (explain)</xsl:with-param>
															<xsl:with-param name="TargetNode" select="$FormData/Other/@explanation"/>
														</xsl:call-template>
													</td>
													<td/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="IRS8865ScheduleK1_tdLeft" style="height: 52mm; vertical-align: middle;">
										<!-- IRS Use Only box -->
										<img src="{$ImagePath}/8865SchK1_For_IRS_Use_Only.gif" width="20" height="142" alt="For IRS Use Only" style="position: relative; left: -2mm;"/>
									</td>
								</tr>
							</table>
							<!-- End inner table - Header, Part I, Part II -->
						</td>
						<!-- Beginning of border-right-width:1px;, header and lines 1-20 -->
						<td width="93mm" style="width: 93mm;" valign="top">
							<table width="93mm" border="0" cellpadding="0" cellspacing="0" style="border-top: 1px solid black; border-bottom: 0px; border-left:1px solid black; border-right:1px solid black;">
								<!-- Inner table - Part III -->
								<tr>
									<td colspan="2">
										<!-- Part III header -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td class="IRS8865ScheduleK1_tdPart" style="height:13mm; border-top:0px; border-right:0px; border-left:0px;" colspan="2">
													<!-- Part III header -->
													<span class="IRS8865ScheduleK1_partName" style="margin: 1mm; float: left; clear: none; position: relative: top: -5mm;">Part III</span>
													<span class="IRS8865ScheduleK1_partDesc" style="width: 73mm; float: right; clear: none;">Partner's Share of Current Year Income,<br/>Deductions, Credits, and Other Items</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="border-right: 1px solid black;">
											<!-- Part III columns 1-14 -->
											<!-- Line 1 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">1</span>
														<span style="width:1mm;"/>
														<span style="font-size: 6pt;">Ordinary business income (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 2 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">2</span>
														<span style="width:1mm"/>
														<span style="font-size: 6pt;">Net rental real estate income (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 3 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">3</span>
														<span style="width:1mm;"/>
														<span style="font-size: 6pt;">Other net rental income (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRentalAmount"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRentalAmount"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 4 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">4</span>
														<span style="width:1mm"/>Guaranteed payments<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/GuaranteedPaymentsToPartner"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 5a -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">5</span>
														<span style="width:1mm"/>Interest income<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/InterestIncome"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 6a -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: right;padding-right:3px">6a</span>
														<span style="width:1mm"/>Ordinary dividends<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncmLossTotOrdnryDiv"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 6b -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: right;padding-right:3px">6b</span>
														<span style="width:1mm;"/>Qualified dividends<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividends"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 7 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">7</span>
														<span style="width:1mm"/>Royalties
										<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRoyalties"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 8 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">8</span>
														<span style="width:1mm"/>
														<span style="font-size: 6pt;">Net short-term capital gain (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainLoss"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 9a -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: right;padding-right:3px">9a</span>
														<span style="width:1mm"/>
														<span style="font-size:6pt;">Net long-term capital gain (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainLoss"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 9c -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: right;padding-right:3px">9b</span>
														<span style="width:1mm"/>
														<span style="font-size:6pt;">Collectibles (28%) gain (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLoss"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLoss"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<!-- Line 9c -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: right;padding-right:3px">9c</span>
														<span style="width:1mm"/>
														<span style="font-size:6pt;">Unrecaptured section 1250 gain</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<!-- Line 10 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">10</span>
														<span style="width:1mm"/>Net section 1231 gain (loss)<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<!-- Line 11 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">11</span>
														<span style="width:1mm"/>Other income (loss)<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom:0px;"/>
														<br/>
													</div>
												</td>
											</tr>
											<xsl:call-template name="Part3AddlDataLine">
												<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLoss"/>
												<xsl:with-param name="NumOfTotalRows" select="4"/>
											</xsl:call-template>
											<!-- Line 12 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">12</span>
														<span style="width:1mm"/>Section 179 deduction<br/>
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox" style="text-align: right;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
																</xsl:call-template>
															</span>
														</span>
													</div>
												</td>
											</tr>
											<!-- Line 13 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">13</span>
														<span style="width:1mm"/>Other deductions<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom: 0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom: 0px; "/>
														<br/>
														<xsl:call-template name="Part3AddlDataLine">
															<xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
															<xsl:with-param name="NumOfTotalRows" select="4"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
											<!-- Line 14 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">14</span>
														<span style="width:1mm"/>
														<span style="font-size:6pt;">Self-employment earnings (loss)</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:1px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom:0px;"/>
														<br/>
														<xsl:call-template name="DisplayPart3CodeAmountLine">
															<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentEarningsLoss"/>
															<xsl:with-param name="NumOfTotalRows" select="2"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<!-- Part III columns 15-20 -->
									<td valign="top">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="border-left: 1px;">
											<!-- Line 15 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">15</span>
														<span style="width:1mm;"/>Credits <br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="margin-bottom:0mm;border-bottom:0px;"/>
														<br/>
														<xsl:call-template name="Part3AddlDataLine">
															<xsl:with-param name="TargetNode" select="$FormData/Credits"/>
															<xsl:with-param name="NumOfTotalRows" select="3"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
											<!-- Line 16 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">16</span>
														<span style="width:1mm;"/>Foreign transactions<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom:0px;"/>
														<br/>
													</div>
												</td>
											</tr>
											<!-- Choice between combinations: Country/Possession Code + Country/Possession Name OR Code + Amount -->
											<!-- Each repeating line has the choice of displaying either the data set Country/Possession Code (C/P Code) + Country/Possession Name (C/P Name)-->
											<!-- OR the data set Code + Amount. Within each data set, the two elements are optional (none, one or both can exist) -->
											<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
											<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
											<xsl:choose>
												<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
												<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
												<xsl:when test="($Print != $Separated) or (count($FormData/ForeignTransactions) &lt;= 6) ">
													<xsl:for-each select="$FormData/ForeignTransactions">
														<xsl:choose>
															<!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
															<!-- display Country/Possession Code + Country/Possession Name-->
															<xsl:when test="CountryOrPossessionCode or CountryOrPossessionName">
																<tr>
																	<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
																		</xsl:call-template>
																	</td>
																	<td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
																		<xsl:call-template name="SetFormLinkInline">
																			<xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
																		</xsl:call-template>
																	</td>
																	<td style="float:right;font-size:7pt;width:36.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</xsl:when>
															<!-- Otherwise, display Code + Amount -->
															<xsl:otherwise>
																<tr>
																	<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="Code"/>
																		</xsl:call-template>
																	</td>
																	<td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
																		<xsl:call-template name="SetFormLinkInline">
																			<xsl:with-param name="TargetNode" select="Code"/>
																		</xsl:call-template>
																	</td>
																	<td style="float:right;font-size:7pt;width:36.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
																		<xsl:call-template name="PopulateAmount">
																			<xsl:with-param name="TargetNode" select="Amount"/>
																		</xsl:call-template>
																	</td>
																</tr>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
													<!-- Add blank rows -->
													<xsl:call-template name="AddBlankFillerRows">
														<xsl:with-param name="NumOfTotRows" select="'6'"/>
														<xsl:with-param name="CurrentRowCount" select="count($FormData/ForeignTransactions)"/>
													</xsl:call-template>
												</xsl:when>
												<!-- For separated print where the number of data elements exceed container height, -->
												<!-- display message directing user to additional data table. -->
												<xsl:otherwise>
													<tr>
														<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
															<span class="styTableCellPad"/>
														</td>
														<td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
															<xsl:call-template name="PopulateAdditionalDataTableMessage">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignTransactions"/>
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
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align: center;">17</span>
														<span style="font-size: 6pt;">
															<span style="width:1mm;"/>Alternative minimum tax (AMT) items</span>
														<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom:0px;"/>
														<br/>
														<xsl:call-template name="Part3AddlDataLine">
															<xsl:with-param name="TargetNode" select="$FormData/AMTItems"/>
															<xsl:with-param name="NumOfTotalRows" select="3"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
											<!-- Line 18 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width:46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;height:8mm;float:left;clear:none;">18</span>
														<span style="float:left;clear:none;">
															<span style="width:1mm;"/>Tax-exempt income and <br/>
															<span style="width:1.5mm;"/>nondeductible expenses</span>
													</div>
													<div style="width:46.5mm;">
														<span class="IRS8865ScheduleK1_codeBox"/>
														<span class="IRS8865ScheduleK1_amountBox"/>
														<br/>
														<xsl:call-template name="DisplayPart3CodeAmountLine">
															<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeNondedExpenses"/>
															<xsl:with-param name="NumOfTotalRows" select="2"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<!-- Line 19 -->
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">19</span>
														<span style="width:1mm;"/>Distributions<br/>
														<span class="IRS8865ScheduleK1_codeBox" style="border-bottom:0px;"/>
														<span class="IRS8865ScheduleK1_amountBox" style="border-bottom:0px;"/>
														<br/>
														<xsl:call-template name="Part3AddlDataLine">
															<xsl:with-param name="TargetNode" select="$FormData/Distributions"/>
															<xsl:with-param name="NumOfTotalRows" select="1"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
											<!-- Line 20 -->
											<tr>
												<td colspan="3" class="IRS8865ScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
													<div style="width: 46.5mm;">
														<span class="IRS8865ScheduleK1_itemLabel" style="text-align:center;">20</span>
														<span style="width:1mm;"/>Other information<br/>
														<span class="IRS8865ScheduleK1_codeBox" style=" height:7mm;"/>
														<span class="IRS8865ScheduleK1_amountBox" style=" height:7mm;"/>
														<br/>
														<xsl:call-template name="Part3AddlDataLine">
															<xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/>
															<xsl:with-param name="NumOfTotalRows" select="2"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="font-family: Verdana; font-size: 7pt; border-top: 1px solid black; text-align: center;">
        * See attached statement for additional information.
      </td>
								</tr>
							</table>
							<!-- End inner table - Part III -->
						</td>
					</tr>
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm; font-family: Verdana; font-size: 6pt; font-weight: bold; border-top: 1px solid black;">
							<span style="width: 115mm;">For Paperwork Reduction Act Notice, see Instructions for Form 8865.</span>
							<span style="width: 1mm;"/>
							<span style="font-weight: normal; width: 24mm;">Cat. No. 28396B</span>
							<span style="width: 1mm;"/>
							<span style="width: 43mm;">Schedule K-1 (Form 8865) 2009</span>
						</td>
					</tr>
				</table>
				<!-- FORM DISPLAY STUFF  ENDS  HERE -->
				<br/>
				<br class="pageEnd"/>
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
					<xsl:if test="$FormData/Other/@explanation">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;vertical-align:top;" scope="row">Form 8865 Schedule K-1, Line F - Other (explain):</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/Other/@explanation"/>
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
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherIncomeLoss) &gt; 4)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLoss"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 11 - Other income (losses):
	  </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 13 - If Separate Print Option is ON and there is more than 4 data set for "Other deductions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherDeductions) &gt; 4)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 13 - Other deductions:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 14 - If Separate Print Option is ON and there is more than 2 data set for "Self employment earnings (loss)"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/SelfEmploymentEarningsLoss) &gt; 2)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentEarningsLoss"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 14 - Self-employment earnings (loss):
	   </xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 15 - If Separate Print Option is ON and there is more than 3 data set for "Credits & credit recapture"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/Credits) &gt; 3)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/Credits"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 15 - Credits:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 16 - If Separate Print Option is ON and there is more than 6 data set for "Foreign transactions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/ForeignTransactions) &gt; 6) ">
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
							<xsl:for-each select="$FormData/ForeignTransactions">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
									<!-- display Country/Possession Code + Country/Possession Name-->
									<xsl:choose>
										<xsl:when test="CountryOrPossessionCode or CountryOrPossessionName">
											<!--First column -->
											<td class="styDepTblCell" style="text-align:center;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
												</xsl:call-template>
											</td>
											<!--Second column-->
											<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
												<span style="float:left;padding-left:2px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
													</xsl:call-template>
												</span>
												<span style="float:left;padding-left:2px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
													</xsl:call-template>
												</span>
											</td>
										</xsl:when>
										<!-- Otherwise, display Code + Amount -->
										<xsl:otherwise>
											<!--First Column-->
											<td class="styDepTblCell" style="text-align:center;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Code"/>
												</xsl:call-template>
											</td>
											<!-- Second Column -->
											<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
												<span style="float:left;padding-left:2px;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="Code"/>
													</xsl:call-template>
												</span>
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="Amount"/>
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
				<xsl:if test="($Print = $Separated) and (count($FormData/AMTItems) &gt; 3)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/AMTItems"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 17 - Alternative minimum tax (AMT) <br/>items:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 18 - If Separate Print Option is ON and there is more than 2 data set for "Tax-exempt income and
nondeductible expenses"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/TaxExemptIncomeNondedExpenses) &gt; 2)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/TaxExemptIncomeNondedExpenses"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 18 - Tax-exempt income and <br/>nondeductible expenses:
	   </xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 19 - If Separate Print Option is ON and there is more than 1 data set for "Distributions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/Distributions) &gt; 1)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/Distributions"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
	    Form 8865 Schedule K1, Part III, Line 19 - Distributions:
	   </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- Line 20 - If Separate Print Option is ON and there is more than 1 data set for "Distributions"-->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherInformation) &gt; 1)">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/>
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
