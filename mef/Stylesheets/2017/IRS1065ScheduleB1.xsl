<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Steven Fook on 10/6/2016 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleB1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065SchB1Data" select="$RtnDoc/IRS1065ScheduleB1"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065SchB1Data)"/>
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
				<meta name="Description" content="IRS Form 1065 Schedule B1"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleB1Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065ScheduleB1">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header - Form1065SchB-1 Number, Title, and Year -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:10pt;">SCHEDULE B-1
							   <span style="font-size:9pt;">(Form 1065)</span>
							   <br/>
							   <span style="font-size:7pt;font-weight:normal">(Rev. September 2017)</span>
							</span>
							<br/>
							<span class="styAgency" style="height:4mm;padding-top:.5mm;">
                                                 Department of the Treasury<br/>
                                                 Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:12mm;">
						    <div class="styMainTitle" style="font-size:13.5pt;padding-top:1.5mm">
						      Information on Partners Owning 50% or<br/>
							    <span style="width:1mm"/>More of the Partnership</div>
							<div class="styFST" style="height:4mm;padding-top:1mm;font-size:8pt">
								<img src="{$ImagePath}/1065ScheduleB1_Bullet.gif" width="7" height="5" alt="Bullet"/>
								Attach to Form 1065.<br/>
								<img src="{$ImagePath}/1065ScheduleB1_Bullet.gif" width="7" height="5" alt="Bullet"/>
								Go to <i>www.irs.gov</i>/Form 1065 for the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;border-left-width:2px;">
							<br/>
							<br/>
							<div class="styOMB" style="height:1mm;border-bottom:0px">OMB No. 1545-0123</div>
							<!--<div class="styTaxYear" style="height:7mm;padding-top:1mm;">
									20<span class="styTYColor">09</span></div>-->
						</div>
					</div>
					<!-- End Header - Form Number, Title, and Year -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm;height:10mm;">
						<div class="styNameBox" style="width:130mm;height:10mm;font-size:7pt;">
                                          Name of partnership<br/>
							<div style="font-family:verdana;font-size:7pt;height:4mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="height:4mm;padding-left:2mm;font-size:7pt;">
                                          Employer identification number (EIN)<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:6mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:1.5mm;padding-bottom:1.5mm;float:left;">
                        <span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;">Part I</span>
						<span style="width:175mm;font-size:9pt;height:4mm" class="styPartDesc">
					         Entities Owning 50% or More of the Partnership <span style="font-weight:normal">
					         (Form 1065, Schedule B, Question 3a)</span><br/>
						</span>
					</div>
					<div class="styLNDesc" style="width:187mm;height:12mm;font-size:8pt">
					  Complete columns (i) through (v) below for any foreign or domestic corporation, 
					  partnership (including any entity treated as a partnership), trust, tax-exempt organization, or 
					  any foreign government that owns, directly or indirectly, an interest of 50% or more in the profit,
					  loss, or capital of the partnership (see instructions).
					</div>
					<!-- Part I Entities owning 50% or more-->
					<div class="styBB" style="width:187mm;border-bottom:none">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/PartnersOwn50PctOrMoreGrp"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'REPtbl' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="REPtbl">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:60mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/><br/>(i)
                                                      <span class="styNormalText"> Name of Entity</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:34mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/>(ii) Employer <br/>Identification Number<br/>
                                                       (if any)
										</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/><br/>(iii)
                                                      <span class="styNormalText"> Type of Entity</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:35mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/>(iv) 
                                                      <span class="styNormalText"><br/> Country of Organization</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText">(v) Maximum <br/>Percentage Owned<br/>
                                                                in Profit, Loss, or<br/> Capital
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB1Data/PartnersOwn50PctOrMoreGrp">
									<xsl:if test="($Print != $Separated) or           (count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt;=2)">
										<tr style="font-size: 6.5pt;height:8mm">
											<td class="styTableCellText" style="width:60mm;text-align:left;vertical-align:top">
												<xsl:if test="EntityNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityNm"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:34mm;text-align:center;vertical-align:top">
												<xsl:choose>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:30mm;text-align:left;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:35mm;text-align:center;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:29mm;text-align:right;vertical-align:top">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="MaximumProfitLossOrCapOwnPct"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 1            or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7)              and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/PartnersOwn50PctOrMoreGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 2             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 3             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 4             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 5             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and             ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 6             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and             ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &lt; 7             or ((count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7) and             ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/PartnersOwn50PctOrMoreGrp"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'REPtbl' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- Part II - Header -->
					<div style="width:187.3mm;height:5.5mm;border-style:solid; border-bottom-width:1px;        border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-top:1.5mm;        padding-bottom:1.5mm;float:left;">
						<span class="styPartName" style="height:4mm;width:11.3mm;font-size:8pt">Part II</span>
						<span style="width:176mm;font-size:8pt;height:4mm" class="styPartDesc">
							Individuals or Estates Owning 50% or More of the Partnership <span style="font-weight:normal">
							(Form 1065, Schedule B, Question 3b)</span><br/>
						</span>
					</div>
					<div class="styLNDesc" style="width:187mm;height:9mm;font-size:8pt">
					  Complete columns (i) through (iv) below for any individual or estate that owns, directly or indirectly,
					  an interest of 50% or more in the profit, loss, or capital of the partnership (see instructions). <br/><br/>
					</div>
					<!-- Part II Individuals or Estates owning 50% or more-->
					<div class="styBB" style="width:187mm;border-bottom:none">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'REPtblb' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="REPtblb">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:60mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/><br/>(i)
                                          <span class="styNormalText"> Name of Individual or Estate</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:34mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/><br/>(ii) Identifying Number<br/>(if any)
										</span>
									</th>
									<th class="styTableCellHeader" style="width:65mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText"><br/><br/>(iii)
                                          <span class="styNormalText"> Country of Citizenship (see instructions)</span>
										</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styNormalText">(iv) Maximum<br/>Percentage Owned in
                                            <br/>Profit, Loss, <br/>or Capital
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp">
									<xsl:if test="($Print != $Separated) or           (count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt;=7)">
										<tr style="font-size: 6.5pt;height:8mm">
											<td class="styTableCellText" style="width:60mm;text-align:left;vertical-align:top">
												<xsl:if test="EntityNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityNm"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:34mm;text-align:center;vertical-align:top">
												<xsl:choose>
													<xsl:when test="PartnerSSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="PartnerSSN"/>
														</xsl:call-template>
													</xsl:when>	
													<xsl:when test="PartnerEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PartnerEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:65mm;text-align:center;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CitizenCountryCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="width:29mm;text-align:right;vertical-align:top">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="MaximumProfitLossOrCapOwnPct"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 1            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and             ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 2            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 3            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 4            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 5            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 6            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &lt; 7            or ((count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7) and            ($Print = $Separated))">
									<tr style="height:8mm">
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:34mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:65mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:29mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'REPtblb' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- Page 1 Footer -->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;font-size:7pt">
						<div class="styBoldText" style="width:107mm;float:left;height:3mm;">
						  For Paperwork Reduction Act Notice, see the Instructions for Form 1065.
                                 </div>
						<div style="float:left;">Cat. No. 49842K</div>
						<div class="styBoldText" style="float:right;height:3mm;">
						     Schedule B-1 (Form 1065) (Rev. 9-2017)</div>
					</div>
					<!-- Left Over Data Table -->
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
							<xsl:with-param name="TargetNode" select="$Form1065SchB1Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table-->
					<!-- Separated Data for Part I Entities  -->
					<xsl:if test="($Print = $Separated) and        (count($Form1065SchB1Data/PartnersOwn50PctOrMoreGrp) &gt;7)">
						<br/>
						<span class="styRepeatingDataTitle">
						Form 1065 Schedule B-1, Part I Entities Owning 50% or More of the Partnership</span>
						<table class="styDepTbl" style="font-size:6.5pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle"><br/><br/>(i) Name of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle"><br/>
									     (ii) Employer Identification Number <br/>(if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle"><br/><br/>(iii) Type of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle"><br/>(iv)
									   <br/>Country of Organization</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (v) Maximum<br/>Percentage Owned<br/>in Profit, Loss, or<br/>Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB1Data/PartnersOwn50PctOrMoreGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:48mm;">
												<span style="float:left;">
													<xsl:if test="EntityNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityNm"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:30mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:30mm;">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:33mm;">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fifth Column -->
										<td class="styDepTblCell" style="text-align:right;vertical-align:top">
											<div style="width:32mm;">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumProfitLossOrCapOwnPct"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Part I, Entities owning 50% or more-->
					<!-- Separated Data for Part II, Individuals or Estates owning 50% or more  -->
					<xsl:if test="($Print = $Separated) and        (count($Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp) &gt;7)">
						<br/>
						<span class="styRepeatingDataTitle">
						  Form 1065 Schedule B-1, Part II, Individuals or Estates Owning 50% or More of the Partnership</span>
						<table class="styDepTbl" style="font-size:6.5pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle"><br/>
									  <br/>(i) Name of Individual or Estate</th>
									<th class="styDepTblCell" scope="col" valign="middle"><br/><br/>(ii) Identifying Number
									  <br/>(if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle"><br/>
									  <br/>(iii) Country of Citizenship (see instructions)</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">(iv) Maximum
									  <br/>Percentage Owned in<br/>Profit, Loss,<br/>or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB1Data/IndivOrEstOwn50PctOrMoreGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:50mm;">
												<span style="float:left;">
													<xsl:if test="EntityNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityNm"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:32mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="PartnerSSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="PartnerSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="PartnerEIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="PartnerEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:60mm;">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CitizenCountryCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:right;vertical-align:top">
											<div style="width:34mm;">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumProfitLossOrCapOwnPct"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Part II Individuals or Estates owning 50% or more -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>