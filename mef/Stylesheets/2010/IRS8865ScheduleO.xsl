<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8865ScheduleOStyle.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8865ScheduleOData" select="$RtnDoc/IRS8865ScheduleO"/>
	<xsl:template match="/">
		<xsl:variable name="TransfersReportable" select="count($Form8865ScheduleOData)&gt;5"/>
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8865ScheduleOData)"/>
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
				<meta name="Description" content="IRS Form 8865ScheduleO"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- Remember to remove comment before checked-in your code -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865ScheduleOStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8865ScheduleO">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styForm8865ScheduleOFN" style="width:28mm;height:17.25mm;float:left;">
							<span class="styForm8865ScheduleOFST" style="margin-left:0mm;">SCHEDULE O </span>
							<br/>
							<span class="styFBT" style="font:size:9pt;">(Form 8865)</span>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:126mm;height:13mm;">
							<div class="styMainTitle" style="height:8mm;font-size:13pt;">
          Transfer of Property to a Foreign Partnership
        </div>
							<div class="styForm8865ScheduleOFST" style="height:5mm;font-size:10pt;">
          (under section 6038B)
        </div>
							<div class="styForm8865ScheduleOFST" style="height:4mm;font-size:7pt;">
								<img src="{$ImagePath}/8865SchO_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
          Attach to Form 8865. See Instructions for Form 8865.
        </div>
						</div>
						<div class="styTYBox" style="width:32mm;height:13mm;">
							<div class="styOMB" style="height:2mm;">
          OMB No. 1545-1668
        </div>
							<div class="styTY" style="height:13mm;">
          20<span class="styTYColor">10</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:147mm;height:8mm;font-size:7pt;">
        Name of transferor<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/NameOfTransferor/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/NameOfTransferor/BusinessNameLine2"/>
							</xsl:call-template>
							<br/>
						</div>
						<div class="styEINBox" style="height:4mm;padding-left:2mm;font-size:7pt;">
        Filer's identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$Form8865ScheduleOData/FilersEIN">
										<span style="width: 30mm;  ">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FilersEIN"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:when test="$Form8865ScheduleOData/FilersSSN">
										<span style="width: 30mm; ">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FilersSSN"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/FilersMissingEINReason"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="border-right-width:0px;height:8mm;font-size:7pt;">
        Name of foreign partnership<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/NameOfForeignPartnership/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/NameOfForeignPartnership/BusinessNameLine2"/>
							</xsl:call-template>
							<br/>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<xsl:variable name="defaultRows" select="4"/>
					<xsl:variable name="p1RecCount1" select="count($Form8865ScheduleOData/MarketableSecurities)"/>
					<xsl:variable name="p1RecCount2" select="count($Form8865ScheduleOData/Inventory)"/>
					<xsl:variable name="p1RecCount3" select="count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)"/>
					<xsl:variable name="p1RecCount4" select="count($Form8865ScheduleOData/IntangibleProperty)"/>
					<xsl:variable name="p1RecCount5" select="count($Form8865ScheduleOData/OtherProperty)"/>
					<!-- Calculate the actual number of rows in the Part I table. If the sets of data in each category (other than Cash, always 1) -->
					<!-- is less than or equal to 4, make the count for the category equal to 4. If the set of data is greater                     -->
					<!-- than 4, make the count equal to the number of the data set.                                                               -->
					<xsl:variable name="MSCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/MarketableSecurities) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/MarketableSecurities)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="InvCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/Inventory) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/Inventory)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="TPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="IPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/IntangibleProperty) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/IntangibleProperty)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="OPCount">
						<xsl:choose>
							<xsl:when test="count($Form8865ScheduleOData/OtherProperty) &lt; 5">
								<xsl:number value="4"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="count($Form8865ScheduleOData/OtherProperty)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<!--Begin Part I-->
					<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:156mm;">Transfers Reportable Under Section 6038B
      </div>
						<!-- Pass in the DataRowCount value as the sum of Cash (which is always 1) and the rest of the data row count.-->
						<span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="1 + $MSCount + $InvCount + $TPCount + $IPCount + $OPCount"/>
								<xsl:with-param name="containerHeight" select="21"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styForm8865ScheduleOTableContainer" id="TPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" cellpadding="0" summary="Table for Transfers Reportable Under Section 6038B">
							<thead class="styTableThead">
								<tr>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;"> Type of <br/> property </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Date of <br/> transfer </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Number of <br/> items <br/> transferred </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(c)</b>
										<br/> Fair market <br/> value on date <br/>   of transfer </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(d)</b>
										<br/> Cost or other <br/> basis  </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 17mm; text-align: center;">
										<b>(e)</b>
										<br/> Section 704(c) <br/> allocation <br/>  method </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(f)</b>
										<br/> Gain <br/> recognized on <br/> transfer </th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(g)</b>
										<br/> Percentage interest  <br/> in partnership after <br/> transfer </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Jessica 10/30/2003: Re-program using index-loop to show structure as PDF form when records are less than space reserved on PDF - Begin -->
								<!-- JMI: 09/23/04: imped repeating data trying to maintain the index loop from above -->
								<xsl:choose>
									<xsl:when test="(($p1RecCount1 &gt; $defaultRows) or ($p1RecCount2 &gt; $defaultRows) or ($p1RecCount3 &gt; $defaultRows) or ($p1RecCount4 &gt; $defaultRows) or ($p1RecCount5 &gt; $defaultRows)) and ($Print = $Separated)">
										<!-- Part I: Rows of Cash - Begin -->
										<tr>
											<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 23mm;text-align: left;"> Cash</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 21mm; text-align: left; padding-left: 1.5mm">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportable/TypeOfProperty"/>
													<xsl:with-param name="ShortMessage" select="'true'"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm;height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: right">
												<span style="width:4px;"/>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right;border-right:0px;">
												<span style="width:4px;"/>
											</td>
										</tr>
										<!-- Part I: Rows of Cash - End -->
										<!-- Part I: Rows of Marketable Securities - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Marketable<br/>securities</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Marketable Securities - End -->
										<!-- Part I: Rows of Inventory - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Inventory</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Inventory - End -->
										<!-- Part I: Rows of Tangible Property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Tangible<br/>property<br/>used in trade<br/>or business</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Tangible Property  - End -->
										<!-- Part I: Rows of Intangible property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Intangible<br/>property</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Intangible property - End -->
										<!-- Part I: Rows of Other property - Begin -->
										<xsl:call-template name="p1FillerTemplate">
											<xsl:with-param name="max" select="$defaultRows"/>
											<xsl:with-param name="PropertyType">Other<br/>property</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other property - End -->
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 23mm;text-align: left;"> Cash</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashDateOfTransfer"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm;height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: right">
												<span style="width:4px;"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashFairMarketValue"/>
												</xsl:call-template>
											</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
											<xsl:choose>
												<xsl:when test="$Form8865ScheduleOData/CashIntInPrtshpAfterTransfer=''">
													<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right;border-right:0px;">
														<span style="width:4px;">%</span>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right;border-right:0px;">
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashIntInPrtshpAfterTransfer"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
										<!-- Part I: Rows of Marketable Securities - Begin -->
										<xsl:call-template name="p1Template1">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount1 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount1"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Marketable Securities - End -->
										<!-- Part I: Rows of Inventory - Begin -->
										<xsl:call-template name="p1Template2">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount2 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount2"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Inventory - End -->
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - Begin -->
										<xsl:call-template name="p1Template3">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount3 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount3"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Tangible Property Used in Trade or Business - End -->
										<!-- Part I: Rows of Intangible Property - Begin -->
										<xsl:call-template name="p1Template4">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount4 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount4"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Intangible Property - End -->
										<!-- Part I: Rows of Other Property - Begin -->
										<xsl:call-template name="p1Template5">
											<xsl:with-param name="max">
												<xsl:choose>
													<xsl:when test="$p1RecCount5 &gt; $defaultRows">
														<xsl:value-of select="$p1RecCount5"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="$defaultRows"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:with-param>
										</xsl:call-template>
										<!-- Part I: Rows of Other Property - End -->
										<!-- Re-program using index-loop to show structure as PDF form when records are less than space reserved on PDF - End -->
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="1 + $MSCount + $InvCount + $TPCount + $IPCount + $OPCount"/>
						<xsl:with-param name="containerHeight" select="21"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
					<div class="styBB" style="float:none;clear:none;width:187mm;height:8mm;">
						<div class="styTitleDesc" style="font-size: 8pt;padding-left:0px;">Supplemental Information Required To Be Reported
      <span class="styNormalText"> (see instructions):
      </span>
						</div>
						<br/>
					</div>
					<table class="styIRS926Table" cellspacing="0" cellpadding="0" border="0">
						<tfoot/>
						<tbody>
							<xsl:for-each select="$Form8865ScheduleOData/SupplementalInfoStatement">
								<xsl:if test="($Print != $Separated) or (count($Form8865ScheduleOData/SupplementalInfoStatement) &lt;=4)">
									<tr style="height:8mm; width: 180mm; font-size: 7pt">
										<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm;width:185mm">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<br/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<!-- 1 -->
							<!--Showing empty rows when there is no element added Ravi Venigalla 11/13/03 -->
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInfoStatement) &lt; 1 or ((count($Form8865ScheduleOData/SupplementalInfoStatement) &gt;4) and ($Print =    $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<xsl:if test="(count($Form8865ScheduleOData/SupplementalInfoStatement) &gt;4) and ($Print = $Separated)">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/SupplementalInfoStatement"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="(count($Form8865ScheduleOData/SupplementalInfoStatement) &lt;1)">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<!-- 2 -->
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInfoStatement) &lt; 2 or ((count($Form8865ScheduleOData/SupplementalInfoStatement) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInfoStatement) &lt; 3 or ((count($Form8865ScheduleOData/SupplementalInfoStatement) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form8865ScheduleOData/SupplementalInfoStatement) &lt; 4 or ((count($Form8865ScheduleOData/SupplementalInfoStatement) &gt;4) and ($Print = $Separated))">
								<tr style="font-size: 7pt">
									<td style="border-bottom:1 solid black; padding-left:2mm; height:5mm; width:185mm; font-size: 7pt">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<!--END Part I-->
					<!--Begin Part II-->
					<div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:156mm;">Dispositions Reportable Under Section 6038B
      </div>
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportable"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'DTPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainerNBB" name="Dispositions6038B" id="DTPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="float:none" cellspacing="0" name="Dispositions6038B" id="DTPctn" summary="Table for Dispositions Reportable Under Section 6038B">
							<thead class="styTableThead">
								<tr>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Date of <br/> original <br/> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(c)</b>
										<br/> Date of <br/> disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 20mm; text-align: center;">
										<b>(d)</b>
										<br/> Manner of <br/> disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(e)</b>
										<br/> Gain <br/> recognized by <br/> partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(f)</b>
										<br/> Depreciation <br/> recapture <br/> recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(g)</b>
										<br/> Gain allocated <br/> to partner</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(h)</b>
										<br/> Depreciation <br/> recapture<br/> allocated<br/> to partner</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/DispositionsReportable">
									<xsl:if test="($Print != $Separated) or (count($Form8865ScheduleOData/DispositionsReportable)&lt;=4)">
										<tr>
											<td class="styForm8865ScheduleOPartIITableCell" scope="row" style="width:23mm;text-align:left;padding-top:1.5mm;">
												<!-- Form to Form Link -->
												<span style="width:3mm; text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="TypeOfProperty"/>
													</xsl:call-template>
												</span>
												<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfProperty"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width:23mm;text-align:center;padding-top:1.5mm;">
												<!-- Form to Form Link -->
												<span style="width:3mm;text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DateOfOriginalTransfer"/>
													</xsl:call-template>
												</span>
												<span style="width:2px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateOfOriginalTransfer"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm; border-left:0px; text-align: center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DateOfDisposition"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm;text-align: left; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MannerOfDisposition"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-left:0px;text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainRecognizedByPartnership"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecRcptrRecognizedByPrtshp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainAllocatedToPartner"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-right:0px; text-align: right; ">
												<!-- Form to Form Link -->
												<span style="width:3mm; text-align:left;" class="styGenericDiv">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DeprecRecaptureAllocnToPartner"/>
													</xsl:call-template>
												</span>
												<span style="float:right;text-align:left;" class="styGenericDiv">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DeprecRecaptureAllocnToPartner"/>
													</xsl:call-template>
												</span>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportable)&lt; 1 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportable)&gt; 4))">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell" style="text-align:left;">
											<span class="styTableCellPad"/>
											<xsl:if test="((count($Form8865ScheduleOData/DispositionsReportable) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportable/TypeOfProperty"/>
													<xsl:with-param name="ShortMessage" select="'true'"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportable)&lt; 2 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportable)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportable)&lt; 3 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportable)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8865ScheduleOData/DispositionsReportable)&lt; 4 or (($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportable)&gt; 4)) ">
									<tr>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell">
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--Set initial height of the Dispositions Reportable table-->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportable"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'DTPctn' "/>
					</xsl:call-template>
					<!--END Part II-->
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="clear:both;width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:133mm;">
							<span class="styNormalText">
          Is any transfer reported on this schedule subject to gain recognition under section 904(f)(3) or
          section 904(f)(5)(F)?
            
          <!-- Form to Form Link -->
								<span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:6px;"/>
								</span>
								<img src="{$ImagePath}/8865SchO_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
							</span>
						</div>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
							</xsl:call-template>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:3mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
									</xsl:call-template>
									<span class="styBoldText">
             Yes 
           </span>
								</label>
							</div>
							<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:3mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:8px"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TransferSubjectToGain"/>
									</xsl:call-template>
									<span class="styBoldText">
             No 
           </span>
								</label>
							</div>
						</span>
					</div>
					<!-- END Part III Title -->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 8865. </span>
						<span style="width:32px;"/>  
      Cat. No. 25909U
      <span style="width:36px;"/>
						<span class="styBoldText">Schedule O (Form 8865) 2010</span>
					</div>
					<br/>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- JMI -->
					<!-- JMI: Additional Data Table-->
					<!-- Separated Data for Part I -->
					<xsl:if test="($Print = $Separated) and  (($p1RecCount1 &gt; $defaultRows) or ($p1RecCount2 &gt; $defaultRows) or ($p1RecCount3 &gt; $defaultRows) or ($p1RecCount4 &gt; $defaultRows) or ($p1RecCount5 &gt; $defaultRows))">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part I - Transfers Reportable Under Section 6038B:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;"> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Date of <br/> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Number of <br/> items <br/> transferred</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(c)</b>
										<br/> Fair market <br/> value on date <br/> of transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(d)</b>
										<br/> Cost or other <br/> basis</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 17mm; text-align: center;">
										<b>(e)</b>
										<br/> Section 704(c) <br/> allocation <br/> method</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(f)</b>
										<br/> Gain <br/> recognized on <br/> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(g)</b>
										<br/> Percentage interest <br/>in partnership after <br/> transfer</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<tr>
									<xsl:attribute name="class">styDepTblRow1    </xsl:attribute>
									<td class="styForm8865ScheduleOTablesCells" scope="row" style="width: 23mm;text-align: left;"> Cash</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashDateOfTransfer"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm;height: 4mm; background-color:lightgrey">&nbsp;</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; text-align: right">
										<span style="width:4px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashFairMarketValue"/>
										</xsl:call-template>
									</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 20mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
									<td class="styForm8865ScheduleOTablesCells" style="width: 23mm; height: 4mm; background-color:lightgrey">&nbsp;</td>
									<xsl:choose>
										<xsl:when test="$Form8865ScheduleOData/CashIntInPrtshpAfterTransfer=''">
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right;border-right:0px;">
												<span style="width:4px;">%</span>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styForm8865ScheduleOTablesCells" style="width: 27mm; text-align: right;border-right:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/CashIntInPrtshpAfterTransfer"/>
												</xsl:call-template>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
								<!-- Part I: Rows of Marketable Securities - Begin -->
								<xsl:call-template name="p1Template1">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$p1RecCount1 &gt; $defaultRows">
												<xsl:value-of select="$p1RecCount1"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$defaultRows"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
								<!-- Part I: Rows of Marketable Securities - End -->
								<!-- Part I: Rows of Inventory - Begin -->
								<xsl:call-template name="p1Template2">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$p1RecCount2 &gt; $defaultRows">
												<xsl:value-of select="$p1RecCount2"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$defaultRows"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
								<!-- Part I: Rows of Inventory - End -->
								<!-- Part I: Rows of Tangible Property Used in Trade or Business - Begin -->
								<xsl:call-template name="p1Template3">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$p1RecCount3 &gt; $defaultRows">
												<xsl:value-of select="$p1RecCount3"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$defaultRows"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
								<!-- Part I: Rows of Tangible Property Used in Trade or Business - End -->
								<!-- Part I: Rows of Intangible Property - Begin -->
								<xsl:call-template name="p1Template4">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$p1RecCount4 &gt; $defaultRows">
												<xsl:value-of select="$p1RecCount4"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$defaultRows"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
								<!-- Part I: Rows of Intangible Property - End -->
								<!-- Part I: Rows of Other Property - Begin -->
								<xsl:call-template name="p1Template5">
									<xsl:with-param name="max">
										<xsl:choose>
											<xsl:when test="$p1RecCount5 &gt; $defaultRows">
												<xsl:value-of select="$p1RecCount5"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$defaultRows"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part I -->
					<!-- Separated Data for Part I - Supplemental Info. -->
					<xsl:if test="($Print = $Separated) and  (count($Form8865ScheduleOData/SupplementalInfoStatement) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part I - Supplemental Information Required To Be Reported:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="padding-left:5mm; padding-bottom:4mm">
										<br/>Supplemental Information Required To Be Reported (see instructions)<br/>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/SupplementalInfoStatement">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:184mm; height:7mm">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part I - Supplemental Info. -->
					<!-- Separated Data for Part II HERE -->
					<xsl:if test="($Print = $Separated) and  (count($Form8865ScheduleOData/DispositionsReportable) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8865 Schedule O, Part II - Dispositions Reportable Under Section 6038B:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(a)</b>
										<br/> Type of <br/> property</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(b)</b>
										<br/> Date of <br/> original <br>/ </br> transfer</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(c)</b>
										<br/> Date of disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(d)</b>
										<br/> Manner of disposition</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;">
										<b>(e)</b>
										<br/> Gain recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 17mm; text-align: center;">
										<b>(f)</b>
										<br/> Depreciation recapture recognized by partnership</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 23mm; text-align: center;">
										<b>(g)</b>
										<br/> Gain allocated to partner</th>
									<th class="styForm8865ScheduleOTablesCells" scope="col" style="width: 27mm; text-align: center;border-right:0px;">
										<b>(h)</b>
										<br/> Depreciation <br/> recapture<br/> allocated<br/> to partner</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8865ScheduleOData/DispositionsReportable">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styForm8865ScheduleOPartIITableCell" scope="row" style="width:23mm;text-align:left;padding-top:1.5mm;">
											<!-- Form to Form Link -->
											<span style="width:3mm;text-align:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="TypeOfProperty"/>
												</xsl:call-template>
											</span>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TypeOfProperty"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width:23mm;text-align:center;padding-top:1.5mm;">
											<!-- Form to Form Link -->
											<span style="width:3mm; text-align:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="DateOfOriginalTransfer"/>
												</xsl:call-template>
											</span>
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateOfOriginalTransfer"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm; border-left:0px; text-align: center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DateOfDisposition"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 20mm;text-align: left; ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MannerOfDisposition"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-left:0px;text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainRecognizedByPartnership"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right; ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeprecRcptrRecognizedByPrtshp"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 23mm; border-left:0px; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAllocatedToPartner"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styForm8865ScheduleOPartIITableCell" style="width: 27mm; border-right:0px; text-align: right; ">
											<!-- Form to Form Link -->
											<span style="width:3mm; text-align:left;" class="styGenericDiv">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="DeprecRecaptureAllocnToPartner"/>
												</xsl:call-template>
											</span>
											<span style="float:right;text-align:right;" class="styGenericDiv">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeprecRecaptureAllocnToPartner"/>
												</xsl:call-template>
											</span>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Jessica 10/30/2003: Add templates for showing Part I structure as PDF form when records are less than space reserved on PDF  - Begin -->
	<xsl:template name="p1Template1">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/MarketableSecurities)&gt;4) or (count($Form8865ScheduleOData/Inventory)&gt;4) or (count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)&gt;4) or (count($Form8865ScheduleOData/IntangibleProperty)&gt;4) or (count($Form8865ScheduleOData/OtherProperty)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>  
          Marketable<br/>securities  
        </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/DateOfTransfer"/>
					</xsl:call-template>
				</td>
				<!-- **************** this is where the line starts  ***************** -->
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/NumberOfItemsTransferred"/>
						<!--   <xsl:with-param name="MaxSize" select="10" />   -->
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/FairMarketValueOnDateOfTrnsfr"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/CostOrOtherBasis"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/AllocationMethod"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/GainRecognizedOnTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/MarketableSecurities[$index]/PctIntInPartnershipAfterTrnsfr"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template1">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template2">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/MarketableSecurities)&gt;4) or (count($Form8865ScheduleOData/Inventory)&gt;4) or (count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)&gt;4) or (count($Form8865ScheduleOData/IntangibleProperty)&gt;4) or (count($Form8865ScheduleOData/OtherProperty)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Inventory             
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/DateOfTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/NumberOfItemsTransferred"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/FairMarketValueOnDateOfTrnsfr"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/CostOrOtherBasis"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/AllocationMethod"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/GainRecognizedOnTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/Inventory[$index]/PctIntInPartnershipAfterTrnsfr"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template2">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template3">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/MarketableSecurities)&gt;4) or (count($Form8865ScheduleOData/Inventory)&gt;4) or (count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)&gt;4) or (count($Form8865ScheduleOData/IntangibleProperty)&gt;4) or (count($Form8865ScheduleOData/OtherProperty)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Tangible<br/>property<br/>used in trade<br/>or business      
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/DateOfTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/NumberOfItemsTransferred"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/FairMarketValueOnDateOfTrnsfr"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/CostOrOtherBasis"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/AllocationMethod"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/GainRecognizedOnTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus[$index]/PctIntInPartnershipAfterTrnsfr"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template3">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template4">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/MarketableSecurities)&gt;4) or (count($Form8865ScheduleOData/Inventory)&gt;4) or (count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)&gt;4) or (count($Form8865ScheduleOData/IntangibleProperty)&gt;4) or (count($Form8865ScheduleOData/OtherProperty)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Intangible<br/>property  
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/DateOfTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/NumberOfItemsTransferred"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/FairMarketValueOnDateOfTrnsfr"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/CostOrOtherBasis"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/AllocationMethod"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/GainRecognizedOnTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/IntangibleProperty[$index]/PctIntInPartnershipAfterTrnsfr"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template4">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p1Template5">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="($Print=$Separated) and ((count($Form8865ScheduleOData/MarketableSecurities)&gt;4) or (count($Form8865ScheduleOData/Inventory)&gt;4) or (count($Form8865ScheduleOData/TngblPropertyUsedInTradeOrBus)&gt;4) or (count($Form8865ScheduleOData/IntangibleProperty)&gt;4) or (count($Form8865ScheduleOData/OtherProperty)&gt;4))">
					<!-- Define background colors to the rows -->
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>        
      Other<br/>property  
    </td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:center">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/DateOfTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/NumberOfItemsTransferred"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/FairMarketValueOnDateOfTrnsfr"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/CostOrOtherBasis"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/AllocationMethod"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/GainRecognizedOnTransfer"/>
					</xsl:call-template>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/OtherProperty[$index]/PctIntInPartnershipAfterTrnsfr"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:call-template name="p1Template5">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Jessica 10/30/2003: Add templates for showing Part I structure as PDF form when records are less than space reserved on PDF - End -->
	<!-- JMI -->
	<xsl:template name="p1FillerTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="PropertyType"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<xsl:if test="$index = 1">
					<td class="styForm8865ScheduleOTablesCells" scope="row" style="text-align:left">
						<xsl:attribute name="rowspan"><xsl:value-of select="$max"/></xsl:attribute>
						<xsl:value-of select="$PropertyType"/>
					</td>
				</xsl:if>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<span style="width:4px"/>
					<xsl:if test="$index = 1">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8865ScheduleOData/DispositionsReportable/TypeOfProperty"/>
							<xsl:with-param name="ShortMessage" select="'true'"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="text-align:left">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells">
					<span style="width:4px"/>
				</td>
				<td class="styForm8865ScheduleOTablesCells" style="border-right:0">
					<span style="width:4px"/>
				</td>
			</tr>
			<xsl:call-template name="p1FillerTemplate">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
