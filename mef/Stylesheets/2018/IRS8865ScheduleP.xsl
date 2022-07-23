<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/23/2015 - Changes made for UWR 151655 - Jeremy Nichols -->
<!-- 06/14/2016 - Changes made for UWR 182766 - Jeremy Nichols -->
<!-- 08/23/2016 - Changes made for defect 46557 - Jeremy Nichols -->
<!-- 05/11/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<!-- 06/02/2017 - Changes made for UWR 197613 - Jeremy Nichols -->
<!-- 08/011/2017 - Changes made for KISAM IM03067889 - Jeremy Nichols -->
<!-- 04/24/2018 - Changes made for defect 201239 - Jeremy Nichols -->
<!-- 10/19/2018 - Changes made per 2018 pdf review - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8865SchedulePStyle.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8865SchedulePData" select="$RtnDoc/IRS8865ScheduleP"/>
	<xsl:variable name="containerHeight" select="3"/>
	<xsl:variable name="p1Count" select="count($Form8865SchedulePData/AcquisitionInfo)"/>
	<xsl:variable name="p2Count" select="count($Form8865SchedulePData/DispositionInfo)"/>
	<xsl:variable name="p3Count" select="count($Form8865SchedulePData/ChangeInPropInterestInfo)"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8865SchedulePData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Desc" content="Schedule P (Form 8865)"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865SchedulePStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form style="font-size:7pt" name="Form8865ScheduleP">
					<xsl:call-template name="DocumentHeader"/>
					<div style="display:block;">
					<div class="styTBB" style="width:187mm">
						<div class="styFNBox" style="height:20mm; width:31mm; font-size:7pt">
							<div>
								<b style="font-size:11.5pt">SCHEDULE P<br/>
									<span style="font-size:7.5pt">(Form 8865)</span>
								</b>
								<div style="font-size:6pt; margin-top:3mm">
								  Department of the Treasury<br/>Internal Revenue Service
								</div>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm">
							<div class="styMainTitle" style="font-size:10pt">Acquisitions, Dispositions, and Changes of Interests<br/>in a Foreign Partnership</div>
							<div style="font-weight:bold; font-size:6pt; margin-top:0.5mm">
								(under section 6046A)<br/>
								<img src="{$ImagePath}/8865SchP_Bullet.gif" alt="Arrow Bullet"/> Attach To Form 8865. See Instructions for Form 8865.<br/> 								 
								<img src="{$ImagePath}/8865SchP_Bullet.gif" alt="Arrow Bullet"/>Go to <i>www.irs.gov/Form8865</i> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="font-size:7pt; width:31mm; height:20mm">
							<div class="styOMB" style="height:4mm">OMB No. 1545-1668</div>
							<div class="styTY" style="height:11mm;padding-top:2mm;">
								20<span class="styTYColor">18</span>
							</div>
						</div>
					</div>
					
					<div class="styBB" style="width:187mm;">
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
						  <td style="width:90mm;font-size:6pt;vertical-align:top;border-right:1px solid black;border-bottom:1px solid black;">
							<b>Name of person filing Form 8865</b><br/>
							<xsl:call-template name="PopulateFilerName">
							  <xsl:with-param name="TargetNode" select="$Form8865SchedulePData"/>
							</xsl:call-template>
						</td>
						  <td colspan="2" style="font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:0 solid black;border-bottom:1px solid black;">
							<b>Filer's identifying number</b><br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
					  <td style="width:90mm;font-size:6pt;vertical-align:top;border-right:1px solid black;border-bottom:1px solid black;">
							<b>Name of foreign partnership</b><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ForeignPartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form8865SchedulePData/ForeignPartnershipName/BusinessNameLine2Txt)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ForeignPartnershipName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td style="width:26mm;font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:1px solid black;border-bottom:1px solid black;">
							<b>EIN (if any)</b><br/><br/>
							<xsl:choose>
								<xsl:when test="$Form8865SchedulePData/EIN">
  									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">																		  
										<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>	 
							</xsl:choose>
						</td>
						<td style="font-size:6pt;vertical-align:top;padding-left:0.5mm;border-right:0 solid black;border-bottom:1px solid black;">
							<b>Reference ID number (see instr.)</b>
							<xsl:if test="(count($Form8865SchedulePData/ForeignEntityIdentificationGrp) &lt;=1)">
								<br/>
							</xsl:if>
							<xsl:for-each select="$Form8865SchedulePData/ForeignEntityIdentificationGrp">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
								</xsl:call-template>
							 </xsl:for-each>
						  </td>  			
						</tr>
					  </table>
 					</div>
					<!-- BEGIN Part I -->
					<div class="styIRS8865SchedulePBB" style="height:4.5mm;">
						<div class="styPartName" style="font-size:9.5pt">Part I</div>
						<div class="styPartDesc" style="width:50mm;font-size:9.5pt">Acquisitions</div>
						<div style="float:right;padding-top:0.5mm; vertical-align:bottom">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo"/>
								<xsl:with-param name="containerHeight" select="$containerHeight"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'part1TPctn'"/>
							</xsl:call-template>
							<!-- End button display logic -->
						</div>
					</div>
					<div class="styIRS8865SchedulePTableContainer" id="part1TPctn" style="width:187mm;display:block;border-bottom:0px;">
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" cellpadding="0" border="0" >
							<thead class="styTableThead">
								<tr align="center" style="height:11.7mm">
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:61mm" scope="col">(a)<br/>
										<span style="font-weight:normal">Name, address, and identifying number of<br/>person from whom your interest was acquired</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:20mm" scope="col">(b)<br/>
										<span style="font-weight:normal">Date of acquisition</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(c)<br/>
										<span style="font-weight:normal">FMV of<br/>interest acquired</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(d)<br/>
										<span style="font-weight:normal">Basis in<br/>interest acquired</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:19.5mm" scope="col">(e)<br/>
										<span style="font-weight:normal">% of interest<br/>before acquisition</span>
									</th>
									<th class="styIRS8865SchedulePTblCell" nowrap="nowrap" style="width:19.5mm">(f)<br/>
										<span style="font-weight:normal">% of interest<br/>after acquisition</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
								<xsl:if test="($Print !=$Separated) or (count($Form8865SchedulePData/AcquisitionInfo) &lt;= $containerHeight)">
									<xsl:call-template name="p1Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p1Count &gt; $containerHeight">
													<xsl:value-of select="$p1Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- If the Print parameter is set to be Separated, and there are more elements than the container height (3), execute -->
								<xsl:if test="($Print = $Separated) and (count($Form8865SchedulePData/AcquisitionInfo) &gt; $containerHeight)">
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo"/>
						<xsl:with-param name="containerHeight" select="$containerHeight"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'part1TPctn'"/>
					</xsl:call-template>
					<!-- END Part I -->
					<!-- BEGIN Part II -->
					<div class="styIRS8865SchedulePBB" style="height:4mm">
						<div class="styPartName" style="font-size:9.5pt">Part II</div>
						<div class="styPartDesc" style="font-size:9.5pt;width:50mm;">Dispositions</div>
						<div style="float:right;padding-top:0.5mm; vertical-align:bottom">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo"/>
								<xsl:with-param name="containerHeight" select="$containerHeight"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'part2TPctn'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styIRS8865SchedulePTableContainer" id="part2TPctn">
						<xsl:attribute name="style"><xsl:if test="$p2Count &gt; $containerHeight">
            height:35.8mm;  
          </xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS8865SchedulePTable" cellspacing="0" cellpadding="0" border="0">
							<thead class="styTableThead">
								<tr align="center" style="height:11.7mm">
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:61mm" scope="col">(a)<br/>
										<span style="font-weight:normal">Name, address, and identifying number of<br/>person who acquired your interest</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:20mm" scope="col">(b)<br/>
										<span style="font-weight:normal">Date of disposition</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(c)<br/>
										<span style="font-weight:normal">FMV of<br/>interest disposed</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(d)<br/>
										<span style="font-weight:normal">Basis in<br/>interest disposed</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:19.5mm" scope="col">(e)<br/>
										<span style="font-weight:normal">% of interest<br/>before disposition</span>
									</th>
									<th class="styIRS8865SchedulePTblCell" nowrap="nowrap" style="width:19.5mm">(f)<br/>
										<span style="font-weight:normal">% of interest<br/>after disposition</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8865SchedulePData/DispositionInfo) &lt;= $containerHeight)">
									<xsl:call-template name="p2Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p2Count &gt; $containerHeight">
													<xsl:value-of select="$p2Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- If the Print parameter is set to be Separated and there are more elements than the container height (3), execute -->
								<xsl:if test="($Print = $Separated) and (count($Form8865SchedulePData/DispositionInfo) &gt; $containerHeight)">
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                     <br/>
                   </span>
                 </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                     <br/>
                   </span>
                 </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo"/>
						<xsl:with-param name="containerHeight" select="$containerHeight"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'part2TPctn'"/>
					</xsl:call-template>
					<!-- END Part II -->
					<!-- BEGIN Part III -->
					<div class="styIRS8865SchedulePBB" style="height:4.5mm">
						<div class="styPartName" style="height:4.5mm;width:17mm;font-size:9.5pt">Part III</div>
						<div class="styPartDesc" style="font-size:9.5pt;width:70mm;">Change in Proportional Interest</div>
						<div style="float:right;padding-top:0.5mm;vertical-align:bottom">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo"/>
								<xsl:with-param name="containerHeight" select="$containerHeight"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select="'part3TPctn'"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styIRS8865SchedulePTableContainer" id="part3TPctn">
						<xsl:attribute name="style"><xsl:if test="$p3Count &gt; $containerHeight">
            height:35.5mm;  
          </xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styIRS8865SchedulePTable" cellspacing="0" cellpadding="0" border="0">
							<thead class="styTableThead">
								<tr align="center" style="height:11.7mm">
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:61mm" scope="col">(a)<br/>
										<span style="font-weight:normal">Description of change</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:20mm" scope="col">(b)<br/>
										<span style="font-weight:normal">Date of change</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(c)<br/>
										<span style="font-weight:normal">FMV of<br/>interest</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:31mm" scope="col">(d)<br/>
										<span style="font-weight:normal">Basis in<br/>interest</span>
									</th>
									<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:19.5mm" scope="col">(e)<br/>
										<span style="font-weight:normal">% of interest<br/>before change</span>
									</th>
									<th class="styIRS8865SchedulePTblCell" nowrap="nowrap" style="width:19.5mm">(f)<br/>
										<span style="font-weight:normal">% of interest<br/>after change</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- If the Print parameter is not set to be Separated, or there are less elements than the container height (3), execute -->
								<xsl:if test="($Print != $Separated) or (count($Form8865SchedulePData/ChangeInPropInterestInfo) &lt;= $containerHeight)">
									<xsl:call-template name="p3Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p3Count &gt; $containerHeight">
													<xsl:value-of select="$p3Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
								<!-- If the Print parameter is set to be Separated and there are more elements than the container height (3), execute -->
								<xsl:if test="($Print = $Separated) and (count($Form8865SchedulePData/ChangeInPropInterestInfo) &gt; $containerHeight)">
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
									<tr align="right" height="30">
										<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
											<span id="/..">
                    <br/>
                  </span>
										</td>
										<td class="styIRS8865SchedulePTblRB" align="center">
											<span id="/.."/><br/>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span style="color:darkblue;" id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblRB">
											<span id="/..">
                    <br/>
                  </span>
                </td>
										<td class="styIRS8865SchedulePTblCell">
											<span id="/..">
                    <br/>
                  </span>
                </td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo"/>
						<xsl:with-param name="containerHeight" select="$containerHeight"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select="'part3TPctn'"/>
					</xsl:call-template>
					<!-- END Part III -->
					<!-- BEGIN Part IV -->
					<xsl:variable name="p4Count" select="count($Form8865SchedulePData/SupplementalInfo8865ScheduleP)"/>
					<xsl:variable name="p4Count1" select="count($Form8865SchedulePData/SupplementalInfo8865ScheduleP/PartNumAndColumnTxt)"/>
					<table class="styIRS8865SchedulePTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm">
						<thead class="styTableThead">
							<tr>
								<th class="styIRS8865SchedulePBB" nowrap="nowrap" scope="col" style="height:4mm;border-top:1px solid black">
									<div class="styPartName" style="font-size:9.5pt">Part IV</div>
									<div class="styPartDesc" style="font-size:9.5pt;width:140mm;">Supplemental Information Required To Be Reported <span class="styNormalText">(see instructions)</span>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:choose>
								<xsl:when test="$Form8865SchedulePData/SupplementalInfo8865ScheduleP">
									<!-- If the Print parameter is not set to be Separated or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print != $Separated) or (count($Form8865SchedulePData/SupplementalInfo8865ScheduleP) &lt;= 1)">
										<xsl:for-each select="$Form8865SchedulePData/SupplementalInfo8865ScheduleP">
											<tr>
												<td style="border-bottom:1px solid black;">
													<xsl:if test="position =last()">
														<xsl:attribute name="style">border-bottom:0 solid black;</xsl:attribute>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartNumAndColumnTxt"/>
													</xsl:call-template>
													<span style="width:4px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Desc"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- If the Print parameter is not set to be Separated or there are less elements than the container height (3), execute -->
									<xsl:if test="($Print = $Separated) and (count($Form8865SchedulePData/SupplementalInfo8865ScheduleP) &gt; 1)">
										<xsl:call-template name="populateemptyrowsforpartiv">
											<xsl:with-param name="IsSeparated" select="'yes'"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="populateemptyrowsforpartiv"/>
								</xsl:otherwise>
							</xsl:choose>
						</tbody>
					</table>
					</div>
					<!-- END Part IV -->
					<div style="width:187mm; font-size:7pt; border-top:1px solid black; padding-top:1mm">
						<div style="float:left; font-size:7pt">
							<b>For Paperwork Reduction Act Notice, see the Instructions for Form 8865.</b>
						</div>
						<div style="float:right">
							Cat. No. 25943Q
							<span style="width:15mm"/>
							<b>Schedule P (Form 8865) 2018</b>
						</div>
					</div>
						<div>
						</div>
					<!-- Additional Data begin -->
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
						  Additional Data    
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8865SchedulePData"/>
						</xsl:call-template>
					</table>
					<!-- Additiona Data Table for Separated Data from Part I -->
					<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/AcquisitionInfo) &gt; $containerHeight)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS 8865 Schedule P, Part I - Acquisitions:</span>
							<table class="styDepTbl" style="width:187mm;font-size:7pt;display:block;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" align="center" style="height:11.7mm">
										<th class="styDepTblCell" style="width:66mm" scope="col">(a)<br/>Name, address, and identifying number of<br/>person from whom your interest was acquired</th>
										<th class="styDepTblCell" style="width:20mm" scope="col">(b)<br/>Date of acquisition</th>
										<th class="styDepTblCell" style="width:31mm" scope="col">(c)<br/>FMV of<br/>interest acquired</th>
										<th class="styDepTblCell" style="width:31mm" scope="col">(d)<br/>Basis in<br/>interest acquired</th>
										<th class="styDepTblCell" style="width:19.5mm" scope="col">(e)<br/>% of interest<br/>before acquisition</th>
										<th class="styDepTblCell" style="width:19.5mm">(f)<br/>% of interest<br/>after acquisition</th>
									</tr>
								</thead>
								<tbody>
									<xsl:call-template name="p1Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p1Count &gt; $containerHeight">
													<xsl:value-of select="$p1Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</tbody>
							</table>
					</xsl:if>
					<!-- Additiona Data Table for Separated Data from Part II -->
					<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/DispositionInfo) &gt; $containerHeight)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS 8865 Schedule P, Part II - Dispositions:</span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableThead;">
									<tr class="styDepTblHdr" align="center" style="height:11.7mm">
										<th class="styDepTblCell" style="width:66mm" scope="col">(a)<br/>Name, address, and identifying number of<br/>person who acquired your interest</th>
										<th class="styDepTblCell" style="width:20mm" scope="col">(b)<br/>Date of disposition</th>
										<th class="styDepTblCell" style="width:31mm" scope="col">(c)<br/>FMV of<br/>interest disposed</th>
										<th class="styDepTblCell" style="width:31mm" scope="col">(d)<br/>Basis in<br/>interest disposed</th>
										<th class="styDepTblCell" style="width:19.5mm" scope="col">(e)<br/>% of interest<br/>before disposition</th>
										<th class="styDepTblCell" style="width:19.5mm">(f)<br/>% of interest<br/>after disposition</th>
									</tr>
								</thead>
								<tbody>
									<xsl:call-template name="p2Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p2Count &gt; $containerHeight">
													<xsl:value-of select="$p2Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</tbody>
							</table>
					</xsl:if>
					<!-- Additiona Data Table for Separated Data from Part III -->
					<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/ChangeInPropInterestInfo) &gt; 3)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS 8865 Schedule P, Part III - Change in Proportional Interest:</span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" align="center" style="height:11.7mm">
										<th class="styIRS8865SchedulePTblRB" nowrap="nowrap" style="width:61mm;font-weight:bold;" scope="col">(a)<br/>Description of change</th>
										<th class="styIRS8865SchedulePTblRB" style="width:20mm;font-weight:bold;" scope="col">(b)<br/>Date of change</th>
										<th class="styIRS8865SchedulePTblRB" style="width:31mm;font-weight:bold;" scope="col">(c)<br/>FMV of<br/>interest</th>
										<th class="styIRS8865SchedulePTblRB" style="width:31mm;font-weight:bold;" scope="col">(d)<br/>Basis in<br/>interest</th>
										<th class="styIRS8865SchedulePTblRB" style="width:19.5mm;font-weight:bold;" scope="col">(e)<br/>% of interest<br/>before change</th>
										<th class="styIRS8865SchedulePTblCell" style="width:19.5mm;font-weight:bold;">(f)<br/>% of interest<br/>after change</th>
									</tr>
								</thead>
								<tbody>
									<!--  444444444444444444444444444444444444444444444444444444444444444444  -->
									<xsl:call-template name="p3Template">
										<xsl:with-param name="max">
											<xsl:choose>
												<xsl:when test="$p3Count &gt; $containerHeight">
													<xsl:value-of select="$p3Count"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$containerHeight"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
									</xsl:call-template>
								</tbody>
							</table>
					</xsl:if>
					<!-- Additiona Data Table for Separated Data from Part IV -->
					<!-- If the Print parameter is not set to be Separated or there are less elements than the container height (3), execute -->
					<xsl:if test="($Print = $Separated) and (count($Form8865SchedulePData/SupplementalInfo8865ScheduleP) &gt; 1)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form IRS 8865 Schedule P, Part IV - Supplemental Information Required To Be Reported:</span>
							<table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" style="height:10mm; ">
										<th nowrap="nowrap" style="width:180mm; text-align:center; font-size:7pt; border-bottom:1px solid black" scope="col">
											<b>Supplemental Information Required To Be Reported</b>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$Form8865SchedulePData/SupplementalInfo8865ScheduleP">
										<tr>
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">
			              styDepTblRow1
			            </xsl:when><xsl:otherwise>
			              styDepTblRow2
			            </xsl:otherwise></xsl:choose></xsl:attribute>
											<td style="padding-top: 1mm; padding-bottom: 1mm; border-bottom:1px solid black;text-align: left; font-size: 7pt">
												<xsl:if test="position = last()">
													<xsl:attribute name="style">border-bottom:0 solid black;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartNumAndColumnTxt"/>
												</xsl:call-template>
												<span style="width:4px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Desc"/>
												</xsl:call-template>
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
	<xsl:template name="p1Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr align="right" height="30">
				<!-- Change background color of row if dependent table -->
				<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/AcquisitionInfo) &gt; 3)">
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">
              styDepTblRow1
            </xsl:when><xsl:otherwise>
              styDepTblRow2
            </xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<td class="styIRS8865SchedulePTblRB" align="left" style="font-size:7pt;">
					<span style="font-family:verdana;font-size:6pt">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsName/BusinessNameLine2Txt)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsName/InCareOfName)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsName/InCareOfName"/>
							</xsl:call-template>
						</xsl:if>
					</span>
					<xsl:choose>
						<xsl:when test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/AddressLine2Txt)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/CityNm"/>
								</xsl:call-template>,
          <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/StateAbbreviationCd"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsUSAddress/ZIPCd"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/AddressLine2Txt)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/CityNm"/>
								</xsl:call-template>,
           <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/ForeignPostalCd"/>
								</xsl:call-template>,  
<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsForeignAddress/CountryCd"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="normalize-space($Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsEIN)!=''">
							<br/>
      
          (ID No. <xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionsEIN"/>
							</xsl:call-template>)
</xsl:when>
						<xsl:otherwise>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/MissingEINReasonCd"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
          <br/>
        </td>
				<td class="styIRS8865SchedulePTblRB" align="center">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/AcquisitionDt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/FMVOfInterestAcquiredAmt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/BasisInInterestAcquiredAmt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/InterestBeforeAcquisitionPct"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblCell">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/AcquisitionInfo[$index]/InterestAfterAcquisitionPct"/>
					</xsl:call-template><br/>
      </td>
			</tr>
			<xsl:call-template name="p1Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p2Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr align="right" height="30">
				<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/DispositionInfo) &gt; 3)">
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">
              styDepTblRow1
            </xsl:when><xsl:otherwise>
              styDepTblRow2
            </xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<td class="styIRS8865SchedulePTblRB" style="font-size:7pt;" align="left">
					<span style="font-family:verdana;font-size:6pt">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsName/BusinessNameLine2Txt)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsName/InCareOfName)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsName/InCareOfName"/>
							</xsl:call-template>
						</xsl:if>
					</span>
					<xsl:choose>
						<xsl:when test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress)!=''">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/AddressLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/AddressLine2Txt)!=''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/CityNm"/>
							</xsl:call-template>,           
        <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/StateAbbreviationCd"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsUSAddress/ZIPCd"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/AddressLine2Txt)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/CityNm"/>
								</xsl:call-template>,                     
        <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/ForeignPostalCd"/>
								</xsl:call-template>,  
      <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsForeignAddress/CountryCd"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="normalize-space($Form8865SchedulePData/DispositionInfo[$index]/DispositionsEIN)!=''">
							<br/>
        
          (ID No. <xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionsEIN"/>
							</xsl:call-template>)
</xsl:when>
						<xsl:otherwise>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/MissingEINReasonCd"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
       <br/>   
    </td>
				<td class="styIRS8865SchedulePTblRB" align="center">
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/DispositionDt"/>
					</xsl:call-template><br/>
    </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/FMVOfInterestDisposedAmt"/>
					</xsl:call-template><br/>
    </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/BasisInInterestDisposedAmt"/>
					</xsl:call-template><br/>
    </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/InterestBeforeDispositionPct"/>
					</xsl:call-template><br/>
    </td>
				<td class="styIRS8865SchedulePTblCell">
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/DispositionInfo[$index]/InterestAfterDispositionPct"/>
					</xsl:call-template><br/>
    </td>
			</tr>
			<xsl:call-template name="p2Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p3Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr align="right" height="30" style="font-size:7pt; line-height:115%">
				<xsl:if test="($Print =$Separated) and (count($Form8865SchedulePData/ChangeInPropInterestInfo) &gt; 3)">
					<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">
              styDepTblRow1
            </xsl:when><xsl:otherwise>
              styDepTblRow2
            </xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<td class="styIRS8865SchedulePTblRB" align="left">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/ChangeDesc"/>
					</xsl:call-template>
				</td>
				<td class="styIRS8865SchedulePTblRB" align="center">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/ChangeDt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/FMVOfInterestAmt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/BasisInInterestAmt"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblRB">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/InterestBeforeChangePct"/>
					</xsl:call-template><br/>
      </td>
				<td class="styIRS8865SchedulePTblCell">
					<xsl:if test="$index = $max">
						<xsl:attribute name="style">
            border-bottom:0
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/ChangeInPropInterestInfo[$index]/InterestAfterChangePct"/>
					</xsl:call-template><br/>
      </td>
			</tr>
			<xsl:call-template name="p3Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="populateemptyrowsforpartiv">
		<xsl:param name="IsSeparated" select="'no'"/>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<xsl:if test="$IsSeparated = 'yes' ">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form8865SchedulePData/SupplementalInfo8865ScheduleP"/>
					</xsl:call-template>
				</xsl:if>
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
		<tr style="height:6mm;">
			<td style="border-bottom:1px solid black;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="p4Template">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:if test="$index &lt;= $max">
			<tr>
				<td class="styIRS8865SchedulePBB1">
					<xsl:if test="$index=$max and $index!=1">
						<xsl:attribute name="style">border-bottom:0</xsl:attribute>
					</xsl:if>
        <br/>                                
      </td>
			</tr>
			<xsl:call-template name="p4Template">
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="max" select="$max"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="p4Template2">
		<xsl:param name="showButLine"/>
		<xsl:for-each select="$Form8865SchedulePData/SupplementalInfo8865ScheduleP">
			<xsl:if test="string(PartNumAndColumnTxt)">
				<tr>
					<td class="styIRS8865SchedulePBB1" style="font-family:verdana;font-size:7pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PartNumAndColumnTxt"/>
						</xsl:call-template>:
        </td>
				</tr>
			</xsl:if>
			<xsl:if test="string(Desc)">
				<tr>
					<td style="text-align:justify; border-bottom:1px solid black" valign="top">
						<xsl:if test="(position() = last()) and ($showButLine = 0)">
							<xsl:attribute name="style">
              text-align:justify; border-bottom:0
            </xsl:attribute>
						</xsl:if>
						<span style="line-height:300%; border-bottom:1px solid black;padding-bottom:2.5mm; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</span>
					</td>
				</tr>
				<xsl:if test="position() != last()">
					<tr>
						<td class="styIRS8865SchedulePBB1"><br/></td>
					</tr>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="counterTemp">
		<xsl:param name="index" select="1"/>
		<xsl:param name="sum" select="0"/>
		<xsl:param name="max"/>
		<xsl:choose>
			<xsl:when test="$index &lt;= $max">
				<xsl:call-template name="counterTemp">
					<xsl:with-param name="index" select="$index + 1"/>
					<xsl:with-param name="max" select="$max"/>
					<xsl:with-param name="sum" select="$sum + ceiling(string-length($Form8865SchedulePData/SupplementalInfo8865ScheduleP[$index]/Desc) div 78) + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$sum"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>