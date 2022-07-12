<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 rel. 3 sp1 (http://www.altova.com) by IRS (IRS) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5713ScheduleAStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5713AData" select="$RtnDoc/IRS5713ScheduleA"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>Schedule A (5713)</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Schedule A (5713)"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5713ScheduleAStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form5713A">
					<!--  start page header -->
					<xsl:call-template name="DocumentHeader"/>
					<div style="width:187mm;height:auto;">
						<div class="styFNBox" style="width:32mm;height:20mm;">
							<div class="styFormNumber" style="font-size: 9pt;">SCHEDULE A</div>
							<div class="styFormNumber" style="font-size: 9pt;">(Form 5713)</div>
							<div style="width:31mm;font-weight:normal;font-size:6.5pt;">(Rev. December 2010)</div>
							<div style="padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<!--  Form Push Pen   -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5713AData"/>
								</xsl:call-template>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:14mm;">
							<div class="styMainTitle">International<br/>Boycott Factor (Section 999(c)(1))</div>
							<span style="font-size:7pt;width:105mm;text-align:center;">
								<i>Complete only if you are <b>not</b> computing a loss of tax benefits using the specifically attributable taxes and income method on Schedule B (Form 5713)</i>
							</span>
							<div class="styFBT" style="margin-top:0mm;font-size:8pt;">
								<img src="{$ImagePath}/5713SchA_Right_Angle_Title.gif" alt="bullet image pointing to right" width="4"/> Attach to Form 5713.
                <span style="width:12px;"/>
								<img src="{$ImagePath}/5713SchA_Right_Angle_Title.gif" alt="bullet image pointing to right" width="4"/>
								<span style="width:3px;"/>See instructions on page 2. </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div style="font-size:7pt;padding-top:9mm;">OMB No. 1545-0216</div>
						</div>
						<!-- end header -->
						<!--Name and Identifying number Begin-->
						<div class="styBB" style="width:187mm;border-top-width:1px">
							<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:137mm;height:9mm;">Name<br/>
								<xsl:choose>
									<xsl:when test="$Form5713AData/BusinessName/BusinessNameLine1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5713AData/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5713AData/NameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5713AData/NameLine1Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<xsl:choose>
									<xsl:when test="$Form5713AData/BusinessName/BusinessNameLine2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5713AData/BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5713AData/NameLine1Txt">
				</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styEINBox" style="font-family:Verdana;font-size:7pt;width:50mm;height:9mm;padding-left:2mm;">Identifying number<br/>
								<br/>
								<span style="text-align:left;font-weight:normal;">
									<xsl:choose>
										<xsl:when test="$Form5713AData/EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form5713AData/EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$Form5713AData/SSN">
											<xsl:if test="$Form5713AData/SSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$Form5713AData/SSN"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:when test="$Form5713AData/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5713AData/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<!-- Name and Identifying number END-->
					<div class="styLNDesc" style="width:187mm;height:auto;">Name of country being boycotted (check one):       <span style="width:.5mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form5713AData/IsraelBoycottedInd"/>
								<xsl:with-param name="BackupName">IRS5713SchAIsraelBoycotted</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:1mm;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form5713AData/IsraelBoycottedInd"/>
								<xsl:with-param name="BackupName">IRS5713SchAIsraelBoycotted</xsl:with-param>
							</xsl:call-template>Israel       
            </label>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form5713AData/OtherInd"/>
								<xsl:with-param name="BackupName">IRS5713SchAOtherCountryBoycotted</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width: 1mm;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form5713AData/OtherInd"/>
								<xsl:with-param name="BackupName">IRS5713SchAOtherCountryBoycotted</xsl:with-param>
							</xsl:call-template>Other (identify)       
            </label>
						<img src="{$ImagePath}/5713SchA_Bullet.gif" alt="bullet image pointing to right" width="8"/>
						<span style="width:4px;"/>
						<span class="styFixedUnderline" style="width:83mm;float:none;padding-bottom:0;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5713AData/OtherInd/@countryCd"/>
							</xsl:call-template>
						</span>
					</div>
					<div style="width:187mm;font-style:italic;height:auto;">
					    <div style="font-style: normal;"><span style="font-weight:bold;">Important:</span></div>
						<div style="font-style: normal;"> If you are involved in more than one boycott, use a separate Schedule A for each boycott and attach to Form 5713.</div> 
					</div>
					<!-- Item "(a-o) Table" start -->
					<!--Table expand/collapse toggle button-->
					<div style="width:187mm;">
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="count($Form5713AData/BoycottInfoForEachCountry) + 1"/>
								<xsl:with-param name="containerHeight" select="16"/>
								<xsl:with-param name="headerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'TP1ctn' "/>
							</xsl:call-template>
						</div>
						<!--Table expand/collapse toggle button end-->
					</div>
					<div class="styIRS5713ScheduleATableContainer" style="height:auto;" id="TP1ctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" summary="Boycott Information for each country">
							<tr>
								<th class="styTableCell" scope="col" colspan="2" rowspan="2" style="width:60mm;text-align:center;font-size:7pt;border-color:black;left-margin:3mm;border-bottom:none;">Name of Country</th>
								<th class="styTableCell" scope="col" colspan="3" style="width:127mm;width:auto;text-align:center;font-size:7pt;border-color:black;border-right:none;padding-top:1mm;padding-bottom:1mm;">Purchases, sales, and payroll attributable to boycotting operations, by operation</th>
							</tr>
							<tr>
								<th class="styTableCell" scope="col" style="width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Boycott purchases</th>
								<th class="styTableCell" scope="col" style="width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Boycott sales</th>
								<th class="styTableCell" scope="col" style="width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;border-right:none;border-bottom:none;">Boycott payroll</th>
							</tr>
							<tr>
								<th class="styTableCell" scope="col" colspan="2" style="width:60mm;width:auto;text-align:center;font-size:7pt;border-color:black;padding-bottom:1mm;">(1)</th>
								<th class="styTableCell" scope="col" style="width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;padding-bottom:1mm;;">(2)</th>
								<th class="styTableCell" scope="col" style="width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;padding-bottom:1mm;">(3)</th>
								<th class="styTableCell" scope="col" style="left-margin:0mm;width:42.3mm;width:auto;text-align:center;font-size:7pt;border-color:black;border-right:none;padding-bottom:1mm;">(4)</th>
							</tr>
							<!-- Display all elements if the Print parameter is not Separated. If the Print parameter is Separated, but there are -->
							<!-- fewer elements than the container height, then also display all elements. -->
							<xsl:if test="($Print != $Separated) or (count($Form5713AData/BoycottInfoForEachCountry) &lt;= 15)">
								<xsl:for-each select="$Form5713AData/BoycottInfoForEachCountry">
									<tr>
										<xsl:if test="position() &lt;16">
											<td class="styTableCell" style="width:5mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;border-right:none;height:8mm;vertical-align:bottom;">
												<xsl:number value="position()" format="a"/>
											</td>
											<td class="styTableCell" style="width:55mm;text-align:left;font-size:7pt;border-color:black;vertical-align:bottom;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
										</xsl:if>
										<xsl:if test="position()&gt;=16">
											<td class="styTableCell" style="width:5mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;border-right:none;height:8mm;vertical-align:bottom;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:55mm;text-align:left;font-size:7pt;border-color:black;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
										</xsl:if>
										<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottPurchasesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottSalesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;border-right:none;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottPayrollAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Display blank rows to fill the container height if needed -->
							<!-- When the Print parameter is Separated and the number of elements exceeds the container height, -->
							<!-- then display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 1 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">
										<span style="font-weight:bold;">a</span>
										<span class="styTableCellPad"/>
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form5713AData/BoycottInfoForEachCountry"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="width:42.3mm;text-align:right;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;text-align:right;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 2 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">b<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 3 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">c<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 4 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">d<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 5 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">e<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 6 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">f<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 7 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">g<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 8 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">h<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 9 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">i<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 10 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">j<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 11 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">k<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:blackvertical-align:bottom;;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 12 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">l<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 13 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">m<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 14 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">n<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713AData/BoycottInfoForEachCountry) &lt; 15 or        (($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)) ">
								<tr>
									<td class="styTableCell" colspan="2" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;height:8mm;vertical-align:bottom;">o<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:42.3mm;border-color:black;border-right:none;vertical-align:bottom;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="styTableCell" colspan="2" style="width:50mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;                  border-bottom-width:0px;border-right-width:1px;height:9mm;vertical-align:bottom;">Total    
                      <!--dotted line-->
									<span style="letter-spacing:4mm;font-weight:bold">.........</span>
								</td>
								<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;border-bottom-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottPurchasesAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;border-bottom-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottSalesAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:42.3mm;text-align:right;font-size:7pt;border-color:black;border-right:none;border-bottom-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottPayrollAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="count($Form5713AData/BoycottInfoForEachCountry) + 1"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="headerHeight" select="3"/>
						<xsl:with-param name="containerID" select="'TP1ctn'"/>
					</xsl:call-template>
					<!-- Item 1 start-->
					<!--KEVINCHANG  <div style="width:187mm;">     <div class="styLNDesc" style="width:143.5mm;font-weight:normal;"></div>     <div class="styLNAmountBox" style="border-top-width:0px;border-bottom-width:0px;width:43mm;"></div>   </div>   -->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">1</div>
							<div class="styLNDesc" style="width:135.3mm;height:4mm;">
								<span style="float:left;">Numerator of boycott factor (add totals of columns (2), (3), and (4))   </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="border-top-width:0px;font-size:7pt;width:42.3mm;height:9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5713AData/NumeratorBoycottFactorAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Item 1 end-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">2</div>
							<div class="styLNDesc" style="width:93.6mm;">Denominator of boycott factor:</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBoxNBB" style="border-top-width:0px;width:42.3mm;height:4.5mm;"/>
							<div class="styShadingCell" style="height:4.5mm;width:42.3mm;"/>
						</div>
					</div>
					<!-- Item 2a start-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD">a</div>
							<div class="styLNDesc" style="width:93.6mm;height:4mm;">
								<span style="float:left;">Total purchases from countries other than United States</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="border-top-width:0px;font-size:7pt;width:42.3mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5713AData/TotalPurchasesOtherThanUSAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:4.5mm;width:42.3mm;"/>
						</div>
					</div>
					<!-- Item 2a end-->
					<!-- Item 2b start-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:93.6mm;height:4mm;">
								<span style="float:left;">Total sales to or from countries other than United States</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="border-top-width:0px;font-size:7pt;width:42.3mm;height:9mm;">
								<br/>
								<span style="height: 4.5mm;">&#160;</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5713AData/TotalSalesOtherThanUSAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:9mm;width:42.3mm;"/>
						</div>
					</div>
					<!-- Item 2b end-->
					<!-- Item 2c start-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD">c</div>
							<div class="styLNDesc" style="width:93.6mm;height:4mm;">
								<span style="float:left;">Total payroll paid or accrued for services performed in countries other</span>
								<span style="float:left;">than United States</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="border-top-width:0px;font-size:7pt;width:42.3mm;height:9mm;padding-top:3mm;">
								<span style="height: 4.5mm;">&#160;</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5713AData/TotalPayrollPaidOtherThanUSAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:9mm;width:42.3mm;"/>
						</div>
					</div>
					<!-- Item 2c end-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNDesc" style="width:135.3mm;font-weight:normal;"/>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="border-top-width:0px;border-bottom-width:0px;width:42.3mm;"/>
						</div>
					</div>
					<!-- Item 2d start-->
					<div style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBoxSD">d</div>
							<div class="styLNDesc" style="width:135.3mm;">
								<span style="float:left;">Total of lines 2a, b, and c   </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBox" style="width:42.3mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5713AData/TotalDenominatorBoycottFctrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Item 2d end-->
					<!-- Item 3 start-->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none">
							<div class="styLNLeftNumBox" style="height:9mm;">3</div>
							<div class="styLNDesc" style="width:135.3mm;font-weight:normal;">
								<b>International boycott factor</b> (divide line 1 by line 2d). Enter here and on Schedule C (Form 5713) (see instructions)     
                <!--Dotted Line-->
								<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
								<img src="{$ImagePath}/5713SchA_Bullet.gif" style="margin-left:3mm;" alt="bullet image pointing to right" width="8"/>
							</div>
						</div>
						<div style="float:right;clear:none">
							<div class="styLNAmountBoxNBB" style="padding-top:6mm;width:42.3mm;height:9mm;float:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5713AData/InternationalBoycottFactorRt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Item 3 end-->
					<div style="width:187mm;font-size:7pt;">
						<b>For Paperwork Reduction Act Notice, see the Instructions for Form 5713.</b>
						<span style="width:3mm;"/>       Cat. No. 12050W       <span style="width:3mm;"/>
						<b>Schedule A (Form 5713) (Rev. 12-2010)</b>
					</div>
					<p style="page-break-before:always"/>
					<!-- Left over data -->
					<br/>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">         Additional Data               </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5713AData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Data from Boycott Country Information Table -->
					<xsl:if test="($Print = $Separated) and (count($Form5713AData/BoycottInfoForEachCountry) &gt; 15)">
						<span class="styRepeatingDataTitle">
							<br/>Form 5713 Schedule A - Boycott Factor Table     </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<!-- Header Rows -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="2" rowspan="2" style="width:60mm;text-align:center;border-bottom:none">             Name of Country           </th>
									<th class="styDepTblCell" scope="col" colspan="3" style="width:126.9mm;text-align:center;">             Purchases, sales, and payroll attributable to boycotting operations, by operation           </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-bottom:none">Boycott purchases</th>
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-bottom:none">Boycott sales</th>
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-bottom:none">Boycott payroll</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="2" style="width:60mm;text-align:center;border-top:none;">(1)</th>
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-top:none">(2)</th>
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-top:none">(3)</th>
									<th class="styDepTblCell" scope="col" style="width:42.3mm;text-align:center;border-top:none">(4)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Data rows-->
								<xsl:for-each select="$Form5713AData/BoycottInfoForEachCountry">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:5mm;text-align:left;font-weight:bold;border-right:none;vertical-align:bottom;">
											<xsl:number value="position()" format="a"/>
										</td>
										<td class="styDepTblCell" style="width:55mm;text-align:left;border-left:none;vertical-align:bottom;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:42.3mm;text-align:right;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottPurchasesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:42.3mm;text-align:right;vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottSalesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:42.3mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottPayrollAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="2" style="text-align:left; font-weight: bold;vertical-align:bottom;">Total</td>
									<td class="styDepTblCell" style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottPurchasesAmt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottSalesAmt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form5713AData/TotalBoycottPayrollAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- End of Boycott Country Information Table separated data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
