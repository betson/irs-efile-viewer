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
			<body class="styBodyClass" style="width:256mm">
				<form name="IRS5471ScheduleJ">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:256mm;height: 23mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:40mm;font-size:8pt;height:23mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:10pt;font-weight:bold;">SCHEDULE J</span>
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
							<div class="sty5471ScheduleJRev">(September 2018)</div>
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
						style="height: 23mm;width:175mm;padding-top:1mm;border-left-width:1px;border-right-width:1px;">
							<div class="styMainTitle" style="font-weight:bold;">
							Accumulated Earnings and Profits (E&amp;P)<br/> of Controlled Foreign Corporation</div>
							<div style="padding-top:4mm;border:0px;width:175mm;font-size:8pt" class="styFST">
								<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="Bullet Image"/>
								Go to
								<a style="text-decoration:none;color:black;"
								 href="http://www.irs.gov/form5471" title="Link to IRS.gov">
									www.irs.gov/Form5471 for instructions and the latest information
								</a>
							</div>
							<div class="styFST" style="font-weight:bold;">
								<div style="margin-left: 1.5mm;;">
									<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="bullet"/>
									 Attach to Form 5471
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:40mm;height:23mm;border-left-width: 2px">
							<div class="styOMB"
							 style="padding-top:10mm;height:2mm;border-bottom:0;text-align:middle;">
							 OMB No. 1545-0704</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
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
							<b>Identifying number</b></span>
							<br/>
							<span class="sty5471ScheduleJINBox"
							 style="font-weight:normal; height:4mm; margin-left: 1mm; padding-top:3mm;">
							  <!-- Choice between input TIN versus TIN from 1120, 1065, 1040,
                                        and 1041 Return Header Filer info -->
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
							<b>Reference ID number</b> (see instructions)</span>
							<br/>
							<span class="sty5471ScheduleJINBox" 
							style="font-weight:normal; loat:left; margin-left: 1mm; padding-top:2mm;">
								<xsl:choose>
									<xsl:when test="((count($IRS5471ScheduleJData/ForeignEntityIdentificationGrp) &gt; 1)) ">
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
				<!-- line a -->
						<div class="styGenericDiv" style="width:256mm;">
							<div style="float:left;clear:none;">
								
								<div class="styLNDesc" style="width:255mm;">
									<span style="float:left;">
							&#160; &#160; a &#160; Separate Category (Enter code-see instructions.) 
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">......................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							<div style="float:right;clear:none;">
								<span style="border-color:black; border-style:solid; border-right-width: 0px;
							 border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SeparateCategoryCd"/>
								</xsl:call-template>
							</span>	
							</div>
						</div>
                		</div>
					</div>
						<div class="styTBB" style="width:256mm;">
							<div style="float:left;clear:none;">
								<div class="styLNDesc" style="width:255mm;">
									<span style="float:left;">
							&#160; &#160; b &#160; If code 901(j) is entered on line a, enter the country code for the sanctioned country (see instructions)
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">.....................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							<div style="float:right;clear:none;">
								<span style="border-color:black; border-style:solid; border-right-width: 0px;
							 border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
					    	<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SanctionedCountryCd"/>
								</xsl:call-template>
							</span>	
							</div>
						</div>		</div>
							</div>
				<!-- BEGIN PART I TITLE -->
						<div class="styBB" style="width:256mm;border-top-width:0px;border-top:0;">
							<div class="styPartName" style="height:4mm;">Part I</div>
							<div class="styPartDesc">
							Accumulated E&amp;P of Controlled Foreign Corporation 
							</div>
						</div>
						<div style="height:5mm;width:256mm;float:left;padding-left:3mm;">
						<input type="checkbox" alt="IRS1120InitialReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/USShareholderInfoNotAvlblInd"/>
										<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/USShareholderInfoNotAvlblInd"/>
										<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:top;padding-top:1px;">
									Check the box if person filing return does not have all U.S. Shareholders' information to complete amount for columns (e)(ii)-(e)(iv) and (e)(vii)-(ix) (see instructions).
									</span>
								</label>
							</div>
					<!-- END PART I TITLE -->	
					<!--   BEGIN HEADER   -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm;">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="sty5471ScheduleJCellGeneric" 
									style="font-weight:normal;width:64mm;text-align:center;height:20mm;
									padding-top:1.5mm;" scope="col" rowspan="2">
							<b>Important: </b> Enter amounts in<br/>functional currency.
						</th>
						<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(a) </b><br/> Post-2017 E&amp;P Not Previously Taxed (post-2017 section 959(c)(3) balance)
						</th>
<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(b) </b><br/> Post-1986<br/>
							Undistributed Earnings<br/>(post-1986 and pre-2018 section<br/>	959(c)(3) balance)
						</th>
				<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(c) </b><br/> Pre-1987 E&amp;P<br/>
							Not Previously<br/>Taxed (per-87<br/>section	959(c)(3) balance)
						</th>		
						<th class="sty5471ScheduleJCellGeneric" 
						style="font-weight:normal;text-align: center; height: 20mm;  padding-top: 2mm;" 
						rowspan="2"  scope="col">
							<b>(d) </b> Hovering Deficit <br/>and Deduction <br/>
							for Suspended<br/>Taxes
						</th>
							<th class="sty5471ScheduleJCellGeneric" 
							style="font-weight:normal;text-align: center; height:10mm;" 
							colspan="9"  scope="col">
								<b>(e) </b> Previously Taxed E&amp;P (see instructions)<br/>
							</th>
						<th class="sty5471ScheduleJCellGeneric"
						 style="font-weight:normal;text-align: center; border-right: 0;height: 20mm;
						  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(f)</b><br/> Total Section<br/>964(a) E&amp;P<br/>(combine columns<br/>(a), (b), (c) and (e)(i) through (e)(ix))) 
						</th>
					</tr>
								<tr>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(i) Earnings Invested<br/>in U.S. Property (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(ii)Section 965(a) Inclusion (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(iii) Section 965(b)(4)(A) (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(iv) Section 951A Inclusion (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(v) Earnings Invested<br/>in Excess Passive<br/>Assets (section 959(c)(1)(B))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(vi) Subpart F Income (section 959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(vii) Section 965 <br/>(a) inclusion (section 959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(viii) Section 965(b)(4)(A)<br/>(section <br/>959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(ix) Section 951A Inclusion (section 959(c)(2))
							</th>
				</tr>
					</thead>
					<!--   END HEADER   -->
					<tfoot/>
					<tbody>
					<!--   BEGIN LINE 1a   -->
					<tr class="sty5471ScheduleJDescLine" style="height:10mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:7pt">
						<div class="styLNLeftNumBox" style="width:4mm;height:10mm;padding-top:4mm;width:64mm;text-alignment:center;;font-weight:normal;padding-right:1mm; "><b>1a</b>
							&#160;&#160;Balance at beginning of year (as reported on
                           <span style="padding-right:28mm">
                           prior year Schedule J)</span></div>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							 select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							  select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>			
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>		
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 1a   -->
					<!--   BEGIN LINE 1b  -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">1b</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Beginning balance adjustments (attach statement)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>			
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>	
		<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>		
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 1b   -->
					<!--   BEGIN LINE 1c   -->
						<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">1c</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							adjustments Beginning balance (combine lines 1a and 1b)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>			
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>	
			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>		
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalSection964AEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 1c   -->
					<!--   BEGIN LINE 2a  -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">2a</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Reduction for taxes unsuspended under anti-splitter rules
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/Section965b4aEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
			
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
				<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 2a   -->
					<!--   BEGIN LINE 2b  -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">2b</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Disallowed deduction for taxes suspended under anti-splitter rules
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
    					
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
		                <td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 2b   -->
					<!--   BEGIN LINE 3 -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">3</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Current year E&amp;P (or deficit in E&amp;P)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/CurrentYearEPDeficitAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/CurrentYearEPDeficitAmt"/>
							</xsl:call-template>
						</td>
						<!--<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>-->
				     	<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 3  -->
		        	<!--   BEGIN LINE 4 -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;padding-left:2mm">4</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:11mm;">
							E&amp;P attributable to distributions of previously taxed E&amp;P from lower-tier foreign corporation
						</div>
						</td>
							<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
							<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
							<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
							<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
         		 			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965b4aEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalSection964AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--   END LINE 4  -->				
		        	<!--   BEGIN LINE5a -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;padding-left:2mm;padding-bottom:8mm">5a</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:11mm;;padding-bottom:8mm">
							E&amp;P carried over in nonrecognition transaction
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
		 			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965b4aEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 5a -->
					</tbody>
					</table>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:130mm;font-weight:bold; float: left; clear: none;">
						For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
						<div style="width:29mm;font-weight:normal; float: left; clear: none">Cat. No. 21111K</div>
						<div style="width:55mm;text-align:right;font-weight:bold; text-align: right; 
						float: right; clear: none">Schedule J(Form 5471)
						<span style="font-weight: normal"> (9-2018)</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
					<p style="page-break-before: always"/>
						<!-- end page break and footer  -->
						<!-- begin page 2 -->
						<!-- page header -->
						<div class="styBB" style="width:256mm;padding-top:.5mm;border-bottom-width:2px;">
							<div style="float:left;">Schedule J (Form 5471) (9-2018)<span style="width:148mm;"/>
							</div>
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</div>
						</div>
						<!-- BEGIN PART I TITLE -->
						<div class="styBB" style="width:256mm;border-top-width:0px;border-top:0;">
							<div class="styPartName" style="height:4mm;">Part I</div>
							<div class="styPartDesc">
							Accumulated E&amp;P of Controlled Foreign Corporation (continued)
							</div>
						</div>
						<!-- END PART I TITLE -->	
						<!--   BEGIN HEADER   -->
					<div class="styTableContainer" id="5471SchJctn" style="width:256mm;">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead" style="font-weight:normal;">
								<tr>
									<th class="sty5471ScheduleJCellGeneric" 
									style="font-weight:normal;width:64mm;text-align:center;height:20mm;
									padding-top:1.5mm;" scope="col" rowspan="2">
							<b>Important: </b> Enter amounts in<br/>functional currency.
						</th>
						<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(a) </b><br/> Post-2017 E&amp;P Not Previously Taxed (post-2017 section 959(c)(3) balance)
						</th>
<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(b) </b><br/> Post-1986<br/>
							Undistributed Earnings<br/>(post-1986 and pre-2018 section<br/>	959(c)(3) balance)
						</th>
				<th class="sty5471ScheduleJCellGeneric" style="font-weight:normal;
						text-align: center; height: 20mm;  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(c) </b><br/> Pre-1987 E&amp;P<br/>
							Not Previously<br/>Taxed (per-87<br/>section	959(c)(3) balance)
						</th>		
						<th class="sty5471ScheduleJCellGeneric" 
						style="font-weight:normal;text-align: center; height: 20mm;  padding-top: 2mm;" 
						rowspan="2"  scope="col">
							<b>(d) </b> Hovering Deficit <br/>and Deduction <br/>
							for Suspended<br/>Taxes
						</th>
							<th class="sty5471ScheduleJCellGeneric" 
							style="font-weight:normal;text-align: center; height:10mm" 
							colspan="9"  scope="col">
								<b>(e) </b> Previously Taxed E&amp;P (see instructions)<br/>
								
							</th>
						<th class="sty5471ScheduleJCellGeneric"
						 style="font-weight:normal;text-align: center; border-right: 0;height: 20mm;
						  padding-top: 2mm;" rowspan="2"  scope="col">
							<b>(f) </b><br/> Total Section<br/>964(a) E&amp;P<br/>(combine columns<br/>(a), (b), (c) and (e)(i) through (e)(ix)))
						</th>
					</tr>
								<tr>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(i) Earnings Invested<br/>in U.S. Property (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(ii) Section 965(a) Inclusion (section (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(iii) Section 965(b)(4)(A) (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(iv) Section 951A Inclusion (section 959(c)(1)(A))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(v) Earnings Invested<br/>in Excess Passive<br/>Assets (section 959(c)(1)(B))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(vi) Subpart F Income (section 959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center;height: 10mm;"  scope="col">
								(vii) Section 965 <br/>(a) inclusion (section 959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(viii) Section 965(b)(4)(A)<br/>(section <br/>959(c)(2))
							</th>
							<th class="sty5471ScheduleJCellGeneric"
							 style="font-weight:normal;text-align: center; height: 10mm;"  scope="col">
								(ix) Section 951A Inclusion (section 959(c)(2))
							</th>
				</tr>
					</thead>
					<!--   END HEADER   -->
					<tfoot/>
					<tbody>
						<!--   BEGIN LINE  5b  -->
					<tr class="sty5471ScheduleJDescLine" style="height:10mm">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:7pt;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;width:64mm;text-alignment:left;;font-weight:normal;padding-right:11mm "><b>5b</b>
							Reclassify deficit in E&amp;P as hovering 
                          </div>
                        <div class="styLNLeftNumBox" style="padding-top:0mm;width:64mm;text-alignment:left;;font-weight:normal;padding-right:7.5mm ">
							 deficit after nonrecognition transaction
                          </div>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 5b   -->
					<!--   BEGIN LINE 6  -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:4mm;">6</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Other adjustments (attach statement)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>			
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</td>
				<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 6   -->
					<!--   start  LINE 7   -->
						<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:4mm">7</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Total current and accumulated E&amp;P (combine lines 1c through 6)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>	
				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
				    	<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>			
				    	<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</td>
		        		<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 7   -->
					<!--   BEGIN LINE 8  -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:4mm">8</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Amounts reclassified to section 959(c)(2) E&amp;P from section 959(c)(3) E&amp;P
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>			
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</td>
			<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 8   -->
					<!--   BEGIN LINE 9  -->
					<tr class="sty5471ScheduleJDescLine" style="height:7mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:7mm;padding-left:4mm">9</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:7mm;">
							Actual distributions
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
				    	<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
			    		<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>	
        				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>
        				<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</td>	
	                	<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
						</tr>
					<!--   END LINE 9   -->
					<!--   BEGIN LINE 10 -->
					<tr class="sty5471ScheduleJDescLine" style="height:9mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:9mm;padding-left:2mm">10</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:9mm;">
							Amounts reclassified to section 959(c)(1) E&amp;P from section 959(c)(2) E&amp;P
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Section965b4aEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
		        		<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>	
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:1;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:1;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:1;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:1;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:1;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 10  -->
		        	<!--   BEGIN LINE 11 -->
					<tr class="sty5471ScheduleJDescLine" style="height:15mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:15mm;padding-left:2mm">11</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:15mm;">
							Amounts included as earnings invested in U.S. property and reclassified to section 959(c)(1)  E&amp;P (see instructions)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
		 			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 11  -->				
					<!--   BEGIN LINE 12 -->
					<tr class="sty5471ScheduleJDescLine" style="height:11mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:11mm;padding-left:2mm">12</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:11mm;">
							Other adjustments (attach statement)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
		 			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965b4aEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 12 -->	
					<!--   BEGIN LINE 13 -->
					<tr class="sty5471ScheduleJDescLine" style="height:10mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:10mm;padding-left:2mm">13</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:10mm;">
                              Hovering deficit offset of undistributed posttransaction E&amp;P (see instructions)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
							 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							 select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
					<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey;"/>
						<td class="sty5471ScheduleJCellGeneric" 
						style="height:11mm;background-color: lightgrey;border-right:0;"/>
					</tr>
					<!--   END LINE 13  -->	
		        	<!--   BEGIN LINE 14 -->
					<tr class="sty5471ScheduleJDescLine" style="height:10mm;">
						<td class="sty5471ScheduleJCellGeneric" style="width:64mm;font-size:8pt;">
							<div class="styLNLeftNumBox" style="width:4mm;height:10mm;padding-left:2mm">14</div>
							<div class="styLNDesc" style="width:59mm;text-align:left;padding-left:4mm;height:10mm;">
							Balance at beginning of next year (combine lines 7 through 13)
						</div>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/Post2017EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Post1986UndistributedEarnGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Pre1987EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/HoveringDeficitDedSspndTaxGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
		 			<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstUSPropSect959c1aGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section965b4aEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/Section951aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
					<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
								select="$IRS5471ScheduleJData/EarnInvstExcessPassiveAssetGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/SubpartFSection959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSect965aInclsnSect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSection965b4ASection959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" 
							select="$IRS5471ScheduleJData/EPSection951AInclusionGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</td>
						<td class="sty5471ScheduleJCellGeneric" style="padding-top: 4.5mm;border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode"
								 select="$IRS5471ScheduleJData/TotalSection964AEPGrp/BalanceBeginningNextYearAmt"/>
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
						<div style="width:55mm;text-align:right;font-weight:bold; text-align: right; 
						float: right; clear: none">Schedule J(Form 5471)
						<span style="font-weight: normal"> (9-2018)</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
						<div class="pageEnd"/>
					<p style="page-break-before: always"/>
						<!-- end page break and footer  -->
						<!-- begin page 2 -->
						<!-- page header -->
						<div class="styBB" style="width:256mm;padding-top:.5mm;border-bottom-width:2px;">
							<div style="float:left;">Schedule J (Form 5471) (9-2018)<span style="width:148mm;"/>
							</div>
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
							</div>
						</div>
					<!--</div>-->
							<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:256mm;border-top-width:0px;border-top:0;">
							<div class="styPartName" style="height:4mm;">Part II</div>
							<div class="styPartDesc">
							
							Nonpreviously Taxed E&amp;P Subject to Recapture as Subpart F Income (section 952(c)(2))
							</div>
						</div>
					<div class="styBB" style="width:256mm;border-bottom-width:2px">	
					<div style="float:left;">Enter amounts in functional currency.</div>
					<!-- line 1 -->
						<div class="styGenericDiv" style="width:256mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">1</div>
								<div class="styLNDesc" style="width:215mm;">
									<span style="float:left;">
										 Balance at beginning of year
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">...........................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
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
								<div class="styLNDesc" style="width:215mm;">
									<span style="float:left;">
										Additions (amounts subject to future recapture)
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">.....................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
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
								<div class="styLNDesc" style="width:215mm;">
									<span style="float:left;">
										 Subtractions (amounts recaptured in current year)
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">....................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
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
								<div class="styLNDesc" style="width:216mm;">
									<span style="float:left;">
										Balance at end of year (combine lines 1 through 3)
			                    	  </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="padding-left:3mm;">....................................</div>
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:4.5mm;;border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndYearBalanceAmt"/>
									</xsl:call-template>
								</div></div>
							</div>
						</div>	
						<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:130mm;font-weight:bold; float: left; clear: none;">
						</div>
						<div style="width:29mm;font-weight:normal; float: left; clear: none"></div>
						<div style="width:55mm;text-align:right;font-weight:bold; text-align: right; 
						float: right; clear: none">Schedule J(Form 5471)
						<span style="font-weight: normal"> (9-2018)</span>
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
