<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 10/21/2014 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065ScheduleK1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1065ScheduleK1"/>
	<xsl:template name="RowWriterCore">
		<tr>
			<td class="styLeftNumBox">
				<span style="width:1px;"/>
			</td>
			<td height="10px;" style="height:4.5mm;font-size:7pt;text-align:left;width:172mm;" class="styIRS1065ScheduleK1BBtable">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<!-- This template is called to fill in blank filler rows in Part III where multiple of rows of data -->
	<!-- may be applicable. The parameter NumOfTotRows is the set number of rows required to display on the page -->
	<!-- even if no data is populated. The parameter CurrentRowCount is the current number of rows already -->
	<!-- populated with data or blank row(s). When this template is called, a new blank row is populated in the -->
	<!-- form and the CurrentRowCount is incremented by 1. It will keep popoulating blank rows as long as -->
	<!-- CurrentRowCount is less than NumOfTotRows and stop when these two numbers are equal. -->
	<xsl:template name="AddBlankFillerRows">
		<xsl:param name="NumOfTotRows"/>
		<xsl:param name="CurrentRowCount"/>
		<!-- Test condition to populate a blank row -->
		<xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
			<!-- Recursive call to itself after incrementing the CurrentRowCount. -->
			<xsl:call-template name="AddBlankFillerRows">
				<xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
				<xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- This template displays tables populated with data of the CodeAndAmountType data types      -->
	<!-- The data is displayed in a dependency data style table. There is an optional parameter     -->
	<!-- that indicates whether to display the associated push pin that comes from the Code element -->
	<!-- By default, this field is set to false unless the caller set it to true.                   -->
	<xsl:template name="DisplayCodeAndAmountTable">
		<xsl:param name="TargetNode"/>
		<xsl:param name="CodeAndAmountTableTitle"/>
		<xsl:param name="DisplayPushPin">false</xsl:param>
		<xsl:if test="count($TargetNode) &gt; 0">
			<br/>
			<span class="styRepeatingDataTitle">
				<xsl:value-of select="$CodeAndAmountTableTitle"/>
			</span>
			<table class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableTHead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col">Code</th>
						<th class="styDepTblCell" scope="col">Amount</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<!--Define background colors to the rows -->
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--First column -->
							<td class="styDepTblCell" style="text-align:left;width:50mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
								</xsl:call-template>
								<xsl:choose>
									<xsl:when test="$DisplayPushPin = 'true'">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</td>
							<!-- Second Column -->
							<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- This template displays a line or lines of data for the IRS1065 Schedule K1 Part III Code/Amount fields -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table. -->
	<xsl:template name="DisplayPart3CodeAmountLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<span class="IRS1065ScheduleK1_codeCell">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
						</xsl:call-template>
					</span>
					<span class="IRS1065ScheduleK1_amountCell">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="Amt"/>
						</xsl:call-template>
					</span>
					<br/>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
				<span class="IRS1065ScheduleK1_codeCell" style="border-bottom:1px solid lightgrey;"/>
				<span class="IRS1065ScheduleK1_amountCell" style="text-align:left;padding-left:1px;       border-bottom:1px solid lightgrey;">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</span>
				<br/>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- This template is the same as DisplayPart3CodeAmountLine with additional display of the pushpin in the amount field. -->
	<!-- This template displays a line or lines of data for the IRS1065 Schedule K1 Part III Line 10 Code/Amount fields     -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is              -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table.              -->
	<xsl:template name="DisplayPart3CodeAmountAddlDataLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
				<xsl:for-each select="$TargetNode">
					<tr>
						<td style="font-size:7pt;font-family:Verdana;width:6mm;height:8mm;vertical-align:bottom;         padding-bottom:2px;border-right:1px solid black;border-bottom:1px solid lightgrey;         text-align:center;border-left:0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
							</xsl:call-template>
						</td>
						<td style="border-bottom:1px solid lightgrey;width:5mm;height:8mm;text-align:left;padding-left:2px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
							</xsl:call-template>
						</td>
						<td style="vertical-align:bottom;font-size:7pt;font-family:Verdana;float:right;width:41.5mm;   border-bottom:1px solid lightgrey;text-align:right;height:8mm;padding-bottom:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
				<tr>
					<td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;        border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
						<span class="styTableCellPad"/>
					</td>
					<td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;        padding-top:4mm;text-align:left;padding-left:1px;">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
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
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1065ScheduleK1"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleK1Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Standard Header -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- Form Display Starts Here -->
				<!--
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Top row: td   (6711)                                              
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Second row: td  (checkboxes)                             
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Middle row:                                                           
                    |  one td                             second td                       
                    |  +~~~~~~~~~~~~~~~~+ | +~~~~~~~~~~~~~~~~~  
                    |   |   with new table         with new tables      
                    |   |       Header                    header                  
                    |   |       Part I                        Part III                    
                    |   |       Part II                       +~~~~~~~~~~~~ 
                    |   |                                       | 1-12   |  13-17  
                    |   |                                       +~~~~~~~~~~~~ 
                    |  +~~~~~~~~~~~~~~~~+ |  +~~~~~~~~~~~~~~~~
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Bottom row: td                                                      
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                -->
				<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana;        font-size: 7pt;">
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="font-family: Courier New, monospace; font-size: 13pt; text-align: right;          width: 186mm;">651113</span>
						</td>
					</tr>
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="width: 186mm;">
								<span style="float: right; margin-bottom: 0.5mm;">
									<input type="checkbox" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
											<xsl:with-param name="BackupName">IRS1065ScheduleK1FinalK1</xsl:with-param>
										</xsl:call-template>
										<span style="vertical-align: bottom;">Final K-1</span>
									</label>
									<span style="width: 11mm;"/>
									<input type="checkbox" class="styCkbox" name="checkbox" id="dummyID2" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1Ind"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1Ind"/>
											<xsl:with-param name="BackupName">IRS1065ScheduleK1AmmendedK1
											</xsl:with-param>
										</xsl:call-template>
										<span style="vertical-align: bottom;">Amended K-1</span>
									</label>
									<span style="width: 11mm;"/>
                    OMB No. 1545-0123</span>
							</span>
						</td>
					</tr>
					<tr>
						<td style="width: 93mm;" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" style="border-right: 1px solid black;">
								<!-- Inner table - Header, Part I, Part II -->
								<tr>
									<td style="width: 93mm;">
										<div style="width: 93mm;">
											<!-- Width necessary to prevent table from shrinking -->
											<span class="styFormNumber" style="font-size: 10pt;padding-top:2mm; float: left;              clear: none;">Schedule K-1<br/>(Form 1065)
											    <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData"/>
												</xsl:call-template>
											</span>
											<div class="styTY" style="float: right; clear: none; padding-right: 2mm;">
											  20<span class="styTYColor">14</span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 7pt;">
                                        Department of the Treasury<br/>
										<span style="float: left; clear: none;">Internal Revenue Service</span>
										<span style="float: right; clear: none; padding-right: 1mm;">For calendar year 2014, or tax
											<br/>year beginning
											<span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
											</span>
										</span>
										<br/>
										<span style="float: left; clear:none;">
											<span style="width:2mm;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">
												Form 1065 Schedule K-1, Top Left Margin - Section 1377 (A)(2) Election Indicator
												</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/@sect1377a2Indicator"/>
											</xsl:call-template>
										</span>
										<span style="float: right; clear: both; padding-right: 1mm;">ending
                                          <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
											</span>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="styMainTitle" style="font-size: 12pt;">
										  Partner’s Share of Income, Deductions,</span>
										<br/>
										<span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits, etc.
										</span>
										<span style="float: right; clear: none; font-weight: bold; font-size: 7pt; padding-right: 1mm;             padding-top: 0.5mm;">
											<img src="{$ImagePath}/1065SchK1_Bullet.gif" width="4" height="7" alt="Right arrow image" border="0"/> See back of form and separate instructions.
											 </span>
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid black; border-top: 2px solid black; height: 5mm;            background-color: lightgrey;">
										<!-- Part I header -->
										<span class="IRS1065ScheduleK1_partName" style="margin: 2mm;">Part I</span>
										<span class="IRS1065ScheduleK1_partDesc">Information About the Partnership</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
										<!-- Line A -->
										<span style="font-weight: bold;">A</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partnership’s employer identification number</span>
										<br/>
										<span style="width: 5mm;"/>
										<!--        <xsl:choose>
                                          <xsl:when test="$FormData/PartnershipSSN">
                                            <xsl:call-template name="PopulateSSN">
                                              <xsl:with-param name="TargetNode" select="$FormData/PartnershipSSN" />
                                            </xsl:call-template>
                                          </xsl:when>
                                          <xsl:when test="$FormData/PartnershipEIN">
                                            <xsl:call-template name="PopulateEIN">
                                              <xsl:with-param name="TargetNode" select="$FormData/PartnershipEIN" />
                                            </xsl:call-template>
                                          </xsl:when>
                                        </xsl:choose>-->
					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</xsl:when>
						  <xsl:otherwise>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
					</xsl:choose>
								</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line B -->
										<span style="font-weight: bold;">B</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partnership’s name, address, city, state, and ZIP code
										</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 84mm;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 8mm;">
										<!-- Line C -->
										<span style="font-weight: bold;">C</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">IRS Center where partnership filed return</span>
										<br/>
										<span style="width: 5mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ServiceCenterWhereRetFiledCd"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 7.5mm;">
										<!-- Line D -->
										<!--<div style="float: left; clear: none;">-->
										<span style="font-weight: bold; width: 2mm;">D</span>
										<span style="width: 1mm;"/>
										<span style="width: 80mm;">
											<input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/PubliclyTradedPartnershipInd"/>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/PubliclyTradedPartnershipInd"/>
													<xsl:with-param name="BackupName">
													  IRS1065ScheduleK1PubliclyTradedPartnership</xsl:with-param>
												</xsl:call-template>
												Check if this is a publicly traded partnership (PTP)
                                            </label>
										</span>
										<!--</div>-->
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid black; border-top: 1px solid black;             height: 5mm; background-color: lightgrey;">
										<!-- Part II header -->
										<span class="IRS1065ScheduleK1_partName" style="margin: 2mm;">Part II</span>
										<span class="IRS1065ScheduleK1_partDesc">Information About the Partner</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 8.5mm;padding-bottom:0mm">
										<!-- PART II Line E -->
										<span style="font-weight: bold;">E</span>
										<span style="width: 3mm;"/>
										Partner’s identifying number<br/>
										<span style="width: 5mm;"/>
										<xsl:if test="$FormData/MissingSSNEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormData/PartnerEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormData/PartnerSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerSSN"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 24mm;">
										<!-- PART II Line F -->
										<span style="font-weight: bold;">F</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Partner’s name, address, city, state, and ZIP code</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 84mm;">
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
											  select="$FormData/PartnerName/BusinessNameLine1Txt"/>
										  </xsl:call-template>
										  <br/>
										  <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode"
											  select="$FormData/PartnerName/BusinessNameLine2Txt"/>
										  </xsl:call-template>
										  <br/>
										  <xsl:if test="$FormData/PartnerUSAddress and $FormData/PartnerUSAddress !=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" 
													 select="$FormData/PartnerUSAddress "/>
												</xsl:call-template>
											</xsl:if>
									<xsl:if test="$FormData/PartnerForeignAddress and $FormData/PartnerForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode"
													  select="$FormData/PartnerForeignAddress "/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height:10mm;">
										<!-- PART II Line G -->
										<div style="float:left;clear:none;">
											<span style="font-weight: bold; width: 2mm;height:8mm;">G</span>
											<span style="width: 3mm;"/>
											<span style="width: 40mm;height:8mm;">
												<input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/GeneralPartnerOrLLCMemMgrInd"/>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/GeneralPartnerOrLLCMemMgrInd"/>
														<xsl:with-param name="BackupName">
														  IRS1065ScheduleK1GenPartnerOrLLCMemManager</xsl:with-param>
													</xsl:call-template>
													General partner or LLC<br/>
													<span style="width:5mm;"/>member-manager
                                                </label>
											</span>
										</div>
										<div style="float:right;clear:all;">
											<span style="width: 50mm;height:8mm;">
												<input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
														<xsl:with-param name="BackupName">
														  IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
													</xsl:call-template>
													Limited partner or other LLC<br/>
													<span style="width:5mm;"/>member
												</label>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 4mm;border-top-width:0;">
										<!-- PART II Line H-->
										<xsl:choose>
											<xsl:when test="$FormData/DomesticPartnerInd">
												<div style="float:left;clear:none;">
													<span style="font-weight: bold; width: 2mm;height:4mm;">H</span>
													<span style="width: 3mm;"/>
													<span style="width: 40mm;height:4mm;">
														<input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/DomesticPartnerInd"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/DomesticPartnerInd"/>
																<xsl:with-param name="BackupName">
																IRS1065ScheduleK1DomesticPartner</xsl:with-param>
															</xsl:call-template>
															Domestic partner  
														</label>
													</span>
												</div>
												<div style="float:right;clear:all;">
													<span style="width: 50mm;height:4mm;">
														<input type="checkbox" alt="alt" class="styckbox" name="checkbox" id="dummyidforeign">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInd"/>
															</xsl:call-template>
														</input>
														<label for="dummyidforeign">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInd"/>
																<xsl:with-param name="BackupName">
																  IRS1065ScheduleK1ForeignPartner</xsl:with-param>
															</xsl:call-template>
															Foreign partner 
														</label>
													</span>
												</div>
											</xsl:when>
											<xsl:when test="$FormData/ForeignPartnerInd">
												<div style="float:left;clear:none;">
													<span style="font-weight: bold; width: 2mm;height:4mm;">H</span>
													<span style="width: 3mm;"/>
													<span style="width: 40mm;height:4mm;">
														<input type="checkbox" alt="alt" class="styckbox" name="checkbox" id="dummyiddomestic">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/DomesticPartnerInd"/>
															</xsl:call-template>
														</input>
														<label for="dummyiddomestic">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/DomesticPartnerInd"/>
																<xsl:with-param name="BackupName">
																  IRS1065ScheduleK1DomesticPartner</xsl:with-param>
															</xsl:call-template>
															Domestic partner  
														</label>
													</span>
												</div>
												<div style="float:right;clear:all;">
													<span style="width: 50mm;height:4mm;">
														<input type="checkbox" class="styckbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInd"/>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnerInd"/>
																<xsl:with-param name="BackupName">
																  IRS1065ScheduleK1ForeignPartner
																</xsl:with-param>
															</xsl:call-template>
															Foreign partner 
														</label>
													</span>
												</div>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="border-top-width:0;">
										<!-- PART II Line I1 -->
										<span style="font-weight: bold;">I1</span>
										<span style="width: 2mm;"/>What type of entity is this partner?
										<span style="width: 37mm; border-bottom: 1px solid black; text-align: left; ">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/EntityPartnerTypeDesc"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="border-top-width:0;">
										<!-- PART II Line I2 -->
										<span style="font-weight: bold;">I2</span>
										<span style="width: 1.5mm;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/PartnerRetirmentPlanInd"/>
												<xsl:with-param name="BackupName">
												  IRS1065ScheduleK1IsPartnerARetirementPlan</xsl:with-param>
											</xsl:call-template>
											If this partner is a retirement plan (IRA/SEP/Keogh/etc.),
											<input type="checkbox" class="styckbox" name="checkbox" id="dummyid">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/PartnerRetirmentPlanInd"/>
												</xsl:call-template>
											</input>
                                            <br/><span style="width: 5.5mm;"/>check here 
                                        </label>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 23mm;border-top-width:0;">
										<!-- PART II Line J -->
										<span style="font-weight: bold;">J</span>
										<span style="width: 4mm;"/>Partner’s share of profit, loss, and capital (see instructions):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp"/>
										</xsl:call-template>
										<br/>
										<br/>
										<table style="font-size:7pt;margin-left:5.3mm;" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<th/>
													<th scope="col" style="width:38mm;">Beginning</th>
													<th scope="col" style="width:38mm;">Ending</th>
												</tr>
												<tr>
													<td width="3" style="width:2mm;border:1px black solid;border-top:0px;                border-left:0;border-right:0;">Profit</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
														<span style="width:10mm;text-align:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersInterestInProfitsBOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;                text-align:right;font-size:6pt">
														<span style="width:32mm;text-align:right;font-size:6pt">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersInterestInProfitsEOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
												</tr>
												<tr>
													<td width="3" style="width:2mm;border:1px black solid;border-top:0px;                border-left:0;                border-right:0;">Loss</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
														<span style="width:16mm;text-align:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersLossesBOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;                text-align:right;font-size:6pt">
														<span style="width:32mm;text-align:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersLossesEOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
												</tr>
												<tr>
													<td width="3" style="width:2mm;border:1px black solid;border-top:0px;                border-left:0;                border-right:0;">Capital</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;font-size:6pt" align="right">
														<span style="width:16mm;text-align:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersCapitalBOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
													<td style="border:1px black solid;border-top:0px;border-left:0;border-right:0px;                text-align:right;font-size:6pt">
														<span style="width:32mm;text-align:right;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareProfitLossCapGrp/PartnersCapitalEOYRt"/>
															</xsl:call-template>%
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 17.5mm;border-top-width:0;">
										<!-- PART II Line K -->
										<span style="font-weight: bold;">K</span>
										<span style="width: 4mm;"/>Partner’s share of liabilities at year end:
										    <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOYGrp"/>
										</xsl:call-template>
										<br/>
										<table cellspacing="0" cellpadding="0" width="100%">
											<tbody>
												<tr>
													<td style="padding-left:5.8mm;">
														<span style="font-size:7pt;">
														Nonrecourse
															<!--Dotted Line-->
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
														</span>
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOYGrp/NonrecourseAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.5mm;">
														<span style="font-size:7pt;">
														  Qualified nonrecourse financing
														    <!--Dotted Line-->
															<span style="width:8px;"/>.
														</span>
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOYGrp/QualifiedNonRcrsFinancingAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.8mm;">
														<span style="font-size:7pt;">
														  Recourse 
															<!--Dotted Line-->
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.
															<span style="width:8px;"/>.                            
														</span>
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black;                 text-align:right;font-size:7pt; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersShareOfLiabilityEOYGrp/RecourseAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="IRS1065ScheduleK1_tdLeft" style="height: 50.4mm;            border-bottom:1px solid black;">
										<!-- PART II Line L -->
										<span style="font-weight: bold;">L</span>
										<span style="width: 4mm;"/>Partner’s capital account analysis:
                                        <table cellspacing="0" cellpadding="0" width="100%">
											<tbody>
												<tr>
													<td style="padding-left:5.6mm;">
														<span style="font-size:7pt;">
														  Beginning capital account</span>
														<!--Dotted Line-->
														<span style="width:8px;"/>.
														<span style="width:8px;"/>. 
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/CapitalAccountBOYAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.6mm;">
														<span style="font-size:7pt;">
                              Capital contributed during the year
                          </span>
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black;                  text-align: right; font-size:7pt;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/CapitalContributedDuringYrAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.6mm;">
														<span style="font-size:7pt;">
                              Current year increase (decrease)
                          </span>
													</td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/CurrentYrIncreaseDecreaseAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.6mm;">
														<span style="font-size:7pt;">
                              Withdrawals &amp; distributions
                              </span>
														<span style="width:8px;"/>.
                              <span style="width:8px;"/>.                     
                          </td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt;">
                              (
                              <xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/WithdrawalsAndDstrbtnsAmt"/>
															</xsl:call-template>
                              )
                            </span>
													</td>
												</tr>
												<tr>
													<td style="padding-left:5.7mm;">
														<span style="font-size:7pt;">
                              Ending capital account    
                          </span>
														<span style="width:8px;"/>.
                          <span style="width:8px;"/>.
                          <span style="width:8px;"/>.
                          </td>
													<td>
														<span style="font-size:7pt;">$</span>
														<span style="width: 33mm; border-bottom: 1px solid black; text-align: right;                 font-size:7pt;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/CapitalAccountEOYAmt"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<span style="width:5.9mm;"/>
										<input type="checkbox" alt="alt" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/TaxBasisInd"/>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
												<xsl:with-param name="BackupName">
												IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
											</xsl:call-template>
											<span style="vertical-align: bottom;padding-left:1mm;">Tax basis</span>
										</label>
										<span style="width:5mm;"/>
										<input type="checkbox" alt="alt" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/GAAPInd"/>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
												<xsl:with-param name="BackupName">
												  IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
											</xsl:call-template>
											<span style="vertical-align: bottom;padding-left:1mm;">GAAP</span>
										</label>
										<span style="width:5mm;"/>
										<input type="checkbox" alt="alt" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/Section704bBookInd"/>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
												<xsl:with-param name="BackupName">
												  IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
											</xsl:call-template>
											<span style="vertical-align: bottom;padding-left:1mm;">Section 704(b) book</span>
										</label>
										<br/>
										<span style="width:5.9mm;"/>
										<input type="checkbox" alt="alt" class="styCkbox" name="checkbox" id="dummyID1" onclick="return false;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/OtherInd"/>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/LimitedPartnerOrOtherLLCMemInd"/>
												<xsl:with-param name="BackupName">
												  IRS1065ScheduleK1LimitedPartnerOrOtherLLCMember</xsl:with-param>
											</xsl:call-template>
											<span style="vertical-align: bottom;padding-left:1mm;">Other (explain)</span>
										</label>
										<span style="width:2mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PartnersCapitalAccountGrp/OtherInd"/>
										</xsl:call-template>
										<br/>
										<br/>
										<!-- PART II Line M -->
										<span style="font-weight: bold;">M</span>
										<span style="width: 3.5mm;"/>Did the partner contribute property with a built-in gain
										  or loss?
                                        <span style="width:6mm;"/>
										<input type="checkbox" class="styCkbox">
										   <xsl:call-template name="PopulateYesCheckbox">
										      <xsl:with-param name="TargetNode" select="$FormData/PropContriBuiltInGainLossInd"/>
									             <xsl:with-param name="BackupName">
									               IRS1065ScheduleK1PropContriWithBuiltInGainLossYes</xsl:with-param>
									         </xsl:call-template>
										</input>
										<label>
										   <xsl:call-template name="PopulateLabelYes">
										      <xsl:with-param name="TargetNode" select="$FormData/PropContriBuiltInGainLossInd"/>
										      <xsl:with-param name="BackupName">
										        IRS1065ScheduleK1PropContriWithBuiltInGainLossYes</xsl:with-param>
									         </xsl:call-template>
											<span style="width:1mm;"/>
											<span class="styBoldText">Yes</span>
										</label>
										<span style="width:23mm"/>
										<input type="checkbox" class="styCkbox">
										   <xsl:call-template name="PopulateNoCheckbox">
										      <xsl:with-param name="TargetNode" select="$FormData/PropContriBuiltInGainLossInd"/>
									             <xsl:with-param name="BackupName">
									               IRS1065ScheduleK1PropContriWithBuiltInGainLossNo</xsl:with-param>
									         </xsl:call-template>
										</input>
										<label>
										   <xsl:call-template name="PopulateLabelNo">
										      <xsl:with-param name="TargetNode" select="$FormData/PropContriBuiltInGainLossInd"/>
										      <xsl:with-param name="BackupName">
										        IRS1065ScheduleK1PropContriWithBuiltInGainLossNo</xsl:with-param>
									         </xsl:call-template>
											<span style="width:1mm;"/>
											<span class="styBoldText">No</span>
										</label>
										<br/>
										<span style="width:10.1mm"/>If "Yes," attach statement (see instructions)
								             <span style="width:1mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/PropContriBuiltInGainLossInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
						</td>
						<td width="93mm" style="width: 93mm;" valign="top">
							<table width="93mm" border="0" cellpadding="0" cellspacing="0" style="border-top: 2px solid black; border-bottom: 0px; border-left: 1px solid black;          border-right: 2px solid black;">
								<!-- Inner table - Part III -->
								<tr>
									<td colspan="2">
										<!-- Part III header -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td class="IRS1065ScheduleK1_tdPartName" style="width: 15mm;">
													<span class="IRS1065ScheduleK1_partName" style="vertical-align: top;">
													  Part III</span>
												</td>
												<td class="IRS1065ScheduleK1_tdPartDesc">
													<span class="IRS1065ScheduleK1_partDesc">Partner’s Share of Current Year 
													  Income, Deductions, Credits, and Other Items</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top" style="border-right:1px solid black;">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="">
											<!-- Part III columns 1-14 -->
											<!-- Line 1 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">1</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Ordinary business income (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/OrdinaryIncomeLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/OrdinaryIncomeLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/OrdinaryIncomeLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 2 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">2</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Net rental real estate income (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/RealEstateNetIncomeLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/RealEstateNetIncomeLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/RealEstateNetIncomeLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 3 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">3</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Other net rental income (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/OtherRentalIncomeAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/OtherRentalIncomeAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/OtherRentalIncomeAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/OtherRentalIncomeAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/OtherRentalIncomeAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 4 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">4</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Guaranteed payments</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/GuaranteedPymtsToPartnerAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.63mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.63mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/GuaranteedPymtsToPartnerAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/GuaranteedPymtsToPartnerAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.63mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.63mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:right;">
																 <xsl:call-template name="PopulateAmount">
																   <xsl:with-param name="TargetNode" select="$FormData/GuaranteedPymtsToPartnerAmt"/>
																 </xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 5 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">5</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Interest income</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/InterestIncomeAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/InterestIncomeAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/InterestIncomeAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
															  	<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>													
											<!-- Line 6a -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">6a</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Ordinary dividends</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/OrdinaryDividendsAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/OrdinaryDividendsAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/OrdinaryDividendsAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																    <xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
																  </xsl:call-template>
															    </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 6b -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">6b</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Qualified dividends</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/QualifiedDividendsAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/QualifiedDividendsAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/QualifiedDividendsAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																    <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
																  </xsl:call-template>
															    </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 7 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">7</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Royalties</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/PortfolioIncomeLossRyltsAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/PortfolioIncomeLossRyltsAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/PortfolioIncomeLossRyltsAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRyltsAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 8 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">8</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Net short-term capital gain (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/NetSTCapitalGainOrLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/NetSTCapitalGainOrLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/NetSTCapitalGainOrLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 9a -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">9a</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Net long-term capital gain (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/NetLTCapitalGainOrLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:6.38mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:6.38mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/NetLTCapitalGainOrLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/NetLTCapitalGainOrLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:6.38mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:6.38mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 9b -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">9b</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Collectibles (28%) gain (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/CollectiblesGainLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/CollectiblesGainLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/CollectiblesGainLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 9c -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">9c</td>
													  <td style="float:left;font-size:6pt;">
														<span style="width:1mm;"/>Unrecaptured section 1250 gain</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/UnrecapturedSection1250GainAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/UnrecapturedSection1250GainAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/UnrecapturedSection1250GainAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 10 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;               float:left;">10</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Net section 1231 gain (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/NetSection1231GainLossAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                 float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                 float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/NetSection1231GainLossAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/NetSection1231GainLossAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;                  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;                  border-top:0px solid;width:41.40mm;font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode" select="$FormData/NetSection1231GainLossAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="$FormData/NetSection1231GainLossAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 11 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" 
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel"
													    style="text-align:center;float:left;">11</td>
														<td style="float:left;font-size:7pt;">
														  <span style="width:1mm;"/>Other income (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" 
													     style="height:4.5mm;float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox"
														  style="height:4.5mm;float:left;border-top:0px solid;width:41.40mm;
														  font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 2 blank rows --> 
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm; 
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each 
							select="$FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp">
													  <xsl:if test="($Print != $Separated) or                                     (count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) &lt;=3)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																    select="SchK1OtherIncomeLossCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:4.5mm;border-top:0px solid;width:41.40mm;
															    font-size:7pt;" valign="bottom">
																<span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode"
																	 select="$FormData/IRS1065K1OtherIncomeLossGrp"/>
																  </xsl:call-template>
																</span>
																<span style="float:right;">
																  <xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																  </xsl:call-template>
																</span>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
															    float:left;border-top:1px solid black;font-size:7pt;"
															    valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																    select="SchK1OtherIncomeLossCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
															    float:left;border-top:1px solid black;width:41.40mm;
															    font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 2 rows-->
													<xsl:if test="count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 2 elements, add 1 row-->
													<xsl:if test="count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 3 rows -->
													<xsl:if test="((count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) &gt;3)  and                  ($Print = $Separated))">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
								 select="$FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														    float:left;border-top:1px solid black;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
													    </tr>
													    <tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														    float:left;border-top:1px solid black;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
													    </tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 12 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" 
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;">12</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Section 179 deduction</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/Section179ExpenseDeductionAmt) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/Section179ExpenseDeductionAmt">
														<xsl:if test="($Print != $Separated) or                  (count($FormData/Section179ExpenseDeductionAmt) =1)">
														  <tr>
															<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
															  float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															  <xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode"
																  select="SchK1OtherInformationCd"/>
															  </xsl:call-template>
															</td>
															<td class="IRS1065ScheduleK1_amountBox" 
															  style="height:4.5mm;border-top:0px solid;width:41.40mm;
															  font-size:7pt;" valign="bottom">
															  <span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																  <xsl:with-param name="TargetNode"
																   select="$FormData/Section179ExpenseDeductionAmt"/>
																</xsl:call-template>
															  </span>
															  <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode"
																   select="$FormData/Section179ExpenseDeductionAmt"/>
																</xsl:call-template>
															  </span>
															</td>
														  </tr>
													</xsl:if>
													</xsl:for-each>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 13 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" 
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;">13</td>
													  <td style="float:left;font-size:7pt;">
														<span style="width:1mm;"/>Other deductions</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 2 blank rows -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
								 select="$FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp">
													  <xsl:if test="($Print != $Separated) or                                     (count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) &lt;=3)">
														<xsl:choose>
														  <xsl:when test="position() = 1">
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode" 
																   select="SchK1OtherDeductionsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" 
															    style="height:4.5mm;border-top:0px solid;width:41.40mm;
															    font-size:7pt;" valign="bottom">
																<span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode"
																	  select="$FormData/IRS1065K1OtherDeductionsGrp"/>
																  </xsl:call-template>
																</span>
																<span style="float:right;">
																  <xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																  </xsl:call-template>
																</span>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" 
															    style="height:7.795mm;float:left;border-top:1px solid black;
															    font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1OtherDeductionsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:7.795mm;float:left;border-top:1px solid black;
															    width:41.40mm;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 2 rows-->
													<xsl:if test="count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 2 elements, add 1 row-->
													<xsl:if test="count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 3 rows -->
													<xsl:if test="((count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) &gt;3)  and                 ($Print = $Separated))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
									 select="$FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														    float:left;border-top:1px solid black;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
													    </tr>
													    <tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.8mm;
														    float:left;border-top:1px solid black;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
													    </tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 14 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight"
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;">14</td>
													  <td style="float:left;font-size:6pt;">
													    <span style="width:1mm;"/>Self-employment earnings (loss)</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.35mm;
														  float:left;border-top:0px solid;font-size:7pt;">
															<span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.35mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 1 blank row -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.5mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.5mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
			 select="$FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp">
													  <xsl:if test="($Print != $Separated) or                                     (count($FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp) &lt;=2)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" 
															  style="height:4.35mm;float:left;border-top:0px solid;
															   font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1SelfEmploymentEarnLossCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" 
															  style="height:4.35mm;float:left;border-top:0px solid;
															   width:41.40mm;font-size:7pt;"
															   valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
														    <tr>
															  <td class="IRS1065ScheduleK1_codeBox" 
															  style="height:7.7mm;float:left;border-top:1px solid black;
															  border-bottom:1px solid black; font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1SelfEmploymentEarnLossCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" 
															  style="height:7.7mm;float:left;border-top:1px solid black;
															  border-bottom:1px solid black; width:41.40mm;font-size:7pt;"
															   valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 1 row -->
													<xsl:if test="count($FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.5mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.5mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 2 rows -->
													<xsl:if test="(($Print = $Separated)  and                 (count($FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp) &gt;2))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
			 select="$FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.5mm;
														    float:left;border-top:1px solid black;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.5mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														    <span style="vertical-align:baseline;height:100%;"/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
										  </table>
									    </td>
									    <!-- Part III columns 15-20 -->
									    <!-- Line 15 -->
									    <td valign="top">
										  <table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="">
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight"
											   style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;">15</td>
														<td style="float:left;font-size:7pt;">
														  <span style="width:1mm;"/>Credits</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.6mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 1 blank row -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81m;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
							 select="$FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp">
													  <xsl:if test="($Print != $Separated) or                              (count($FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp) &lt;=2)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
														    <tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:4.6mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															    <xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1CreditsAndCrRcptrCd"/>
															    </xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" 
															   style="height:4.6mm;float:left;border-top:0px solid;
															   width:41.40mm;font-size:7pt;" valign="bottom">
															    <span style="float:left;padding-left:2px;">
															      <xsl:call-template name="SetFormLinkInline">
																    <xsl:with-param name="TargetNode"
																     select="$FormData/IRS1065K1CreditsAndCrRcptrGrp"/>
																  </xsl:call-template>
															    </span>
															    <span style="float:right;">
																  <xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																  </xsl:call-template>
																</span>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
														    <tr>
															  <td class="IRS1065ScheduleK1_codeBox" 
															    style="height:7.81mm;float:left;border-top:1px solid black;	
															    font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1CreditsAndCrRcptrCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															   style="height:7.81mm;float:left;border-top:1px solid black;
															   width:41.40mm;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 1 row -->
													<xsl:if test="count($FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 2 rows -->
													<xsl:if test="(($Print = $Separated)  and                  (count($FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp) &gt;2))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.48mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.48mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
							 select="$FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox"
														    style="height:7.81mm;float:left;border-top:1px solid black;
														    width:41.40mm;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 16 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight" 
											   style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;" valign="top">16</td>
													  <td style="font-size:7pt;">
														<span style="width:1mm;"/>Foreign transactions
                                                      </td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 6 blank rows -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each select="$FormData/SchK1ForeignTransactionsGrp">
													  <xsl:if test="($Print != $Separated) or                              (count($FormData/SchK1ForeignTransactionsGrp) &lt;=6)">
												        <xsl:if test="CountryOrPossessionCd">
														  <xsl:choose>
														    <xsl:when test="position() = 1">
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox" 
																 style="height:4.5mm;float:left;border-top:0px solid;
																 font-size:7pt;" valign="bottom">
																  <xsl:call-template name="PopulateText">
																    <xsl:with-param name="TargetNode"
																     select="CountryOrPossessionCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox"
																 style="height:4.5mm;float:left;border-top:0px solid;
																 width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp"/>
																    </xsl:call-template>
																    <span style="width:1mm"/>
																	<xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode" 
																	  select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
																	</xsl:call-template>
																  </span>
																  <span style="padding-right:15mm;">
																	<xsl:call-template name="PopulateText">
																	  <xsl:with-param name="TargetNode"
																	   select="ForeignCountryOrUSPossessionCd"/>
																	</xsl:call-template>
																  </span>
																</td>
															  </tr>
															</xsl:when>
															<xsl:otherwise>
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox" 
																 style="height:7.81m;float:left;border-top:1px solid black;
																 font-size:7pt;" valign="bottom">
																  <xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode"
																	 select="CountryOrPossessionCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox" 
																 style="height:7.81mm;float:left;border-top:1px solid black;
																 width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																	<xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp"/>
																	</xsl:call-template>
																	<span style="width:1mm"/>
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
																    </xsl:call-template>
																  </span>
																  <span style="padding-right:15mm;">
																	<xsl:call-template name="PopulateText">
																	  <xsl:with-param name="TargetNode"
																	   select="ForeignCountryOrUSPossessionCd"/>
																	</xsl:call-template>
  																  </span>
																</td>
															  </tr>
															</xsl:otherwise>
														  </xsl:choose>
														</xsl:if>
														<xsl:if test="SchK1ForeignTransactionsCd">
														  <xsl:choose>
															<xsl:when test="position() = 1">
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox"
																 style="height:4.5mm;float:left;border-top:0px solid;
																 font-size:7pt;" valign="bottom">
																  <xsl:call-template name="PopulateText">
  																	<xsl:with-param name="TargetNode"
  																	 select="SchK1ForeignTransactionsCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox"
																 style="height:4.5mm;float:left;border-top:0px solid;
																 width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp"/>
																	</xsl:call-template>
																	<span style="width:1mm"/>
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
																    </xsl:call-template>
																  </span>
																  <span style="float:right;">
																	<xsl:call-template name="PopulateAmount">
																	  <xsl:with-param name="TargetNode" select="Amt"/>
																	</xsl:call-template>
																  </span>
																</td>
															  </tr>
															</xsl:when>
															<xsl:otherwise>
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox"
																 style="height:7.81mm;float:left;border-top:1px solid black;
																 font-size:7pt;" valign="bottom">
																  <xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode"
																	 select="SchK1ForeignTransactionsCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox"
																 style="height:7.81mm;float:left;border-top:1px solid black;
																 width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																	<xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp"/>
																	</xsl:call-template>
																	<span style="width:1mm"/>
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
																    </xsl:call-template>
																  </span>
																  <span style="float:right;">
																	<xsl:call-template name="PopulateAmount">
																	  <xsl:with-param name="TargetNode" select="Amt"/>
																	</xsl:call-template>
																  </span>
																</td>
															  </tr>
															</xsl:otherwise>
														  </xsl:choose>
														</xsl:if>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there are only 1 element, add 6 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														 float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 2 elements, add 5 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 3 elements, add 4 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 3">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 4 elements, add 3 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 4">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 5 elements, add 2 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 5">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 6 elements, add 1 row -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 6">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there is only 1 element, add 2 rows -->
													<xsl:if test="count($FormData/SchK1ForeignTransactionsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.81mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 7 rows -->
													<xsl:if test="((count($FormData/SchK1ForeignTransactionsGrp) &gt;7)  and                  ($Print = $Separated))">
													   <tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														    float:left;border-top:0px solid;width:41.40mm;font-size:7pt;"
														    valign="bottom">
															<span style="float:right;">
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													            <xsl:with-param name="TargetNode"
													             select="$FormData/SchK1ForeignTransactionsGrp"/>
												              </xsl:call-template>
												            </span>
														  </td>
														  <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
													      <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
													      <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
													      <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
													      <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm; 
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
													      <tr>
														    <td class="IRS1065ScheduleK1_codeBox" style="height:7.81mm;
														      float:left;border-top:1px solid black;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
														    <td class="IRS1065ScheduleK1_amountBox"
														      style="height:7.81mm;float:left;border-top:1px solid black;
														      width:41.40mm;font-size:7pt;">
														      <span style="vertical-align:baseline;height:100%;"/>
														    </td>
													      </tr>
														</tr>                 
													  </xsl:if>
												    </tbody>
												  </table>
											    </td>
											  </tr>
											  <tr>
											    <!-- Line 17 -->
												<td colspan="3" class="IRS1065ScheduleK1_tdRight" 
												  style="border-bottom:0px solid lightgrey;">
												 <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;" valign="top">17</td>
														<td style="font-size:6pt;">
														  <span style="width:0.5mm;"/>Alternative minimum tax (AMT)
														   items</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.2mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.2mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 2 blank rows -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
  														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.87mm; 
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
												 select="$FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp">
													  <xsl:if test="($Print != $Separated) or                                     (count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) &lt;=3)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:4.2mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode" 
																    select="SchK1AMTItemsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" 
															    style="height:4.2mm;float:left;border-top:0px solid;
															    width:41.40mm;font-size:7pt;" valign="bottom">
																<span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode"
																	  select="$FormData/IRS1065K1AMTItemsGrp"/>
																  </xsl:call-template>
																</span>
																<span style="float:right;">
																  <xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																  </xsl:call-template>
																</span>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox"
															    style="height:7.87mm;float:left;border-top:1px solid black;
															    font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																    select="SchK1AMTItemsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:7.87mm;float:left;border-top:1px solid black;
															    width:41.40mm;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there are only 2 elements, add 1 row -->
													<xsl:if test="count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm; 
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there is only 1 element, add 2 rows -->
													<xsl:if test="count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
  														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.87mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 3 rows -->
													<xsl:if test="((count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) &gt;3)  and                                    ($Print = $Separated))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
													     select="$FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox"
														    style="height:7.87mm;float:left;border-top:1px solid black;
														    width:41.40mm;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.87mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox"
														    style="height:7.87mm;float:left;border-top:1px solid black;
														    width:41.40mm;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 18 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight"
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;height:6.5mm;" valign="top">18</td>
														<td style="float:left;font-size:7pt;">
														  <span style="width:1mm;"/>Tax-exempt income and <br/>
														  <span style="width:1mm;"/>nondeductible expenses
                                                        </td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 2 blank rows -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
													    </td>
													  </tr>
													</xsl:if>
													<xsl:for-each
				 select="$FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp">
													  <xsl:if test="($Print != $Separated) or                        (count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) &lt;=3)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																    select="SchK1TxExmptNondedExpnsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:4.5mm;float:left;border-top:0px solid;
															    width:41.40mm;font-size:7pt;" valign="bottom">
															    <span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode"
																	 select="$FormData/IRS1065K1TxExmptNondedExpnsGrp"/>
																  </xsl:call-template>
																</span>
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
															<tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
															    float:left;border-top:1px solid black;font-size:7pt;"
															    valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1TxExmptNondedExpnsCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
															    float:left;border-top:1px solid black;width:41.40mm;
															    font-size:7pt;" valign="bottom">
															    <span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode"
																	 select="$FormData/IRS1065K1TxExmptNondedExpnsGrp"/>
																  </xsl:call-template>
																</span>
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there are only 2 elements, add 1 row -->
													<xsl:if test="count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
 														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there is only 1 element, add 2 rows -->
													<xsl:if test="count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
													    </td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 3 rows -->
													<xsl:if test="(($Print = $Separated) and                     (count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) &gt;3))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode" 
					select="$FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;"
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;"
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
											<!-- Line 19 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight"
											    style="border-bottom:0px solid lightgrey;">
												<table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" style="text-align:center;
													    float:left;">19</td>
														<td style="float:left;font-size:7pt;">
														  <span style="width:1mm;"/>Distributions</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp) = 0 ">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 1 blank row -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
													      <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
												 select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp">
													  <xsl:if test="($Print != $Separated) or                   (count($FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp) &lt;=2)">
														<xsl:if test="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp">
														  <xsl:choose>
															<xsl:when test="position() = 1">
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox" 
																  style="height:4.5mm;float:left;border-top:0px solid;
																  font-size:7pt;" valign="bottom">
																  <xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode"
																	  select="SchK1DistributionsCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox"
																  style="height:4.5mm;float:left;border-top:0px solid;
																  width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode" 
																	    select="$FormData/IRS1065K1DistributionsGrp"/>
																    </xsl:call-template>
																  <span style="width:1mm"/>
  																	<xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
												 select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp"/>
																    </xsl:call-template>
																  </span>
																  <span style="float:right;">
																	<xsl:call-template name="PopulateAmount">
																	  <xsl:with-param name="TargetNode" select="Amt"/>
																	</xsl:call-template>
																  </span>
																  <br/>
																</td>
															  </tr>
															</xsl:when>
															<xsl:otherwise>
															  <tr>
																<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
																  float:left;border-top:1px solid black;font-size:7pt;"
																  valign="bottom">
																  <xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode"
																	  select="SchK1DistributionsCd"/>
																  </xsl:call-template>
																</td>
																<td class="IRS1065ScheduleK1_amountBox" 
																  style="height:8mm;float:left;border-top:1px solid black;
																  width:41.40mm;font-size:7pt;" valign="bottom">
																  <span style="float:left;padding-left:2px;">
																    <xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode"
																	   select="$FormData/IRS1065K1DistributionsGrp"/>
																    </xsl:call-template>
																    <span style="width:1mm"/>
																	<xsl:call-template name="SetFormLinkInline">
																	  <xsl:with-param name="TargetNode" 
												select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp"/>
																	</xsl:call-template>
																  </span>
																  <span style="float:right;">
																	<xsl:call-template name="PopulateAmount">
																	  <xsl:with-param name="TargetNode" select="Amt"/>
																	  </xsl:call-template>
																  </span>
																  <!--<br/>-->
																</td>
															  </tr>
															</xsl:otherwise>
														  </xsl:choose>
														</xsl:if>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 1 row -->
													<xsl:if test="count($FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
													      <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 2 rows -->
													<xsl:if test="(($Print = $Separated) and                     (count($FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp) &gt;2))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:4.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:4.5mm; 
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
												 select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:8mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:8mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;"
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												 </table>
											  </td>
											</tr>
											<!-- Line 20 -->
											<tr>
											  <td colspan="3" class="IRS1065ScheduleK1_tdRight"
											    style="border-bottom:0px solid lightgrey;">
											    <table cellpadding="0" cellspacing="0" style="width:46.5mm;">
												  <tbody>
													<tr>
													  <td class="IRS1065ScheduleK1_itemLabel" 
													    style="text-align:center;float:left;">20</td>
														<td style="float:left;font-size:7pt;">
														  <span style="width:1mm;"/>Other information
														</td>
													</tr>
													<!-- Display a blank line if there are no data elements -->
													<xsl:if test="count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) = 0 ">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:8.6mm;
														  float:left;border-top:0px solid;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:8.6mm;
														  float:left;border-top:0px solid;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <!-- Add 3 blank rows -->
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<xsl:for-each
									 select="$FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp">
													  <xsl:if test="($Print != $Separated) or                     (count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) &lt;=4)">
													    <xsl:choose>
														  <xsl:when test="position() = 1">
														    <tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:8.6mm;
															    float:left;border-top:0px solid;font-size:7pt;" valign="bottom">
															    <xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																   select="SchK1OtherInformationCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:8.6mm;border-top:0px solid;width:41.40mm;
															    font-size:7pt;" valign="bottom">
																<span style="float:left;padding-left:2px;">
																  <xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" 
																	  select="$FormData/IRS1065K1OtherInformationGrp"/>
																  </xsl:call-template>
																  <span style="width:1mm;"/>
																</span>
																<span style="float:right;">
																  <xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="Amt"/>
																  </xsl:call-template>
																</span>
															  </td>
															</tr>
														  </xsl:when>
														  <xsl:otherwise>
														    <tr>
															  <td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
															    float:left;border-top:1px solid black;font-size:7pt;" 
															    valign="bottom">
																<xsl:call-template name="PopulateText">
																  <xsl:with-param name="TargetNode"
																    select="SchK1OtherInformationCd"/>
																</xsl:call-template>
															  </td>
															  <td class="IRS1065ScheduleK1_amountBox"
															    style="height:7.6mm;float:left;border-top:1px solid black;
															    width:41.40mm;font-size:7pt;" valign="bottom">
																<xsl:call-template name="PopulateAmount">
																  <xsl:with-param name="TargetNode" select="Amt"/>
																</xsl:call-template>
																<br/>
															  </td>
															</tr>
														  </xsl:otherwise>
														</xsl:choose>
													  </xsl:if>
													</xsl:for-each>
													<!-- If there is only 1 element, add 3 rows-->
													<xsl:if test="count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) = 1">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 2 elements, add 2 rows-->
													<xsl:if test="count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) = 2">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														 <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- If there are only 3 elements, add 1 row-->
													<xsl:if test="count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) = 3">
													  <tr>
														<td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														  float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
													  </tr>
													</xsl:if>
													<!-- See Additional Table message for > 4 rows -->
													<xsl:if test="(($Print = $Separated) and                     (count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) &gt;4))">
													  <tr>
													    <td class="IRS1065ScheduleK1_codeBox" style="height:9.5mm;
													      float:left;border-top:0px solid black;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														</td>
														<td class="IRS1065ScheduleK1_amountBox" style="height:9.5mm;
														  float:left;border-top:0px solid black;width:41.40mm;font-size:7pt;">
														  <span style="vertical-align:baseline;height:100%;"/>
														  <xsl:call-template name="PopulateAdditionalDataTableMessage">
													        <xsl:with-param name="TargetNode"
								 select="$FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp"/>
												          </xsl:call-template>
														</td>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;" 
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;width:41.40mm;font-size:7pt;"
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
														<tr>
														  <td class="IRS1065ScheduleK1_codeBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;font-size:7pt;" valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
														  </td>
														  <td class="IRS1065ScheduleK1_amountBox" style="height:7.6mm;
														    float:left;border-top:1px solid black;width:41.40mmfont-size:7pt;"
														    valign="bottom">
															<span style="vertical-align:baseline;height:100%;"/>
															<br/>
														  </td>
														</tr>
													  </tr>
													</xsl:if>
												  </tbody>
												</table>
											  </td>
											</tr>
										  </table>
									    </td>
								      </tr>
								      <tr>
									    <td colspan="2" style="font-family: Verdana; font-size: 7pt;text-align: left;border-top: 2px solid black; border-bottom:2px solid black;">
                                          * See attached statement for additional information.
                                        </td>
								      </tr>
								    <tr>
									  <td colspan="2" style="height:100%;height:62.95mm;
									    border-bottom:1px solid black;">
										<!-- IRS Use Only box -->
										<span style="vertical-align:baseline;height:85%;"/>
										<img src="{$ImagePath}/1065SchK1_For_IRS_Use_Only.gif" width="24"
										  height="112" alt="For IRS Use Only"/>
									  </td>
								    </tr>
							</table>
							<!-- End inner table - Part III -->
						</td>
					</tr>
					<tr>
					  <td width="187mm" colspan="2" style="width: 187mm; font-family: Verdana;
					    font-size: 6pt;font-weight: bold; border-top: 1px solid black;">
						<span style="width: 91mm;">For Paperwork Reduction Act Notice, see
						   Instructions for Form 1065.
						</span>
						<span style="width: 28.5mm;">IRS.gov/form1065</span>
						<span style="font-weight: normal; width: 26mm;">Cat. No. 11394R</span>
						<span style="width: 40mm;">Schedule K-1 (Form 1065) 2014</span>
					  </td>
					</tr>
				</table>
				<!-- FORM DISPLAY ENDS  HERE -->
				<!--<br/>-->
				<div class="pageEnd"/>
				<!-- From 1065 form -->
				<!-- BEGIN Left Over Table -->
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
				<!-- End Left Over Table -->
				<!-- Additional Data Table -->
				<div style="width:187mm">
				  <!-- Separated Data for Part III Line 11 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp) &gt;3)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 11</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">11</th>
							<th class="styDepTblCell" scope="col" valign="middle">Other income (loss)</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each 
						 select="$FormData/IRS1065K1OtherIncomeLossGrp/SchK1OtherIncomeLossGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
										  <xsl:with-param name="TargetNode"
										  select="$FormData/IRS1065K1OtherIncomeLossGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherIncomeLossCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 11 -->
				  <!-- Separated Data for Part III Line 13 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp) &gt;3)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 13</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">13</th>
							<th class="styDepTblCell" scope="col" valign="middle">Other deductions</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each 
						 select="$FormData/IRS1065K1OtherDeductionsGrp/SchK1OtherDeductionsGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
										  <xsl:with-param name="TargetNode"
										   select="$FormData/IRS1065K1OtherDeductionsGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherDeductionsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 13 -->
				  <!-- Separated Data for Part III Line 14 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp) &gt;2)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 14</span>
					  <table class="styDepTbl" style="width:55mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">14</th>
							<th class="styDepTblCell" scope="col" valign="middle">Self-employment earnings (loss)</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each 
				select="$FormData/IRS1065K1SelfEmplmnEarnLossGrp/SchK1SelfEmploymentEarnLossGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode"
									     select="SchK1SelfEmploymentEarnLossCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
								      <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
									</div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode"
									     select="SchK1SelfEmploymentEarnLossCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 14 -->
				</div>
				<div style="width:187mm">
				  <!-- Separated Data for Part III Line 15 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp) &gt;2)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 15</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">15</th>
							<th class="styDepTblCell" scope="col" valign="middle">Credits</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each 
						  select="$FormData/IRS1065K1CreditsAndCrRcptrGrp/SchK1CreditsAndCrRcptrGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
										  <xsl:with-param name="TargetNode"
										   select="$FormData/IRS1065K1CreditsAndCrRcptrGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1CreditsAndCrRcptrCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 15 -->
				  <!-- Separated Data for Part III Line 16 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/SchK1ForeignTransactionsGrp) &gt;7)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 16</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">16</th>
							<th class="styDepTblCell" scope="col" valign="middle">Foreign transactions</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each select="$FormData/SchK1ForeignTransactionsGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
							         </xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
							      <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
								      <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
									  </xsl:call-template>
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode"
											select="$FormData/SchK1ForeignTransactionsGrp"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="SetFormLinkInline">
										  <xsl:with-param name="TargetNode"
										  select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
										</xsl:call-template>
									  </span>
									  <xsl:if test="CountryOrPossessionCd">
									    <span style="padding-left:15mm">
									      <xsl:call-template name="PopulateText">
										    <xsl:with-param name="TargetNode"
										    select="ForeignCountryOrUSPossessionCd"/>
									      </xsl:call-template>
									    </span>
									  </xsl:if>
									  <xsl:if test="SchK1ForeignTransactionsCd">
									    <span style="float:right">
									      <xsl:call-template name="PopulateAmount">
									        <xsl:with-param name="TargetNode" select="Amt"/>
									      </xsl:call-template>
									      <span style="width:1.5mm;"/>
									    </span>
									  </xsl:if>
									</div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
							         </xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <xsl:if test="CountryOrPossessionCd">
								      <div style="width:5mm;">
								        <xsl:call-template name="PopulateText">
									      <xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
									    </xsl:call-template>
									  </div>
									</xsl:if>
									<xsl:if test="SchK1ForeignTransactionsCd">
									  <div style="width:5mm;">
									    <xsl:call-template name="PopulateText">
									      <xsl:with-param name="TargetNode" select="SchK1ForeignTransactionsCd"/>
									    </xsl:call-template>
									  </div>
									</xsl:if>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
								      <span style="float:left;padding-left:2px;">
										<xsl:call-template name="SetFormLinkInline">
											 <xsl:with-param name="TargetNode"
												select="$FormData/SchK1ForeignTransactionsGrp"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/SchK1ForeignTransactionsGrp/CountryOrPossessionCd"/>
									    </xsl:call-template>
									  </span>
									  <xsl:if test="CountryOrPossessionCd">
									    <span style="padding-left:15mm;">
									      <xsl:call-template name="PopulateText">
										    <xsl:with-param name="TargetNode"
										    select="ForeignCountryOrUSPossessionCd"/>
									      </xsl:call-template>
									    </span>
									  </xsl:if>
									  <xsl:if test="SchK1ForeignTransactionsCd">
									    <span style="float:right;">
									      <xsl:call-template name="PopulateAmount">
										    <xsl:with-param name="TargetNode" select="Amt"/>
									      </xsl:call-template>
									      <span style="width:1.5mm;"/>
									    </span>
									  </xsl:if>
									</div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>
					      </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 16 -->
				  <!-- Separated Data for Part III Line 17 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp) &gt;3)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 17</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" valign="middle">17</th>
							<th class="styDepTblCell" scope="col" valign="middle">Alternative minimum tax (AMT) items</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each select="$FormData/IRS1065K1AMTItemsGrp/SchK1AMTItemsGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
										  <xsl:with-param name="TargetNode"
										  select="$FormData/IRS1065K1AMTItemsGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1AMTItemsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 17 -->
                </div>				
				<div>
				  <!-- Separated Data for Part III Line 18 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp) &gt;3)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 18</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
						    <th class="styDepTblCell" scope="col" valign="middle">18</th>
							<th class="styDepTblCell" scope="col" valign="middle">
							 Tax-exempt income and nondeductible expenses</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each select="$FormData/IRS1065K1TxExmptNondedExpnsGrp/SchK1TxExmptNondedExpnsGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/IRS1065K1TxExmptNondedExpnsGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1TxExmptNondedExpnsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
									      <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 18 -->
				  <!-- Separated Data for Part III Line 19 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp) &gt;2)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 19</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
						    <th class="styDepTblCell" scope="col" valign="middle">19</th>
							<th class="styDepTblCell" scope="col" valign="middle">Distributions</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/IRS1065K1DistributionsGrp"/>
									    </xsl:call-template>
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
								      <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1DistributionsCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
								      <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/IRS1065K1DistributionsGrp"/>
									    </xsl:call-template>
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode"
									      select="$FormData/IRS1065K1DistributionsGrp/SchK1DistributionsGrp"/>
									    </xsl:call-template>
									  </span>
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 19 -->
				</div>
                <!-- Separated Data for Part III Line 20 -->
				  <xsl:if test="($Print = $Separated) and  (count($FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp) &gt;4)">
				    <div style="float:left">
				      <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Form 1065 Schedule K1,</span>
					  <br/>
					  <span class="styRepeatingDataTitle" style="width:60mm">Part III, Line 20</span>
					  <table class="styDepTbl" style="width:50mm;font-size:7pt;">
						<thead class="styTableThead">
						  <!-- Label the Column Headers -->
						  <tr class="styDepTblHdr">
						    <th class="styDepTblCell" scope="col" valign="middle">20</th>
							<th class="styDepTblCell" scope="col" valign="middle">Other information</th>
						  </tr>
						</thead>
						<tfoot/>
						<tbody>
						  <xsl:for-each 
						 select="$FormData/IRS1065K1OtherInformationGrp/SchK1OtherInformationGrp">
						    <xsl:choose>
							  <xsl:when test="position() = 1">
							    <tr style="border-color:black;">
							      <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							      <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
									  <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
									  <span style="float:left;padding-left:2px;">
									    <xsl:call-template name="SetFormLinkInline">
									      <xsl:with-param name="TargetNode" 
									     select="$FormData/IRS1065K1OtherInformationGrp"/>
									    </xsl:call-template>
                                      </span>									  
									  <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:when>
							  <xsl:otherwise>
								<tr style="border-color:black;">
                                  <!-- Define background colors to the rows -->
							      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                                  <!-- First Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:5mm;">
								      <xsl:call-template name="PopulateText">
									    <xsl:with-param name="TargetNode" select="SchK1OtherInformationCd"/>
									  </xsl:call-template>
								    </div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left"> 
								    <div style="width:40mm;">
								      <span style="float:right;">
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="Amt"/>
									    </xsl:call-template>
									    <span style="width:1.5mm;"/>
									  </span>
								    </div>
								  </td>
								</tr>
							  </xsl:otherwise>
							</xsl:choose>						  
						  </xsl:for-each>
						</tbody>
					  </table>
					</div>
				  </xsl:if>
				  <!-- End Separated Data for Form 1065 Schedule K1, Part III, Line 20 -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>