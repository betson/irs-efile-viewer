<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120ScheduleUTPStyle.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleUTP"/>
	<xsl:template match="/">
		<html>
			<head>
				<!-- Set Document Title -->
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
				<!-- Set Target to Top -->
				<!-- <meta http-equiv="Window-target" content="_top" /> -->
				<!-- Set Filename and Description -->
				<meta name="Description" content="Schedule UTP (Form 1120)"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--Note: Part I and Part II table must content greater than 21 rows of data before a scroll bar will display-->
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS1120ScheduleUTPStyle"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<!-- <body onload="init();"> -->
			<body class="styBodyClass">
				<form name="Form1120ScheduleD">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- BEGIN FORM HEADER -->
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 17mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;font-size:8pt;height:17mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;font-weight:bold;">SCHEDULE UTP<br/>(Form 1120)</div>
							<div class="styAgency" style="padding-top:1.7mm;">Department of the Treasury</div>
							<div class="styAgency" style="padding-bottom:.1mm;">Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="height: 17mm;width:125mm;padding-top:1mm;border-left-width:2px;border-right-width:2px;">
							<div class="styMainTitle" style="font-weight:bold;">Uncertain Tax Position Statement</div>
							<div class="styFST" style="font-size:6pt;margin-left:3mm;font-weight:bold;">
								<div style="margin-left: 1.5mm;padding-top:4mm;">
									<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Pointer"/>
				  File with Form 1120, 1120-F, 1120-L, or 1120-PC.<br/>
									<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Pointer"/>
				  See separate instructions.<br/>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:17mm;border-left-width: 2px">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:10mm;padding-top:1mm;">20<span class="styTYColor">11</span>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- END FORM HEADER -->
					<!-- BEGIN TAXPAYER INFO -->
					<!--  Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
              Name of entity as shown on page 1 of tax return
              <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">EIN of entity</span>
							<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:0;">
							<br/>
							<div style="text-align:center;font-size:8pt;padding-bottom:0.5mm;">
                This Part I, Schedule UTP (Form 1120) is page
                <span style="width:10mm; border-bottom:1 solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                of 
                <span style="width:10mm; border-bottom:1 solid black; text-align:center">
									<!-- insert element here -->
								</span>
                Part I pages.
		      </div>
						</div>
					</div>
					<!-- END TAXPAYER INFO -->
					<!-- BEGIN PART I HEADER -->
					<div class="styIRS1120ScheduleUTP_styPartHdr" style="width:707px;height:16px;">
						<span style="float:left;clear:left;font-size:8pt;">
							<span style="width:76px;height:16px;">
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
								<span class="styIRS1120ScheduleUTP_styPartHdrTitle">Part I</span>
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
							</span>
							<span style="height:16px;">Uncertain Tax Positions for the Current Tax Year.&#160;&#160;</span>
							<span style="height:16px;font-weight:normal;">See instructions for how to complete columns (a)</span>
							<span style="height:16px;padding-left:76px;font-weight:normal;">through (g).&#160;&#160;Enter, in Part III, a description for each uncertain tax position (UTP).</span>
							<span style="height:16px;padding-top:2mm;padding-left:76px;font-weight:normal;">
					Check this box if the corporation was unable to obtain information from related parties sufficient to
				</span>
							<span style="height:16px;padding-left:76px;font-weight:normal;vertical-align: middle;">
					determine whether a tax position is a UTP (see instructions) 
				<img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Pointer"/>
							</span>
							<span style="height:16px;font-weight:normal;vertical-align:middle;padding-left:2mm;">
								<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox" name="PartICheckBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRelatedPartyInfoI"/>
									</xsl:call-template>
								</input>
							</span>
						</span>
						<div style="float:right;padding-top:16mm;padding-right:.25mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationCurrTY"/>
								<xsl:with-param name="containerHeight" select="21"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'ScheduleUTPPartITable'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END PART I HEADER -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0">
							<!-- BEGIN PART I TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:20mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(a)<br/>UTP No.</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:75mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(b)<br/>Primary IRC Section</span>
									<br/>(e.g., "61", "108", etc.)
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="2" style="width:20mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(c)<br/>Timing Codes</span>
									<br/>(check if Permanent,<br/>Temporary, or both)
        </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:25mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(d)<br/>Pass-Through<br/>Entity EIN</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:10.5mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(e)<br/>Major Tax<br/>Position</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:25mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(f)<br/>Ranking of Tax<br/>Position</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" style="width:10.5mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(g)<br/>Title TBD<br/>
									</span>
								</th>
							</tr>
							<!-- END PART I TABLE HEADER -->
							<!-- BEGIN PART I TABLE -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<xsl:if test="($Print != $Separated) or (count($FormData/ScheduleUTPInformationCurrTY) &lt;= 21) ">
								<xsl:for-each select="$FormData/ScheduleUTPInformationCurrTY">
									<tr>
										<xsl:if test="position() mod 2 = 1">
											<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
										</xsl:if>
										<!-- Begin UTP Number Column 1-->
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:center;font-size:6pt;width:14mm;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:14mm;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNumber"/>
											</xsl:call-template>
										</td>
										<!-- End UTP Number Column 1-->
										<!-- Begin Primary IRC Sections Columns(3) -->
										<xsl:variable name="UTPpositionPartI" select="position()"/>
										<xsl:if test="count(PrimaryIRCSections) = 1">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:20mm;">
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:20mm;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
										</xsl:if>
										<xsl:if test="count(PrimaryIRCSections) = 2">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
												<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
										</xsl:if>
										<xsl:if test="count(PrimaryIRCSections) = 3">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
										</xsl:if>
										<!-- End Primary IRC Sections Columns(3) -->
										<!-- Begin Timing Codes Columns(2) -->
										<xsl:choose>
											<xsl:when test="BothTimingCodes">
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="Perm" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
															<xsl:with-param name="BackupName">Permanent</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="Temp" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
															<xsl:with-param name="BackupName">Temporary</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
														</xsl:call-template>
													</input>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
														</xsl:call-template>
													</input>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<!-- End Timing Codes Columns(2) -->
										<!-- Begin Pass Through Entity EIN Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="PassThroughEntityEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReason"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Pass Through Entity EIN Column -->
										<!-- Begin Major Tax Position Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
											</xsl:if>
											<span style="width:4px;"/>
											<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
												</xsl:call-template>
											</input>
										</td>
										<!-- End Major Tax Position Column -->
										<!-- Begin Ranking of Tax Position Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
											<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;font-size:6pt;width:25mm;</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="TransferPricingTaxPostion">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferPricingTaxPostion"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxPosition"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Ranking of Tax Position Column -->
										<!-- Begin title TBD -->
										<td class="styIRS1120ScheduleUTP_styRightCell" style="text-align:center;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="($UTPpositionPartI = count($FormData/ScheduleUTPInformationCurrTY)) and (count($FormData/ScheduleUTPInformationCurrTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
											</xsl:if>
											<span style="width:4px;"/>
											<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TitleTBD"/>
												</xsl:call-template>
											</input>
										</td>
										<!-- End title TBD -->
										<!--<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table1LastCol"> </td>-->
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Depending on the number of data rows, insert blank rows to fill the container height -->
							<!-- For separated print where there are more data elements than the container height, -->
							<!-- display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($FormData/ScheduleUTPInformationCurrTY) &lt; 21">
								<xsl:call-template name="PrintBlankTable1">
									<xsl:with-param name="numRows" select="21 - count($FormData/ScheduleUTPInformationCurrTY)"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(count($FormData/ScheduleUTPInformationCurrTY) &gt; 21) and ($Print = $Separated)">
								<xsl:call-template name="PrintBlankTable1">
									<xsl:with-param name="numRows" select="21"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationCurrTY"/>
						<xsl:with-param name="containerHeight" select="21"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'ScheduleUTPPartITable'"/>
					</xsl:call-template>
					<!-- END PART I TABLE -->
					<!-- BEGIN PAGE I FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:187mm;border-top-width: 1px;">
						<span style="width:98mm;font-weight:bold;font-size:6pt;" class="styGenericDiv">
			    For Paperwork Reduction Act Notice, see the Instructions for Form 1120.
			  </span>
						<span style="width:38mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv">Cat. No. 54658Q</span>
						<span style="width:50mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule UTP (Form 1120) 2011</span>
					</div>
					<!-- END PAGE I FOOTER -->
					<!--  ********************************************************************************************************* -->
					<br class="pageend"/>
					<!--  ********************************************************************************************************* -->
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule UTP (Form 1120) 2011 </div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!--  Name -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
                Name of entity as shown on page 1 of tax return
                <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">EIN of entity</span>
							<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:0;">
							<br/>
							<div style="text-align:center;font-size:8pt;padding-bottom:0.5mm;">
                  This Part II, Schedule UTP (Form 1120) is page
                  <span style="width:10mm; border-bottom:1 solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                  of 
                  <span style="width:10mm; border-bottom:1 solid black; text-align:center">
									<!-- insert element here -->
								</span>
                  Part II pages.
		        </div>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<!-- END Page 2 Header -->
					<!-- BEGIN PART II HEADER -->
					<div class="styIRS1120ScheduleUTP_styPartHdr" style="width:707px;height:16px;">
						<span style="float:left;clear:left;font-size:8pt;">
							<span style="width:76px;height:16px;">
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
								<span class="styIRS1120ScheduleUTP_styPartHdrTitle">Part II</span>
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
							</span>
							<span style="height:16px;">Uncertain Tax Positions For Prior Tax Years.&#160;&#160;</span>
							<span style="height:16px;font-weight:normal;">See instructions for how to complete columns (a)</span>
							<span style="height:16px; padding-left:76px;font-weight:normal;">
				  through (h).&#160;&#160;Enter, in Part III, a description for each uncertain tax position (UTP).
                </span>
							<span style="padding-top:2mm;height:16px; padding-left:76px;font-weight:normal;">
				  Check this box if the corporation was unable to obtain information from related parties sufficient to 
                </span>
							<span style="height:16px; padding-left:76px;font-weight:normal;vertical-align:middle;">
				  determine whether a tax position is a UTP (see instructions)
				  <img src="{$ImagePath}/1120SchUTP_Bullet.gif" alt="Pointer"/>
							</span>
							<span style="height:16px;padding-left:2mm;font-weight:normal;vertical-align:middle;">
								<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox" name="PartIICheckBox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/UnableObtainRelatedPartyInfoII"/>
									</xsl:call-template>
								</input>
							</span>
						</span>
						<div style="float:right;padding-top:16mm;padding-right:.25mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationPriorTY"/>
								<xsl:with-param name="containerHeight" select="21"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'ScheduleUTPPartIITable'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END PART II HEADER -->
					<!-- BEGIN PART II TABLE -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartIITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0">
							<!-- BEGIN PART II TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:20mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(a)<br/>UTP No.</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="3" style="width:75mm;text-align:center;font-weight:normal;">
									<span style="font-weight:bold;">(b)<br/>Primary IRC sections</span>
									<br/>(e.g., "61", "108", etc.)
                  </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" colspan="2" style="width:20mm;text-align:center;font-weight:normal;">
									<span style="font-weight:bold;">(c)<br/>Timing Codes</span>
									<br/>(check if Permanent,<br/>Temporary, or both)
                  </th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:25mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(d)<br/>Pass-Through<br/>Entity EIN</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:10mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(e)<br/>Major Tax<br/>Position</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:15mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(f)<br/>Ranking of<br/>Tax Position</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styMiddleCell" style="width:10mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(g)<br/>Title TBD<br/>
									</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" style="width:16mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">(h)<br/>Year of<br/>Tax Position</span>
								</th>
							</tr>
							<!-- END PART II TABLE HEADER -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<!-- If the print parameter is separated, but there are fewer elements than the container height (7) -->
							<xsl:if test="($Print != $Separated) or (count($FormData/ScheduleUTPInformationPriorTY) &lt;= 21) ">
								<xsl:for-each select="$FormData/ScheduleUTPInformationPriorTY">
									<tr>
										<xsl:if test="position() mod 2 = 1">
											<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
										</xsl:if>
										<!-- Begin UTP Number Column-->
										<td class="styIRS1120ScheduleUTP_styLeftCell" style="text-align:center;width:20mm;font-size:6pt;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:20mm;font-size:6pt;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNumber"/>
											</xsl:call-template>
										</td>
										<!-- End UTP Number Column -->
										<!-- Begin Primary IRC Sections Columns(3) -->
										<xsl:variable name="UTPpositionPartII" select="position()"/>
										<xsl:if test="count(PrimaryIRCSections) = 1">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
													<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
										</xsl:if>
										<xsl:if test="count(PrimaryIRCSections) = 2">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
													<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
												</xsl:if>
												<span>&#160;</span>
											</td>
										</xsl:if>
										<xsl:if test="count(PrimaryIRCSections) = 3">
											<xsl:for-each select="PrimaryIRCSections">
												<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
													<xsl:if test="($UTPpositionPartII = count($FormData/ScheduleUTPInformationPriorTY)) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</td>
											</xsl:for-each>
										</xsl:if>
										<!-- End Primary IRC Sections Columns(3) -->
										<!-- Begin Timing Codes Columns(2) -->
										<xsl:choose>
											<xsl:when test="BothTimingCodes">
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="Perm" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
															<xsl:with-param name="BackupName">Permanent</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="Temp" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
															<xsl:with-param name="BackupName">Temporary</xsl:with-param>
														</xsl:call-template>
													</input>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
														</xsl:call-template>
													</input>
												</td>
												<td class="styIRS1120ScheduleUTP_styMiddleCell">
													<!-- If this is the last row, do not display a bottom line -->
													<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
														<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
													<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
														</xsl:call-template>
													</input>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<!-- End Timing Codes Columns(2) -->
										<!-- Begin Pass Through Entity EIN Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;width:25mm;font-size:6pt;</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="PassThroughEntityEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReason"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Pass Through Entity EIN Column -->
										<!-- Begin Administrative Practice Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
											</xsl:if>
											<span style="width:4px;"/>
											<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
												</xsl:call-template>
											</input>
										</td>
										<!-- End Administrative Practice Column -->
										<!-- Begin Maximum Tax Adjustment Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="width:15mm;font-size:6pt;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;width:15mm;font-size:6pt;</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="TransferPricingTaxPostion">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferPricingTaxPostion"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxPosition"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- End Maximum Tax Adjustment Column -->
										<!-- Begin Title TBD Column -->
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
											</xsl:if>
											<span style="width:4px;"/>
											<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TitleTBD"/>
												</xsl:call-template>
											</input>
										</td>
										<!-- End Title TBD Column -->
										<!-- Begin Tax Year Of Position Column-->
										<td class="styIRS1120ScheduleUTP_styRightCell" style="text-align:center;width:16mm;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationPriorTY) &gt;20)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;</xsl:attribute>
											</xsl:if>
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateMonthYearForYearMonthType">
													<xsl:with-param name="TargetNode" select="TaxYearOfPosition"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- End Tax Year Of Position Column-->
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table2LastCol"> </td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Depending on the number of data rows, insert blank rows to fill the container height -->
							<!-- For separated print where there are more data elements than the container height, -->
							<!-- display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($FormData/ScheduleUTPInformationPriorTY) &lt;= 21">
								<xsl:call-template name="PrintBlankTable2">
									<xsl:with-param name="numRows" select="21 - count($FormData/ScheduleUTPInformationPriorTY)"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print = $Separated) and (count($FormData/ScheduleUTPInformationPriorTY) &gt; 21)">
								<xsl:call-template name="PrintBlankTable2">
									<xsl:with-param name="numRows" select="21"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<!--Toggle button at the bottom -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationPriorTY"/>
						<xsl:with-param name="containerHeight" select="21"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'ScheduleUTPPartIITable'"/>
					</xsl:call-template>
					<!-- END PART II TABLE -->
					<!-- BEGIN PAGE II FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:707px;border-top-width: 1px;">
						<span style="width:98mm;font-weight:bold;font-size:7pt;" class="styGenericDiv"/>
						<span style="width:38mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv"/>
						<span style="width:50mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule UTP (Form 1120) 2011</span>
					</div>
					<!-- END PAGE II FOOTER -->
					<!--  ********************************************************************************************************* -->
					<br class="pageend"/>
					<!--  ********************************************************************************************************* -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Schedule UTP (Form 1120) 2011 </div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!--  Name -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:141mm;font-size:7pt;">
                Name of entity as shown on page 1 of tax return
                <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">
							<span class="BoldText">EIN of entity</span>
							<br/>
							<br/>
							<span style="width:38mm;text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;border-bottom-width:0;">
							<br/>
							<div style="text-align:center;font-size:8pt;padding-bottom:0.5mm;">
				  This Part III, Schedule UTP (Form 1120) is page
                  <span style="width:10mm; border-bottom:1 solid black; text-align:center;">
									<!-- insert element here -->
								</span>
                  of 
                  <span style="width:10mm; border-bottom:1 solid black; text-align:center">
									<!-- insert element here -->
								</span>
                  Part III pages.
		        </div>
						</div>
						<!-- Close EIN div -->
					</div>
					<!-- Close Name and EIN Div -->
					<!--  End Name and Employer indentification number  -->
					<!-- END Page 3 Header -->
					<!-- BEGIN PART III HEADER -->
					<xsl:variable name="TableIIIRowCount" select="count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY)"/>
					<div class="styIRS1120ScheduleUTP_styPartHdr" style="width:707px;height:16px;">
						<span style="float:left;clear:left;">
							<span style="width:76px;">
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
								<span class="styIRS1120ScheduleUTP_styPartHdrTitle">Part III</span>
								<span class="styIRS1120ScheduleUTP_styPartHdrSpanner"/>
							</span>
							<span style="height:13px;">Concise Descriptions of UTPs.&#160;&#160;</span>
							<span style="height:13px;font-weight:normal;">Indicate the corresponding UTP number from Part I, column (a). </span>
							<span style="height:13px; padding-left:76px;font-weight:normal;">Use as many Part III pages as necessary (see instructions).</span>
						</span>
						<div style="float:right;padding-top:5mm;padding-right:.25mm;">
							<!-- Determine whether or not to display the vertical scroll bar.-->
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$TableIIIRowCount"/>
								<xsl:with-param name="containerHeight" select="49"/>
								<xsl:with-param name="containerID" select=" 'ScheduleUTPPartIIITable' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END PART III HEADER -->
					<!-- BEGIN PART III TABLE -->
					<div class="styIRS1120ScheduleUTP_styTableContainer" id="ScheduleUTPPartIIITable">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS1120ScheduleUTP_styTable" cellspacing="0">
							<!-- BEGIN PART III TABLE HEADER -->
							<tr>
								<th class="styIRS1120ScheduleUTP_styLeftCell" style="width:25mm;text-align:center;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">UTP<br/>No.</span>
								</th>
								<th class="styIRS1120ScheduleUTP_styRightCell" style="text-align:left;padding-left:2mm;font-weight:normal;" scope="col">
									<span style="font-weight:bold;">Concise Description of Uncertain Tax Position</span>
								</th>
							</tr>
							<!-- END PART III TABLE HEADER -->
							<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
							<xsl:if test="($Print != $Separated) or (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &lt;= 49) ">
								<xsl:for-each select="$FormData/ScheduleUTPInformationCurrTY">
									<tr>
										<!-- Begin UTP Number Column-->
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:center;vertical-align:top;width:25mm;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &gt;48) and (count($FormData/ScheduleUTPInformationPriorTY) = 0)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;vertical-align:top;width:25mm;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNumber"/>
											</xsl:call-template>
										</td>
										<!-- End UTP Number Column -->
										<!-- Begin Concise Description Of UTPs Column -->
										<td class="styIRS1120ScheduleUTP_styRightCell">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &gt;48) and (count($FormData/ScheduleUTPInformationPriorTY) = 0)">
												<xsl:attribute name="style">border-bottom-width:0px;vertical-align:top;</xsl:attribute>
											</xsl:if>
											<span style="float:left;padding-left:2mm;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConciseDescriptionOfUTPs"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- End Concise Description Of UTPs Column -->
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table3LastCol"> </td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &lt;= 49) ">
								<xsl:for-each select="$FormData/ScheduleUTPInformationPriorTY">
									<tr>
										<td class="styIRS1120ScheduleUTP_styLeftCell" scope="row" style="text-align:center;vertical-align:top;width:25mm;">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &gt;48)">
												<xsl:attribute name="style">border-bottom-width:0px;text-align:center;vertical-align:top;width:25mm;</xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="UTPNumber"/>
											</xsl:call-template>
										</td>
										<td class="styIRS1120ScheduleUTP_styRightCell">
											<!-- If this is the last row, do not display a bottom line -->
											<xsl:if test="(position() = last()) and (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &gt;48)">
												<xsl:attribute name="style">border-bottom-width:0px;vertical-align:top;</xsl:attribute>
											</xsl:if>
											<span style="float:left;padding-left:2mm;font-size:7pt;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConciseDescriptionOfUTPs"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styTableLastCol" id="Table3LastCol"/>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="($Print = $Separated) and (count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &gt; 49)">
								<xsl:call-template name="PrintBlankTable3">
									<xsl:with-param name="numRows" select="49"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="(count($FormData/ScheduleUTPInformationCurrTY) + count($FormData/ScheduleUTPInformationPriorTY) &lt; 49) ">
								<xsl:call-template name="PrintBlankTable3">
									<xsl:with-param name="numRows" select="49 - (count($FormData/ScheduleUTPInformationCurrTY) +
		 count($FormData/ScheduleUTPInformationPriorTY))"/>
								</xsl:call-template>
							</xsl:if>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$TableIIIRowCount"/>
						<xsl:with-param name="containerHeight" select="49"/>
						<xsl:with-param name="containerID" select=" 'ScheduleUTPPartIIITable' "/>
					</xsl:call-template>
					<!-- END PART III TABLE -->
					<!-- BEGIN PART III FOOTER -->
					<div class="styIRS1120ScheduleUTP_styFormFooter" style="width:707px;border-top-width: 1px;">
						<span style="width:98mm;font-weight:bold;font-size:7pt;" class="styGenericDiv"/>
						<span style="width:38mm;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv"/>
						<span style="width:50mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv">Schedule D (Form 1120) 2011</span>
					</div>
					<!-- END PART III FOOTER -->
				</form>
				<!--  ********************************************************************************************************* -->
				<br class="pageend"/>
				<!--  ********************************************************************************************************* -->
				<!-- leftover data table -->
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
				</table>
				<!-- Additonal Data Table for Part I -->
				<xsl:if test="($Print = $Separated) and (count($FormData/ScheduleUTPInformationCurrTY) &gt; 21)">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>Form 1120 Schedule UTP, Part I, Uncertain Tax Positions for the Current Tax Year.
              </span>
					<table class="styDepTbl" style="font-size:6pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col">(a)<br/>UTP No.</th>
								<th class="styDepTblCell" colspan="3" style="width:75mm;vertical-align: middle;" scope="col">(b)<br/>Primary IRC Section
					  <br/>
									<span style="font-weight:normal;">(e.g., "61", "108", etc.)</span>
								</th>
								<th class="styDepTblCell" colspan="2" style="width:20mm;vertical-align: middle;" scope="col">(c)<br/>Timing Codes
					  <span style="font-weight:normal;">(check if Permanent, Temporary, or both)</span>
								</th>
								<th class="styDepTblCell" style="width:25mm;vertical-align: middle;" scope="col">(d)<br/>Pass-Through Entity EIN</th>
								<th class="styDepTblCell" style="width:10.5mm;vertical-align: middle;" scope="col">(e)<br/>Major Tax Position</th>
								<th class="styDepTblCell" style="width:25mm;vertical-align: middle;" scope="col">(f)<br/>Ranking of Tax Position</th>
								<th class="styDepTblCell" style="width:10.5mm;vertical-align: middle;" scope="col">(g)<br/>Title TBD</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/ScheduleUTPInformationCurrTY">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:center;width:20mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="UTPNumber"/>
										</xsl:call-template>
									</td>
									<xsl:if test="count(PrimaryIRCSections) = 1">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:20mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(PrimaryIRCSections) = 2">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
												<!-- If this is the last row, do not display a bottom line -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(PrimaryIRCSections) = 3">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;font-size:6pt;width:25mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="BothTimingCodes">
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<!--<span style="width:4px;"/>-->
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
													</xsl:call-template>
												</input>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<!--<span style="width:4px;"/>-->
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
													</xsl:call-template>
												</input>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
													</xsl:call-template>
												</input>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
													</xsl:call-template>
												</input>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styDepTblCell" style="text-align:middle;width:25mm;">
										<xsl:choose>
											<xsl:when test="PassThroughEntityEIN">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReason"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell">
										<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
											</xsl:call-template>
										</input>
									</td>
									<td class="styDepTblCell" style="text-align:center;width:25mm;">
										<xsl:choose>
											<xsl:when test="TransferPricingTaxPostion">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TransferPricingTaxPostion"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherTaxPosition"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell">
										<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="TitleTBD"/>
											</xsl:call-template>
										</input>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part I separated data -->
				<!-- Additonal Data Table for Part II-->
				<xsl:if test="($Print = $Separated) and (count($FormData/ScheduleUTPInformationPriorTY) &gt; 21)">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>
                Form 1120 Schedule UTP, Part II, Uncertain Tax Positions For Prior Tax Years.
              </span>
					<table class="styDepTbl" style="font-size:6pt">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:20mm;vertical-align: middle;" scope="col">(a)<br/>UTP No.</th>
								<th class="styDepTblCell" colspan="3" style="width:75mm;vertical-align: middle;" scope="col">(b)<br/>Primary IRC sections 
					  <span style="font-weight:normal;">(e.g., "61", "108", etc.)</span>
								</th>
								<th class="styDepTblCell" colspan="2" style="width:20mm;vertical-align: middle;" scope="col">(c)<br/>Timing Codes
					  <span style="font-weight:normal;">(check if Permanent, Temporary, or both)</span>
								</th>
								<th class="styDepTblCell" style="width:25mm;vertical-align: middle;" scope="col">(d)<br/>Pass-Through Entity EIN</th>
								<th class="styDepTblCell" style="width:10mm;vertical-align: middle;" scope="col">(e)<br/>MajorTax Position</th>
								<th class="styDepTblCell" style="width:15mm;vertical-align: middle;" scope="col">(f)<br/>Ranking of Tax Position</th>
								<th class="styDepTblCell" style="width:10mm;vertical-align: middle;" scope="col">(e)<br/>Title TBD</th>
								<th class="styDepTblCell" style="width:16mm;vertical-align: middle;" scope="col">(g)<br/>Year of Tax Position</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/ScheduleUTPInformationPriorTY">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:center;width:20mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="UTPNumber"/>
										</xsl:call-template>
									</td>
									<xsl:if test="count(PrimaryIRCSections) = 1">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(PrimaryIRCSections) = 2">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
										<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
											<span>&#160;</span>
										</td>
									</xsl:if>
									<xsl:if test="count(PrimaryIRCSections) = 3">
										<xsl:for-each select="PrimaryIRCSections">
											<td class="styIRS1120ScheduleUTP_styMiddleCell" style="text-align:center;width:25mm;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
										</xsl:for-each>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="BothTimingCodes">
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<span style="width:4px;"/>
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
													</xsl:call-template>
												</input>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<span style="width:4px;"/>
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="BothTimingCodes"/>
													</xsl:call-template>
												</input>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<span style="width:4px;"/>
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
													</xsl:call-template>
												</input>
											</td>
											<td class="styIRS1120ScheduleUTP_styMiddleCell">
												<span style="width:4px;"/>
												<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
													</xsl:call-template>
												</input>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styDepTblCell" style="text-align:center;width:25mm;">
										<xsl:choose>
											<xsl:when test="PassThroughEntityEIN">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="PassThroughEntityEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReason"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell">
										<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
											</xsl:call-template>
										</input>
									</td>
									<td class="styDepTblCell" style="width:15mm;">
										<xsl:choose>
											<xsl:when test="TransferPricingTaxPostion">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferPricingTaxPostion"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherTaxPosition"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell">
										<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="TileTBD"/>
											</xsl:call-template>
										</input>
									</td>
									<td class="styDepTblCell">
										<xsl:call-template name="PopulateMonthYearForYearMonthType">
											<xsl:with-param name="TargetNode" select="TaxYearOfPosition"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part II separated data -->
				<!-- Additonal Data Table for Part III-->
				<xsl:if test="($Print = $Separated) and ( count($FormData/ScheduleUTPInformationPriorTY) + count($FormData/ScheduleUTPInformationCurrTY)) &gt; 49">
					<br/>
					<span class="styRepeatingDataTitle">
						<br/>
                Form 1120 Schedule UTP, Part III, Concise Descriptions of UTPs.
              </span>
					<table class="styDepTbl" style="font-size:7pt;">
						<thead class="styTableHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" style="width:25mm;vertical-align: middle;" scope="col">UTP<br/>No.</th>
								<th class="styDepTblCell" style="vertical-align: middle;" scope="col">Concise Description of Uncertain Tax Position</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/ScheduleUTPInformationCurrTY">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:center;width:25mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="UTPNumber"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConciseDescriptionOfUTPs"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="$FormData/ScheduleUTPInformationPriorTY">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="(count($FormData/ScheduleUTPInformationCurrTY) + position()) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="UTPNumber"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ConciseDescriptionOfUTPs"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
				</xsl:if>
				<!-- End Part III -->
			</body>
		</html>
	</xsl:template>
	<xsl:template name="PrintBlankTable1">
		<xsl:param name="numRows" select="21 - count($FormData/ScheduleUTPInformationCurrTY)"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styLeftCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="($numRows = 21) and ($Print = $Separated) and (count($FormData/ScheduleUTPInformationCurrTY) &gt; 21)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationCurrTY"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<span style="width: 4px"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TitleTBD"/>
						</xsl:call-template>
					</input>
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable1">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PrintBlankTable2">
		<xsl:param name="numRows" select="21 - count($FormData/ScheduleUTPInformationPriorTY)"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<xsl:if test="($numRows mod 2 = 1) and ($numRows != 1)">
					<xsl:attribute name="style">background-color:lightgrey;</xsl:attribute>
				</xsl:if>
				<td class="styIRS1120ScheduleUTP_styLeftCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="($numRows = 21) and ($Print = $Separated) and (count($FormData/ScheduleUTPInformationPriorTY) &gt; 21)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationPriorTY"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<span style="width: 4px"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PermanentTimingCode"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TemporaryTimingCode"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="MajorTaxPosition"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
				<td class="styIRS1120ScheduleUTP_styMiddleCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
					<input alt="alt" type="checkbox" class="styIRS1120ScheduleUTP_styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TitleTBD"/>
						</xsl:call-template>
					</input>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">background-color:lightgrey;border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable2">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PrintBlankTable3">
		<xsl:param name="numRows" select="49- (count($FormData/ScheduleUTPInformationCurrTY) +
		 count($FormData/ScheduleUTPInformationPriorTY))"/>
		<xsl:if test="$numRows &gt; 0">
			<tr>
				<td class="styIRS1120ScheduleUTP_styLeftCell">
					<xsl:choose>
						<xsl:when test="($numRows = 49) and ($Print = $Separated) and (count($FormData/ScheduleUTPInformationCurrTY) +
		 count($FormData/ScheduleUTPInformationPriorTY) &gt; 49)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/ScheduleUTPInformationCurrTY"/>
								<xsl:with-param name="ShortMessage" select=" 'true' "/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$numRows = 1">
								<xsl:attribute name="style">border-bottom-width: 0px;</xsl:attribute>
							</xsl:if>
							<span style="width: 4px;"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="styIRS1120ScheduleUTP_styRightCell">
					<xsl:if test="$numRows = 1">
						<xsl:attribute name="style">border-bottom-width: 0px;</xsl:attribute>
					</xsl:if>
					<span style="width: 4px"/>
				</td>
			</tr>
			<xsl:call-template name="PrintBlankTable3">
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
