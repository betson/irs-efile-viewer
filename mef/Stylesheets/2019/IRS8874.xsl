<?xml version="1.0" encoding="UTF-8"?>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 07/20/2016 - Modified per UWR 182753 - Jeremy Nichols-->
<!-- 11/16/2016 - Modified per defect 47036 - Jeremy Nichols-->
<!-- 02/21/2017 - Modified per defect 47636 - Jeremy Nichols-->
<!-- 05/11/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<!-- 09/22/2017 - Changes made for UWR 199895 - Jeremy Nichols -->
<!-- 09/22/2017 - Changes made for UWR 201226 - Jeremy Nichols -->
<!-- 10/24/2017 - Changes made for UWR 125103 - Jeremy Nichols -->
<!-- 11/08/2017 - Modified per defect 125765 - Jeremy Nichols -->
<!-- 11/13/2017 - Modified per defect 125766 - Jeremy Nichols-->
<!-- 11/14/2017 - Modified per defect 125103 - Jeremy Nichols-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8874Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8874Data" select="$RtnDoc/IRS8874"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8874Data)"/>
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
				<meta name="Description" content="IRS Form 8874"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8874Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8874">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;">
      Form <span class="styFormNumber">8874</span>
							<br/>
							<span style="font-size:6pt">(Rev. September 2017)</span>
							<div class="styAgency" style="padding-top:1.5mm">Department of the Treasury</div>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123mm;height:21mm;">
							<div class="styMainTitle" style="height:8mm;">
        New Markets Credit
      </div>
						  <br/>
							<div class="styFST" style="height:3mm;font-size:7pt;">
								<img src="{$ImagePath}/8874_Bullet.gif" height="7mm" alt="Bullet Image"/>
        Attach to your tax return.
      </div><br/>							
							<div class="styFST" style="padding-top: 3mm; height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/8874_Bullet.gif" height="7mm" alt="Bullet Image"/>
								Go to <i>www.irs.gov/Form8874</i> for the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:21mm;">
							<div class="styOMB" style="height:4mm;">
        OMB No. 1545-1804
      </div>
							<div style="text-align: left; padding-top: 10mm; padding-left: 4mm">Attachment<br/> Sequence No.<span class="styBoldText">
									<span style="width:4px;"/>127</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:145mm;height:9mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
							<span style="font-size:6pt;font-family:verdana;">
								<xsl:call-template name="PopulateFilerName">
								  <xsl:with-param name="TargetNode" select="$Form8874Data"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:35mm;height:9mm;padding-left:2mm;font-size:7pt;">
     Identifying number<br/>
							<br/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateFilerTIN">
								   <xsl:with-param name="TargetNode" select="$Form8874Data"/>
								</xsl:call-template>
							</span>
						</div>
										<div class="styGenericDiv" style="width:6mm;padding-left:2mm;padding-top:5mm;display:inline;font-size:7pt;float:right;">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$Form8874Data/CurrentYearCreditInfo"/>
												<xsl:with-param name="containerHeight" select="3"/>
												<xsl:with-param name="headerHeight" select="2"/>
												<xsl:with-param name="containerID" select=" 'TPctn' "/>
											</xsl:call-template>
										</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- BEGIN Part I Title -->
					<!--  <div class="styBB" style="width:187mm;float: none; clear: none"> -->
					<!-- Table expand/collapse toggle button -->
					<!--     <span style="width:122mm;"></span>
        <span style="width:7mm;padding-left:3.5mm;">
            <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$Form8874Data/CurrentYearCreditInfo"/>
            <xsl:with-param name="containerHeight" select="3"/>
            <xsl:with-param name="headerHeight" select="2"/>
            <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
        </span>      
    </div>  -->
					<!-- END Part I Title -->
					<div class="styTableContainer" id="TPctn" style="border-bottom-width:0px;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" style="height:auto;" summary="Table displaying entity name or names and corresponding employer identification numbers">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell" rowspan="3" style="width:7mm;border-right:none;font-weight:bold;">
										<span style="width:1mm;"/>
									</th>
									<th scope="col" class="styTableCell" style="width:51.75mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">(a)</th>
									<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">(b)</th>
									<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">(c)</th>
									<th scope="col" class="styTableCell" style="width:30mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">(d)</th>
									<th scope="col" class="styTableCell" style="width:12mm;font-size:7pt;text-align:center;border-bottom:none;font-weight:bold;">(e)</th>
									<th scope="col" class="styTableCell" style="width:45.5mm;font-size:7pt;text-align:center;border-bottom:none;border-right:none;font-weight:bold;">(f)</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCell" style="width:51.75mm;font-size:7pt;text-align:center;font-weight:normal;">Name and address of the qualified community development entity (CDE)</th>
									<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;font-weight:normal;">Employer identification number of CDE</th>
									<th scope="col" class="styTableCell" style="width:20mm;font-size:7pt;text-align:center;font-weight:normal;">Date of initial investment</th>
									<th scope="col" class="styTableCell" style="width:30mm;font-size:7pt;text-align:center;font-weight:normal;">Amount of qualified equity investment</th>
									<th scope="col" class="styTableCell" style="width:12mm;font-size:7pt;text-align:center;font-weight:normal;">Credit rate</th>
									<th scope="col" class="styTableCell" style="width:45.5mm;font-size:7pt;text-align:center;border-right:none;font-weight:normal;">Credit ((d) x (e))</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number of -->
								<!-- elements is less than the container height, then also display all rows. -->
								<xsl:if test="($Print != $Separated) or (count($Form8874Data/CurrentYearCreditInfo) &lt;= 6) ">
									<xsl:for-each select="$Form8874Data/CurrentYearCreditInfo">
										<tr>
											<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;">
												<xsl:if test="position()=1">1</xsl:if>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
												<span style="font-family:verdana;font-size:6pt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CDEName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="CDEName/BusinessNameLine2Txt !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CDEName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</span>
												<xsl:choose>
													<xsl:when test="USAddress">
														<br/>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<br/>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
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
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InitialInvestmentDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EquityInvestmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CreditRt"/>
												</xsl:call-template>%
          </td>
											<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CreditByRatioAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>				
								</xsl:if>
								<!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
								<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 1 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr>
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;height:8mm;padding-top:2.5mm;">1</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8874Data/CurrentYearCreditInfo"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 2 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr height="8mm">
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 3 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr height="8mm">
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-bottom-width:0px;border-right:none;font-weight:bold;height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;border-bottom-width:0px;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;border-bottom-width:0px;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 4 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr height="8mm">
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 5 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr height="8mm">
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8874Data/CurrentYearCreditInfo) &lt; 6 or          (($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
									<tr height="8mm">
										<td class="styTableCell" style="width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;height:8mm">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;">%</td>
										<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
										<tr>
											<td class="styTableCell" style="height:15mm;width:7mm;font-size:7pt;text-align:center;vertical-align:top;border-right:none;font-weight:bold;">
												<xsl:if test="position()=1"><!--1--></xsl:if>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" rowspan="1" style="width:51.75mm;text-align:left;font-size:7pt;font-weight:normal;">
												<span style="width:50mm;"/>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
												<span style="width:24mm;"/>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;">
												<span style="width:19mm;"/>
											</td>
											<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;font-weight:normal;">
												<span style="width:29mm;"/>
											</td>
											<td class="styTableCell" style="width:12mm;text-align:right;font-size:7pt;padding-left:1mm;">
												<span style="width:11mm;"/>
											</td>
											<td class="styTableCell" style="text-align:right;width:45.5mm;border-right:none;font-size:7pt;font-weight:normal;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8874Data/CDETotalCreditAmt"/>
												</xsl:call-template>
											</td>
										</tr>
							</tbody>
						</table>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8874Data/CurrentYearCreditInfo"/>
							<xsl:with-param name="containerHeight" select="3"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'TPctn' "/>
						</xsl:call-template>
					</div>
					<xsl:if test="(($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo)&gt;6)) ">
						<span style="height:38.5mm;"></span>
					</xsl:if>
					<!-- Line 2 caption -->
					<div style="width:187mm; float: none; clear: none;">
						<div class="styLNLeftNumBox" style="width:5mm;height:4mm;padding-left: 2mm"/>
						<div class="styLNDesc" style="width:139.5mm; height:2mm;padding-left: 2mm;padding-bottom:0mm;"/>
						<div class="styLNRightNumBoxNBB" style="width:9mm;"/>
						<div class="styLNAmountBoxNBB" style="width:33.5mm;"/>
					</div>
					<div style="width:187mm; float: none; clear: none;">
						<div class="styLNLeftNumBox" style="width:5mm;height:4mm;padding-left: 2.5mm">2</div>
						<div class="styLNDesc" style="width:139.5mm; height:2mm;padding-left: 2mm;padding-bottom:0mm;">          
          New markets credit from partnerships and S corporations
 

            <!-- Form to Form links (Push Pins) -->
							<!--           <xsl:call-template name="SetFormLinkInline">        
            <xsl:with-param name="TargetNode" select="$Form8874Data/NewMarketsCredit"/>
                    </xsl:call-template>
 -->
							<!--Dotted Line-->
							<span style="letter-spacing:3.5mm;font-weight:bold">..............</span>
						</div>
						<div class="styLNRightNumBox" style="width:9mm;">
         
          2    
        </div>
						<div class="styLNAmountBox" style="width:33.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8874Data/NewMarketsCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;width:5mm;padding-left: 2.5mm">3</div>
						<div class="styLNDesc" style="height:7mm;width:139.5mm;padding-left: 2mm">
							Add lines 1 and 2. Partnerships and S corporations, report this amount on Schedule K.  
							All others, report this amount on Form 3800, Part III, line 1i 
							  <!--Dotted Line-->
							<span style="padding-left:1.75mm;letter-spacing:3.5mm;font-weight:bold;display:inline;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;width:9mm;text-align:center;border-bottom:none;padding-top:0mm;">
							<div class="styLNRightNumBoxNBB" style="height: 4mm; width:8.75mm;text-align:center;border-left-width:0px;background-color:lightgrey;"/>
							  3    
							</div>
						<div class="styLNAmountBox" style="height:7mm;width:33.5mm;border-bottom:none;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8874Data/TotalCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:1mm;border-top:1px solid black;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
						<span style="width:120px;"/>                      
						  Cat. No. 31663N 
						  <span style="width:78px;"/>  
						  Form <span class="styBoldText">8874</span> (Rev. 9-2017)    
				    </div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						  </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8874Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Data from Part I Line 1 -->
					<xsl:if test="($Print = $Separated) and (count($Form8874Data/CurrentYearCreditInfo) &gt; 3) ">
						<span class="styRepeatingDataTitle">
          Form 8874, Part I, Line 1 - Current Year Credit
        </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:68mm;text-align:center;border-bottom:none;">(a)</th>
									<th scope="col" class="styDepTblCell" style="width:23mm;text-align:center;border-bottom:none;">(b)</th>
									<th scope="col" class="styDepTblCell" style="width:20mm;text-align:center;border-bottom:none;">(c)</th>
									<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;border-bottom:none;">(d)</th>
									<th scope="col" class="styDepTblCell" style="width:12mm;text-align:center;border-bottom:none;">(e)</th>
									<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;border-bottom:none;">(f)</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:68mm;text-align:center;border-top:none;">
                Name and address of the qualified community development entity (CDE)
              </th>
									<th scope="col" class="styDepTblCell" style="width:23mm;text-align:center;border-top:none;">
                Employer identification number of CDE
              </th>
									<th scope="col" class="styDepTblCell" style="width:20mm;text-align:center;border-top:none;">
                Date of initial investment
              </th>
									<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;border-top:none;">
                Amount of qualified equity investment
              </th>
									<th scope="col" class="styDepTblCell" style="width:12mm;text-align:center;border-top:none;">Credit rate</th>
									<th scope="col" class="styDepTblCell" style="width:32mm;text-align:center;border-top:none;">Credit ((d) x     (e))  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8874Data/CurrentYearCreditInfo">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:68mm;text-align:left;">
											<span style="font-family:verdana;font-size:6pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CDEName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CDEName/BusinessNameLine2Txt !=''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CDEName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<!--										<xsl:if test="AddressOfCDE !=''">
												<br/>
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressOfCDE"/>
												</xsl:call-template>
											</xsl:if>  -->
											<xsl:choose>
												<xsl:when test="USAddress">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:center;">
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
											<!--                <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="IdentificationNumberOfCDE"/>
                  </xsl:call-template>
   -->
										</td>
										<td class="styDepTblCell" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InitialInvestmentDt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EquityInvestmentAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:12mm;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CreditRt"/>
											</xsl:call-template>%
                </td>
										<td class="styDepTblCell" style="text-align:right;width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CreditByRatioAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>						
							</tbody>
						</table>
					</xsl:if>
					<!-- End of Part I Line 1 Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>