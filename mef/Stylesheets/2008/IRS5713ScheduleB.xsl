<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5713ScheduleBStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5713BData" select="$RtnDoc/IRS5713ScheduleB"/>
	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="Content-Type" content="text/html"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5713BData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Schedule B (5713)"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5713ScheduleBStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form5713B">
					<!-- start page header-->
					<xsl:call-template name="DocumentHeader"/>
					<div style="width:187mm;">
						<div class="styFNBox" style="width:32mm;height:24.25mm;">
							<div class="styFormNumber" style="font-size: 11pt;">SCHEDULE B</div>
							<div class="styFormNumber" style="font-size: 9pt;">(Form 5713)</div>
							<br/>
							<div style="width:31mm;font-weight:normal;font-size:7pt;">(Rev. December 2004)</div>
							<br/>
							<div>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<div class="styMainTitle">
								<b>Specifically Attributable Taxes</b>
								<br/>
								<b>and Income (Section 999(c)(2))</b>
							</div>
							<br/>
							<div style="height:4mm;font-size: 7pt;">
								<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="bullet image pointing to right" width="6"/>
								<span style="width: 1mm;"/>Complete only if you are <b>not</b> computing a loss of tax benefits<br/> 
          using the international boycott factor on Schedule A (Form 5713).</div>
							<div class="styFBT">
								<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="bullet image pointing to right" width="6"/>
								<span style="width: 1mm;"/>Attach to Form 5713. <span style="width:5mm;"/>
								<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="bullet image pointing to right" width="6"/>
								<span style="width: 1mm;"/>See instructions on page 2.</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:24.25mm;">
							<br/>
							<br/>
							<div style="font-size:7pt;">OMB No. 1545-0216</div>
						</div>
						<!-- end header -->
						<!--Name and Identifying number Begin-->
						<div class="styBB" style="width:187mm;border-top-width:1px">
							<div class="styNameBox" style="font-family:Arial;font-size:7pt;width:137mm;height:9mm;">Name<br/>
								<xsl:choose>
									<xsl:when test="$Form5713BData/Name/BusinessNameLine1 = '' or not($Form5713BData/Name/BusinessNameLine1)">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5713BData/Name/BusinessNameLine1"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<xsl:choose>
									<xsl:when test="$Form5713BData/Name/BusinessNameLine2 = '' or not($Form5713BData/Name/BusinessNameLine2)">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5713BData/Name/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="styEINBox" style="font-family:Verdana;font-size:7pt;width:50mm;height:9mm;padding-left:2mm;">Identifying number<br/>
								<br/>
								<xsl:choose>
									<xsl:when test="$Form5713BData/IdentifyingNumber">
										<span style="text-align:left;font-weight:normal;">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form5713BData/IdentifyingNumber"/>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="text-align:left;font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5713BData/MissingEINReason"/>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!-- Name and Identifying number END-->
					<!-- Item portion above "(a-o) table" start  -->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:187mm;height:4.0mm;">Name of country being boycotted (check one)
                            <span style="font-size: 7pt; font-weight: bold; letter-spacing:4mm;">. </span>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5713BData/IsraelBoycotted"/>
								</xsl:call-template>
							</input>
							<span style="width: .5mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5713BData/IsraelBoycotted"/>
								</xsl:call-template>Israel
                              </label>
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5713BData/OtherCountryBoycotted"/>
								</xsl:call-template>
							</input>
							<span style="width: .5mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5713BData/OtherCountryBoycotted"/>
								</xsl:call-template>Other (identify)
                                </label>
						    	<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="bullet image pointing to right" width="6"/>
						    	<span style="width:.5mm;"/>
						    	<span class="styFixedUnderline" style="width:76.5mm;float:none;padding-bottom:0;">
								<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5713BData/nameOfOtherCountry"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:0px"/>
					<div class="styBB" style="width:187mm;">
						<b>Important:</b>
						<i> If you are involved in more than one international boycott, use a separate Schedule B (Form 5713) to compute the specifically attributable taxes and income for each boycott.</i>
					</div>
					<div style="width:187mm;text-align:left;font-size:9pt;font-weight:bold;" class="styBB">
						<span style="width:187mm;float:left;text-align:center;padding-top:2mm;height:5mm;">Specifically Attributable Taxes and Income by Operation (Use a separate line for each operation.)</span>
						<!--Table expand/collapse toggle button-->
						<div class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form5713BData/OperationTaxesAndIncome"/>
								<xsl:with-param name="containerHeight" select="14"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TP1ctn' "/>
								<!--          <xsl:with-param name="imageID" select=" 'TPimg' "/>
          <xsl:with-param name="buttonID" select=" 'TPbtn' "/> -->
							</xsl:call-template>
						</div>
						<!--Table expand/collapse toggle button end-->
					</div>
					<div class="styIRS5713BTableContainer" style="width:187mm;" id="TP1ctn">
						<!-- Show table in expanded form -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" summary="Specifically Attributable Taxes and  Income by Operation">
							<tr>
								<th class="styTableCell" scope="col" rowspan="2" nowrap="nowrap" style="width:25mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Name of country</th>
								<th class="styTableCell" scope="col" colspan="2" style="width:38mm;text-align:center;font-size:7pt;border-color:black;">Principal business activity</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">Foreign tax credit</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">Subpart F income</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">IC-DISC income</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">FSC income</th>
							</tr>
							<tr>
								<th class="styTableCell" scope="col" style="width:10mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Code</th>
								<th class="styTableCell" scope="col" style="width:28mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Description</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Foreign taxes attributable to boycott operations</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Prorated share of international boycott income</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-bottom:none;">Taxable income attributable to boycott operations</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;border-bottom:none;">Taxable income attributable to boycott operations</th>
							</tr>
							<tr>
								<th class="styTableCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;border-color:black;padding-left:1.5mm;">(1)</th>
								<th class="styTableCell" scope="col" style="width:10mm;text-align:center;font-size:7pt;border-color:black;">(2)</th>
								<th class="styTableCell" scope="col" style="width:28mm;text-align:center;font-size:7pt;border-color:black;">(3)</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">(4)</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">(5)</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;">(6)</th>
								<th class="styTableCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;border-color:black;border-right:none;">(7)</th>
							</tr>
							<!-- Display all the rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number -->
							<!-- of rows is less than the container height, then also display all the rows -->
							<xsl:if test="($Print != $Separated) or (count($Form5713BData/OperationTaxesAndIncome) &lt;= 14) ">
								<!--First 14 rows -->
								<xsl:for-each select="$Form5713BData/OperationTaxesAndIncome">
									<tr>
										<xsl:if test="position()&lt;15">
											<td class="styTableCell" style="width:20mm;text-align:left;font-size:7pt;border-color:black;padding-left:2mm;">
												<span style="float:left;font-weight:bold;">
													<xsl:number value="position()" format="a"/>
												</span>
												<span style="width:1.5mm;"/>
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryName"/>
													</xsl:call-template>
												</span>
											</td>
										</xsl:if>
										<!--Rows greater than 14 -->
										<xsl:if test="position()&gt;=15">
											<td class="styTableCell" style="width:20mm;text-align:right;font-weight:normal;font-size:7pt;border-color:black;">
												<span style="float:left;width:3mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryName"/>
													</xsl:call-template>
												</span>
											</td>
										</xsl:if>
										<!--      *************************************************************************** -->
										<td class="styTableCell" style="width:10mm;text-align:center;font-size:7pt;border-color:black;" nowrap="nowrap">
										     	 <xsl:choose>
                                                  <xsl:when test="PBACode">
                                                       <xsl:call-template name="PopulateText">
                                                       <xsl:with-param name="TargetNode" select="PBACode" />
                                                        </xsl:call-template>
                                                 </xsl:when>
                                            <xsl:otherwise>
                                               <xsl:if test="InactivePBACode">
                                                     <xsl:call-template name="PopulateText">
                                                     <xsl:with-param name="TargetNode" select="InactivePBACode" />
                                               </xsl:call-template>
                                               </xsl:if>
                                         </xsl:otherwise>
                                     </xsl:choose>

        
										</td>
										<td class="styTableCell" style="width:28mm;text-align:left;font-size:7pt;border-color:black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PBADescription"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;padding-left:3mm;" nowrap="nowrap">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottOperationsForeignTaxes"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;padding-left:3mm;" nowrap="nowrap">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntntlBoycottIncmProratedShare"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:7pt;border-color:black;" nowrap="nowrap">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ICDISCTxblIncmAttrblBoycottOpr"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:30mm;text-align:right;font-size:6pt;
        border-color:black;border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FSCTxblIncmAttrblBoycottOpr"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<!-- Display blank filler rows. If the Print parameter is Separated and the number of rows exceeds the -->
							<!-- container height, then display a message in the first row directing the user to the additional data table -->
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 1 or
       (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:24mm;text-align:left;font-size:7pt;border-color:black;">
										<span style="float:left;font-weight:bold;">a</span>
										<span style="width:1.5mm;"/>
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form5713BData/OperationTaxesAndIncome"/>
											<xsl:with-param name="ShortMessage" select="'true'"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:33mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:33mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:33mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:33mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 2 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">b<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 3 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">c<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 4 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">d<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 5 or 
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">e<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 6 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">f<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 7 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">g<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 8 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">h<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 9 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">i<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 10 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">j<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 11 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">k<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 12 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">l<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt; 13 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">m<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="count($Form5713BData/OperationTaxesAndIncome) &lt;14 or
         (($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome)&gt;14)) ">
								<tr>
									<td class="styTableCell" style="width:60mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">n<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:14mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:16mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="width:34mm;border-color:black;border-right:none;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="styTableCell" colspan="3" style="width:48mm;text-align:left;font-weight:bold;font-size:7pt;border-color:black;">o<span style="width:3mm;"/> Total
        <!--dotted line-->
									<span style="letter-spacing:4mm;">......<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="Right pointing arrow large image" width="6"/>
									</span>
								</td>
								<td class="styTableCell" style="width:34mm;text-align:right;font-size:7pt;border-color:black;" nowrap="yes">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713BData/TotBoycottOperationsForeignTxs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:34mm;text-align:right;font-size:7pt;border-color:black;" nowrap="yes">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713BData/TotIntntlBoycottIncmPrortShare"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:34mm;text-align:right;font-size:7pt;border-color:black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713BData/TotICDISCTxblIncmAttrblByctOpr"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" style="width:34mm;text-align:right;font-size:7pt;border-color:black;border-right-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5713BData/TotFSCTxblIncmAttrblBoycottOpr"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form5713BData/OperationTaxesAndIncome"/>
						<xsl:with-param name="containerHeight" select="14"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'TP1ctn' "/>
					</xsl:call-template>
					<!--Begin Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div class="stySmallText" style="width:110mm;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the instructions for Form 5713.</span>
						</div>
						<div class="stySmallText" style="width:20mm;">Cat. No. 12060S</div>
						<div class="stySmallText" style="width:56mm;text-align:right">
							<span class="styBoldText">Schedule B (Form 5713) (Rev. 12-2004)</span>
						</div>
					</div>
					<!--End Footer-->
					<br/>
					<!-- BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form5713BData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table for Separated Data from Schedule B Table -->
					<xsl:if test="($Print = $Separated) and (count($Form5713BData/OperationTaxesAndIncome) &gt; 14) ">
						<span class="styRepeatingDataTitle">
        Form 5713 Schedule B Table - Specifically Attributable Taxes and Income by Operation
      </span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-bottom:none;"/>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:40mm;text-align:center;">Principal business activity</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;">Foreign tax credit  </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;">Subpart F income  </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;">IC-DISC income</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;">FSC   income</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;border-top:none;border-bottom:none;">Name of country</th>
									<th class="styDepTblCell" scope="col" style="width:13mm;text-align:center;border-bottom:none;">Code</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;text-align:center;border-bottom:none;">Description</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-bottom:none;">
              Foreign taxes attributable to boycott operations
            </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-bottom:none;">
              Prorated share of international boycott income
            </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-bottom:none;">
              Taxable income attributable to boycott operations
            </th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-bottom:none;">
              Taxable income attributable to boycott operations
            </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;border-top:none">(1)</th>
									<th class="styDepTblCell" scope="col" style="width:13mm;text-align:center;border-top:none">(2)</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;text-align:center;border-top:none">(3)</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-top:none">(4)</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-top:none">(5)</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-top:none">(6)</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;text-align:center;border-top:none">(7)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5713BData/OperationTaxesAndIncome">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:20mm;text-align:left;">
											<span style="float:left;font-weight:bold;">
												<xsl:number value="position()" format="a"/>
											</span>
											<span style="width:1.5mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryName"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:13mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PBACode"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:27mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PBADescription"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BoycottOperationsForeignTaxes"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntntlBoycottIncmProratedShare"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:center;">
											<span style="width:1px;"/>
										</td>
										<td class="styDepTblCell" style="width:32mm;text-align:center;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr class="styDepTblHdr">
									<td class="styDepTblCell" colspan="3" style="width:60mm;text-align:left;font-weight:bold;">
										<span style="width:3mm;"/> Total
              <span style="letter-spacing:4mm;">
                .........<img src="{$ImagePath}/5713SchB_Bullet.gif" alt="Right pointing arrow large image" width="6"/>
										</span>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5713BData/TotBoycottOperationsForeignTxs"/>
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5713BData/TotIntntlBoycottIncmPrortShare"/>
											<xsl:with-param name="WhiteFont">true</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<span style="width:1px;"/>
									</td>
									<td class="styDepTblCell" style="width:32mm;text-align:right;">
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!-- End of Schedule B Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!--   <xsl:choose>
                   <xsl:when test="$Form5713AData/IdentifyingNumber = '' or not($Form5713AData/IdentifyingNumber)">
                           <xsl:call-template name="PopulateReturnHeaderFiler">
                                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                          </xsl:call-template> 
                  </xsl:when>
 
                 <xsl:when test="$Form5713AData/IdentifyingNumber">
                         <xsl:call-template name="PopulateEIN">
                                <xsl:with-param name="TargetNode" select="$Form5713AData/IdentifyingNumber" />
                         </xsl:call-template>
                 </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
      </xsl:choose>

       <xsl:if test="$Form5713AData/MissingEINReason">
              <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form5713AData/MissingEINReason" />
             </xsl:call-template>
        </xsl:if> -->
