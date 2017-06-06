<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471ScheduleOStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5471ScheduleO" select="$RtnDoc/IRS5471ScheduleO"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5471ScheduleO)"/>
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
				<meta name="Description" content="IRS Form 5471 Schedule O"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleOStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form5471_ScheduleO">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;border-right-width:2px;">
							<div style="height:20mm">
								<span class="styIRS5471ScheduleOScheduleFN">Schedule O<br/>(Form 5471)</span>
								<span style="width:2px;"/>
								<br/>
								<div style="height:4mm;">(Rev. December 2012)</div>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5471ScheduleO"/>
								</xsl:call-template>
								<br/>
							</div>
							<div style="height:8mm;padding-top:4px;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<div class="styMainTitle" style="height:18mm;">
								Organization or Reorganization of Foreign <br/>Corporation, and Acquisitions
								and <br/>Dispositions of its Stock
							</div>
							<div class="styFBT" style="height:5mm;font-size:6pt;padding-top:2mm;">
								Information about Schedule O (Form 5471) and its instructions is at 
								<a href="http://www.irs.gov/form5471" title="Link to irs.gov">	<i>www.irs.gov/form5471 </i>	</a>
								<span style="width:80mm;">
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
									Attach to Form 5471.
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-bottom-width:0px;border-left-width:2px;">
							<div class="styOMB" style="height:28mm; border-bottom: 0px;padding-top:12mm;">OMB No. 1545-0704</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:142mm;height:11mm;font-size:7pt;">
							Name of person filing Form 5471<br/>
							<span style="padding-top:1mm;">
							<!-- Start choise of name from header or data elements for shared file/1040/1120  -->
								<xsl:if test="$Form5471ScheduleO/PersonNm!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/PersonNm"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5471ScheduleO/BusinessName/BusinessNameLine1Txt!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5471ScheduleO/PersonNm=''">
									<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
											<br/>
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
								</xsl:if>
								<xsl:if test="$Form5471ScheduleO/BusinessName=''">
									<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Name</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</span>
						</div>
						<!--  End choise of name from header or data elements for shared file 1040/1120  -->
						<!-- EIN LIne choice from input and Return header 1120 or 1040   -->
						<div class="styINBox" style="float:left;clear:none;padding-left:1mm;width:43mm;height:11mm;">
							<span class="styBoldText">Identifying number<br/>
							</span>
							<br/>
							<br/>
							<span style="font-weight: normal;padding-top:1mm;">
								<xsl:choose>
									<xsl:when test="$Form5471ScheduleO/FilerSSN != '' ">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/FilerSSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5471ScheduleO/FilerEIN != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/FilerEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5471ScheduleO/MissingSSNEINReasonCd != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/MissingSSNEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$RtnHdrData/Filer/SSN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">SSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$RtnHdrData/Filer/EIN">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">EIN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">MissingEINReasonCd</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:115mm;height:11mm;font-size:7pt;">
							Name of foreign corporation<br/>
							<span style="padding-top:1mm;">
								<!-- Start choise of name from header or data elements for shared file/1040/1120  -->
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ForeignCorporationName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ForeignCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</span>
						</div>
						<!--  End choise of name from header or data elements for shared file 1040/1120  -->
						<!-- EIN LIne choice from input and Return header 1120 or 1040   -->
						<div class="styNameBox" style="float:left;clear:none;padding-left:1mm;width:27mm;height:11mm;border-right-width:1px;border-color:black">
							EIN (if any)<br/>
							<br/>
							<br/>
							<span style="font-size:7pt;">
								<xsl:if test="$Form5471ScheduleO/ForeignCorporationEIN!=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ForeignCorporationEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5471ScheduleO/MissingEINReasonCd">
									<br/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="styNameBox" style="float:left;clear:none;padding-left:1mm;width:45mm;height:11mm;border-right-width:0px;border-color:black;">
							<span>
								Reference ID number (see instructions) <br/>
								<span style="font-size:7pt;padding-top:2mm;">
									<xsl:choose>
										<xsl:when test="(count($Form5471ScheduleO/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) = 1)">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="(count($Form5471ScheduleO/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt;1)">
											<br/>See Additional Table
										</xsl:when>
										<!--   End EIN SSN for shared form 1120/1040  -->
										<xsl:when test="$Form5471ScheduleO/MissingSSNEINReasonCd">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
													<xsl:call-template name="PopulateReturnHeaderFiler">
														<xsl:with-param name="TargetNode">EIN</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:8pt;padding-top:2mm;padding-bottom:2mm;">
						<span class="styBoldText">Important:</span>
						<span style="width:4px;"/>
						<span class="styItalicText">Complete a
        <span style="font-weight:bold;">separate</span> Schedule O for each foreign corporation
        for which information must be reported</span>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styTitleName" style="height:4mm;">Part I</div>
						<div class="styTitleDesc" style="width:159.8mm;height:4mm;">To Be Completed by U.S. Officers and Directors</div>
						<div class="styGenericDiv" style="width:3.2mm;height:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'USODctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USODctn" style="border-right:0px;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:58mm;" scope="col">(a)<br/>
										<span class="styNormalText">Name of shareholder for whom <br/>acquisition information is reported</span>
									</th>
									<th class="styTableCellHeader" style="width:58mm;" scope="col">(b)<br/>
										<span class="styNormalText">Address of shareholder</span>
									</th>
									<th class="styTableCellHeader" style="width:30mm;" scope="col">(c)<br/>
										<span class="styNormalText">Identifying number of shareholder</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">(d)<br/>
										<span class="styNormalText">Date of original<br/> 10% acquisition</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" style="width:20mm;" scope="col">(e)<br/>
										<span class="styNormalText">Date of additional<br/> 10% acquisition</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (4), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &lt;=4)">
										<tr style="font-size: 7pt;">
											<td class="styTableCellText" style="width:58mm;">
												<xsl:if test="ShareholderPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ShareholderBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</td>
											<xsl:choose>
												<xsl:when test="ShareholderUSAddress">
													<td class="styTableCellText" style="width:58mm;">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="ShareholderUSAddress"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="width:58mm;">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ShareholderForeignAddress"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCellText" style="width:30mm;text-align:center;">
												<span style="width:4px"/>
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="width:20mm;text-align:center;padding-left:1.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Original10PercentAcquisitionDt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;text-align:center;padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Addnl10PercentAcquisitionDt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt;4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt;4) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt;4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &lt; 3 or ((count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt;4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- JMI: added: or.... -->
								<xsl:if test="count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &lt; 4 or ((count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt;4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'USODctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div style="width:187mm;">
						<div class="styTitleName">Part II</div>
						<div class="styTitleDesc">To Be Completed by U.S. Shareholders</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;font-size:8pt;padding-left:27mm;">
							<span>
								<b>Note:</b>
								<i> If this return is required because one or more
          shareholders became U.S. persons, attach a list showing the names of such
          persons and the date each became a U.S. person.</i>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle">Section A&#8212;General Shareholder Information</div>
						<div class="styGenericDiv" style="width:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/GeneralShareholderInfoGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2Actn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div style="clear:both;">
						<div class="styTableContainer" id="USSP2Actn">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:130mm;" rowspan="2" scope="col">(a)<br/>
											<span class="styNormalText">Name, address, and identifying number of<br/> shareholder(s) filing this schedule</span>
										</th>
										<th class="styTableCellHeader" style="width:95mm;" colspan="3" scope="col">(b)<br/>
											<span class="styNormalText">For shareholders latest U.S. income tax return filed, indicate:</span>
										</th>
										<th class="styIRS5471ScheduleOTableCellHeader" style="width:25mm;" rowspan="2" scope="col">(c)<br/>
											<span class="styNormalText">Date (if any) shareholder last filed information return under section 6046 for the foreign corporation</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" style="width:20mm;" scope="col">(1)<br/>
											<span class="styNormalText">Type of return (enter form number)</span>
										</th>
										<th class="styTableCellHeader" style="width:25mm; padding-left: 4mm" scope="col">(2)<br/>
											<span class="styNormalText">Date return filed</span>
										</th>
										<th class="styTableCellHeader" style="width:20mm;" scope="col">(3)<br/>
											<span class="styNormalText">Internal Revenue Service Center where filed</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form5471ScheduleO/GeneralShareholderInfoGrp">
										<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
										<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/GeneralShareholderInfoGrp) &lt;=3)">
											<tr style="font-size: 7pt;">
												<td class="styTableCellText" style="width:130mm; padding-top=4mm; padding-bottom=4mm">
													<xsl:if test="ShareholderPersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ShareholderBusinessName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:if>
													<br/>
													<xsl:choose>
														<xsl:when test="ShareholderUSAddress">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="ShareholderUSAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ShareholderForeignAddress"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
													<xsl:choose>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellText" style="width:20mm;">
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ReturnTypeCd"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtr" style="width:25mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ReturnFiledDt"/>
													</xsl:call-template>
													<span style="width:4px"/>
												</td>
												<td class="styTableCellText" style="width:20mm;">
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ServiceCenterWhereRetFiledCd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LastFiledReturnUnderSect6046Dt"/>
													</xsl:call-template>
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- Table Filler Rows -->
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/GeneralShareholderInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/GeneralShareholderInfoGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:130mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<xsl:if test="((count($Form5471ScheduleO/GeneralShareholderInfoGrp) &gt;3) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/GeneralShareholderInfoGrp"/>
													</xsl:call-template>
												</xsl:if>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width25mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/GeneralShareholderInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/GeneralShareholderInfoGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:130mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/GeneralShareholderInfoGrp) &lt; 3 or ((count($Form5471ScheduleO/GeneralShareholderInfoGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:130mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/GeneralShareholderInfoGrp"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2Actn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm; float:none;clear:both;">
						<div class="styIRS5471ScheduleOSectionTitle">Section B&#8212;U.S. Persons Who Are Officers or Directors of the Foreign Corporation</div>
						<div class="styGenericDiv" style="width:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2Bctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div style="clear:both;">
						<div class="styTableContainer" id="USSP2Bctn">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:67mm;" rowspan="2" scope="col">(a)<br/>
											<span class="styNormalText">Name of U.S. officer or director</span>
										</th>
										<th class="styTableCellHeader" style="width:67mm;" rowspan="2" scope="col">(b)<br/>
											<span class="styNormalText">Address</span>
										</th>
										<th class="styTableCellHeader" style="width:31mm;" rowspan="2" scope="col">(c)<br/>
											<span class="styNormalText">Social Security Number</span>
										</th>
										<th class="styIRS5471ScheduleOTableCellHeader" style="width:22mm;" colspan="2" scope="col">(d)<br/>
											<span class="styNormalText">Check appropriate <br/>box(es)</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" style="width:11mm;" scope="col">
											<span class="styNormalText">Officer</span>
										</th>
										<th class="styIRS5471ScheduleOTableCellHeader" style="width:11mm;" scope="col">
											<span class="styNormalText">Director</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp">
										<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
										<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &lt;=3)">
											<tr style="font-size: 7pt;">
												<td class="styTableCellText" style="width:67mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OfficerOrDirectorPersonNm"/>
													</xsl:call-template>
													<br/>
													<xsl:if test="OfficerOrDirector2PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OfficerOrDirector2PersonNm"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:67mm;">
													<xsl:choose>
														<xsl:when test="USAddress">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="USAddress"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellText" style="width:31mm;text-align:center;">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtr" style="width:11mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OfficerInd"/>
													</xsl:call-template>
												</td>
												<td class="styIRS5471ScheduleOTableCellCtr" style="width:11mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectorInd"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &lt; 1 or ((count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px;"/>
												<xsl:if test="((count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &lt; 2  or ((count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI -->
									<xsl:if test="count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &lt; 3  or ((count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:67mm;">
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
												<br/>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellText" style="width:33mm;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:10mm;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2Bctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle">Section C&#8212;Acquisition of Stock</div>
						<div class="styGenericDiv" style="width:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'USSP2C1ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2C1ctn" style="height:auto">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:45mm;" rowspan="2">(a)<br/>
										<span class="styNormalText">Name of shareholder(s) filing this schedule</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(b)<br/>
										<span class="styNormalText">Class of stock acquired</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(c)<br/>
										<span class="styNormalText">Date of acquisition</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(d)<br/>
										<span class="styNormalText">Method of acquisition</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:75mm;" colspan="3">(e)<br/>
										<span class="styNormalText">Number of shares acquired</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(1)<br/>
										<span class="styNormalText">Directly</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(2)<br/>
										<span class="styNormalText">Indirectly</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(3)<br/>
										<span class="styNormalText">Constructively</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCellText" style="width:45mm;">
												<xsl:if test="ShareholderPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ShareholderBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</td>
											<td class="styTableCellTextSmall">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StockClassDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:25mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquisitionDt"/>
												</xsl:call-template>
												<span style="width:4px;"/>
											</td>
											<td class="styTableCellTextSmall">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AcquisitionMethodDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesAcquiredDirectlyCnt"/>
												</xsl:call-template>
												<span style="width:4px;"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesAcquiredIndirectlyCnt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesAcqConstructivelyCnt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 3 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'USSP2C1ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<div class="styGenericDiv" style="width:105mm;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions for Form 5471.</span>
						</div>
						<div class="styGenericDiv" style="width:25mm;">Cat. No. 61200O</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText">Schedule O (Form 5471)</span> (Rev. 12-2012)</div>
					</div>
					<!-- header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
						<div style="width:55mm;text-align:left;" class="styGenericDiv">Schedule O (Form 5471) (Rev. 12-2012)</div>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div class="styIRS5471ScheduleOSectionTitle"/>
						<div class="styGenericDiv" style="width:4mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2C2ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2C2ctn" style="height:auto">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" cellpadding="0" border="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:45mm;">(f)<br/>
										<span class="styNormalText">Amount paid or value given</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:142mm;">(g)<br/>
										<span class="styNormalText">Name and address of person from whom shares were acquired</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCell" style="width:45mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PaidOrValueGivenAmt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
												<xsl:if test="SharesAcquiredPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesAcquiredPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="SharesAcquiredBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesAcquiredBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="SharesAcquiredBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SharesAcquiredBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="SharesAcquiredUSAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="SharesAcquiredUSAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="SharesAcquiredForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm; text-align:left">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows :JMI-->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2C2ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle" style="height:8mm;padding-top:2mm;">Section D&#8212;Disposition of Stock</div>
						<div class="styGenericDiv" style="width:4mm;height:8mm;padding-top:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2Dctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2Dctn" style="height:auto;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:45mm;" rowspan="2">(a)<br/>
										<span class="styNormalText">Name of shareholder disposing of stock</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(b)<br/>
										<span class="styNormalText">Class of stock</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(c)<br/>
										<span class="styNormalText">Date of disposition</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;" rowspan="2">(d)<br/>
										<span class="styNormalText">Method of disposition</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:75mm;" colspan="3">(e)<br/>
										<span class="styNormalText">Number of shares disposed of</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(1)<br/>
										<span class="styNormalText">Directly</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(2)<br/>
										<span class="styNormalText">Indirectly</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:25mm;border-top-width:1px">(3)<br/>
										<span class="styNormalText">Constructively</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCellText" style="width:45mm;">
												<xsl:if test="ShrDisposingStockPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShrDisposingStockPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ShrDisposingStockBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShrDisposingStockBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="ShrDisposingStockBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShrDisposingStockBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</td>
											<td class="styTableCellTextSmall">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="StockClassDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:25mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DispositionDt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellTextSmall">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DispositionMethodDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesDisposedDirectlyCnt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesDisposedIndirectlyCnt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellSmall">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="SharesDisposConstructivelyCnt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;text-align: left">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 3 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:16mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellSmall">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'USSP2Dctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle"/>
						<div class="styGenericDiv" style="width:4mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2D2ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2D2ctn" style="height:auto">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" cellpadding="0" border="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:45mm;">(f)<br/>
										<span class="styNormalText">Amount received</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:141mm;">(g)<br/>
										<span class="styNormalText">Name and address of person to whom disposition of stock was made</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCell" style="width:45mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ReceivedAmt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
												<xsl:if test="SharesDispositionPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesDispositionPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="SharesDispositionBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesDispositionBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="SharesDispositionBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SharesDispositionBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 1 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;text-align:left">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px;"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 2 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &lt; 3 or ((count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellText" style="width:142mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2D2ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle" style="height:8mm;padding-top:2mm;">Section E&#8212;Organization or Reorganization of Foreign Corporation</div>
						<div class="styGenericDiv" style="width:4mm;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2E1ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2E1ctn" style="height:51mm">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:134mm;">(a)<br/>
										<span class="styNormalText">Name and address of transferor</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;">(b)<br/>
										<span class="styNormalText">Identifying number (if any)</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" style="width:20mm; padding-left: 4mm">(c)<br/>
										<span class="styNormalText">Date of transfer</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCellText" style="width:134mm;">
												<xsl:if test="TransferorPersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferorPersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="TransferorBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferorBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="TransferorBusinessName/BusinessNameLine2Txt">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TransferorBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="TransferorUSAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="TransferorUSAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="TransferorForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="width:33mm;">
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styIRS5471ScheduleOTableCellCtr" style="width:20mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferDt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 1 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:134mm;">
											<span style="width:4px"/>
											<br/>
											<xsl:choose>
												<xsl:when test="((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
													<span style="width:4px"/>
													<br/>
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:4px"/>
													<br/>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 2 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:134mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 3 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellText" style="width:134mm;">
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
											<br/>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCellCtr" style="width:30mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2E1ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471ScheduleOSectionTitle"/>
						<div class="styGenericDiv" style="width:4mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'USSP2E2ctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="USSP2E2ctn" style="height:23mm">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" cellpadding="0" border="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" colspan="3" style="width:134mm;">(d)<br/>
										<span class="styNormalText">Assets transferred to foreign corporation</span>
									</th>
									<th class="styIRS5471ScheduleOTableCellHeader" scope="col" rowspan="2" style="width:53mm;">(e)<br/>
										<span class="styNormalText">Description of assets transferred by, or notes or securities issued by, foreign corporation</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:45mm;">(1)<br/>
										<span class="styNormalText">Description of assets</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;">(2)<br/>
										<span class="styNormalText">Fair market value</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;">(3)<br/>
										<span class="styNormalText">Adjusted basis (if transferor was U.S. person)</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp">
									<!-- JMI: If the print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt;=3)">
										<tr style="font-size: 7pt;">
											<td class="styTableCellText" style="width:45mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AssetDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:44mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styTableCell" style="width:45mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
												</xsl:call-template>
												<span style="width:4px"/>
											</td>
											<td class="styIRS5471ScheduleOTableCellText" style="width:53mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AssetsTransferredNotesSecDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 1 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm; text-align:left">
											<span style="width:4px"/>
											<xsl:if test="((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCell" style="width:44mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCell" style="width:53mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 2 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:44mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCell" style="width:53mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Table Filler Rows:JMI -->
								<xsl:if test="count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &lt; 3 or ((count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt;3) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:44mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:45mm;">
											<span style="width:4px"/>
										</td>
										<td class="styIRS5471ScheduleOTableCell" style="width:53mm;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'USSP2E2ctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!--Section F Table-->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td class="styIRS5471ScheduleOSectionTitle" style="width:187mm;height:8mm;border-bottom:1px solid black;padding-top:2mm;">
								Section F&#8212;Additional Information</td>
						</tr>
						<tr>
							<td class="styBB" style="width:187mm;font-size:7pt;">
								<span class="styBoldText">(a)</span> If the foreign corporation or a predecessor U.S. corporation
        filed (or joined with a consolidated group in filing) a U.S. income tax return for any of the
        last 3 years, attach a statement indicating the year for which a return was filed (and, if
        applicable, the name of the corporation filing the consolidated return), the taxable income
        or loss, and the U.S. income tax paid (after all credits).
      </td>
						</tr>
						<tr>
							<td class="styBB" style="width:187mm;font-size:7pt;">
								<span class="styBoldText">(b)</span> List the date of any reorganization of the foreign corporation
        that occured during the last 4 years while any U.S. person held 10% or more in value or vote
        (directly or indirectly) of the corporation's stock <img src="{$ImagePath}/5471SchO_Bullet.gif" alt="bullet"/>
								<span style="width:4px"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5471ScheduleO/ReorganizationDt"/>
								</xsl:call-template>
							</td>
						</tr>
						<br/>
						<tr>
							<td class="styBB" style="width:187mm;font-size:7pt;">
								<span class="styBoldText">(c)</span> If the foreign corporation is a member of a group constituting
        a chain of ownership, attach a chart, for each unit of which a shareholder owns 10% or more in
        value or voting power of the outstanding stock. The chart must indicate the corporation's position
        in the chain of ownership and the percentages of stock ownership (see instructions for an example).
         </td>
						</tr>
					</table>
					<!--Begin Footer-->
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:187mm;padding-top:1mm;text-align:right;">
								<span class="styBoldText" >Schedule O (Form 5471)</span> (Rev. 12-2012)</div>
					</div>
					<p>
						<div  class="pageEnd"/>
					</p>
					<!--End Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5471ScheduleO"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- JMI: Additional Data Table-->
					<xsl:if test="(count($Form5471ScheduleO/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						<span style="padding-left:1mm;font-size:9pt">
							<b>Reference ID number (see instructions):</b>
						</span>
						<br/>
						<!--Special Condition Description -->
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">

Special Condition Description</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ForeignEntityIdentificationGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:179mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part I -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp) &gt; 4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part I &#8212; To Be Completed by U.S. Officers and Directors:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col">
										<br/>(a) <br/>Name of shareholder for whom acquisition information is reported</th>
									<th class="styDepTblCell" scope="col">
										<br/>(b) <br/>Address of shareholder</th>
									<th class="styDepTblCell" scope="col">
										<br/>(c)<br/>Identifying number of shareholder</th>
									<th class="styDepTblCell" scope="col">
										<br/>(d) <br/>Date of original 10% acquisition</th>
									<th class="styDepTblCell" scope="col">
										<br/>(e) <br/>Date of additional 10% acquisition</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShrInfoUSOfficerDirInfoGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:58mm;">
											<span style="width:4px"/>
											<xsl:if test="ShareholderPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ShareholderBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</td>
										<xsl:choose>
											<xsl:when test="ShareholderUSAddress">
												<td class="styTableCellText" style="width:58mm;">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="ShareholderUSAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="width:58mm;">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ShareholderForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCellText" style="width:30mm; text-align:center">
											<span style="width:4px"/>
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="EIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtr" style="width:20mm;text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Original10PercentAcquisitionDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm; text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Addnl10PercentAcquisitionDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part I -->
					<!-- Separated Data for Part II section A -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/GeneralShareholderInfoGrp) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part II, Section A&#8212;General Shareholder Information:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:130mm;" rowspan="2" scope="col">
										<br/>
										<br/>
										<br/>(a)<br/>
                    Name, address, and identifying number of <br/>shareholder(s) filing this schedule
                  </th>
									<th class="styDepTblCell" style="width:95mm;" colspan="3" scope="col">
										<br/>(b)<br/>
                    For shareholders latest U.S. income tax return filed, indicate: 
                  </th>
									<th class="styDepTblCell" style="width:20mm;" rowspan="2" scope="col">
										<br/>(c)<br/>
                    Date (if any) shareholder last filed information return under section 6046 for the foreign  corporation
                  </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:20mm;" scope="col">
										<br/>(1)<br/>Type of return (enter form number)</th>
									<th class="styDepTblCell" style="width:25mm;" scope="col">
										<br/>(2)<br/>Date return filed</th>
									<th class="styDepTblCell" style="width:20mm;" scope="col">
										<br/>(3)<br/>Internal Revenue Service Center where filed</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/GeneralShareholderInfoGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:130mm; padding-top=4mm; padding-bottom=4mm">
											<span style="width:4px"/>
											<xsl:if test="ShareholderPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ShareholderBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="ShareholderUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="ShareholderUSAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ShareholderForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<span style="width:4px;text-align:center;"/>
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="EIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:20mm;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReturnTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:25mm; text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ReturnFiledDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:20mm;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ServiceCenterWhereRetFiledCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:20mm; text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LastFiledReturnUnderSect6046Dt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section A -->
					<!-- Separated Data for Part II section B -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part II, Section B&#8212;U.S. Persons Who Are Officers or Directors of the Foreign Corporation:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:67mm;" rowspan="2" scope="col">
										<br/>(a)<br/>
                    Name of U.S. officer or director
                  </th>
									<th class="styDepTblCell" style="width:67mm;" rowspan="2" scope="col">
										<br/>(b)<br/>
                    Address
                  </th>
									<th class="styDepTblCell" style="width:30mm;" rowspan="2" scope="col">
										<br/>(c)<br/>
                    Social Security Number
                  </th>
									<th class="styDepTblCell" style="width:22mm;" colspan="2" scope="col">(d)<br/>
                    Check appropriate <br/>box(es)
                  </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:11mm;" scope="col">
                    Officer
                  </th>
									<th class="styDepTblCell" style="width:11mm;" scope="col">
                    Director
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/USPrsnOfcrDirectorFrgnCorpGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:67mm;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OfficerOrDirectorPersonNm"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="OfficerOrDirector2PersonNm">
												<span style="width:4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OfficerOrDirector2PersonNm"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:67mm;">
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:30mm;  text-align:center">
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SSN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:11mm; text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OfficerInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:11mm; text-align:center">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DirectorInd"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section B -->
					<!-- Separated Data for Part II section C table 1 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part II, Section C&#8212;Acquisition of Stock:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:45mm;" rowspan="2">
										<br/>(a)<br/>
                    Name of shareholder(s) filing this schedule
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(b)<br/>
                    Class of stock acquired
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(c)<br/>
                    Date of acquisition
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(d)<br/>
                    Method of acquisition
                  </th>
									<th class="styDepTblCell" scope="col" style="width:75mm;" colspan="3">
										<br/>(e)<br/>
                    Number of shares acquired
                  </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:25mm;border-top-width:1px;background-color:yellow"><br/>
                    Directly
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;border-top-width:1px">(2)<br/>
                    Indirectly
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;border-top-width:1px">(3)<br/>
                    Constructively
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
											<xsl:if test="ShareholderPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ShareholderBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockClassDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:25mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcquisitionDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcquisitionMethodDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesAcquiredDirectlyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesAcquiredIndirectlyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesAcqConstructivelyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section C table 1 -->
					<!-- Separated Data for Part II section C table 2 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/ShareholderStockAcquisInfoGrp) &gt; 3)">
						<br/>
						<table class="styDepTbl" style="font-size:7pt;border-color:black;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:45mm;">(f)<br/>
                    Amount paid or value given
                  </th>
									<th class="styDepTblCell" scope="col" style="width:141mm;">(g)<br/>
                    Name and address of person from whom shares were acquired
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockAcquisInfoGrp">
									<tr style="font-size: 7pt;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCell" style="width:45mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidOrValueGivenAmt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:141mm;">
											<span style="width:4px"/>
											<xsl:if test="SharesAcquiredPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SharesAcquiredPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="SharesAcquiredBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SharesAcquiredBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="SharesAcquiredBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesAcquiredBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="SharesAcquiredUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="SharesAcquiredUSAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="SharesAcquiredForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section C  table 2 -->
					<!-- Separated Data for Part II section D table 1 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part II, Section D&#8212;Disposition of Stock:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:45mm;" rowspan="2">
										<br/>(a)<br/>
                    Name of shareholder(s) disposing of stock
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(b)<br/>
                    Class of stock
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(c)<br/>
                    Date of disposition
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;" rowspan="2">
										<br/>(d)<br/>
                    Method of disposition
                  </th>
									<th class="styDepTblCell" scope="col" style="width:75mm;" colspan="3">(e)<br/>
                    Number of shares disposed of
                  </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:25mm;">(1)<br/>
                    Directly
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(2)<br/>
                    Indirectly
                  </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(3)<br/>
                    Constructively
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
											<xsl:if test="ShrDisposingStockPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShrDisposingStockPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ShrDisposingStockBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShrDisposingStockBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShrDisposingStockBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShrDisposingStockBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</td>
										<td class="styTableCellTextSmall">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="StockClassDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:25mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DispositionDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellTextSmall">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DispositionMethodDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesDisposedDirectlyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesDisposedIndirectlyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellSmall">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="SharesDisposConstructivelyCnt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section D table 1 -->
					<!-- Separated Data for Part II section D table 2 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/ShareholderStockDisposInfoGrp) &gt; 3)">
						<br/>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:45mm;">(f)<br/>
                    Amount received
                  </th>
									<th class="styDepTblCell" scope="col" style="width:141mm;">(g)<br/>
                    Name and address of person to whom disposition of stock was made
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/ShareholderStockDisposInfoGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCell" style="width:45mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ReceivedAmt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:141mm;">
											<span style="width:4px"/>
											<xsl:if test="SharesDispositionPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SharesDispositionPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="SharesDispositionBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SharesDispositionBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="SharesDispositionBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SharesDispositionBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section D table 2 -->
					<!-- Separated Data for Part II section E table 1 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471 Schedule O, Part II, Section E&#8212;Organization or Reorganization of Foreign Corporation:</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:134mm;">(a)<br/>
                    Name and address of transferor
                  </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">(b)<br/>
                    Identifying number (if any)
                  </th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(c)<br/>
                    Date of transfer
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:134mm;">
											<span style="width:4px"/>
											<xsl:if test="TransferorPersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferorPersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="TransferorBusinessName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransferorBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="TransferorBusinessName/BusinessNameLine2Txt">
													<br/>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TransferorBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="TransferorUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="TransferorUSAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="TransferorForeignAddress"/>
														<xsl:with-param name="SpanWidth" select="'width:4px;'"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtr" style="width:32mm;">
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="EIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:20mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransferDt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section E table 1 -->
					<!-- Separated Data for Part II section E table 2 -->
					<xsl:if test="($Print = $Separated) and  (count($Form5471ScheduleO/OrgReorganizationFrgnCorpGrp) &gt; 3)">
						<br/>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<!-- Label the Column Headers -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="3" style="width:134mm;">(d)<br/>
                    Assets transferred to foreign corporation                                 </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:52mm;">(e)<br/>
                    Description of assets transferred by, or notes or securities issued by, foreign corporation                       </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:45mm;">(1)<br/>
                    Description of assets
                  </th>
									<th class="styDepTblCell" scope="col" style="width:44mm;">(2)<br/>
                    Fair market value
                  </th>
									<th class="styDepTblCell" scope="col" style="width:45mm;">(3)<br/>
                    Adjusted basis (if transferor was U.S. person)
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5471ScheduleO/OrgReorganizationFrgnCorpGrp">
									<tr style="font-size: 7pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" style="width:45mm;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AssetDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:44mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="width:45mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
											</xsl:call-template>
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:52mm;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AssetsTransferredNotesSecDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Data for Part II section E table 2 -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
