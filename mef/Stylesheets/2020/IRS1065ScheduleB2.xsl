<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Steven Fook on 4/30/2019 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleB2Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065SchB2Data" select="$RtnDoc/IRS1065ScheduleB2"/>
	<!-- Part II - Header -->
	<xsl:template name="Part2A">
		<xsl:param name="NodeData" select="/.."/>
						<xsl:variable name="containerPos">SCorpShareholderListGrp<xsl:number value="position()"/>
						</xsl:variable>
				<xsl:if test="count($NodeData/ShareholderGrp) &gt;12">
					<span class="styRepeatingDataTitle">
						  Form 1065 Schedule B-2, Part II, List of S Corporation Shareholders</span>
							<span style="font-size:7pt;vertical-align:top;">Name of S Corporation Partner</span>
								<span style="width:4px"/>
								<span>
							<xsl:choose>
								<xsl:when test="$NodeData/PartnerBusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$NodeData/PartnerBusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
							</span>

							<span style="width:4px"/>
								TIN of Partner
							<span style="width:10px"/>
							<span>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$NodeData/EIN"/>
								</xsl:call-template>
							</span>
			<div class="styTableContainer" >
				<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styDepTbl" style="font-size:6.5pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle"></th>
									<th class="styDepTblCell" scope="col" valign="middle">Name of Shareholder</th>
									<th class="styDepTblCell" scope="col" valign="middle">Shareholder TIN</th>
									<th class="styDepTblCell" scope="col" valign="middle">Type of Person<br/>(Code)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$NodeData/ShareholderGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:10mm;">
												<span style="float:left;">
													<xsl:value-of select="position()"/>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:100mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="$NodeData/ShareholderGrp/ShareholderBusinessName/BusinessNameLine1Txt">
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/ShareholderBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$NodeData/ShareholderGrp/ShareholderBusinessName/BusinessNameLine2Txt">
																<br/>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/ShareholderBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/ShareholderPersonNm"/>
															</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:50mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="MissingEINReasonCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/SSN"/>
															</xsl:call-template>
														</xsl:otherwise>
												</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:27mm;">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp/EntityTypeCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
						<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$NodeData/SCorpShareholderListGrp/ShareholderGrp"/>
						<xsl:with-param name="containerHeight" select="12"/>
						<xsl:with-param name="containerID" select="$containerPos"/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
				</xsl:if>
	</xsl:template>
	<xsl:template name="Part2">
		<xsl:param name="NodeData" select="/.."/>
						<xsl:variable name="containerPos">SCorpShareholderListGrp<xsl:number value="position()"/>
						</xsl:variable>
					<p style="page-break-before: always" />
					<div style="width:187mm;height:16mm;border-style:solid; border-bottom-width:0px;border-top-width:0px;border-right-width:0px;border-left-width:0px;padding-bottom:1mm;float:left;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:9pt">Part II</span>
						<span style="width:172mm;font-size:9pt;height:4mm" class="styPartDesc">
							List of S Corporation Shareholders <span style="font-weight:normal;"> (For each S corporation partner, complete a separate Part II, if needed.)</span><br/>
							<span style="font-weight:normal;">
					         Use the following codes under Type of Person:<br/>
					         I – Individual
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>E – Estate of Deceased Shareholder
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>T – Trust
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>O – Other
					         </span>
					    </span>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="width:135mm;height:8mm;border-right-width:1px;font-size:7pt;">
							<span style="padding-top:1mm;">Name of<br/>
										S Corporation Partner</span>
										<span style="width:4px"/>
							<span>
							<xsl:choose>
								<xsl:when test="$NodeData/PartnerBusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$NodeData/PartnerBusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$NodeData/PartnerBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;height:8mm;font-size:7pt;font-weight:normal;padding-top:4mm;padding-left:2mm;">
							TIN of Partner
							<span style="width:20px"/>
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$NodeData/EIN"/>
							</xsl:call-template>						
						</div>
					</div>
					<!-- Part II List of S Corporation Shareholders -->
					<div class="styBB" style="width:187mm;border-bottom:none">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp"/>
								<xsl:with-param name="containerHeight" select="12"/>
								<!--<xsl:with-param name="containerID" select=" 'REPtblb' "/>-->
								<xsl:with-param name="containerID" select="$containerPos"/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
			<div class="styTableContainer" >
				<xsl:attribute name="id"><xsl:value-of select="$containerPos"/></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead" style="height:10mm;">
								<tr>
									<th class="styTableCellHeader" style="width:10mm;vertical-align:center;font-size:6.5pt;border-right-width:0px;" scope="col"/>
									<th class="styTableCellHeader" style="width:100mm;vertical-align:center;font-size:6.5pt;" scope="col">
                                        <span class="styNormalText">Name of Shareholder</span>
									</th>
									<th class="styTableCellHeader" style="width:50mm;vertical-align:center;font-size:6.5pt;" scope="col">
										<span class="styNormalText">Shareholder TIN</span>
									</th>
									<th class="styTableCellHeader" style="width:27mm;vertical-align:center;font-size:6.5pt;padding-top:3mm;border-right-width:0px;" scope="col">
										<span class="styNormalText">Type of Person<br/>
                                                      <span class="styNormalText">(Code)</span>
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$NodeData/ShareholderGrp">
									<xsl:if test="($Print != $Separated) or (count($NodeData/ShareholderGrp) &lt;=12)">
										<tr style="font-size: 6.5pt;height:4mm">
											<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">
												<xsl:value-of select="position()"/>
											</td>
											<td class="styTableCellText" style="width:100mm;text-align:left;vertical-align:top">
												<xsl:choose>
													<xsl:when test="ShareholderBusinessName/BusinessNameLine1Txt">
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:50mm;text-align:center;vertical-align:top">
												<xsl:choose>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:27mm;text-align:center;vertical-align:top;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityTypeCd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 1 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">1
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$NodeData/ShareholderGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 2 or ((count($NodeData/ShareholderGrp) &gt;12) and  ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">2
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 3 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">3
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 4 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">4
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 5 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">5
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 6 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">6
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 7 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">7
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 8 or ((count($NodeData/ShareholderGrp) &gt;12) and  ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">8
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 9 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">9
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 10 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">10
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 11 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">11
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($NodeData/ShareholderGrp) &lt; 12 or ((count($NodeData/ShareholderGrp) &gt;12) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">12
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$NodeData/SCorpShareholderListGrp"/>
						<xsl:with-param name="containerHeight" select="12"/>
						<xsl:with-param name="containerID" select="$containerPos"/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
				</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065SchB2Data)"/>
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
				<meta name="Description" content="IRS Form 1065 Schedule B2"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleB2Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065ScheduleB2">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header - Form1065SchB-1 Number, Title, and Year -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:2px;">
							<span class="styFormNumber" style="font-size:10pt;">SCHEDULE B-2
							   <span style="font-size:9pt;">(Form 1065)</span>
							   <br/>
							   <span style="font-size:7pt;font-weight:normal">(December 2018)</span>
							</span>
							<br/>
							<span class="styAgency" style="height:4mm;padding-top:2mm;">
                                                 Department of the Treasury<br/>
                                                 Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
						  <div class="styMainTitle" style="padding-top:1mm;">Election Out of the Centralized Partnership Audit Regime</div>
							<div class="styFST" style="height:4mm;padding-top:6mm;font-size:8pt">
								<img src="{$ImagePath}/1065ScheduleB2_Bullet.gif" width="7" height="5" alt="Bullet"/>
								Attach to Form 1065 or Form 1066.<br/>
								<img src="{$ImagePath}/1065ScheduleB2_Bullet.gif" width="7" height="5" alt="Bullet"/>
								Go to <i>www.irs.gov</i>/Form 1065 for the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;border-left-width:2px;">
							<br/>
							<br/>
							<div class="styOMB" style="height:1mm;border-bottom:0px">OMB No. 1545-0123</div>
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
					<div class="styIRS1065SchB2BBText" style="width:187mm;font-size:8pt">
					  Certain partnerships with 100 or fewer partners can elect out of the centralized partnership audit regime if each partner is an individual, 
					  a C corporation, a foreign entity that would be treated as a C corporation were it domestic, an S corporation, or an estate of a deceased 
					  partner. For purposes of determining whether the partnership has 100 or fewer partners, the partnership must include all shareholders of 
					  any S corporation that is a partner. By completing Part I, you are making an affirmative statement that all of the partners in the partnership 
					  are eligible partners under section 6221(b)(1)(C) and you have provided all of the information on this schedule. 
					  See the instructions for more details, including the treatment of real estate mortgage investment conduits (REMICs).
					</div>
					<!-- Part I - Header -->
					<div style="width:187mm;height:12mm;border-style:solid; border-bottom-width:1px;border-top-width:1px;border-right-width:0px;border-left-width:0px;padding-bottom:1.5mm;float:left;">
                        <span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;">Part I</span>
						<span style="width:175mm;font-size:9pt;height:4mm" class="styPartDesc">
					         List of Eligible Partners <br/>
					         <span style="font-weight:normal;font-size:8pt;">
					         Use the following codes under Type of Partner:<br/>
					         I – Individual
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>C – Corporation
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>E – Estate of Deceased Partner
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>F – Eligible Foreign Entity
					         <xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text>S – S corporation
					         </span>
						</span>
					</div>
					<!-- Part I List of Partners-->
					<div class="styBB" style="width:187mm;border-bottom:none">
						<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/PartnerListGrp"/>
								<xsl:with-param name="containerHeight" select="15"/>
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
							<thead class="styTableThead" style="height:10mm;">
								<tr>
									<th class="styTableCellHeader" style="width:10mm;vertical-align:center;font-size:6.5pt;border-right-width:0px;" scope="col"/>
									<th class="styTableCellHeader" style="width:100mm;vertical-align:center;font-size:6.5pt;" scope="col">
                                        <span class="styNormalText">Name of Partner</span>
									</th>
									<th class="styTableCellHeader" style="width:50mm;vertical-align:center;font-size:6.5pt;" scope="col">
										<span class="styNormalText">Taxpayer Identification Number (TIN)</span>
									</th>
									<th class="styTableCellHeader" style="width:27mm;vertical-align:center;font-size:6.5pt;padding-top:3mm;border-right-width:0px;" scope="col">
										<span class="styNormalText">Type of Partner<br/>
                                                      <span class="styNormalText">(Code)</span>
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB2Data/PartnerListGrp">
									<xsl:if test="($Print != $Separated) or (count($Form1065SchB2Data/PartnerListGrp) &lt;=15)">
										<tr style="font-size: 6.5pt;height:4mm">
											<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">
												<xsl:number level="any"/>
											</td>
											<td class="styTableCellText" style="width:100mm;text-align:left;vertical-align:top">
												<xsl:choose>
													<xsl:when test="PartnerBusinessName">
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
													<xsl:if test="PartnerBusinessName/BusinessNameLine2Txt">
																<br/>
														<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:50mm;text-align:center;vertical-align:top">
												<xsl:choose>
													<xsl:when test="EIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellText" style="width:27mm;text-align:center;vertical-align:top;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityTypeCd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;1 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">1
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;font-size:6.5pt;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/PartnerListGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;2 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and  ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">2
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;3 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">3
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;4 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">4
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;5 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">5
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;6 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">6
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;7 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">7
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;8 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and  ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">8
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;9 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">9
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;10 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">10
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;11 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">11
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;12 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">12
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;13 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">13
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt; 14 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">14
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1065SchB2Data/PartnerListGrp) &lt;15 or ((count($Form1065SchB2Data/PartnerListGrp) &gt;15) and ($Print = $Separated))">
									<tr style="height:4mm">
										<td class="styTableCellText" style="width:10mm;font-size:8pt;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;">15
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:100mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellText" style="width:50mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCellCtr" style="width:27mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/PartnerListGrp"/>
						<xsl:with-param name="containerHeight" select="15"/>
						<xsl:with-param name="containerID" select=" 'REPtbl' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->

					<xsl:for-each select="$Form1065SchB2Data/SCorpShareholderListGrp">
						<xsl:if test="position() &gt; 1">
								<div class="pageEnd"/>
						</xsl:if>
						<xsl:call-template name="Part2">
							<xsl:with-param name="NodeData" select="."/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($Form1065SchB2Data/SCorpShareholderListGrp) = 0">
						<xsl:call-template name="Part2"/>
					</xsl:if>

					<!-- Part III - Header -->
					<div  class="styBB" style="width:187mm;height:9mm;padding-top:1.5mm;float:left;">
						<span class="styPartName" style="height:4mm;width:15mm;font-size:9pt">Part III</span>
						<span style="width:172mm;font-size:9pt;height:4mm" class="styPartDesc">
							Total Number of Schedules K-1 required to be issued.
							<xsl:text>&#xA0;&#xA0;</xsl:text>
							<span style="font-weight:normal;">See instructions.</span>
						</span>
					</div>
					<!-- BEGIN LINE 1 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:142mm;font-size:7pt;">
							Total of Part I Schedules K-1 required to be issued by the partnership
							<span style="float:right;">
								<span class="styIRS1065SchB2DotLn">.............</span>
							</span></div>	
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/TotalSchK1IssuedPrtshpCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 1 -->
					<!-- BEGIN LINE 2 -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:142mm;font-size:7pt;">
							Total of Part II Schedules K-1 required to be issued by any S corporation partners
							<span style="float:right;">
								<span class="styIRS1065SchB2DotLn">.........</span>
							</span></div>	
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/TotalSchK1IssuedSCorpPrtnrCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END LINE 2 -->
					<!-- BEGIN LINE 3 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:142mm;font-size:7pt;font-weight:bold;">
							Total.  Add line 1 and line 2
							<span style="float:right;">
								<span class="styIRS1065SchB2DotLn">.........................</span>
							</span></div>	
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox" style="font-size:6pt;width:29mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065SchB2Data/TotalK1IssuedCnt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065SchB2BBText" style="width:187mm;">
							<b>Note:</b><span class="width:4px;"/>
							If line 3 is more than 100, the partnership cannot make the election under section 6221(b).
						</div>
					</div>
					<!-- END LINE 3 -->
					<!-- Page 1 Footer -->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;font-size:7pt">
						<div class="styBoldText" style="width:104mm;float:left;height:3mm;">
						  For Paperwork Reduction Act Notice, see the Instructions for Form 1065.
                                 </div>
						<div style="float:left;">Cat. No. 69658K</div>
						<div class="styBoldText" style="float:right;height:3mm;">
						     Schedule B-2 (Form 1065) (Rev. 12-2018)</div>
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
							<xsl:with-param name="TargetNode" select="$Form1065SchB2Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table-->
					<!-- Separated Data for Part I, List of Partners  -->
					<xsl:if test="($Print = $Separated) and (count($Form1065SchB2Data/PartnerListGrp) &gt;15)">
						<br/>
						<span class="styRepeatingDataTitle">
						Form 1065 Schedule B-2, Part I, List of Partners</span>
						<table class="styDepTbl" style="font-size:6.5pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle"></th>
									<th class="styDepTblCell" scope="col" valign="middle">Name of Partner</th>
									<th class="styDepTblCell" scope="col" valign="middle">Taxpayer Identification Number (TIN)</th>
									<th class="styDepTblCell" scope="col" valign="middle">Type of partner<br/>(Code)</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065SchB2Data/PartnerListGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:10mm;">
												<span style="float:left;">
													<xsl:number level="any"/>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;vertical-align:top">
											<div style="width:100mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="PartnerBusinessName">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
														<xsl:if test="PartnerBusinessName/BusinessNameLine2Txt">
																<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PartnerBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PartnerPersonNm"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:50mm;">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="MissingEINReasonCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:otherwise>
												</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:center;vertical-align:top">
											<div style="width:27mm;">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityTypeCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Part I, List of Partners -->
					<!-- Separated Data for Part II, List of S Corporation Shareholders  -->
					<!--<xsl:for-each select="$Form1065SchB2Data/SCorpShareholderListGrp/ShareholderGrp">-->
						<xsl:if test="($Print = $Separated) and (count($Form1065SchB2Data/SCorpShareholderListGrp/ShareholderGrp) &gt;12)">
							<xsl:for-each select="$Form1065SchB2Data/SCorpShareholderListGrp">
								<!--<xsl:if test="position() &gt; 1">
										<div class="pageEnd"/>
								</xsl:if>-->
							<xsl:call-template name="Part2A">
								<xsl:with-param name="NodeData" select="."/>
							</xsl:call-template>
							</xsl:for-each>
						</xsl:if>


						<br/>


					<!--</xsl:for-each>-->
					<!-- End Separated Data for Part II, List of S Corporation Shareholders -->

				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>