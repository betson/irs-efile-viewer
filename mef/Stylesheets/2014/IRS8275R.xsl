<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8275RStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8275RData" select="$RtnDoc/IRS8275R"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8275RData)"/>
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
				<meta name="Description" content="Form IRS8275R"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--NOTE: Part I table will display 6 rows of data per PDF, prior to displaying scroll bar/separated format.
					    Part II table will display 10 rows of data per PDF, prior to displaying scroll bar/separated format. 
							EXCEPTION: THERE IS NO PART IV or page 2 of Part III for continuing of part 1 and 2 table 
						  since Style sheet can display data continuously inline and separated print -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8275RStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8275R">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Title of the form -->
					<div style="width:187mm;height:22mm;" class="styTBB">
						<div style="width:30mm;height:22mm;" class="styFNBox">
							<div style="height:13.5mm;">Form<span class="styFormNumber" style="font-size: 18pt;">  8275-R</span>
								<br/>
								<div style="font-size:normal">(Rev. August 2013) </div>
								<br/>
							</div>
							<div style="height:5mm;padding-top:1.0mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:22mm;" >
							<div class="styMainTitle" style="height:8mm;padding-top:1mm;" >
                Regulation Disclosure Statement
							</div>
							<div class="styFST" style="height:10mm;font-size:7pt;font-weight: bold;">
                Use this form only to disclose items or positions that are contrary to Treasury <br/>
                regulations. For other disclosures, use Form 8275, Disclosure Statement. <br/>                
                <span style="text-align:center;margin-left:0mm;font-size:6.5pt;">
									<img src="{$ImagePath}/8275-R_Bullet.gif" alt="Bullet Image"/> 
									Information about Form 8275-R and its separate instructions is at 
									<a href="http://www.irs.gov/form8275" title="Link to IRS.gov"><i>www.irs.gov/form8275.</i></a>
								</span>
							</div>							
							<div  class="styFST">
								<img src="{$ImagePath}/8275-R_Bullet.gif" alt="Bullet Image"/>
                Attach to your tax return.
							</div>
						</div>
						<div style="width:30mm;height:22mm;" class="styTYBox">
							<div style="height:8mm;padding-top:2mm;padding-left:.5mm;" class="styOMB">
                OMB No. 1545-0889
              </div>
							<div class="styOMB" style="height:10mm;border-bottom-width:0px;padding-top:1mm;text-align:left;padding-left:2mm;">
                Attachment <br/>
                Sequence No. <span class="styBoldText" style="font-size:9pt;">92A</span>
							</div>
						</div>
					</div>
					<!-- Title of the form -->
					<!-- Name and EIN/SSN (return header)  -->
					<div style="width:187mm;height:10mm;" class="styBB">
						<div style="width:130mm;height:10mm;font-weight:normal;font-size:7pt;" class="styNameBox">
							  Name(s) shown on return<br/>
							  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
							  <xsl:choose>
							  <!-- Name from 1120/990/1065 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!-- Name from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!-- Name from 1041 Return Header 
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								  </xsl:call-template>
								  <br/>
								</xsl:when> -->
							  </xsl:choose>
						</div>
						<div style="width:56mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
              Identifying number shown on return
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
								<xsl:choose>
								  <xsl:when test="$RtnHdrData/Filer/EIN">
									<xsl:call-template name="PopulateReturnHeaderFiler">
									  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								  </xsl:when>
								  <xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
									  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								  </xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Name and EIN/SSN (return header)  -->
					<!-- Foreign Entity - Name, EIN (input) and Reference ID -->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:187mm;">
			If Form 8275-R relates to an information return for a foreign entity (for example, Form 5471), enter:
						</div>
						<div class="styLNDesc" style="width:35mm;float:left;">
              Name of foreign entity
              <img src="{$ImagePath}/8275-R_Bullet.gif" alt="Bullet Image"/>
						</div>
						<div class="styUnderlineAmount" style="width:152mm;text-align:left;height:auto;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8275RData/ForeignEntityName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8275RData/ForeignEntityName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:55mm;">
              Employer identification number, if any
              <img src="{$ImagePath}/8275-R_Bullet.gif" alt="Bullet Image"/>
						</div>
						<div class="styUnderlineAmount" style="width:132mm;text-align:left">
						<xsl:choose>
						<xsl:when test="$Form8275RData/ForeignEntityEIN">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8275RData/ForeignEntityEIN"/>
							</xsl:call-template>
							</xsl:when>
							 <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8275RData/EINMissingReasonCd"/>
                </xsl:call-template>
              </xsl:otherwise>
               </xsl:choose>
						</div>
					</div>
					<!-- Shaw Anita ask for the additional data table when there are multipule "Reference ID number". UWR89180/82576  and the response email at 8/16/2013-->
					<div class="styBB" style="width:187mm;">
						<div class="styLNDesc" style="width:58mm;">
              Reference ID number (see instructions)
              <img src="{$ImagePath}/8275-R_Bullet.gif" alt="Bullet Image"/>
						</div>
						<div class="styLNDesc" style="width:129mm;text-align:left">
							<xsl:choose>
								<xsl:when test="count($Form8275RData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1">
									See Additional Data Table
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8275RData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Foreign Entity - Name, EIN (input) and Reference ID -->
					<!-- Begin Part I - General Information-->
					<div style="width:187mm;" class="styBB">
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styPartName" style="width:15mm;">Part I</div>
							<div class="styPartDesc" style="padding-left:3mm;width:100mm;">
                General Information <span class="styNormalText">(see instructions)</span>
							</div>
							<div style="float:right;margin-top:2.8mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'TPctn' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styTableContainer" id="TPctn" style="height:auto">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
							<thead class="styTableThead">
								<tr style="height:6mm;">
									<th class="styTableCellHeader" style="width:45mm;border-color:black;" scope="col">
                    (a)<br/>
                    Regulation Section   
                  </th>
									<th class="styTableCellHeader" style="width:23mm;border-color:black;" scope="col">
                    (b)<br/>
										Item or Group of Items 
									</th>
									<th class="styTableCellHeader" style="width:58mm;border-right-width:0px;border-color:black;" scope="col">
                    (c)<br/>
                    Detailed Description <br/>
                    of Items
                  </th>
									<th class="styTableCellHeader" style="width:23mm;border-left-width:1px;border-color:black;" scope="col">
                    (d)<br/>
                    Form or <br/>
                    Schedule
                  </th>
									<th class="styTableCellHeader" style="width:13mm;border-color:black;padding-left:4mm" scope="col">
                    (e)<br/>
                    Line No.
                  </th>
									<th class="styTableCellHeader" style="width:24mm;border-color:black;border-right-width:0px;" scope="col">
                    (f)<br/>
                    Amount 
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:choose>
									<xsl:when test="$Form8275RData/DisclosureGeneralInformation">
										<xsl:if test="($Print != $Separated) or (count($Form8275RData/DisclosureGeneralInformation) &lt;6) ">
											<xsl:for-each select="$Form8275RData/DisclosureGeneralInformation">
												<tr style="height:10mm;">
													<td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;">
														<xsl:if test="position() = last() and position() &gt;= 3">
															<xsl:attribute name="style">width:45mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:1px;</xsl:attribute>
														</xsl:if>
														<xsl:choose>
															<!-- Line number control -->
															<xsl:when test="position() &lt;99 ">
																<span style="width:3mm;font-weight:bold;">
																	<xsl:value-of select="position()"/>
																</span>
															</xsl:when>
															<xsl:otherwise>
																<span style="width:3mm;"/>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CitationNm"/>
														</xsl:call-template>
													</td>
													<td class="styTableCell" style="width:23mm;text-align:left;border-color:black;vertical-align:top;">
														<xsl:if test="position() = last() and position() &gt; 6">
															<xsl:attribute name="style">width:23mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DisclosureItemNm"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:58mm;border-style:solid;border-right-width:0px;text-align:left;border-color:black;vertical-align:top;">
														<xsl:if test="position() = last() and position() &gt; 6">
															<xsl:attribute name="style">width:58mm;border-style:solid;border-right-width:0px;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DetailedItemDesc"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;vertical-align:top;">
														<xsl:if test="position() = last() and position() &gt; 6">
															<xsl:attribute name="style">width:23mm;border-left-width:1px;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:13mm;text-align:left;border-color:black;vertical-align:top;">
														<xsl:if test="position() = last() and position() &gt;6">
															<xsl:attribute name="style">width:13mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LineNum"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:24mm;text-align:right;border-color:black;border-right-width:0px;vertical-align:top;">
														<xsl:if test="position() = last() and position() &gt;6">
															<xsl:attribute name="style">width:24mm;text-align:right;border-color:black;border-right-width:0px;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Build Blank Row 1 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 1 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">1</xsl:with-param>
												<xsl:with-param name="IsSeparated">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- Build Blank Row 2 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 2 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">2</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- Build Blank Row 3 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 3 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">3</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- Build Blank Row 4 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 4 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">4</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- Build Blank Row 5 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 5 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">5</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<!-- Build Blank Row 6 of Part I table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation) &lt; 6 or          ((count($Form8275RData/DisclosureGeneralInformation) &gt;= 6) and ($Print = $Separated))">
											<xsl:call-template name="populateirs8275Rpartiemptycells">
												<xsl:with-param name="index">6</xsl:with-param>
												<xsl:with-param name="end">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">1</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">2</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">3</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">4</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">5</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8275Rpartiemptycells">
											<xsl:with-param name="index">6</xsl:with-param>
											<xsl:with-param name="end">true</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
					<!-- Begin Part II Detailed Explanation-->
					<div style="width:187mm;height:6mm;" class="styBB">
						<div class="styPartName" style="width:15mm;margin-top:1.5mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;margin-top:1.5mm;width:100mm;">
              Detailed Explanation <span class="styNormalText">(see instructions.)</span>
						</div>
						<div style="float:right;margin-top:2.8mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'DEctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Probably as it as PDF can be shown only when there is no data -->
					<xsl:choose>
						<xsl:when test="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc">
							<div class="styTableContainer" id="DEctn" style="height:;">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
									<thead class="styTableThead"/>
									<tfoot/>
									<tbody>
										<xsl:if test="($Print != $Separated) or          (count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt;=3) ">
											<xsl:for-each select="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc">
												<tr style="height:15mm;">
													<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
														<xsl:if test="position()=last() and position() &gt;= 3">
															<xsl:attribute name="style">width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<!-- line number control -->
														<xsl:if test="position() &lt;99 ">
															<xsl:value-of select="position()"/>
														</xsl:if>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
														<xsl:if test="position()=last() and position() &gt;= 3">
															<xsl:attribute name="style">text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="current()"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<!-- Build blank row 1 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 1 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">1<span class="styTableCellPad"/></td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- Build blank row 2 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 2 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                          2<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- Build blank row 3 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 3 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                          3<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- Build blank row 4 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 4 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                          4<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- Build blank row 5 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 5 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                          5<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<!-- Build blank row 6 data for Part II Table -->
										<xsl:if test="count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 6 or ((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                          6<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
											<tr style="height:5mm;">
												<td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">1</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">2</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">3</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">4</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">5</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
							<div style="width:187mm;height:21mm;" class="styBB">
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">6</div>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styBB">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
								<div style="width:187mm;height:7mm;" class="styGenericDiv">
									<div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
									<div class="styGenericDiv" style="width:184mm;"/>
								</div>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc and not((count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc"/>
							<xsl:with-param name="containerHeight" select="6"/>
							<xsl:with-param name="headerHeight" select="0"/>
							<xsl:with-param name="containerID" select=" 'DEctn' "/>
						</xsl:call-template>
					</xsl:if>
					<!-- Begin Part III Information about Pass-Through Entity-->
					<div class="styBB" style="width:187mm;height:8mm;float:none;" >
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
              Information About Pass-Through Entity. 
							<span class="styNormalText">To be completed by partners, shareholders, beneficiaries,</span>
							<span class="styNormalText">or residual interest holders.</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;" >
						<div class="styGenericDiv" style="width:186mm;height:4mm;font-weight:bold;float:none;" >
              Complete this part only if you are making adequate disclosure for a pass-through item.
						</div>
						<div class="styGenericDiv" style="width:187mm;height:8mm;float:none;" >
							<span class="styBoldText" style="height:8mm;width:180mm">Note:
						<!--	<span class="styItalicText" style="height:20mm;width:179mm;background-color:red">-->
								<!-- <span style="width:1px;"/> -->
				A pass-through entity is a partnership, S corporation, estate, 
                trust, regulated investment company (RIC), real estate  <span style="width:9mm"/>investment             
							
				trust (REIT), or real estate mortgage investment conduit (REMIC).
								
							</span><!--</span>-->
						</div>
					</div>
					<!-- Line 1 Name and Address-->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styIRS8275LeftLine" style="width:93mm;height:27mm;">
							<div class="styLNLeftNumBox" style="width:5mm;padding-top:0mm;">1</div>
							<div style="padding-top:0mm;padding-bottom:.5mm;">
      Name, address, and ZIP code of pass-through entity<br/>
							</div>
							<div class="styGenericDiv">
                <!--Name (input Indivdual vs Business)-->
								<xsl:choose>
									<xsl:when test="$Form8275RData/PassThroughEntityBusName/BusinessNameLine1Txt !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityBusName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="$Form8275RData/PassThroughEntityBusName/BusinessNameLine2Txt !=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityBusName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityIndivNm"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
								<!--Address (input US vs Foreign)-->
								<xsl:choose>
									<xsl:when test="$Form8275RData/PassThroughEntityUSAddress">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityUSAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityFrgnAddress"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="styIRS8275LeftLine" style="width:93mm;height:27mm;border-right-width:0px;">
							<!-- Line 2 EIN/SSN/MissingEIN-->
							<div style="width:93mm;height:8mm;" class="styBB">
								<div class="styLNLeftNumBox" style="padding-top:0mm;width:5mm;text-align:center;">2</div>
                Identifying number of pass-through entity<br/>
								<xsl:choose>
									<xsl:when test="$Form8275RData/PassThroughEntitySSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntitySSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form8275RData/PassThroughEntityEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityEIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8275RData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<!-- Line 3 Tax period-->
							<div style="width:93mm;height:8mm;" class="styBB">
								<div class="styLNLeftNumBox" style="padding-top:0mm;width:5mm;text-align:center;">3</div>
                Tax year of pass-through entity<br/>
								<span style="width:30mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityTaxYearFromDt"/>
									</xsl:call-template>
								</span>
								<span style="width:20px;"/>to<span style="width:20px;"/>
								<span style="width:30mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8275RData/PassThroughEntityTaxYearToDt"/>
									</xsl:call-template>
								</span>
							</div>
							<!-- Line 4 Filing Service Center-->
							<div style="width:93mm;height:11mm;">
								<div class="styLNLeftNumBox" style="padding-top:0mm;width:5mm;text-align:center;">4</div>
                Internal Revenue Service Center where the pass-through entity filed its return
                <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part III Line 4 - Service Center where the pass-through entity filed its return</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form8275RData/ServiceCenterWhereRetFiledCd/@efileCd"/>
								</xsl:call-template>
								<br/>
								<div class="styLNLeftNumBox" style="padding-top:0mm;width:5mm;text-align:center;"/>
								<span style="width:30mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8275RData/ServiceCenterWhereRetFiledCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					 <!-- Begin Footer -->
      <div class="pageEnd" style="width:187mm;padding-top:1mm;">
        <div style="float:left;">
             <span class="styBoldText" >For Paperwork Reduction Act Notice, see separate instructions</span>
             <span style="width:10px;"></span>
              Cat. No. Cat. No. 14594X
            </div>
            <div style="float:right;">
             <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8275-R</span> (Rev. 8-2013)</div>
        </div>
      </div>
      <!-- End Footer -->
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
					<!--footer -->
				<!--	<div style="width:187mm;clear:both;padding-top:1mm;">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 14594X</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8275-R</span> (Rev. 8-2013)</div>
					</div><br/>-->
					<!-- AFter talking to Charlie and Andy it has been decided to remove the Page 2 from the stylesheet -->
				<!--	<p class="pageend" style="border:0 solid green;"/>-->
					<!--*****ADDITIONAL DATA************************************ -->
	<!--				--><!-- BEGIN Left Over Table --><!-- <br/> 
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
					--><!--<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>-->
					<!-- Additional Data Table-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8275RData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III Line 4 - Service Center where the pass-through entity filed its return</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8275RData/ServiceCenterWhereRetFiledCd/@efileCd"/>
						</xsl:call-template>
					</table>
					<!-- BEGIN Reference ID number Separated Repeating Data-->
					<xsl:if test="count($Form8275RData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum)  &gt; 1">
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;text-align:left;">
									Reference ID number
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$Form8275RData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				  </xsl:if>
					<!-- BEGIN Part I table Separated Repeating Data  -->
					<xsl:if test="($Print = $Separated) and (count($Form8275RData/DisclosureGeneralInformation) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 8275-R, Part I -  General Information:</span>
						<table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:42mm;" scope="col">
                    (a)<br/>
                    Citation name   
                  </th>
									<th class="styDepTblCell" style="width:23mm;" scope="col">
                    (b)<br/>
                    Disclosure Item Name
                  </th>
									<th class="styDepTblCell" style="width:53mm;" scope="col">
                    (c)<br/>
                    Detailed Description <br/>
                    of Items
                  </th>
									<th class="styDepTblCell" style="width:23mm;" scope="col">
                    (d)<br/>
                    Form or <br/>
                    Schedule
                  </th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
                    (e)<br/>
                    Form Or Schedule Line Number
                  </th>
									<th class="styDepTblCell" style="width:30mm;" scope="col">
										(f)<br/>
										Disclosed item amount
                  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8275RData/DisclosureGeneralInformation">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:42mm;vertical-align:top;text-align:left;">
											<span style="width:5mm;font-weight:bold;">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CitationNm"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DisclosureItemNm"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:53mm;text-align:left;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DetailedItemDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:13mm;text-align:left;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:30mm;text-align:right;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- BEGIN Part II table Separated Repeating Data -->
					<xsl:if test="($Print = $Separated) and (count($Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3)">
						<span class="styRepeatingDataTitle">Form 8275-R, Part II -  Detailed Explanation:</span>
						<table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8275RData/DisclosureGeneralInformation/DetailedExplanationDesc">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:5mm;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;padding-right:0px;">
											<xsl:number value="position()" format="1"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align:left;width:182mm;text-align:left;vertical-align:top;border-left-width:0px;padding-left:0.5px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="current()"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!--*****ADDITIONAL DATA************************************ -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Template for Partial?-->
	<xsl:template name="populateirs8275Rpartiemptycells">
		<xsl:param name="index"/>
		<xsl:param name="end">false</xsl:param>
		<xsl:param name="IsSeparated">false</xsl:param>
		<tr style="height:12mm;">
			<xsl:if test="($end = 'false')">
				<td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;">
					<span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;width:3mm;">
						<xsl:value-of select="$index"/>
					</span>
					<xsl:if test="$IsSeparated != 'false' ">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form8275RData/DisclosureGeneralInformation"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="width:23mm;text-align:left;border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:58mm;border-right-width:0px;text-align:left;border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:13mm;text-align:left;border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:24mm;border-color:black;border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</xsl:if>
			<xsl:if test="($end != 'false')">
				<td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;">
					<span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;">
						<xsl:value-of select="$index"/>
					</span>
				</td>
				<td class="styTableCell" style="width:23mm;text-align:left;border-color:black;border-bottom-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:58mm;text-align:left;border-color:black;border-right-width:0px;nborder-bottom-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;border-bottom-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:13mm;text-align:left;border-color:black;border-bottom-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:24mm;border-color:black;border-right-width:0px;border-bottom-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
</xsl:stylesheet>
