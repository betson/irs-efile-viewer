<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1118ScheduleKStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1118ScheduleKData" select="$RtnDoc/IRS1118ScheduleK"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1118ScheduleKData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching  -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set   -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1118ScheduleK"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1118ScheduleKStyle"/>
						<xsl:call-template name="AddOnStyle"/>
			</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:256mm;">
				<form name="Form1118ScheduleK">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<div class="styTBB" style="width:256mm;height:25mm;">
						<div class="styFNBox" style="width:31mm;height:25mm;">
							<div style="height:auto;">
								<span style="font-weight:bold;height:3mm;padding-top:2.5mm;">SCHEDULE K</span>
								<span style="font-weight:bold;height:5mm;">(Form 1118)</span><br/>(Rev. September 2018)
								
									<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData"/>
							</xsl:call-template>
							</div>
							<br/>
							<div style="height:8mm;">
								<span class="styAgency">Department of the Treasury</span>
								<span class="styAgency" style="width:30mm;">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:178mm;height:auto;">
							<div class="styMainTitle" style="height:auto;padding-top:2mm;font-weight:normal;">
								Foreign Tax Carryover Reconciliation Schedule 
							</div>
							<div style="text-align:center;margin-top:2mm">For calendar year 
								<span style="width: 10mm">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>,
								or other tax year beginning 
								<span style="width: 20mm">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>, 
								and ending 
								<span style="width: 20mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</div>
							<br/>
							<div class="styFBT">
								<img src="{$ImagePath}/1118SchedK_Bullet_Sm.gif" alt="bulletpoint"/>
								See separate instructions.
							</div>
							<br/>
							<div class="styFST">
						<img src="{$ImagePath}/1118SchedK_Bullet_Sm.gif" alt="bulletpoint"/> Attach to Form 1118.
						<br/>
				  <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="Bullet Image"/>
				  &#160;Go to 
				  <a style="text-decoration:none;color:black;" 
				  href="http://www.irs.gov/form1118f"><i>www.irs.gov/Form1118</i></a>
				  for instructions and the latest information.
				</div>
						</div>
						<div class="styTYBox" style="width:35mm;height:25mm;">
							<div style="text-align:center;padding-top:10mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styBB" style="width:256mm;">
						<div class="styNameBox" style="width:189mm;height:8mm;">
							Name of corporation
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" 
								select="$Form1118ScheduleKData/CorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" 
								select="$Form1118ScheduleKData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:65mm;height:8mm;font-weight:bold;padding-left:2mm;">
						    Employer identification number
							<br/>
							<br/>
							<span class="styNormalText">
								<xsl:choose>
									<xsl:when test="$Form1118ScheduleKData/EIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form1118ScheduleKData/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--BEGIN CATEGORY OF INCOME SECTION -->
					<div>
						<div style="float:left;padding-left:1.2mm;">
							Use a separate Schedule K (Form 1118) for each category of income (see instructions).
							<br/>
						</div>
						<span style="height:3mm"/>
					</div>	
					<br/>
					<div style="width:256mm;display:inline;">						
						<div style="height:auto;width:180mm;float:left;padding-left:3mm">
						a. Separate Category (enter code - see instructions)   
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>&#160;
							<span style="border-color:black; border-style:solid; border-right-width: 0px;
							 border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" 	select="$Form1118ScheduleKData/SeparateCategoryCd"/>
								</xsl:call-template>
							</span>	
							<br/>
						</div>
					</div>				
					<div style="width:256mm;display:inline;">						
						<div style="height:auto;width:180mm;float:left;padding-left:3mm">
						b. If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)   
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>&#160;
								<span style="border-color:black; border-style:solid; border-right-width: 0px;
							 border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData/SanctionedCountryCd"/>
								</xsl:call-template>
							</span>	
							<br/>
							</div>
					</div>
						<div style="width:256mm;display:inline;">						
						<div style="height:auto;width:180mm;float:left;padding-left:3mm">
						c. If code RBT is entered on line a, enter the country code for the treaty country (see instructions)
							<img src="{$ImagePath}/1118_Bullet_Line.gif" alt="bulletpoint"/>&#160;
							<span style="border-color:black; border-style:solid; border-right-width: 0px;
							 border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px; width: 25mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									select="$Form1118ScheduleKData/TreatyCountryCd"/>
								</xsl:call-template>
							</span>	
							<br/>
							</div>
					</div>
					<span style="height:11mm;"/>
					<!--END CATEGORY OF INCOME SECTION -->
					<!--HINT: Set up print preview custom to 101% -->
					<!-- Table one -->
					<div class="styBB" style="width:256mm;">
						<div class="styGenericDiv" style="width:3.2mm;text-align:right;"></div>
					</div>
					<!-- END SCHEDULE A TITLE -->
					<!-- BEGIN INCOMEORLOSS TABLE -->
					<div class="styBB" id="IBActn">
						<table class="styTable" cellspacing="0" style="width:256mm;">
							<thead class="styTableThead">
								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<th class="styIRS1118TableCellLtr" 
									style="width:45mm;height:15mm;font-size:3.5mm; font-weight:normal;"
									 colspan="3" rowspan="1">
										Foreign Tax Carryover Reconciliation 
									</th>
									<th class="styIRS1118TableCellHeaderSmall"
									 style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;">(i) </div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										10th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall"
									 style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(ii) </div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										9th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(iii) </div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										8th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;"
									 scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(iv) </div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										7th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(v) </div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										6th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">(vi) 
										</div><br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										5th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(vii) </div>
										<div style="width:30mm;text-align:center;font-weight:normal">
										Subtotal (add columns (i) through (vi))</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Begin Line 1, column 1-8-->
								<tr >
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;border-bottom-width:1px">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">1</span>
											<span style="width:43mm;font-weight:normal;">
												Foreign tax carryover from the prior tax year 
												(enter amounts from the appropriate columns of line 8 
												of the prior year Schedule K (see instructions))   
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
											ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
											ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
											 ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
											ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
											ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
											ForeignTaxCarryoverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/ForeignTaxCarryoverSubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2, column 1-8 -->
								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3" style="border-bottom-width:1px;">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">2</span>
											<span style="width:43mm;font-weight:normal;">
												Adjustments to line 1 (enter description—see instructions): 
											</span>
										</span>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; border-color:
									 black;border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; border-color: 
									black; border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:0px;
									border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black;border-bottom-width:0px;
									 border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; border-color:
									 black;border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black;border-bottom-width:0px;
									 border-right-width:1px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black;border-bottom-width:0px;
									 border-right-width:0px;float:none;border-bottom-width:1px">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin line 2a, column 1-8  -->
								<tr style="height:6mm; border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" 
											style="width:4mm;font-weight:bold;padding-left:2mm;
											padding-bottom:0mm;vertical-align:top;">a</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">
											Carryback adjustment (see instructions) </span>
										</span>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; 
									border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid;
									 border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; border-color: 
									black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" 
									style="border-left-width:0px;border-style: solid; 
									border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell"
									 style="border-left-width:0px;border-style: solid; 
									 border-color: black;border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;
									border-style: solid; border-color: black;
						            border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2b, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span class="styLNLeftNumBox" style="width:4mm;font-weight:bold;
											 padding-left:2mm;padding-bottom:0mm;vertical-align:top;">b</span>
											<span style="width:43mm;font-weight:normal;padding-top:.5mm;">
											Adjustments for section 905(c) redeterminations (see instructions) </span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
											SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
											SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
											 SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
											SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
											 SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
											SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/SectionRedeterminationAdjAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2c, column 1-8 -->
								<xsl:choose>
									<xsl:when test="count($Form1118ScheduleKData/OtherAdjustmentsDescription)=0">
										<tr style="height:6mm;border-bottom-width:1px; 
										border-style: solid; border-color: black;">
											<td class="styIRS1118TableCellLtr" colspan="3">
												<span style="width:53mm;">
													<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
													 padding-left:2mm;vertical-align:top;">c</span>
													<span style="width:43mm;font-weight:normal;"/>
												</span>
											</td>
											<td class="styTableCellSmall">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="width:29mm;">
												<div style="float:left; clear:none; width: 4mm"></div>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellSmall" style="border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr style="border-bottom-width:1px; border-style: solid;
										 border-color: black;vertical-align:top;">
											<td class="styIRS1118TableCellLtr" colspan="3">
												<span style="width:53mm;">
													<xsl:for-each 
													select="$Form1118ScheduleKData/OtherAdjustmentsDescription">
														<xsl:choose>
															<xsl:when test="position()=1">
																<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
																 padding-left:2mm;vertical-align:top;padding-top:3mm">c</span>	
																<span style="width:35mm;padding-left:1mm;padding-top:3mm">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode"
																		 select="OtherAdjustmentsTxt"/>
																	</xsl:call-template>
																</span>
															</xsl:when>
															<xsl:otherwise>
																<span style="width:4mm;font-weight:bold;padding-bottom:0mm; height:5mm;
																padding-left:2mm;"/>
																<span style="padding-top:2mm;width:35mm;padding-left:5mm">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode"
																		 select="OtherAdjustmentsTxt"/>
																	</xsl:call-template>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</span>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;padding-top:2mm">
												<xsl:for-each 
												select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom">
												<xsl:for-each 
												select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;">
												<xsl:for-each 
												select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;">
												<xsl:for-each 
												select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;">
												<xsl:for-each 
												select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" style="vertical-align:bottom;">
												<xsl:for-each 
												select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
												OtherAdjustmentsAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
											<td class="styTableCellSmall" 
											style="border-right-width:0px;vertical-align:bottom;">
												<xsl:for-each 
												select="$Form1118ScheduleKData/Subtotal/OtherAdjustmentsTotalAmt">
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
													<br/>
													<span style="width:1px;"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Begin Line 2d, row 1, column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
											 padding-left:2mm;vertical-align:top;">d</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;vertical-align:bottom;">
										<div style="float:left; clear:none; width: 4mm"></div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2e, row 2, column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
											 padding-left:2mm;vertical-align:top;">e</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;vertical-align:bottom;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm"></div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2f, row 3, column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; 
											padding-left:2mm;vertical-align:top;">f</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;vertical-align:bottom;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm"></div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 2g, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;padding-bottom:0mm; 
											padding-left:2mm;vertical-align:top;">g</span>
											<span style="width:43mm;font-weight:normal;"/>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Interest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="width:29mm;vertical-align:bottom;">
										<!-- Form to form link -->
										<div style="float:left; clear:none; width: 4mm"></div>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherIncomeOrLoss"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 3, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<!--Line 3, column description -->
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">3</span>
											<span style="width:43mm;font-weight:normal;">
												Adjusted foreign tax carryover from prior tax year (combine lines 1 and 2). 
											</span>
										</span>
									</td>
									<!--Line 3, column (i) -->
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
											AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (ii) -->
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
											AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (iii) -->
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
											AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (iv) -->
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
											 AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (v) -->								
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
											AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (vi) -->
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
											AdjustmentToFrgnTxCarryOverAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<!--Line 3, column (vii) -->
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/AdjustmentFrgnTxCyovSubtlAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 4, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">4</span>
											<span style="width:43mm;font-weight:normal;">
											Foreign tax carryover used in current tax year (enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
											ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
											ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
											ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
											 ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
											ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
											ForeignTaxCarryOverUsedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/ForeignTaxCyovUsedSubtlAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 5, column 1-8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">5</span>
											<span style="width:43mm;font-weight:normal;">
												Foreign tax carryover expired unused in current tax year 
												(enter as a negative number)
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode"
											 select="$Form1118ScheduleKData/TenthPrecedingTaxYear/
											 FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" 
									style="border-left-width:0px;border-style: solid; border-color: black;
									 border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/ForeignTaxCyovExpiredSubtlAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 6, column 1-8  -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">6</span>
											<span style="width:43mm;font-weight:normal;">
											Foreign tax carryover generated in current tax year </span>
										</span>
									</td>
									<td class="styShadingCellSmall" 
									style="border-left-width:0px;border-style: solid; border-color: black; 
									border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 7, column 1-8    -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">7</span>
											<span style="width:43mm;font-weight:normal;">Actual or estimated amount of 
											line 6 to be carried back to prior tax year (enter as a negative number)</span>
										</span>
									</td>
									<td class="styShadingCellSmall" style="border-left-width:0px;border-style:
									 solid;border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
									border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
									border-color: black; border-bottom-width:1px;border-right-width:0px;float:none;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- Begin Line 8 -->
								<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
									<td class="styIRS1118TableCellLtr" colspan="3">
										<span style="width:53mm;">
											<span style="width:4mm;font-weight:bold;vertical-align:top;">8</span>
											<span style="width:43mm;font-weight:normal;">
											Foreign tax carryover to the following tax year.  Combine lines 3 through 7.
											</span>
										</span>
									</td>
									<td class="styTableCellSmall" style="text-align:center;padding-top:4mm;">
										<b>-0-</b>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/NinthPrecedingTaxYear/
											FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/EighthPrecedingTaxYear/
											FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SeventhPrecedingTaxYear/
											FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/SixthPrecedingTaxYear/
											FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
									<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/FifthPrecedingTaxYear/
											FrgnTaxCyovPrecedingTaxYrAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styTableCellSmall" style="border-right-width:0px;padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
											select="$Form1118ScheduleKData/Subtotal/FrgnTaxCyovFollowingSubtlAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--BEGIN Page 1 FOOTER-->
					<div style="width:256mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">
							For Paperwork Reduction Act Notice, see the instructions for Form 1118.</span>
						</div>
						<div style="float:right">
							Cat. No. 51904R 
							<span style="width:140px"/>
							<b>  Schedule K (Form 1118)  </b>(Rev. 9-2018)
						</div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN Page 2 HEADER-->
					<div class="styBB" style="width:256mm;float:none">
						<div style="float: left; clear: none">Schedule K (Form 1118) </div>
						 &#160;(Rev. 9-2018)
						<div style="float:right">
							Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!-- BEGIN SCHEDULE A TITLE -->
					<div class="styBB" style="width:256mm;"></div>
					<!-- BEGIN INCOMEORLOSS TABLE -->
					<div class="styTableContainerLandscape" id="IBActn" >
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr style="border-bottom-width:1px;border-style: solid; border-color: black;">
									<th class="styIRS1118TableCellLtr"
									 style="width:50mm;height:15mm;font-size:2.9mm;font-weight:normal;"
									  colspan="3" rowspan="1">
										Foreign Tax Carryover Reconciliation (continued)
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;"
									 scope="col">
										<div style="padding-left:5mm;width:10mm;font-weight:bold;padding-right:4mm;">
										(viii)</div>
										<div style="width:30mm;text-align:center;font-weight:normal">
										Subtotal from page 1 (enter the amounts from column (vii) on page 1)</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;"
									 scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">(ix)
										 </div>
										<br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										4th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" style="width:25mm;height:11mm;" 
									scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">(x)
										 </div>
										<br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										3th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(xi) </div>
										<br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										2th Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(xii) </div>
										<br/>
										<div style="width:10mm;text-align:center;font-weight:normal">
										1st Preceding Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(xiii)</div>
										<br/><br/>
										<div style="width:10mm;text-align:center;font-weight:normal;height:4mm;">
										Current Tax Year</div>
									</th>
									<th class="styIRS1118TableCellHeaderSmall" 
									style="width:25mm;height:11mm;border-right-width:0px;" scope="col">
										<div style="text-align:center;width:2mm;font-weight:bold;padding-right:4mm;">
										(xiv) </div>
										<br/>
										<div style="width:20mm;text-align:center;font-weight:normal">
										Totals (add columns (viii) through (xiii))</div>
									</th>
								</tr>
							</thead>
						<tfoot/>
						<tbody>
							<!-- Page 2 Table Start Here********** -->
							<!-- Page 2, line 1 column 1-8-->
							<tr style="height:6mm;border-bottom-width:1px;border-style: solid; border-color: black">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">1</span>
										<span style="width:43mm;font-weight:normal;">
											Foreign tax carryover from the prior tax year 
											(enter amounts from the appropriate columns 
											of line 8 of the prior year Schedule K (see instructions))   
										</span>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SubtotalFromPage1/
										ForeignTaxCarryoverSubtotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
										ForeignTaxCarryoverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/
										ForeignTaxCarryoverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/SecondPrecedingTaxYear/
										 ForeignTaxCarryoverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										 ForeignTaxCarryoverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" 
								style="border-left-width:0px;border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverTotalsAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!--End of row 1  -->
							<!-- Page 2, line 2 column 1-8 -->
							<tr style="height:6mm;border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3"
								 style="border-bottom-width:1px;border-right-width:1px;">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top">2</span>
										<span style="width:43mm;font-weight:normal;border-bottom-width:1px">
										Adjustments to line 1 (enter description—see instructions): </span>
									</span>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:0px;border-right-width:1px;
								float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell"
								 style="border-left-width:0px;border-style: solid; border-color: black;
								  border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color:
								; border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color:
								 black; border-bottom-width:0px;border-right-width:1px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" 
								style="border-right-width:1px;border-left-width:0px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" 
								style="border-right-width:1px;border-left-width:0px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" 
								style="border-right-width:0px;border-left-width:0px;float:none;border-bottom-width:1px">
									<span style="width:1px;"/>
								</td>
								<!--<td class="styTableCellSmall" style="border-bottom-width:0px;border-right-width:0px;">
									<span style="width:1px;"/>
								</td>-->
							</tr>
							<!-- End of  line 2  -->
							<!-- Page 2, Line 2a column 1-8 -->
							<tr style="height:6mm; border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span class="styLNLeftNumBox" 
										style="width:4mm;font-weight:bold;padding-left:2mm;
										padding-bottom:0mm;vertical-align:top;">a</span>
										<span style="width:43mm;font-weight:normal;padding-top:.5mm;">
										Carryback adjustment (see instructions) </span>
									</span>
								</td>
								<td class="styShadingCell"
								 style="border-left-width:0px;border-style: solid; border-color: black; 
								 border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall"
								 style="border-left-width:0px;border-style: solid;border-color: black;
								  border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="border-left-width:0px;border-style:
								 solid;border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCellSmall" style="border-left-width:0px;border-style:
								 solid;border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										 CarrybackAdjustmentAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" 
								style="border-left-width:0px;border-style: solid; border-color: black; 
								border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/Totals/CarrybackAdjustmentTotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end of line 2a -->
							<!-- Page 2, line 2b column 1-8  -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span class="styLNLeftNumBox" 
										style="width:4mm;font-weight:bold;padding-left:2mm;
										padding-bottom:0mm;">b</span>
										<span style="width:43mm;font-weight:normal;padding-top:.5mm;">
										Adjustments for section 905(c) redeterminations (see instructions) </span>
									</span>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SubtotalFromPage1/
										SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
										 SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/
										SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/SecondPrecedingTaxYear/
										 SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-bottom-width:1px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell"
								 style="border-left-width:0px;border-style: solid; border-color: black; 
								 border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/Totals/SectionRedeterminationAdjAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- End row 2b  -->
							<!-- Page 2, line 2c column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
												<span style="width:53mm;">
													<xsl:for-each 
													select="$Form1118ScheduleKData/OtherAdjustmentsDescription">
														<xsl:choose>
															<xsl:when test="position()=1">
																<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
																 padding-left:2mm;vertical-align:top;padding-top:3mm">c</span>	
																<span style="width:35mm;padding-left:1mm;padding-top:3mm">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode"
																		 select="OtherAdjustmentsTxt"/>
																	</xsl:call-template>
																</span>
															</xsl:when>
															<xsl:otherwise>
																<span style="width:4mm;font-weight:bold;padding-bottom:0mm; height:5mm;
																padding-left:2mm;"/>
																<span style="padding-top:2mm;width:35mm;padding-left:5mm;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode"
																		 select="OtherAdjustmentsTxt"/>
																	</xsl:call-template>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</span>
											</td>
								<!--<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;padding-bottom:0mm; 
										padding-left:2mm;vertical-align:top;"></span>
										<span style="width:43mm;font-weight:normal;"/>
									</span>
								</td>-->
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<br/>
									<xsl:for-each select=" $Form1118ScheduleKData/SubtotalFromPage1/
									OtherAdjustmentsTotalAmt">
									<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<br/>
									<xsl:for-each select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
									OtherAdjustmentsAmt">
									<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<br/>
									<xsl:for-each 
									select=" $Form1118ScheduleKData/ThirdPrecedingTaxYear/OtherAdjustmentsAmt">
									<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<br/>
									<xsl:for-each 
									select="$Form1118ScheduleKData/SecondPrecedingTaxYear/OtherAdjustmentsAmt">
									<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<br/>
									<xsl:for-each
									 select="$Form1118ScheduleKData/FirstPrecedingTaxYear/OtherAdjustmentsAmt">
									 <br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
								<td class="styShadingCell" 
								style="border-left-width:0px;border-style: solid; border-color: black; 
								border-bottom-width:1px;
								border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="width:25mm;
								  border-right-width:0px;vertical-align:bottom">
									<br/>
									<xsl:for-each select="$Form1118ScheduleKData/Totals/OtherAdjustmentsTotal">
									<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<br/>
									</xsl:for-each>
								</td>
							</tr>
							<!--End row 2c -->
							<!-- Page 2 line 2d column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;padding-bottom:0mm; 
										padding-left:2mm;vertical-align:top;">d</span>
										<span style="width:43mm;font-weight:normal;"/>
									</span>
								</td>
								<td class="styTableCellSmall">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Interest"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" 
								style="width:25mm;border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!--End row 2d  -->
							<!-- Pag2 2 line 2e column 1-8-->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
										 padding-left:2mm;vertical-align:top;">e</span>
										<span style="width:43mm;font-weight:normal;"/>
									</span>
								</td>
								<td class="styTableCellSmall">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Interest"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" 
								style="width:25mm;border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- End row 2e -->
							<!-- Page 2 line 2f  column 1-8-->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
										 padding-left:2mm;vertical-align:top;">f</span>
										<span style="width:43mm;font-weight:normal;"/>
									</span>
								</td>
								<td class="styTableCellSmall">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Interest"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" 
								style="width:25mm;border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- End row 2f  -->
							<!-- Page 2 line 2g column 1-8-->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;padding-bottom:0mm;
										padding-left:2mm;vertical-align:top;">g</span>
										<span style="width:43mm;font-weight:normal;"/>
									</span>
								</td>
								<td class="styTableCellSmall">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="OtherDividendsGrossUp"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Interest"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrossRentsRoyaltiesLicenseFees"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PerformanceOfServicesGrossIncm"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; border-color: 
								black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" 
								style="width:25mm;border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotGrossIncomeOrLossOutsideUS"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!--End row 2g  -->
							<!--Page 2, line 3 column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">3</span>
										<span style="width:43mm;font-weight:normal;">
											Adjusted foreign tax carryover from prior tax year (combine lines 1 and 2).  
											Include the column (xiv) total on the current year Form 1118, 
											Schedule B, Part II, line 5. 
										</span>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SubtotalFromPage1/
										AdjustmentFrgnTxCyovSubtlAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
										AdjustmentToFrgnTxCarryOverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/
										 AdjustmentToFrgnTxCarryOverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SecondPrecedingTaxYear/
										AdjustmentToFrgnTxCarryOverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										AdjustmentToFrgnTxCarryOverAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" 
								style="width:25mm;border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/Totals/AdjustmentsFrgnTxCyovTotAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- End row 3  -->
							<!-- Page 2 line 4 column 1-8-->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">4</span>
										<span style="width:43mm;font-weight:normal;">
										Foreign tax carryover used in current tax year (enter as a negative number)</span>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SubtotalFromPage1/
										ForeignTaxCyovUsedSubtlAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
										ForeignTaxCarryOverUsedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/
										ForeignTaxCarryOverUsedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SecondPrecedingTaxYear/
										ForeignTaxCarryOverUsedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										ForeignTaxCarryOverUsedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell"
								 style="border-left-width:0px;border-style: solid; border-color: black; 
								 border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="width:25mm; 
								 border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverUsedTotAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- Page 2 line 5 column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
									<span style="width:4mm;font-weight:bold;vertical-align:top;">5</span>
										<span style="width:43mm;font-weight:normal;">Foreign tax carryover expired 
										unused in current tax year (enter as a negative number)</span>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/SubtotalFromPage1/
										 ForeignTaxCyovExpiredSubtlAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverExprTotAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- Page 2, line 6 column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;;">6</span>
										<span style="width:43mm;font-weight:normal;">
										Foreign tax carryover generated in current tax year </span>
									</span>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black;  border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black;  border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/CurrentTaxYear/ForeignTaxCarryoverGenAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/Totals/ForeignTaxCarryoverGenTotAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- Page 2 line 7 column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">7</span>
										<span style="width:43mm;font-weight:normal;">
											Actual or estimated amount of line 6 to be carried back to prior tax year 
											(enter as a negative number)
										</span>
									</span>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid;
								 border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="border-left-width:0px;border-style: solid; 
								border-color: black; border-bottom-width:1px;border-right-width:1px;float:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/CurrentTaxYear/TentativeCarriedBackAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/Totals/TentativeCarriedBackTotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- Page 2 line 8 column 1-8 -->
							<tr style="height:6mm;border-bottom-width:1px; border-style: solid; border-color: black;">
								<td class="styIRS1118TableCellLtr" colspan="3">
									<span style="width:53mm;">
										<span style="width:4mm;font-weight:bold;vertical-align:top;">8</span>
										<span style="width:43mm;font-weight:normal;">Foreign tax carryover to the 
										following tax year. Combine lines 3 through 7.</span>
									</span>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/SubtotalFromPage1/
										FrgnTaxCyovFollowingSubtlAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FourthPrecedingTaxYear/
										FrgnTaxCyovPrecedingTaxYrAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/ThirdPrecedingTaxYear/
										 FrgnTaxCyovPrecedingTaxYrAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/SecondPrecedingTaxYear/
										 FrgnTaxCyovPrecedingTaxYrAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/FirstPrecedingTaxYear/
										FrgnTaxCyovPrecedingTaxYrAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" 
										select="$Form1118ScheduleKData/CurrentTaxYear/
										ForeignTaxCyovFollowingCYAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td class="styTableCellSmall" style="border-right-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode"
										 select="$Form1118ScheduleKData/Totals/ForeignTaxCyovFollowingTotAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--Page 2  FOOTER-->
				<div style="width:256mm">
					<div style="float: left; clear: none;">
						<span class="styBoldText"></span>
					</div>
					<div style="float:right">						
						<span style="width:140px"/>
						<b>  Schedule K (Form 1118) </b> (Rev. 9-2018)
					</div>
				</div>
				<!--END FOOTER-->
				<!-- BEGIN Left Over Table -->
				<!-- Additonal Data Title Bar and Button -->
				<div class="pageEnd"/>
				<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
					<div class="styLeftOverTitle">Additional Data </div> 
					<div class="styLeftOverButtonContainerLandscape">
						<input class="styLeftoverTableBtn" type="button" value="Return to Form"
						 onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
			 <!-- Additional Data Table -->
				<table class="styLeftOverTblLandscape">
					<xsl:call-template name="PopulateCommonLeftoverLandscape">
						<xsl:with-param name="TargetNode" select="$Form1118ScheduleKData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
			</form>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
