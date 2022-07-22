<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS5471ScheduleJData" select="$RtnDoc/IRS5471ScheduleJ"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS5471ScheduleJData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Schedule J (Form 5471)"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5471ScheduleJ CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5471ScheduleJStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:256mm">
				<form name="IRS5471ScheduleJ">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:256mm;height: 23mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:40mm;font-size:8pt;height:23mm;border-right-width:2px;">
							<span class="styFormNumber" 
							style="font-size:10pt;font-weight:bold;">SCHEDULE J</span>
							<span class="styFormNumber" style="font-size:10pt;font-weight:bold;">(Form 5471)</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Return Software ID</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/softwareId"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Return Software Version</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/softwareVersion"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<div class="sty5471ScheduleJRev">(Rev. December 2012)</div>
							<div class="styAgency" style="width:36mm;height:3mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData"/>
							</xsl:call-template>
							</div>
							<div class="styAgency" style="padding-top:0mm;font-size:8pt">Department of the Treasury</div>
							<div class="styAgency" style="padding-top:0mm;font-size:8pt">Internal Revenue Service</div>
							<br/>
						</div>
						<div class="styFTBox" 
						style="height: 23mm;width:175mm;padding-top:1mm;
						border-left-width:1px;border-right-width:1px;">
							<div class="styMainTitle" style="font-weight:bold;">
							Accumulated Earnings and Profits (E&amp;P)<br/> of Controlled Foreign Corporation</div>
							<div style="padding-top:4mm;border:0px;width:175mm;font-size:8pt" class="styFST">
								<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="Bullet Image"/>
								Information about Schedule J (Form 5471) and its instructions is at
								<a style="text-decoration:none;color:black;" 
								href="http://www.irs.gov/form5471" title="Link to IRS.gov">
									<i>www.irs.gov/form5471</i>
								</a>.
							</div>
							<div class="styFST" style="font-weight:bold;">
								<div style="margin-left: 1.5mm;;">
									<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="bullet"/>
									 Attach to Form 5471.
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:40mm;height:23mm;border-left-width: 2px">
							<div class="styOMB"
							 style="padding-top:10mm;height:2mm;border-bottom:0;text-align:middle;">
							 OMB No. 1545-0704</div>
						</div>
					</div>
					<!-- END FORM HEADER -->
	                <!-- BEGIN TAXPAYER INFO -->
					<div class="styBB" style="width:256mm;">
						<div class="sty5471ScheduleJBusinessName" 
						style="width:184mm;height:9mm;border-right-width: 0px;">
						Name of person filing Form 5471
					  <br/>
							<span>
							  <!-- choise beween input Name versus Name from 1120/1065/1040 and 1041 Return Header info --> 
								<xsl:choose>
									<!-- Name from Form level -->
									<xsl:when test="$IRS5471ScheduleJData/PersonNm != '' ">
									<span style="padding-top:3mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/PersonNm"/>
										</xsl:call-template>
									</span>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/BusinessName/BusinessNameLine1Txt != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
											 select="$IRS5471ScheduleJData/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when
											 test="$IRS5471ScheduleJData/BusinessName/BusinessNameLine2Txt != '' ">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode"
													 select="$IRS5471ScheduleJData/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
									<!-- Name from 1120/990/1065,1041,1040,1040NR Return Header -->
										<xsl:call-template name="PopulateFilerName">
										<xsl:with-param name="TargetNode" 
										select="IRS5471ScheduleJData"/>
									</xsl:call-template>
								</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty5471ScheduleJIN" style="width:72mm;height:9mm;border-left-width: 1px;">
							<span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">
							Identifying number</span>
							<br/>
							<span class="sty5471ScheduleJINBox"
							 style="font-weight:normal; height:4mm; margin-left: 1mm; padding-top:3mm;">
							  <!-- Choice between input TIN versus TIN from 1120, 1065, 1040, and 1041 Return Header Filer info -->
								<xsl:choose>
									<!-- TIN from Form level -->
									<xsl:when test="$IRS5471ScheduleJData/SSN != '' ">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/EIN != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/MissingSSNEINReasonCd != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$IRS5471ScheduleJData/MissingSSNEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<!-- TIN from 1120, 990, 1065, ETEC, 1041 return headers-->
										<xsl:call-template name="PopulateFilerTIN">
										<xsl:with-param name="TargetNode" 
										select="IRS5471ScheduleJData"/>
									</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN NAME OF FOREIGN CORPORATION   -->
					<!-- May 24, 2012 place holder for new line -->
					<div class="styBB" style="width:256mm;">
						<div class="sty5471ScheduleJBusinessName" 
						style="width:120mm;height:9mm;">Name of foreign corporation
							<br/>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									select="$IRS5471ScheduleJData/ForeignCorporationName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									 select="$IRS5471ScheduleJData/ForeignCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5471ScheduleJBusinessName" style="width:64mm;height:9mm;border-right:0;">
							<span style="float:left; clear: none; margin-left: 1mm">EIN (if any)</span>
							<br/>
							<span class="sty5471ScheduleJINBox"
							 style="font-weight:normal; margin-left: 1mm; padding-top: 3mm;">
								<xsl:choose>
									<xsl:when test="$IRS5471ScheduleJData/ForeignCorporationEIN != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" 
											select="$IRS5471ScheduleJData/ForeignCorporationEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/MissingEINReasonCd != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$IRS5471ScheduleJData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty5471ScheduleJIN" style="width:72mm;height:9mm;border-left-width:1px;">
							<span style="float:left; clear: none; margin-left: 1mm">
							Reference ID number (see instructions)</span>
							<br/>
							<span class="sty5471ScheduleJINBox"
							 style="font-weight:normal; loat:left; margin-left: 1mm; padding-top:2mm;">
								<xsl:choose>
									<xsl:when
									 test="((count($IRS5471ScheduleJData/ForeignEntityIdentificationGrp) &gt; 1)) ">
									See Additional Data Table
									</xsl:when>
									<xsl:otherwise>
										<span style="font-size:8px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" 
												select="$IRS5471ScheduleJData/ForeignEntityIdentificationGrp/
												ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--   BEGIN HEADER   -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm;">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="sty5471ScheduleJCellGeneric" 
									style="font-weight:normal;width:64mm;text-align:center;
									height:20mm;padding-top:1.5mm;" 
									scope="col" rowspan="2">
							<b>Important: </b> Enter amounts in<br/>functional currency.
						</th>
						<th class="sty5471ScheduleJCellGeneric" 
						style="font-weight:normal;text-align: center; height: 20mm;  padding-top: 2mm;"
						 rowspan="2"  scope="col">
							<b>(a) </b> Post-1986<br/>
							Undistributed Earnings<br/>(post-86 section<br/>	959(c)(3) balance)
						</th>
						<th class="sty5471ScheduleJCellGeneric" 
						style="font-weight:normal;text-align: center; height: 20mm;  padding-top: 2mm;"
						 rowspan="2"  scope="col">
							<b>(b) </b> Pre-1987 E&amp;P<br/>
							Not Previously Taxed<br/>(pre-87 section<br/>959(c)(3) balance)
						</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;width:96mm;text-align: center; height:10mm;" 
							 colspan="3"  scope="col">
								<b>(c) </b> Previously Taxed E&amp;P (see instructions)
								<br/>(sections 959(c)(1) and (2) balances)
							</th>
						<th class="sty5471ScheduleJCellGeneric"
						 style="font-weight:normal;text-align: center; border-right: 0;height: 20mm; padding-top: 2mm;"
						  rowspan="2"  scope="col">
							<b>(d) </b> Total Section<br/>964(a) E&amp;P<br/>(combine columns<br/>(a), (b), and (c))
						</th>
					</tr>
								<tr>
							<th class="sty5471ScheduleJCellGeneric" 
							style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								<i>(i)</i> Earnings Invested<br/>in U.S. Property
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								<i>(ii)</i> Earnings Invested<br/>in Excess Passive<br/>Assets
							</th>
							<th class="sty5471ScheduleJCellGeneric" 
							style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								<i>(iii)</i> Subpart F Income
							</th>
					</tr>
					</thead>
					<!--   END HEADER   -->
					<tfoot/>
					<tbody>
					<!--   BEGIN LINE 1   -->
					<tr class="sty5471ScheduleJDescLine" style="height:8mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:8mm;padding-top:4mm;">1</div>
							<div class="styLNDesc" 
							style="width:59mm;padding-top:4mm;text-align:left;padding-left:4mm;">
							Balance at beginning of year</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalBOYPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalBOYPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalBOYEarnInvstUSPropAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalBOYEarnInvstExPassiveAstAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalBOYSubpartFIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalBOYTotalSection964aEPAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2a   -->
					<tr class="sty5471ScheduleJDescLine" style="height:8mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD"
							 style="width:4mm;height:8mm;padding-top:4mm;">2a</div>
							<div class="styLNDesc"
							 style="width:59mm;padding-top:4mm;text-align:left;padding-left:4mm;">
							 Current year E&amp;P</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/CYEPPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; "/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 2a   -->
					<!--   BEGIN LINE 2b   -->
					<tr class="sty5471ScheduleJDescLine" style="height:8mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" 
							style="width:4mm;height:8mm;padding-top:4mm;padding-left:4.5mm"> b</div>
							<div class="styLNDesc"
							 style="width:58.5mm;padding-top:4mm;text-align:left;padding-left:4mm;">
							 Current year deficit in E&amp;P</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/CYDfctEPPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; "/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 2b   -->
					<!--   BEGIN LINE 3   -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;">3</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:11mm;">
							Total current and accumulated E&amp;P not previously
							 taxed (line 1 plus line 2a <b> or </b> line 1 minus line 2b)
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Total1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;height:11mm;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;height:11mm;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;height:11mm;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="background-color: lightgrey;border-right:0;height:11mm;"/>
					</tr>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;">4</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;">
							Amounts included under section 
							<span style="width:4mm;"/> 951(a) or reclassified under section 959(c) in current year
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/IncldCYPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/IncldCYPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/IncldCYEarnInvstUSPropAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/IncldCYEarnInvstExPssvAstAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/IncldCYSubpartFIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5a   -->
					<tr class="sty5471ScheduleJDescLine" style="height:8mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:4mm;height:8mm;">5a</div>
							<div class="styLNDesc" style="width:58.5mm;text-align:left;padding-left:4mm;">
							Actual distributions or reclassifications of previously taxed E&amp;P
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/ActlDistrEarnInvstUSPropAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/ActlDistrEarnInvstExPssvAstAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/ActlDistrSubpartFIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 5a   -->
					<!--   BEGIN LINE 5b   -->
					<tr class="sty5471ScheduleJDescLine" style="height:8mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" 
							style="width:4mm;height:8mm;padding-left:4.5mm"> b</div>
							<div class="styLNDesc" style="width:58.5mm;text-align:left;padding-left:4mm;">
							Actual distributions of nonpreviously taxed E&amp;P
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/ActlDstrPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/ActlDstrPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 5b   -->
					<!--   BEGIN LINE 6a   -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:4mm;height:11mm;">6a</div>
							<div class="styLNDesc" 
							style="width:58.5mm;height:11mm;text-align:left;padding-left:4mm;">
							Balance of previously taxed E&amp;P at end of year (line 1 plus line 4, minus line 5a)
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalTxdEarnInvstUSPropAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalTxdEarnInvstExPassiveAstAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalTxdSubpartFIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric"
						 style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 6a   -->
					<!--   BEGIN LINE 6b   -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD"
							 style="width:4mm;height:11mm;padding-left:4.5mm"> b</div>
							<div class="styLNDesc" style="width:58.5mm;text-align:left;padding-left:4mm;">
							Balance of E&amp;P not previously taxed at end of year (line 3 minus line 4, minus line 5b)
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalNoTxPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalNoTxPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 6b   -->
					<!--   BEGIN LINE 7   -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;">7</div>
							<div class="styLNDesc" style="width:58.5mm;text-align:left;padding-left:4mm;">
							Balance at end of year. (Enter amount from line 6a or line 6b, whichever is applicable.)
							</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalEOYPost1986UndistrEarnAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalEOYPre1987EPNotPrevTxdAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalEOYEarnInvstUSPropAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalEOYEarnInvstExPassiveAstAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="height:11mm;padding-top: 8.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/BalEOYSubpartFIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric"
						 style="height:11mm;padding-top: 8.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/BalEOYTotalSection964aEPAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 7   -->
					</tbody>
					</table>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:130mm;font-weight:bold; float: left; clear: none;">
						For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
						<div style="width:29mm;font-weight:normal; float: left; clear: none">Cat. No. 21111K</div>
						<div style="width:55mm;text-align:right;font-weight:bold; text-align: right; 
						float: right; clear: none">
						Schedule J(Form 5471)
						<span style="font-weight: normal"> (Rev. 12-2012)</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					<br/>
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						  Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape" style="float:right;">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" 
							value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTblLandscape">
							<xsl:call-template name="PopulateCommonLeftoverLandscape">
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
						<!-- END Left Over Table -->
						<xsl:if test="((count($IRS5471ScheduleJData/ForeignEntityIdentificationGrp) &gt; 1))">
							<span class="styRepeatingDataTitle">
								<br/>
							</span>
							<table class="styDepTbl" style="font-size:7pt"  scope="col">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
										Reference ID number (see instructions)
                                     </th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$IRS5471ScheduleJData/ForeignEntityIdentificationGrp">
										<tr>
											<!--Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-family:verdana;font-size:6pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" 
														select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
												<br/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					<!--</div>-->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>