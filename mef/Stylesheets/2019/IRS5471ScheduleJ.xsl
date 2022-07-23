<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest  -->
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
			<body class="styBodyClass" style="width:256mm;">
				<form name="IRS5471ScheduleJ">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:256mm; height:23mm; border-bottom-width:2px;">
						<div class="styFNBox" style="width:40mm; font-size:8pt; height:23mm; border-right-width:2px;">
							<span class="styFormNumber" style="font-size:10pt; font-weight:bold;">SCHEDULE J</span>
							<span class="styFormNumber" style="font-size:10pt; font-weight:bold;">(Form 5471)</span>
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
							<div class="sty5471ScheduleJRev">(Rev. December 2019)</div>
							<div class="styAgency" style="width:36mm; height:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData"/>
								</xsl:call-template>
							</div>
							<div class="styAgency" style="padding-top:0mm; font-size:8pt">Department of the Treasury</div>
							<div class="styAgency" style="padding-top:0mm; font-size:8pt">Internal Revenue Service</div>
							<br/>
						</div>
						<div class="styFTBox" style="width:175mm; height: 23mm; padding-top:1mm; border-left-width:1px; border-right-width:1px;">
							<div class="styMainTitle" style="font-weight:bold;">
								Accumulated Earnings and Profits (E&amp;P)<br/> of Controlled Foreign Corporation
							</div>
							<div class="styFST" style="font-weight:bold;width:175mm; padding-top:2mm; border:0px; width:175mm; font-size:8pt">
								<div style="margin-left:1.5mm;;">
									<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="Right pointing Arrow"/>
									Attach to Form 5471
								</div>
							</div>
							<div style="width:175mm; padding-top:1mm; border:0px; width:175mm; font-size:8pt" class="styFST">
								<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="Bullet Image"/>
								Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form5471" title="Link to IRS.gov">
									www.irs.gov/Form5471 for instructions and the latest information
								</a>
							</div>							
						</div>
						<div class="styTYBox" style="width:40mm; height:23mm; border-left-width: 2px">
							<div class="styOMB" style="padding-top:10mm; height:2mm; border-bottom:0; text-align:middle;">
								OMB No. 1545-0123
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div class="styBB" style="width:256mm;">
						<div class="sty5471ScheduleJBusinessName" style="width:184mm; height:9mm; border-right-width 0px;">
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
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471ScheduleJData/BusinessName/BusinessNameLine2Txt != '' ">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<!-- Name from 1120/990/1065,1041,1040,1040NR Return Header -->
										<xsl:call-template name="PopulateFilerName">
											<xsl:with-param name="TargetNode" select="IRS5471ScheduleJData"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty5471ScheduleJIN" style="width:72mm; height:9mm;">
							<span style="font-weight:bold; float:left; clear: none; margin-left:1mm">
								<b>Identifying number</b>
							</span>
							<br/>
							<span class="sty5471ScheduleJINBox" style="font-weight:normal; height:4mm; margin-left: 1mm; padding-top:3mm;">
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
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/MissingSSNEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<!-- TIN from 1120, 990, 1065, ETEC, 1041 return headers-->
										<xsl:call-template name="PopulateFilerTIN">
											<xsl:with-param name="TargetNode" select="IRS5471ScheduleJData"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN NAME OF FOREIGN CORPORATION   -->
					<div class="styBB" style="width:256mm;">
						<div class="sty5471ScheduleJBusinessName" style="width:120mm;height:9mm;">Name of foreign corporation
							<br/>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ForeignCorporationName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ForeignCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5471ScheduleJBusinessName" style="width:63.5mm; height:9mm; border-right:0;">
							<span style="float:left; clear: none; margin-left: 1mm">EIN (if any)</span>
							<br/>
							<span class="sty5471ScheduleJINBox" style="font-weight:normal; margin-left:1mm; padding-top 3mm;">
								<xsl:choose>
									<xsl:when test="$IRS5471ScheduleJData/ForeignCorporationEIN != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ForeignCorporationEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/MissingEINReasonCd != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty5471ScheduleJIN" style="width:72mm; height:9mm; border-left-width:1px;">
							<span style="float:left; clear: none; margin-left: 1mm">
							<b>Reference ID number</b> (see instructions)</span>
							<br/>
							<span class="sty5471ScheduleJINBox" style="font-weight:normal; loat:left; margin-left:1mm; padding-top:2mm;">
								<xsl:choose>
									<xsl:when test="((count($IRS5471ScheduleJData/ForeignEntityIdentificationGrp) &gt; 1)) ">
										See Additional Data Table
									</xsl:when>
									<xsl:otherwise>
										<span style="font-size:8px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
				    <!-- line a -->
					<div class="styGenericDiv" style="width:256mm;">
						<div style="float:left; clear:none;">								
							<div class="styLNDesc" style="width:255mm;">
								<span style="float:left;">&#160; &#160; a &#160; Separate Category (Enter code-see instructions.) 
			                	</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="padding-left:3mm;">......................................</div>
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								<div style="float:right;clear:none;">
									<span style="border-color:black; border-style:solid; border-right-width:0px; border-left-width: 0px; border-top-width:0px; border-bottom-width:1px; width:25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SeparateCategoryCd"/>
										</xsl:call-template>
									</span>	
								</div>
							</div>
                		</div>
					</div>
					<div class="styTBB" style="width:256mm;">
						<div style="float:left; clear:none;">
							<div class="styLNDesc" style="width:255mm;">
								<span style="float:left;">
									&#160; &#160; b &#160; If code 901(j) is entered on line a, enter the country code for the sanctioned country (see instructions)
			                   	</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="padding-left:3mm;">.....................</div>
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								<div style="float:right;clear:none;">
									<span style="border-color:black; border-style:solid; border-right-width:0px; border-left-width:0px; border-top-width:0px; border-bottom-width:1px; width:25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SanctionedCountryCd"/>
										</xsl:call-template>
									</span>	
								</div>
							</div>
						</div>
					</div>
				    <!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:256mm; border-top-width:0px; border-top:1px;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc">
							Accumulated E&amp;P of Controlled Foreign Corporation 
						</div>
					</div>
					<div style="height:5mm; width:256mm; float:left; padding-left:3mm; border-color:black; border-style:solid; border-right-width:0px; border-top:0px; border-bottom-width:1px; border-left:0px;">
						<input type="checkbox" alt="not have all U.S. Shareholders' information" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/USShareholderInfoNotAvlblInd"/>
								<xsl:with-param name="BackupName">USShareholderInfoNotAvlblInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/USShareholderInfoNotAvlblInd"/>
								<xsl:with-param name="BackupName">USShareholderInfoNotAvlblInd</xsl:with-param>
							</xsl:call-template>
							<span style="vertical-align:top; padding-top:1px;">
								Check the box if person filing return does not have all U.S. Shareholders' information to complete amount for columns (e)(i), (e)(ii), (e)(iv), and (e)(x) through (e)(xii) (see instructions).
							</span>
						</label>
					</div>
					<!-- END PART I TITLE -->	
					<!-- BEGIN PART I TABLE HEADER   -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm; font-size:7pt;">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="sty5471ScheduleJCellGeneric" style="width:64mm; height:20mm; " scope="col" rowspan="2" colspan="2">
										<b>Important: </b> Enter amounts in functional currency.
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b>(a) </b><br/> Post-2017 E&amp;P Not Previously Taxed (post-2017 section 959(c)(3) balance)
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:20mm;  padding-top:2mm;" rowspan="2"  scope="col">
										<b>(b) </b><br/> Post-1986<br/>
										Undistributed Earnings<br/>(post-1986 and pre-2018 section<br/>	959(c)(3) balance)
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b>(c) </b><br/> Pre-1987 E&amp;P<br/>
										Not Previously<br/>Taxed (pre-1987<br/>section 959(c)(3) balance)
									</th>		
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b>(d) </b><br/> Hovering Deficit <br/>and Deduction <br/>
										for Suspended<br/>Taxes
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:10mm; border-color:black; border-style:solid; border-right-width:0px; border-top:0px; border-bottom-width:1px; border-left:0px;" colspan="2"  scope="col">
										<b>(e) </b> Previously Taxed E&amp;P (see instructions)<br/>
									</th>						
								</tr>
								<tr>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:10mm;"  scope="col">
										<b><i>(i)</i></b> Section 965(a) Inclusion (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:32mm; text-align:center; height:10mm; border-right-width:0px;"  scope="col">
										<b><i>(ii)</i></b> Section 965(b)(4)(A) (section 959(c)(1)(A))
									</th>
								</tr>
							</thead>
							<!--   END PART I TABLE HEADER   -->
							<tfoot/>
							<tbody>
								<!--   BEGIN LINE 1a   -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold; ">1a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Balance at beginning of year (as reported on prior year Schedule J) 											
										</span>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;"> 
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  END LINE 1a   -->
								<!--  BEGIN LINE 1b  -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold; ">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Beginning balance adjustments (attach statement) 											
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 1b   -->
								<!--   BEGIN LINE 1c   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold;">c</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Adjusted beginning balance (combine lines 1a and 1b)
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td> 						
								</tr>
								<!--   END LINE 1c   -->
								<!--   BEGIN LINE 2a  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold;">2a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Reduction for taxes unsuspended under anti-splitter rules
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 2a   -->
								<!--   BEGIN LINE 2b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left">Disallowed deduction for taxes suspended under anti-splitter rules
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>    					
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--   END LINE 2b   -->
								<!--   BEGIN LINE 3 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-top:4mm;font-weight:bold;">3</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm;text-align:left;padding-top:4mm; " >							
										<span style="text-align:left;">Current year E&amp;P (or deficit in E&amp;P)  <!-- Add unicode for ampersand-->
										</span>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 3  -->
								<!--   BEGIN LINE 4 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:4.5mm;font-weight:bold;">4</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">E&amp;P attributable to distributions of previously taxed E&amp;P from lower-tier foreign corporation 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>			
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 4  -->				
								<!--   BEGIN LINE 5a -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;padding-bottom:3.5mm;font-weight:bold;">5a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">E&amp;P carried over in nonrecognition transaction
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   BEGIN LINE  5b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;padding-bottom:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Reclassify deficit in E&amp;P as hovering deficit after nonrecognition transaction 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 5b   -->
								<!--   BEGIN LINE 6  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-top:4mm;font-weight:bold;">6</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm;text-align:left; padding-top:5mm;" >							
										<span style="text-align:left;">Other adjustments (attach statement) 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 6   -->
								<!--   START LINE 7   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:2mm;font-weight:bold;">7</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Total current and accumulated E&amp;P (combine lines 1c through 6) 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 7   -->
								<!--   BEGIN LINE 8  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:2mm;font-weight:bold;">8</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Amounts reclassified to section 959(c)(2) E&amp;P from section 959(c)(3) E&amp;P 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>									
								</tr>
								<!--   END LINE 8   -->
								<!--   BEGIN LINE 9  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-top:4mm;font-weight:bold;">9</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm;text-align:left;padding-top:5.5mm; " >							
										<span style="text-align:left;">Actual distributions 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>				    	
								</tr>
								<!--   END LINE 9   -->
								<!--   BEGIN LINE 10 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:2mm;font-weight:bold;">10</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Amounts reclassified to section 959(c)(1) E&amp;P from section 959(c)(2) E&amp;P 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>									
								</tr>
								<!--   END LINE 10  -->
								<!--   BEGIN LINE 11 -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:4mm;font-weight:bold;">11</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Amounts included as earnings invested in U.S. property and reclassified to section 959(c)(1) E&amp;P (see instructions) 							
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:4.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>									
								</tr>
								<!--   END LINE 11  -->				
								<!--   BEGIN LINE 12 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-top:4mm;font-weight:bold;">12</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm;text-align:left;padding-top:5.5mm;" >							
										<span style="text-align:left;">Other adjustments (attach statement) 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 12 -->	
								<!--   BEGIN LINE 13 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:3.5mm;font-weight:bold;padding-top:3mm;">13</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm;padding-top:3mm; " >							
										<span style="text-align:left;">Hovering deficit offset of undistributed posttransaction E&amp;P (see instructions) 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>							
								</tr>
								<!--   END LINE 13  -->	
								<!--   BEGIN LINE 14 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;padding-bottom:3.5mm;font-weight:bold;">14</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="width:56mm; " >							
										<span style="text-align:left;">Balance at beginning of next year (combine lines 7 through 13) 
										</span> 
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="padding-top:5.5mm; border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section965b4AEPGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 14 -->
							</tbody>
						</table>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:130mm; font-weight:bold; float:left; clear:none;">
							For Paperwork Reduction Act Notice, see the Instructions for Form 5471.
						</div>
						<div style="width:29mm; font-weight:normal; float:left; clear:none">Cat. No. 21111K</div>
						<div style="width:55.5mm; text-align:right; font-weight:bold; text-align:left; float:right; clear:none;">
							Schedule J (Form 5471) (Rev. 12-2019)
							<!--<span style="font-weight: normal"> </span>-->
						</div>
					</div>
					<!--    END FORM FOOTER   -->
					<p style="page-break-before: always"/>
					<!-- end page break and footer  -->
					<!-- BEGIN PAGE 2 -->
					<!-- page header -->
					<div class="styBB" style="width:256mm; padding-top:.5mm; border-bottom-width:2px;">
						<div style="float:left;">Schedule J (Form 5471) (Rev. 12-2019)<span style="width:148mm;"/>
					</div>
					<div style="float:right;">Page <span style="font-weight:bold; font-size:8pt;">2</span></div>
					</div>
					<!-- BEGIN PART I CONTINUE TITLE -->
					<div class="styBB" style="width:256mm; border-top-width:0px; border-top:0;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc">
							Accumulated E&amp;P of Controlled Foreign Corporation
							<span style="font-weight: normal"> <i> (continued)</i></span>
						</div>
					</div>
					<div class="styBB" style="width:256mm; border-top-width:0px; border-top:0; ">
					<div class="styPartName" style="width:9mm;height:4mm;border-style:solid;border-right-width:1px;border-color:black;background-color:white;border-bottom:0px;border-top:0px;border-left:0px;"></div>
						<div class="styPartDesc" style="font-weight:normal;border-left-width:1px;padding-left:102mm;">						
						<b>(e)</b> Previously Taxed E&amp;P (see instruction)
						</div>
					</div>
					<!-- END PART I CONTINUE TITLE -->
					<!-- BEGIN PART I TABLE HEADER   -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm; font-size:7pt;">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="sty5471ScheduleJCellGeneric" style="width:8mm; height:20mm; " scope="col" rowspan="2" ></th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(iii)</i></b> Earnings Invested in U.S. Property (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm;  padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(iv)</i></b> Section 951A Inclusion (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(v)</i></b> Section 245A(e)(2) Inclusion (section 959(c)(1)(A))
									</th>		
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(vi)</i></b> Section 959(e) (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(vii)</i></b> Section 964(e)(4) Inclusion (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(viii)</i></b> Section 951(a)(1)(A) Inclusion (section 959(c)(1)(A))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(ix)</i></b> Earnings Invested in Excess Passive Assets (section 959(c)(1)(B))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm; border-right-width:0px;" rowspan="2"  scope="col">
										<b><i>(x)</i></b> Section 965(a) Inclusion (section 959(c)(2))
									</th>
								</tr>
							</thead>
							<!--   END PART I TABLE HEADER   -->
							<tfoot/>
							<tbody>
								<!--   BEGIN LINE 1a   -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">1a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";"> 
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>	
								</tr>
								<!--  END LINE 1a   -->
								<!--  BEGIN LINE 1b  -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 1b   -->
								<!--   BEGIN LINE 1c   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">c</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td> 						
								</tr>
								<!--   END LINE 1c   -->
								<!--   BEGIN LINE 2a  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">2a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 2a   -->
								<!--   BEGIN LINE 2b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>	
								</tr>
								<!--   END LINE 2b   -->
								<!--   BEGIN LINE 3 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">3</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 3  -->
								<!--   BEGIN LINE 4 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">4</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 4  -->				
								<!--   BEGIN LINE 5a -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">5a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   BEGIN LINE  5b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--   END LINE 5b   -->
								<!--   BEGIN LINE 6  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">6</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--  END LINE 6  -->
								<!--   BEGIN  LINE 7   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">7</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 7   -->
								<!--   BEGIN LINE 8  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">8</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 8   -->
								<!--   BEGIN LINE 9  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">9</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>				    	
								</tr>
								<!--   END LINE 9   -->
								<!--   BEGIN LINE 10 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">10</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--   END LINE 10  -->
								<!--   BEGIN LINE 11 -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">11</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>							
								</tr>
								<!--   END LINE 11  -->				
								<!--   BEGIN LINE 12 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">12</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 12 -->	
								<!--   BEGIN LINE 13 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">13</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>							
								</tr>
								<!--   END LINE 13  -->	
								<!--   BEGIN LINE 14 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">14</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/Section951AInclusionEPGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect245Ae2Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c1AGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect951a1ASect959c1AGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 14 -->
							</tbody>
						</table>
					</div>
					<!--   BEGIN 2nd Table  -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm; font-size:7pt;">
					<div style="width:9.2mm;height:6mm;border-style:solid;border-color:black;border-bottom-width:0px;border-top:0px;border-left:0px;border-right-width:1px;"></div>
					 <div style="width:186.3mm;height:6mm;border-style:solid;border-color:black;border-bottom-width:1px;border-top:0px;border-left:0px;border-right-width:1px;
padding-top:1mm;padding-left:90mm;">
						<b>(e)</b> Previously Taxed E&amp;P (see instruction)</div>
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>									
									<th class="sty5471ScheduleJCellGeneric" style="width:8mm; height:20mm; " scope="col" rowspan="2" ></th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xi)</i></b> Section 965(b)(4)(A) (section 959(c)(2))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm;  padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xii)</i></b> Section 951A Inclusion (section 959(c)(2))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xiii)</i></b> Section 245A(e)(2) Inclusion (section 959(c)(2))
									</th>		
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xiv)</i></b> Section 959(e) (section 959(c)(2))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xv)</i></b> Section 964(e)(4) Inclusion (section 959(c)(2))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:31mm; text-align:center; height:20mm; padding-top:2mm;" rowspan="2"  scope="col">
										<b><i>(xvi)</i></b> Section 951(a)(1)(A) Inclusion (section 959(c)(2))
									</th>
									<th class="sty5471ScheduleJCellGeneric" style="width:62mm; text-align:center; height:20mm; padding-top:2mm; border-right-width:0px;" rowspan="2" colspan="2" scope="col">
										<b>(f) </b><br/> Total Section 964(a) E&amp;P (combine columns (a), (b), (c), and (e)(i) through (e)(xvi))
									</th>
								</tr>
							</thead>
							<!--   END PART i TABLE HEADER   -->
							<tfoot/>
							<tbody>
								<!--   BEGIN LINE 1a   -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">1a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";"> 
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BeginningYearBalanceAmt"/>
										</xsl:call-template>
									</td>	
								</tr>
								<!--  END LINE 1a   -->
								<!--  BEGIN LINE 1b  -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BeginningBalanceAdjustmentAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 1b   -->
								<!--   BEGIN LINE 1c   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">c</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/AdjustedBeginningBalanceAmt"/>
										</xsl:call-template>
									</td> 						
								</tr>
								<!--   END LINE 1c   -->
								<!--   BEGIN LINE 2a  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">2a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 2a   -->
								<!--   BEGIN LINE 2b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
										</xsl:call-template>
									</td>	
								</tr>
								<!--   END LINE 2b   -->
								<!--   BEGIN LINE 3 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">3</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/CurrentYearEPDeficitAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 3  -->
								<!--   BEGIN LINE 4 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">4</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 4  -->				
								<!--   BEGIN LINE 5a -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:1mm; padding-right:3mm;font-weight:bold;">5a</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/EPCyovNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   BEGIN LINE  5b  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-left:2mm; padding-right:3mm;font-weight:bold;">b</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/ReclsEPNonrecognitionTransAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--   END LINE 5b   -->
								<!--   BEGIN LINE 6  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">6</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/TotalOtherAdjustmentsAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--  END LINE 6  -->
								<!--  START  LINE 7   -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">7</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/TotalCurrentAccumulatedEPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 7   -->
								<!--   BEGIN LINE 8  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">8</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/ReclassifiedSect959c2EPAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 8   -->
								<!--   BEGIN LINE 9  -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">9</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/ActualDistributionAmt"/>
										</xsl:call-template>
									</td>				    	
								</tr>
								<!--   END LINE 9   -->
								<!--   BEGIN LINE 10 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">10</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/ReclassifiedSect959c1EPAmt"/>
										</xsl:call-template>
									</td>					
								</tr>
								<!--   END LINE 10  -->
								<!--   BEGIN LINE 11 -->
								<tr>
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">11</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
										</xsl:call-template>
									</td>							
								</tr>
								<!--   END LINE 11  -->				
								<!--   BEGIN LINE 12 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">12</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/OtherAdjustmentsTotalAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 12 -->	
								<!--   BEGIN LINE 13 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">13</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/DeficitOffstPostTransEPAmt"/>
										</xsl:call-template>
									</td>							
								</tr>
								<!--   END LINE 13  -->	
								<!--   BEGIN LINE 14 -->
								<tr >
									<td class="sty5471ScheduleJCellGeneric" style="width:8mm; " >
										<span style="padding-right:5mm;font-weight:bold;">14</span>							
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection245Ae2Sect959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection959eSect959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection964e4Sect959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style=";">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EPSection951a1ASect959c2Grp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty5471ScheduleJCellGeneric" style="border-right-width:0px;" colspan="2" >
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="MaxSize" select="17"/>
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BalanceBeginningNextYearAmt"/>
										</xsl:call-template>
									</td>						
								</tr>
								<!--   END LINE 14 -->
							</tbody>
						</table>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:130mm;font-weight:bold; float: left; clear: none;">
						</div>
						<div style="width:29mm;font-weight:normal; float: left; clear: none"></div>
						<div style="width:55.5mm;text-align:right;font-weight:bold; text-align: right;float: right; clear: none">
							Schedule J (Form 5471) (Rev. 12-2019)
						</div>
					</div>
					<!--     END FORM FOOTER   -->
						<div class="pageEnd"/>
					<p style="page-break-before: always"/>
						<!-- end page break and footer  -->
						<!-- begin page 3 -->
						<!-- page header -->
						<div class="styBB" style="width:256mm;padding-top:.5mm;border-bottom-width:2px;">
							<div style="float:left;">Schedule J (Form 5471) (Rev. 12-2019) <span style="width:148mm;"/>
							</div> 
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
							</div>
						</div>
						<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:256mm;border-top-width:0px;border-top:0;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc">							
								Nonpreviously Taxed E&amp;P Subject to Recapture as Subpart F Income (section 952(c)(2))
							</div>
						</div>
					<div class="styBB" style="width:256mm;border-bottom-width:2px">	
					<div class="styBB" style="float:left;height:5mm;padding-top:1mm;border-left-width:0px;border-right-width:1px;border-bottom:0px;width:216.2mm;">
						<b>Important:</b> Enter amounts in functional currency.						
					</div>
					<div class="styLNAmountBox" style="height:5mm;float:right;border-bottom:0px;"></div>
					<!-- line 1 -->
						<div class="styGenericDiv" style="width:256mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">1</div>
								<div class="styLNDesc" style="width:208mm;">
									<span style="float:left;">
										 Balance at beginning of year
			                    	</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">.........................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-bottom-width:1px;">1</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BeginningYearBalanceAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
							<!-- line 2 -->
						<div class="styGenericDiv" style="width:256mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">2</div>
								<div class="styLNDesc" style="width:208mm;">
									<span style="float:left;">
										Additions (amounts subject to future recapture)
			                    	</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">...................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-bottom-width:1px;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/FutureRecaptureAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					<!-- line 3 -->
						<div class="styGenericDiv" style="width:256mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">3</div>
								<div class="styLNDesc" style="width:208mm;">
									<span style="float:left;">
										Subtractions (amounts recaptured in current year)
			                    	</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">..................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-bottom-width:1px;">3</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CurrentYearRecaptureAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					<!-- line 4 -->
						<div class="styGenericDiv" style="width:256mm;border-bottom-width:0px">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">4</div>
								<div class="styLNDesc" style="width:208mm;">
									<span style="float:left;">
										Balance at end of year (combine lines 1 through 3)
			                    	</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">..................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Right pointing Arrow"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">4</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndYearBalanceAmt"/>
									</xsl:call-template>
								</div>
							</div>
							</div>
						</div>	
						<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:256mm;clear: none; text-align: right;">
							<span style="font-weight: bold">Schedule J (Form 5471)  (Rev. 12-2019) </span>
						</div>						
					</div>
					<!--     END FORM FOOTER   -->	
					<br/>
					<p style="page-break-before: always"/>
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
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
												<br/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>