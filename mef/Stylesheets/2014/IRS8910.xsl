<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8910Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8910"/>
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
				<meta name="Description" content="Form IRS 8910"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- ************************************************************************
					Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
					is an unbound repeatable columns. 
					EXCEPTION: Part I, line 3 if code is present on column (a) and not (b) the "Slash for MM/DD/YYYY" will not display for column (b).
						  ************************************************************************** -->
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8910Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8910">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 20mm">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height:22mm;">
							Form <span class="styFormNumber">8910</span>
							<br/>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="height: 22mm;width:125mm;padding-top:3mm;">
							<div class="styMainTitle" style="height: 8mm">Alternative Motor Vehicle Credit</div>
							<div class="styFST" style="font-size:7pt;margin-left:1mm;font-weight:bold;padding-top:2mm">
								<div style="margin-left: .5mm;">
									<img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
								    Attach to your tax return.<br/>
									<img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
									Information about Form 8910 and its separate instructions is at 
									<a href="http://www.irs.gov/form8910">
										<i>www.irs.gov/form8910.</i>
									</a>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width:1px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-1998</div>
							<div class="styTY" style="height:10mm">20<span class="styTYColor">14</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b>152</b>
							</div>
						</div>
					</div>
					<!--  End title of Form   -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">Name(s) shown on return<br/>
							<div style="font-family:verdana;font-size:7pt;height:6mm">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!--   ****************************************************************************** -->
						<div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">
							<span class="BoldText">Identifying number</span>
							<div style="text-align:left;font-weight:normal; ">
								<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- *******************************************************************  -->
					<!--  Note Line  -->
					<div style="width: 187mm">
						<b>Note.</b>
					</div>
					<!--  Note Line, first bullet  -->
					<div style="width: 187mm">
						<span class="styBoldText">
							<img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/>
						</span>
						<span style="width: 1mm"/>Use this form to claim the credit for certain alternative motor vehicles.
					</div>
					<!--  Note Line, second bullet  -->
					<div class="styBB" style="width: 187mm">
						<span class="styBoldText">
							<img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/>
						</span>
						Claim the credit for certain plug-in electric vehicles on Form 8936.
					</div>
					<!-- *******************************************************************  -->
					<!--  Part I -->
					<div class="styBB" style="width: 187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Tentative Credit</div>
					</div>
					<!--  Part I, repeating table for line 1-4 -->
					<!-- NOTE: this div extend part I line 1-4 including empty table before the Next Line, so the repeating table does not float to the right in IE browser view-->
					<div style="width:187mm;clear:all;">
					<xsl:if test="($Print != $Separated) or (count($FormData/IRS8910TentativeCreditGrp) &lt;= 2)">
							<xsl:for-each select="$FormData/IRS8910TentativeCreditGrp">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 2)=1">
									<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">
										<tr >
											<th scope="col" class="PopulateTxt" colspan="3" style="border:none;border-top-width:1px;text-align:left;height:8mm;">
												<span class="styNormalText"> Use a separate column for each vehicle. If you need more columns,
													use additional Forms 8910 and include the total on lines 7 and 11.
												</span>
											</th>
											<th scope="col" class="styTableCell" style="width:45mm;border:none;border-left:1px solid black;border-right:1px solid black; text-align:center;">
												(<xsl:number value="($pos)" format="a"/>)
												<span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/></span>
											</th>
											<th scope="col" class="styTableCell" style="width:45mm;text-align:center;border:none;">
												(<xsl:number value="($pos + 1)" format="a"/>)
												<span style="font-weight:normal;">Vehicle <xsl:number value="($pos + 1)" format="1"/></span>
											</th>
										</tr>
										<tfoot/>
										<tbody>
											<!--  Line 1   -->
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:right;padding-top:4mm;border:none;border-top:1px solid black;">
													<b>1</b>
												</td>
												<td class="styTableCell" style="width:84mm;padding-left:2mm;border:none;border-top:1px solid black;padding-top:4mm;">
													<span style="float: left; clear: none;">Year, make, and model of vehicle</span>
													<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
												</td>
												<td class="styLNRightNumBoxNBB" style="width:8mm;border-width:1px;border-right:0;">1 </td>
												<td class="styTableCell" style="width:45mm;border:1px solid black;text-align:left;padding-left:1mm;">
													<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos]/VehicleDescriptionGrp/VehicleModelYr"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos]/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos]/VehicleDescriptionGrp/VehicleModelNameTxt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:45mm;border:1px solid black;border-left:0;border-right:0;text-align:left;padding-left:1mm;">
													<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelYr"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelNameTxt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 2  -->
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:right;border:none;"><b>2</b></td>
												<td class="styTableCell" style="width:84mm;padding-left:2mm;border:none;">
													<span style="float: left; clear: none;">Vehicle identification number (see instructions)</span>
												</td>
												<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;">2</td>
												<td class="styTableCell" style="width:45mm;text-align:center;border:1px solid black;border-top:0;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VIN"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:45mm;text-align:center;border:none;border-bottom:1px solid black;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VIN"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 3  -->
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:right;font-weight:bold;border:none;" valign="top">3</td>
												<td class="styTableCell" style="width: 84mm; padding-left:2mm;text-align: left; border:none;" valign="top;">
													Enter date vehicle was placed in service (MM/DD/YYYY)
												</td>
												<td class="styLNRightNumBox" style="width:8mm;">3</td>
												<td class="styTableCell" style="width:45mm;text-align:center;border:1px solid black;border-top: 0;padding-left:2mm;" valign="bottom">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:45mm;text-align:center;border:none;border-bottom:1px solid black; padding-left:2mm" valign="bottom">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
													</xsl:call-template>
												</td>
											</tr>
											<!-- Line 4  -->
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:right;font-weight:bold;border:none;border-bottom:1px solid black;" valign="top">4</td>
												<td class="styTableCell" style="width: 84mm;padding-left:2mm;text-align:left;border:none;border-bottom:1px solid black;">
													<b>Tentative credit</b> (see instructions for amount to enter)
												</td>
												<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;">4</td>
												<td class="styTableCell" style="width:45mm;border:1px solid black;border-top:0;text-align:right;" valign="bottom">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:45mm;border:none;border-bottom:1px solid black;" valign="bottom">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehTentativeCreditAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<!--Part I Empty table no data -->
						<xsl:if test="(count($FormData/IRS8910TentativeCreditGrp)=0) or (($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2))">						
							<div class="styIRS8910TableContainer" id="Spcctn">
							<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" style="font-size: 7pt">
									<thead class="styTableThead">
										<tr style="height: 8mm">
											<th scope="col" class="PopulateTxt" colspan="3" style="width:83mm; border:none;">
												<span class="styNormalText"> 
													Use a separate column for each vehicle. If you need more columns, use additional Forms
													8910 and include the total on lines 7 and 11.
												</span>
											</th>
											<th scope="col" class="styTableCell" style="width:50mm;border:none;border-left:1px solid black;border-right:1px solid black; text-align: center;font-weight:normal;">
												<b>(a)</b> Vehicle 1
											</th>
											<th scope="col" class="styTableCell" style="width:50mm;border:none;text-align: center;font-weight:normal;">
												<b>(b)</b> Vehicle 2
											</th>
										</tr>
									</thead>
								<tfoot/>
								<tbody>
								<!--  Line 1   -->
									<tr>
										<td class="styTableCell" style="width:5mm;text-align:center;border:none;border-top:1px solid black;
										padding-top:6mm;padding-left:2mm;">
											<b>1</b>
										</td>
										<td class="styTableCell" style="width:84mm;text-align:left; border:none;border-top:1px solid black;padding-top:6mm;">
											<span style="float: left;">Year, make, and model of vehicle</span>
											<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
										</td>
										<td class="styLNRightNumBoxNBB" style="width:8mm;border:1px solid black;border-right:0;padding-left:0;">
											1
										</td>
										<td class="styTableCell" style="width:45mm;border:1px solid black;text-align:center;">
											<!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
											<xsl:choose>
												<xsl:when test="(($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="ShortMessage">true</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp/VehicleDescriptionGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span class="styTableCellPad"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:45mm;border:1px solid black;border-left:0;border-right:0;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 2  -->
									<tr>
										<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:2mm;">2</td>
										<td class="styTableCell" style="width: 84mm;text-align: left;border:none;">
											<span style="float: left;">Vehicle identification number (see instructions) </span>
											<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
										</td>
										<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;">2</td>
										<td class="styTableCell" style="width:45mm;border:1px solid black;border-top: 0;" valign="bottom">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:45mm;border:none;border-bottom:1px solid black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 3  -->
									<tr>
										<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:2mm;">3</td>
										<td class="styTableCell" style="width: 84mm;text-align:left;border:none;">
										   Enter date vehicle was placed in service (MM/DD/YY)
										</td>
										<td class="styLNRightNumBox" style="width:8mm;">3</td>
										<td class="styTableCell" style="text-align:center;width:45mm;border:1px solid black;border-top:none;">
											 <span class="styTableCellPad"/>/<span class="styTableCellPad" style="width:8mm;"/>/<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:center;width:45mm;border:none;border-bottom:1px solid black;">
											 <span class="styTableCellPad"/>/<span class="styTableCellPad" style="width:8mm;"/>/<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- Line 4  -->
									<tr>
										<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;border-bottom:1px solid black;padding-left:2mm;">4 </td>
										<td class="styTableCell" style="width: 84mm;text-align: left; border:none;border-bottom:1px solid black;">
											<b>Tentative credit</b> (see instructions for amount to enter)
										</td>
										<td class="styLNRightNumBox" style="width:8mm;">4</td>
										<td class="styTableCell" style="width:45mm;border:1px solid black;border-top:none;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:45mm;border:none;border-bottom:1px solid black;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<!-- ***********************************************************************************  -->
								</tbody>
							</table>
						</div>
					</xsl:if>
				</div>
					<!-- NEXT Line -->
					<div style="width: 187mm;border-top-width:0px;">
						<span style="padding-left:7mm"/>
						<b>Next:</b> If you did NOT use your vehicle for business or 
						investment purposes and did not have a credit from a partnership or S corporation, 
						<span style="padding-left:7mm;border-top-width:0px;"/>skip Part II and go to Part III. ALL others, go to Part II.<br/>
					</div>
					<!-- PART II -->
					<div class="styBB" style="width: 187mm;border-top-width:1px">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>
					</div>
					<br/>
					<!-- Part II, repeating line 5 and 6 table-->
					<!--NOTE: this div extend from line 5 -9 including empty table, so that the repeating table is not floating to the right in IE browser view --> 
					<div style="width:187mm; clear:all;">
						<xsl:if test="($Print != $Separated) or (count($FormData/BusinessInvestmentUseGrp) &lt;= 2)">
							<xsl:for-each select="$FormData/BusinessInvestmentUseGrp">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 2)=1">
									<div class="styIRS8910TableContainer" id="Spcctn">
										<!--print logic-->
										<xsl:call-template name="SetInitialState"/>
										<!--end-->
										<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;">
											<tbody>
												<!-- line 5 -->
												<tr>
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<b>5</b>
													</td>
													<td class="styTableCell" style="width:77.5mm; padding-left:2mm;text-align:left;border:none;">
														Business/Investment use percentage (see instructions)
													</td>
													<td class="styLNRightNumBox">5</td>
													<td class="styTableCell" style="border:1px solid black;border-right:0;width:46.5mm;border-top:0;">
														<span class="styTableCellPad"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
														</xsl:call-template>%
													</td>
													<td class="styTableCell" style="border:1px solid black;border-right:0;width:47mm;border-top:0;">
														<span class="styTableCellPad"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUsePct"/>
														</xsl:call-template>%
													</td>
												</tr>
												<!-- Line 6 -->
												<tr>
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<b>6</b>
													</td>
													<td class="styTableCell" style="width:77.5mm; padding-left:2mm;text-align:left;border:none;">
														<span style="float:left;">Multiply line 4 by line 5</span>
														<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
													</td>
													<td class="styLNRightNumBox">6</td>
													<td class="styTableCell" style="border:1px solid black;width:46.5mm; border-right:0;border-top:0;">
														<span class="styTableCellPad"/>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos]/BusinessInvestmentUseAmt"/>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="border:1px solid black;width:47mm;border-right:0;border-top:0;">
														<span class="styTableCellPad"/>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUseAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<!-- Part II, repeating line 5 and 6 Empty table (no data) -->
						<xsl:if test="(count($FormData/BusinessInvestmentUseGrp)=0) or (($Print = $Separated)and (count($FormData/BusinessInvestmentUseGrp) &gt; 2))">
							<div style="width:187mm">
								<!--<div class="styIRS8910TableContainer" id="Spcctn">  -->
								<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;">
									<tfoot/>
									<tbody>
										<!-- line 5  -->
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<b>5</b>
											</td>
											<td class="styTableCell" style="width:78mm; padding-left:2mm;text-align:left;border:none;">
												Business/Investment use percentage (see instructions)
											</td>
											<td class="styLNRightNumBox">5</td>
											<td class="styTableCell" style="border:1px solid black;width:47.5mm;border-top:none;">
												<xsl:if test="(($Print = $Separated) and (count($FormData/BusinessInvestmentUseGrp) &gt; 2))">
												<span style="text-align:center;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="ShortMessage">true</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp/BusinessInvestmentUsePct"/>
													</xsl:call-template>
												</span>
												</xsl:if>
												<span class="styTableCellPad" style="width:16mm;">%</span>
											</td>
											<td class="styTableCell" style="width:48mm;border:none;border-bottom:1px solid black;width:48mm;">
												<span class="styTableCellPad"/>%
											</td>
										</tr>
										<!-- Line 6  -->
										<tr>
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<b>6</b>
											</td>
											<td class="styTableCell" style="width:78mm; padding-left:2mm;text-align:left;border:none;">
												<span style="float:left;">Multiply line 4 by line 5</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
											</td>
											<td class="styLNRightNumBox">6</td>
											<td class="styTableCell" style="border:1px solid black;width:47.5mm;border-top:none;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:48mm;border:none;border-bottom:1px solid black;width:48mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<!--  Line 7 - 9 in table format that are not repeating-->
						<table class="styTable" cellspacing="0" style="font-size: 7pt;">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<!-- Line 7-->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">7</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">Add columns (a) and (b) on line 6</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;border-right:1px;">7</td>
									<td class="styTableCell" style="border:1px solid black;width:48mm;border-right:0;border-top:0;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 8 -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">8</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">Alternative motor vehicle credit from partnerships and S corporations (see instructions)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;border-right:0;">8</td>
									<td class="styTableCell" style="border:1px solid black;width:48mm;border-right:0;border-top:0;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AlternativeMotorVehicleCrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 9a-->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">9</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<b>Business/Investment use part of credit. </b>Add lines 7 and 8. Partnerships and S corporations,
									</td>
									<td class="styLNRightNumBox" style="background-color:lightgrey;width:8mm;border-bottom:0;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border:none; border-left:1px solid black;width:48mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 9b -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">
										stop here and report this amount on Schedule K. All others, report this amount on Form
										</span>
									</td>
									<td class="styLNRightNumBox" style="background-color:lightgrey;width:8mm;border-bottom:0;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border:none;border-left:1px solid black;width:48mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 9c -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;"> 3800, Part III, line 1r</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border:none;border-left:1px solid black;">9</td>
									<td class="styTableCell" style="border:none;width:48mm;border-left:1px solid black">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessInvstUsePartOfCrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  End Line 7-9 table format that are not repeating -->
					<!--   Part III -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
					</div>
					<!-- Part III, Line 10 repeating line table -->
					<!--NOTE: this div extend from line 10 and 15 including empty table, so that the repeating table is not floating to the right in IE browser view--> 
					<div style="width:187mm; clear:all;">
						<xsl:if test="($Print != $Separated) or (count($FormData/TentativeCreditForPrsnlUseAmt) &lt;= 2)">
							<xsl:for-each select="$FormData/TentativeCreditForPrsnlUseAmt">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 2)=1">
									<div class="styIRS8910TableContainer" id="Spcctn">
										<!--print logic-->
										<xsl:call-template name="SetInitialState"/>
										<!--end-->
										<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;width:187mm;">
											<tbody>
												<!-- Line 10a  -->
												<tr style="width:187mm;">
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<b>10</b>
													</td>
													<td class="styTableCell" style="width:77mm; padding-left:2mm;text-align:left;border:none;">
														If you skipped Part II, enter the amount from line 4.  If
														</td>
													<td class="styLNRightNumBox" style="border-bottom:0;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:46.5mm;border:none;border-left:1px solid black;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="border:none;border-left:1px solid black;width:47.5mm;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
												<!-- Line 10b  -->
												<tr style="width:187mm;">
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:77mm; padding-left:2mm;text-align:left;border:none;">
														<span style="float:left;">you completed Part II, subtract line 6 from line 4</span>
														<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
													</td>
													<td class="styLNRightNumBox">10</td>
													<td class="styTableCell" style="border:none;border-left:1px solid black;width:46.5mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos]"/>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:47.5mm;border:none;border-left:1px solid black;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos + 1]"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<!-- Part III, Line 10 repeating empty table -->
						<xsl:if test="(count($FormData/TentativeCreditForPrsnlUseAmt)=0) or (($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2))">
							<div class="styIRS8910TableContainer" id="Spcctn">
								<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
								<xsl:call-template name="SetInitialState"/>
								<!--end-->
								<table class="styTable" cellspacing="0" style="font-size: 7pt">
									<thead class="styTableThead"/>
									<tfoot/>
									<tbody>
										<!-- line 10a -->
										<tr style="width:187mm;">
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<b>10</b>
											</td>
											<td class="styTableCell" style="width:77mm; padding-left:2mm;text-align:left;border:none;">
														If you skipped Part II, enter the amount from line 4.  If
														</td>
											<td class="styLNRightNumBox" style="border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:46.5mm;border:none;border-left:1px solid black;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border:none;border-left:1px solid black;width:48mm;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<!-- Line 10b  -->
										<tr style="width:187mm;">
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:77mm; padding-left:2mm;text-align:left;border:none;">
												<span style="float:left;">you completed Part II, subtract line 6 from line 4</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
											</td>
											<td class="styLNRightNumBox">10</td>
											<td class="styTableCell" style="width:46.5mm;border:1px solid black;border-top:0;border-right:0;text-align:center;">
												<xsl:if test="(($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="ShortMessage">true</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt"/>
													</xsl:call-template>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:48mm;border:none;border-left:1px solid black;border-bottom:1px solid black;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<!-- Line 11-15 in table format that is not repeating-->
						<table class="styTable" cellspacing="0" style="font-size: 7pt;">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<!--  Line 11 -->
								<tr>
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">11</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">Add columns (a) and (b) on line 10</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;border-right:1px;">11</td>
									<td class="styTableCell" style="border:1px solid black;width:48mm;border-right:0;border-top:0;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCrForPrsnlUseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 12 -->
								<tr>
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">12</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">Enter the amount from Form 1040, line 47, or Form 1040NR, line 45</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;border-right:1px;">12</td>
									<td class="styTableCell" style="border:1px solid black;width:48mm;border-right:0;border-top:0;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 13 -->
								<tr>
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">13</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">Personal credits from Form 1040 or 1040NR (see instructions)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;border-right:1px;">13</td>
									<td class="styTableCell" style="border:1px solid black;width:48mm;border-right:0;border-top:0;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehCreditFromFormsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 14a-->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">14</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										Subtract line 13 from line 12.  If zero or less, enter -0- and stop here. You cannot claim the
									</td>
									<td class="styLNRightNumBox" style="width:8mm;border-bottom:0;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border:none; border-left:1px solid black;width:48mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 14b -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;"> personal use part of the credit</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;;border:1px solid black; border-top:none;border-right:none;">14</td>
									<td class="styTableCell" style="width:48mm;;border:1px solid black; border-top:none;border-right:none;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehAdjustedCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--  Line 15a-->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">15</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<b> Personal use part of credit.</b> Enter the <b>smaller</b> of line 11 or line 14 here and on Form 1040,
									</td>
									<td class="styLNRightNumBox" style="background-color:lightgrey;width:8mm;border-bottom:0;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border:none; border-left:1px solid black;width:48mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 15b -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;padding-left:1.5mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;">
										<span style="float: left;">
										  line 54 (or Form 1040NR, line 51).  Check box <b>c</b> on that line and enter "8910" in the space 
										</span>
									</td>
									<td class="styLNRightNumBox" style="background-color:lightgrey;width:8mm;border-bottom:0;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border:none;border-left:1px solid black;width:48mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<!--  Line 15c -->
								<tr style="width:187mm;">
									<td class="styTableCell" style="width:5mm;text-align:center;font-weight:bold;border:none;border-bottom:1px solid black;padding-left:1.5mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width: 124.5mm;text-align:left;border:none;border-bottom:1px solid black;">
										<span style="float: left;">next to that box. If line 14 is smaller than line 11, see instructions</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="width:8mm;">15</td>
									<td class="styTableCell" style="width:48mm;border:1px solid black; border-top:none;border-right:none;">
										<span class="styTableCellPad"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- End Line 11 -15 table format that are not repeating -->
					<!-- End of page footer-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
						<span style="width:120px;"/>Cat. No. 37720F 
						<span style="width:80px;"/>Form <span class="styBoldText">8910</span> (2014)
					</div>
					<br/>
					<br class="pageEnd"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Data from Part I; displayed if more than 2 elements and Print is set to separated-->
					<xsl:if test="($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 8910, Part I - Tentative Credit:</span>
						<xsl:for-each select="$FormData/IRS8910TentativeCreditGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="(position() mod 2)=1">
								<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th scope="col" class="styDepTblCell" colspan="3" style="border:none;border-top-width:1mm;text-align:left;">
												<span class="styNormalText"> Use a separate column for each vehicle. If you need more columns,
											 use additional Forms 8910 and include the total on lines 7 and 11.
											</span>
											</th>
											<th scope="col" class="styDepTblCell" style="width:45mm;padding-top:4mm; ">
												<span style="font-weight:bold;">(<xsl:number value="($pos)" format="a"/>) </span>
												<span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/></span>
											</th>
											<th scope="col" class="styDepTblCell" style="width:45mm;padding-top:4mm;">
												<span style="font-weight:bold;">(<xsl:number value="($pos + 1)" format="a"/>) </span>
												<span style="font-weight:normal;">Vehicle <xsl:number value="($pos + 1)" format="1"/></span>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!--  Line 1   -->
										<tr class="styDepTblRow1">
											<td class="styTableCellText" style="width:5mm;text-align:right;padding-top:4mm;border:none;border-top:1px solid black;">
												<b>1</b>
											</td>
											<td class="styTableCell" style="width:84mm;padding-left:2mm;border:none;border-top:1px solid black;padding-top:4mm;">
												<span style="float: left; clear: none;">Year, make, and model of vehicle</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
											</td>
											<td class="styLNRightNumBoxNBB" style="width:8mm;border-width:1px;border-right:0;">1
											</td>
											<td class="styTableCellText" style="width:45mm;border:1px solid black;text-align:left;padding-left:1mm;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos]/VehicleDescriptionGrp/VehicleModelYr"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos]/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos]/VehicleDescriptionGrp/VehicleModelNameTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:45mm;border:1px solid black;border-left:0;border-right:0; text-align:left;padding-left:1mm;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelYr"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMakeNameTxt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModelNameTxt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Line 2  -->
										<tr class="styDepTblRow2">
											<td class="styTableCellText" style="width:5mm;text-align:right;border:none;">
												<b>2</b>
											</td>
											<td class="styTableCellText" style="width:84mm;padding-left:2mm;border:none;">
												<span style="float: left; clear: none;">Vehicle identification number (see instructions)</span>
											</td>
											<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;">2</td>
											<td class="styTableCellText" style="width:45mm;text-align:center;border:1px solid black;border-top:0;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:45mm;text-align:center;border:none;border-bottom:1px solid black;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VIN"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Line 3  -->
										<!--EXCEPTION: Part I, line 3 if code is present on column (a) and not (b) the "Slash for MM/DD/YYYY" will not display for column (b).-->
										<tr class="styDepTblRow1">
											<td class="styTableCellText" style="width:5mm;text-align:right;font-weight:bold;border:none;" valign="top">3</td>
											<td class="styTableCellText" style="width: 84mm; padding-left:2mm;text-align: left; border:none;" valign="top;">
												Enter date vehicle was placed in service (MM/DD/YYYY)
											</td>
											<td class="styLNRightNumBox" style="width:8mm;">3</td>
											<td class="styTableCellText" style="width:45mm;text-align:center;border:1px solid black;border-top: 0;padding-left:2mm;" valign="bottom">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:45mm;text-align:center;border:none;border-bottom:1px solid black;padding-left:2mm" valign="bottom">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Line 4  -->
										<tr class="styDepTblRow2">
											<td class="styTableCell" style="width:5mm;text-align:right;font-weight:bold;border:none;border-bottom:1px solid black;" valign="top">4</td>
											<td class="styTableCellText" style="width: 84mm;padding-left:2mm;text-align:left;border:none;border-bottom:1px solid black;">
												<b>Tentative credit</b> (see instructions for amount to enter)
											</td>
											<td class="styLNRightNumBox" style="width:8mm;border-bottom-width:1px;">4</td>
											<td class="styTableCellText" style="width:45mm;border:1px solid black;border-top:0;text-align:right;" valign="bottom">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:45mm;border:none;border-bottom:1px solid black;" valign="bottom">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehTentativeCreditAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- ***********************************************************************************  -->
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Additional Data Table for Separated Data from Part II;
						   displayed if more than 3 elements and Print is set to separated-->
					<xsl:if test="($Print = $Separated) and (count($FormData/BusinessInvestmentUseGrp) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS8910, Part II -Credit for Business/Investment Use Part of Vehicle:</span>
						<xsl:for-each select="$FormData/BusinessInvestmentUseGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="(position() mod 2)=1">
								<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
									<tbody>
										<!-- line 5 -->
										<!-- line 5 -->
										<tr class="styDepTblRow1">
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<b>5</b>
											</td>
											<td class="styTableCell" style="width:77.5mm; padding-left:2mm;text-align:left;border:none;">
												Business/Investment use percentage (see instructions)
											</td>
											<td class="styLNRightNumBox">5</td>
											<td class="styTableCell" style="border:none;border-left:1px solid black;width:46.5mm;border-bottom:1px solid black;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
												</xsl:call-template>%
											</td>
											<td class="styTableCell" style="border:1px solid black;border-right:0;width:47mm;border-top:0;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUsePct"/>
												</xsl:call-template>%
											</td>
										</tr>
										<!-- Line 6 -->
										<tr class="styDepTblRow2">
											<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
												<b>6</b>
											</td>
											<td class="styTableCell" style="width:77.5mm; padding-left:2mm;text-align:left;border:none;">
												<span style="float:left;">Multiply line 4 by line 5</span>
												<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
											</td>
											<td class="styLNRightNumBox">6</td>
											<td class="styTableCell" style="border:1px solid black;width:46.5mm; border-right:0;border-top:0;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos]/BusinessInvestmentUseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border:1px solid black;width:47mm;border-right:0;border-top:0;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUseAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- line 7-->
					<!--  *********************************************************************  -->
					<!-- Additional Data Table for Separated Data from Part III; displayed if more than 3 elements and Print is set to separated-->
					<xsl:if test="($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS8910, Part III -Credit for Personal Use of Vehicle:</span>
						<xsl:for-each select="$FormData/TentativeCreditForPrsnlUseAmt">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="(position() mod 2)=1">
								<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
									<tbody>
										<!-- line10 -->
										<!--  *********************************************************************  -->
										<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
											<tbody>
												<!-- Line 10a  -->
												<tr class="styDepTblRow1">
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<b>10</b>
													</td>
													<td class="styTableCell" style="width:78mm; padding-left:2mm;text-align:left;border:none;">
														If you skipped Part II, enter the amount from line 4.  If
														</td>
													<td class="styLNRightNumBox" style="border-bottom:0;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="border:none;border-left:1px solid black;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="border:none;border-left:1px solid black;width:48mm;">
														<span class="styTableCellPad"/>
													</td>
												</tr>
												<!-- Line 10b  -->
												<tr class="styDepTblRow1">
													<td class="styTableCell" style="width:5mm;text-align:right;border-right:0;border-bottom:0;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:78mm; padding-left:2mm;text-align:left;border:none;">
														<span style="float:left;">you completed Part II, subtract line 6 from line 4</span>
														<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
													</td>
													<td class="styLNRightNumBox">10</td>
													<td class="styTableCell" style="border:none;border-left:1px solid black;width:48mm;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos]"/>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:48mm;border:none;border-left:1px solid black;border-bottom:1px solid black;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos + 1]"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
										<!--  *********************************************************************  -->
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
