<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4136Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="IRS4136Data" select="$RtnDoc/IRS4136"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS4136Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4136"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4136Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS4136">
					<xsl:call-template name="DocumentHeader"/>
					<!--    BEGIN FORM HEADER   -->
					<div class="styIRS4136BB" style="width:187mm;border-bottom-width:2px;">
						<div class="styIRS4136FN" style="width:29mm;height:21mm;border-right-width:2px;">
							<div>
								<span>Form <span style="width: 4px"/>
								</span>
								<span class="styFormNumber">4136</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS4136Data"/>
								</xsl:call-template>
								<span style="width:1mm"/>
							</div>
							<div class="styIRS4136Agency" style="padding-top:4mm;">Department of the Treasury Internal Revenue Service (99)
    </div>
						</div>
						<div class="styGenericDiv" style="width:128mm;height:21mm;text-align:center;font-weight:bold;">
							<div class="styMainTitle" style="font-size:16pt;padding-top:4mm;">Credit for Federal Tax Paid on Fuels</div>
							<div style="padding-top:3mm;">
    </div>
							<div class="styFBT" style="height:4mm;">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/> 
								Information about Form 4136 and its separate instructions is at
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4136" title="Link to irs.gov Form 4136">
									<i>www.irs.gov/form4136</i>
								</a>.
							</div>
						</div>
						<div class="styIRS4136TYBox" style="width:29mm;height: 21mm;border-left-width:2px;">
							<div class="styIRS4136OMB">OMB No. 1545-0162</div>
							<div class="styIRS4136TY">20<span class="styTYColor">14</span>
							</div>
							<div class="styIRS4136Sequence">Attachment<br/>Sequence No. <b>23</b>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:187mm;">
						<div class="styIRS4136BusinessName" style="font-size: 7pt; font-weight: normal;">Name (as shown on your income tax return)
    <br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
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
							</span>
						</div>
						<div class="styEINBox" style="padding-left: 2mm;font-size:7pt;font-weight:bold;">Taxpayer identification number
    <div style="padding-top:3mm;font-weight:normal;">
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
					<!--   END TAXPAYER INFO   -->
					<!-- Name and Identifying number END-->
					<div class="styIRS4136CautionHdr" style="padding-left:1.5mm;border-top-width:2px;">
						<span class="styIRS4136CautionHdrTitle" style="padding-left:2mm;padding-right:1mm;">Caution.</span>
						<span style="width:160mm;float:left;font-size:7.75pt;padding-right:1mm;">
        Claimant has the name and address of the person who sold the fuel to the claimant and the dates of purchase. <br/>
         For claims on lines 1c and 2b (type of use 13 and 14), 3d, 4c, and 5, claimant has not waived the right to <br/>
         make the claim. For claims on lines 1c and 2b (type of use 13 and 14), claimant certifies that a certificate has <br/>
         not been provided to the credit card issuer. 
         <br/>
							<br/>
		The alternative fuel mixture credit cannot be claimed on this form or on Schedule 3 (Form 8849). It  must be taken
		as a credit against your taxable fuel liability (gasoline, diesel fuel, and kerosene) reported on Form 720.
         <br/>
							<br/>
						</span>
					</div>
					<!--   END NOTE HEADER   -->
					<!--   BEGIN BLOCK 1   -->
					<!--   BEGIN LINE 1   -->
					<!-- Count the number of rows in the table -->
					<xsl:variable name="table1RowCount" select="3 + count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
					<div class="styIRS4136NumLine" style="padding-left:2mm;border-top-width: 0px;">
						<br/>
						<span style="float:left;clear:none;"> 1<span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Gasoline</span>
						<span style="width:6mm"/>
						<b>Note. </b>
						<span style="font-weight:normal"> CRN is credit reference number.</span>
						<br/>
						<span style="width:7mm;text-align:right;float:right; clear: none">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$table1RowCount"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'NGctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styIRS4136TableContainer1" id="NGctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<!-- Declare all varaible that hold the count of the repeating elements in this block -->
						<xsl:variable name="AFRowCount" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136Braces" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 1A OFF-HIGHWAY BUSINESS USE OF GASOLINE  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;">Off-highway business use</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style=" text-align:center;">$ .183</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="3"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/OffHwyBusUseGasolineGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces" rowspan="3">
										<!-- When the row count of Line 1C is less than 3, then add a border under the bracket to close out the row -->
										<xsl:choose>
											<xsl:when test="$AFRowCount &lt;2">
												<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">border-bottom-width: 0px</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<img src="{$ImagePath}/4136_Bracket_L6.gif" alt="bracket"/>
									</td>
									<td class="styIRS4136TableCellD" style="text-align:left;vertical-align:top;">
										<xsl:choose>
											<xsl:when test="$AFRowCount &lt;2">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount + 2"/></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:attribute name="style">text-align:right;vertical-align:bottom;</xsl:attribute>$
   <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfGasolineCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="vertical-align:bottom;">
										<xsl:choose>
											<xsl:when test="$AFRowCount &lt; 2">
												<xsl:attribute name="rowspan"><xsl:number value="3"/></xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount + 2"/></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>362
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 1B USE OF GASOLINE ON A FARM FOR FARMING PURPOSES -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center">.183</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="3"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmingPurposesGasolineGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Loop  -->
								<!--  Row 1C OTHER NONTAXABLE USE OF GASOLINE  -->
								<xsl:if test="$AFRowCount = 0 or (($AFRowCount &gt;1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;">
											<b>c</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle; width:92mm;">Other nontaxable use (see <b>Caution</b> above line 1)</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center;">.183</td>
										<td class="styIRS4136TableCellC">
											<xsl:if test="($AFRowCount &gt;1) and ($Print = $Separated)">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationNontxUseGasGalsQty"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
											<span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($AFRowCount &lt;=1)  or  ($Print != $Separated)">
									<xsl:for-each select="$IRS4136Data/OtherNontaxableUseOfGasoline">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
													<b>c</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
                Other nontaxable use (see <b>Caution </b>above line 1)   
              </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center;">.183</td>
											<td class="styIRS4136TableCellC" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<!--If this is the last repeating row in line 1C, then add a blank cell with a bottom border to close out -->
											<!--column under the bracket -->
											<xsl:if test="position()=$AFRowCount">
												<td class="styIRS4136Braces">
													<span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- End Loop  -->
								<!-- Line D  position -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;padding-right:2mm;">
										<b>d</b>
									</td>
									<td class="styIRS4136TableCellLine">
                Exported
         </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm; text-align:center;">.184</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<span class="styIRS4136TableCellPad" style="padding-right:1mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontxUseGasGalsQty"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontxUseOfGasCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">411
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- End Line D -->
								<!--   **********************************************************************************  -->
							</tbody>
						</table>
					</div>
					<!--					<div style="width:187mm;height:2mm;padding-left:8mm">
						*There rates apply after Septemper 30, 2012
					</div>-->
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$table1RowCount"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'NGctn' "/>
					</xsl:call-template>
					<!--  END LINE 1   -->
					<!--   BEGIN BLOCK 2   -->
					<!--   BEGIN LINE 2   -->
					<!-- Track the number of rows in table 2-->
					<xsl:variable name="table2RowCount" select="1 + count($IRS4136Data/AviationNontxUseGasGalsQty)"/>
					<div class="styIRS4136NumLine" style="float:none;padding-top:3mm;padding-left:2mm;">
						<br/>
						<span style="float:left;clear:none;"> 2<span class="styIRS4136NBSP" style="padding-right:3mm;"/>  Nontaxable Use of Aviation Gasoline</span>
						<br/>
						<span style="width:7mm;text-align:right;float:right; clear: none">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$table2RowCount"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'AGctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styIRS4136TableContainer2" id="AGctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  *******************************************************************************************  -->
								<!-- LINE 2a -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-left:4mm;padding-right:1.5mm;">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade)</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3.5mm;">$ .15</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineGallonsQty"/>
										</xsl:call-template>
										<xsl:if test=" ((count($IRS4136Data/ExpNontxAviationGasCrAmt) &gt; 1) and ($Print = $Separated))">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineGallonsQty"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</xsl:if>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
										<xsl:if test="not(count($IRS4136Data/AviationNontxUseGasGalsQty) = 0) ">
											<xsl:attribute name="style">text-align:right;</xsl:attribute>
										</xsl:if>$
                    <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">354
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  END LOOP  -->
								<!--  *******************************************************************************************  -->
								<!--  Row 2B OTHER NONTAXABLE USE  -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/AviationNontxUseGasGalsQty)"/>
								<xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/AviationNontxUseGasGalsQty) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>b</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Other nontaxable use (see<b> Caution </b> above line 1)
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.193</td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/AviationNontxUseGasGalsQty) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationNontxUseGasGalsQty"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">324
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/AviationNontxUseGasGalsQty) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/AviationNontxUseGasGalsQty">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<b>b</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Other nontaxable use (see <b>Caution </b> above line 1)
        </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.193</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationNontxGasCrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>324
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- LINE 2c -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:0px;padding-left:4mm;padding-right:1.5mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:5.5mm;">.194</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasGalsQty"/>
										</xsl:call-template>
										<xsl:if test=" ((count($IRS4136Data/ExpNontxAviationGasCrAmt) &gt; 1) and ($Print = $Separated))">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasCrAmt"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</xsl:if>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
										<xsl:if test="not(count($IRS4136Data/AviationNontxUseGasGalsQty) = 0) ">
											<xsl:attribute name="style">text-align:right;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">412
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  END LOOP  -->
								<!-- LINE 2d -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;padding-right:1.5mm;">
										<b>d</b>
									</td>
									<td class="styIRS4136TableCellLine">LUST tax on aviation fuels used in foreign trade</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:5.5mm;">.001</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAvnFuelFrgnTradeGalsQty"/>
										</xsl:call-template>
										<xsl:if test=" ((count($IRS4136Data/ExpNontxAviationGasCrAmt) &gt; 1) and ($Print = $Separated))">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasCrAmt"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</xsl:if>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="padding-left:3mm;text-align:left;">
										<xsl:if test="not(count($IRS4136Data/AviationNontxUseGasGalsQty) = 0) ">
											<xsl:attribute name="style">text-align:right;</xsl:attribute>
										</xsl:if>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAvnFuelFrgnTradeCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">433
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  END LOOP  -->
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$table2RowCount"/>
						<xsl:with-param name="containerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'AGctn' "/>
					</xsl:call-template>
					<!-- END LINE 2   -->
					<!--   BEGIN BLOCK 3  -->
					<!--   BEGIN LINE 3   -->
					<div class="styIRS4136NumLine" style="padding-top:4mm;padding-bottom:1mm;padding-left:2mm;float: none; clear: both">3
          <span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Undyed Diesel Fuel <br/>
					</div>
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<div class="styIRS4136DescLine" style="margin-left: 8mm; width:183mm;">Claimant certifies that the diesel fuel did not contain visible evidence of dye.
                    </div>
					<div class="styBB" style="width:180mm;margin-left:8mm;font-size:6pt;">
						<div style="float:left;padding-top:.5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
								</xsl:call-template>
								<b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain visible evidence of dye, attach an explanation and check here
    </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
							</xsl:call-template>
							<span style="letter-spacing:10px;font-weight:bold;"/>
							<span style="margin-left: 1mm; margin-right:1mm">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							</span>
						</div>
						<div style="float:right;padding-right:.5mm;">
							<input alt="UndyedDieselUseExceptionInd" type="checkbox" class="styIRS4136Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
									<xsl:with-param name="backupName">UndyedDieselUseException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedDieselUseException</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UDctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;border-right-width:0;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136Braces" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 3A USE ON A FARM FOR FARMING PURPOSES -->
								<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
								<xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableUseOfUndyedDiesel) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
											<b>a</b>
										</td>
										<td class="styIRS4136TableCellLine" style="border-top-width:1px">Nontaxable use</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-left:4mm;">$ .243</td>
										<td class="styIRS4136TableCellC">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136Braces">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellD" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseOfUndyedDiesel) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedDiesel">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<b>a</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Nontaxable use
                                             </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .243</td>
											<td class="styIRS4136TableCellC" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136Braces">
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;">
													<span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row3B  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;">.243</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedDslFuelGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float-left;">$</span>
										<span style="float-right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedDslFuelCrAmt"/>
											</xsl:call-template>
										</span>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">360
              <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row3C USE IN TRAINS  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine">Use in trains</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;">.243</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">353
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row3D USE IN CERTAIN INTERCITY AND LOCAL BUSES  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:3.5mm;padding-left:4mm;padding-right:1.5mm;">
										<b>d</b>
									</td>
									<td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution</b>   above line 1)</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;"> .17</td>
									<td class="styIRS4136TableCellC" style="padding-top:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedDieselGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="padding-top:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedDieselCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="padding-top:2mm;">350
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row3E EXPORTED  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom-width:1px;">
										<b>e</b>
									</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;">.244</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpUndyedDieselFuelGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpUndyedDieselFuelCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="padding-top:1mm;">413
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  END LINE 3  -->
					<!--					<div style="width:187mm;height:2mm;padding-left:8mm">
* These rates apply after September 30, 2012</div>-->
					<!--   BEGIN BLOCK 4 -->
					<!--   BEGIN LINE 4  -->
					<div class="styIRS4136NumLine" style="padding-top:3mm;padding-bottom:1.5mm;padding-left:2mm;float: none; clear: both"> 4
          <span class="styIRS4136NBSP" style="padding-right:3mm;"/> Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation) 
                    </div>
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<div class="styIRS4136DescLine" style="margin-left:8mm; width:180mm;margin-right: 5mm;">Claimant certifies that the kerosene did not contain visible evidence of dye.
                   </div>
					<div class="styBB" style="width:179mm;margin-left:8mm;font-size:6pt;">
						<div style="float:left;padding-top:.5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
								</xsl:call-template>
								<b>Exception.</b> If any of the kerosene included in this claim <b>did</b> contain visible evidence of dye, attach an explanation and check here
                        </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
							</xsl:call-template>
							<span style="letter-spacing:10px;font-weight:bold;"/>
							<span style="margin-left: 1mm; margin-right:1mm">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							</span>
						</div>
						<div style="float:right;padding-right:.5mm;">
							<input alt="UndyedKeroseneUseExceptionInd" type="checkbox" class="styIRS4136Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
									<xsl:with-param name="backupName">UndyedKeroseneUseException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedKeroseneUseException</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:2px solid black;" id="UDctn">
						<!--					<div style="width:187mm;float:left;clear:left;" id="UDctn">
-->
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" scope="col" style="border-bottom:0;">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;border-right-width:0;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136Braces" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 4A NONTAXABLE USE  -->
								<!-- ********************************************************************************************************** -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
								<xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NontaxableUseOfUndyedKerosene) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
											<b>a</b>
										</td>
										<td class="styIRS4136TableCellLine">Nontaxable use taxed at $.244</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-left:4mm;">$ .243</td>
										<td class="styIRS4136TableCellC">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136Braces">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellD" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxableUseOfUndyedKerosene) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedKerosene">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<b>a</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Nontaxable use taxed at $.244
        </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .243</td>
											<td class="styIRS4136TableCellC" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136Braces">
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;">
													<span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row4B  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;">.243</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedKeroseneGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">$
        <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedKeroseneCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">346
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- ********************************************************************************************************** -->
								<!--  Row4C USE IN CERTAIN INTERCITY AND LOCAL BUSES  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:4mm;padding-left:4mm;padding-right:1.5mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution </b> above line 1)
                  </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;"> .17</td>
									<td class="styIRS4136TableCellC" style="padding-top:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedKeroseneGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="padding-top:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedKeroseneCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="padding-top:2mm;">347
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 4d EXPORTED  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:.5mm;padding-right:1.5mm;padding-left:4mm;border-bottom:0;">
										<b>d</b>
									</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;">.244</td>
									<td class="styIRS4136TableCellC" style="text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="padding-top:1mm;">414
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- ************************************************************************************************************* -->
								<!--  Row 4e Nontaxable use taxed at $.044 -->
								<xsl:variable name="AGRowCount2" select="count($IRS4136Data/NontxUseUndyedKrsnTxdAt044)"/>
								<xsl:if test="$AGRowCount2 = 0 or ((count($IRS4136Data/NontxUseUndyedKrsnTxdAt044) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
											<b>e</b>
										</td>
										<td class="styIRS4136TableCellLine">Nontaxable use taxed at $.044</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
											<td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;"> .043</td>
										<td class="styIRS4136TableCellC">
											<xsl:attribute name="style">text-align:left;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136Braces">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
									<td class="styIRS4136TableCellE" style="padding-top:1mm;">377
        <span class="styIRS4136TableCellPad"/>
									</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxUseUndyedKrsnTxdAt044) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxdAt044">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
													<b>e</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>Nontaxable use taxed at $.044</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;"> .043</td>
											<td class="styIRS4136TableCellC" style="text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136Braces">
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd044CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>377
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- ************************************************************************************************************* -->
								<!--  Row 4f   -->
								<xsl:variable name="AGRowCount3" select="count($IRS4136Data/NontxUseUndyedKrsnTxd219)"/>
								<xsl:if test="$AGRowCount3 = 0 or ((count($IRS4136Data/NontxUseUndyedKrsnTxd219) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
											<b>f</b>
										</td>
										<td class="styIRS4136TableCellLine" style="border-bottom:0;">
										Nontaxable use taxed at $.219
										</td>
										<td class="styIRS4136TableCellA" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="border-bottom:0;padding-left:3.5mm;text-align:center;">.218</td>
										<td class="styIRS4136TableCellC">
											<xsl:attribute name="style">text-align:left;border-bottom:0;</xsl:attribute>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136Braces" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellD" style="border-bottom:0;">
											<span class="styIRS4136TableCellPad"/>
										</td>
									<td class="styIRS4136TableCellE" style="padding-top:1mm;">369
        <span class="styIRS4136TableCellPad"/>
									</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxUseUndyedKrsnTxd219) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxd219">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>
													<b>f</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>Nontaxable use taxed at $.219</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;padding-left:3.5mm;text-align:center;</xsl:attribute>
												</xsl:if>
											 .218
											 </td>
											<td class="styIRS4136TableCellC" style="text-align:center;">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;text-align:center;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136Braces">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;</xsl:attribute>
												</xsl:if>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>369
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--  END LINE 4  -->
					<!--					<div style="width:187mm;height:2mm;padding-left:8mm">
* These rates apply after September 30, 2012</div>-->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						</div>
						<div style="float:right">Cat. No. 12625R
    <span style="width:70px"/>Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2014)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div style="float: left; clear: none">Form 4136 (2014)</div>
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN LINE 5   -->
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both;padding-top:1px;padding-left:2mm;padding-bottom:2mm;">
						<br/>5
    <span class="styIRS4136NBSP" style="padding-right:3mm;"/>
						<b>Kerosene Used in Aviation </b>
						<span style="font-weight:normal">(see </span>Caution <span style="font-weight:normal">above line 1)</span>
					</div>
					<div style="width:187mm;float:left;clear:left;styBB;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 5A -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm; border-bottom-width:4mm;border-color:white">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine">Kerosene used in commercial aviation (other than foreign trade) taxed at $.244</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:1mm;text-align:center;">$ .200</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd244GalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd244CrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">417<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 5B -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;padding-right:1.5mm;padding-top:5mm;         border-bottom-width:10mm;border-color:white">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;padding-bottom:7mm;">
                  Kerosene used in commercial aviation (other than foreign trade) taxed at $.219<br/>
									</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.175</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd219GalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd219CrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">355<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 5C  -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd244)"/>
								<xsl:if test="$AGRowCount = 0 or ((count($IRS4136Data/NonTxKrsnUsedInAvnTxd244) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>c</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
										Nontaxable use (other than use by state or local government) taxed at $.244
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.243</td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NonTxKrsnUsedInAvnTxd244) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244CrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">346
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NonTxKrsnUsedInAvnTxd244) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<b>c</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
										Nontaxable use (other than use by state or local government) taxed at $.244
        </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:4mm">.243</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>346
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row 5D  -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount2" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd219)"/>
								<xsl:if test="$AGRowCount2 = 0 or ((count($IRS4136Data/NonTxKrsnUsedInAvnTxd219) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>d</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
										Nontaxable use (other than use by state or local government) taxed at $.219
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style=";padding-left:4mm;">.218
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NonTxKrsnUsedInAvnTxd219) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE"> 360
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NonTxKrsnUsedInAvnTxd219) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
													<b>d</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
										Nontaxable use (other than use by state or local government) taxed at $.219
                       </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:4mm;">.218</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>369
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row 5E -->
								<!--  *******************************************************************************************  -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount5e" select="count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty)"/>
								<xsl:if test="$AGRowCount5e = 0 or ((count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>e</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">LUST tax on aviation fuels used in foreign trade
      </td>
										<td class="styIRS4136TableCellA" style="background-color: lightgrey">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.001
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">433
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="border-bottom-width:1px;vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
													<b>e</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
													LUST tax on aviation fuels used in foreign trade
        </td>
											</xsl:if>
											<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Type"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:4mm;">.001</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdCrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5e"/></xsl:attribute>433
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  *******************************************************************************************  -->
							</tbody>
						</table>
					</div>
					<!--   END LINE 5   -->
					<!--   BEGIN BLOCK 6   -->
					<!--   BEGIN LINE 6   -->
					<div class="styIRS4136NumLine" style="width:186mm;float: none; clear: both;padding-left:2mm;padding-top:10mm;">
						<br/>6
          <span class="styIRS4136NBSP" style="padding-right:3mm;"/>  
          Sales by Registered Ultimate Vendors of Undyed Diesel Fuel <span style="width:2mm;"/>
						 Registration No.
  <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:4px;"/>
						<span style="font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselRegistrationNum"/>
							</xsl:call-template>
						</span>
						<div style="width:187mm;"/>
					</div>
					<!--   END LINE 6   -->
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<div class="styIRS4136DescLine" style="width:180mm;font-size: 7pt; margin-left: 8mm; margin-right: 8mm; ">Claimant certifies that it sold the diesel fuel at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained the written
consent of the buyer to make the claim. Claimant certifies that the diesel fuel did not contain visible evidence of dye.
</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--   BEGIN BLOCK DESCRIPTION   -->
								<div class="styBB" style="width:180mm;margin-left:8mm;font-size:6pt;">
									<div style="float:left;padding-top:1mm;padding-left:.5mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
											</xsl:call-template>
											<b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain 
      visible evidence of dye, attach an explanation and check here<span class="styDotLn" style="float:none;clear:none;">......</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
											<xsl:with-param name="TabOrder" select="1"/>
										</xsl:call-template>
										<span style="letter-spacing:10px;font-weight:bold;"/>
										<span style="margin-left: 1mm; margin-right:1mm">
											<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
										</span>
									</div>
									<div style="float:right;padding-right:2mm;">
										<input alt="SalesUndyedDieselExceptionInd" type="checkbox" class="styIRS4136Ckbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
												<xsl:with-param name="backupName">UndyedDieselSalesException</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
												<xsl:with-param name="BackupName">UndyedDieselSalesException</xsl:with-param>
											</xsl:call-template>
										</label>
									</div>
								</div>
								<!--  Row 6A USE BY A STATE OR LOCAL GOVERNMENT -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">Use by a state or local government</td>
									<td class="styIRS4136TableCellB" style="padding-left:5mm;">$ .243</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDslStLclGovtGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDslUseStLclGovtCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">360<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 6B  -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;border-bottom-width:1px;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">Use in certain intercity and local buses</td>
									<td class="styIRS4136TableCellB" style="padding-left:7.5mm;"> .17</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDieselUseBusGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDieselUseBusCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">350<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  END LINE 6  -->
					<!--					<div style="width:187mm;height:2mm;padding-left:8mm;">* These rates apply after Septemper 30, 2012</div>
-->
					<!--   BEGIN BLOCK 7   -->
					<!--   BEGIN LINE 7   -->
					<div class="styBB" style="padding-top:10mm;">
						<table class="styIRS4136Table" style="width:187mm;border-bottom:0px solid black;">
							<tbody>
								<tr class="styIRS4136NumLine">
									<td style="float: none; padding-top: 2mm; border-bottom-width: 0px;border-top-width: 0px;" rowspan="2">7
                  <span class="styIRS4136NBSP"/>Sales by Registered Ultimate Vendors of Undyed Kerosene (Other <br/>
										<span style="width:4.5mm"/>Than Kerosene For Use in Aviation)
<span style="width:45mm"/>
										<b>Registration No. </b>
										<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
										<span style="width:8px;"/>
										<span style="font-weight:normal">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneRegistrationNum"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--   END LINE 7   -->
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<br/>
					<div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 5mm; margin-right: 15mm; padding-right:10mm">Claimant certifies that it sold the kerosene at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained the written consent
of the buyer to make the claim. Claimant certifies that the kerosene did not contain visible evidence of dye.
</div>
					<div style="width:183mm;margin-left:2.75mm;font-size:6pt;">
						<div style="float:left;padding-top:1mm;padding-left:3mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
								</xsl:call-template>
								<b>Exception.</b> If any of the kerosene included in this claim <b>did </b> contain visible evidence of dye, attach an explanation and check here<span class="styDotLn" style="float:none;clear:none;">......</span>
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
								<xsl:with-param name="TabOrder" select="1"/>
							</xsl:call-template>
							<span style="letter-spacing:10px;font-weight:bold;font-size:6pt;"/>
							<span style="margin-left: 1mm; margin-right:1mm">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							</span>
						</div>
						<div style="float:right;padding-right:.5mm;">
							<input alt="SlsUndyedKeroseneExceptionInd" type="checkbox" class="styIRS4136Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
									<xsl:with-param name="backupName">UndyedKeroseneSalesException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedKeroseneSalesException</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" style="width:187mm;" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th class="styIRS4136TableCellLine" style="width:3mm;height:4mm;border:0" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;border-right-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px; border-bottom-width:0px;" scope="col">
										<span style="width:1mm;"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136Braces" style="border-top-width:1px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 7A USE ON A FARM FOR FARMING PURPOSES -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="border-right-width:0px;">Use by a state or local government
      </td>
									<td class="styIRS4136TableCellA" style="border-left-width:0px;">
										<span style="width:1mm;"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .243</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnStLclGovtGalsQty"/>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnStLclGovtGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces" rowspan="2">
										<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
									</td>
									<td class="styIRS4136TableCellD" rowspan="2">$ 
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnBlockPumpCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" rowspan="2">346
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 7B USE BY A STATE OR LOCAL GOVERNMENT  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="border-right-width:0px">Sales from a blocked pump</td>
									<td class="styIRS4136TableCellA">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3.5mm;text-align:center;">.243</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnBlockPumpGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 7C USE BY A STATE OR LOCAL GOVERNMENT  -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="border-right-width:0px;">Use in certain intercity and local buses</td>
									<td class="styIRS4136TableCellA">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:7mm;"> .17</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnUseBusGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136Braces">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnUseBusCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">347
        <span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--   END LINE 7    -->
					<!--   BEGIN LINE 8   -->
					<!--   BEGIN BLOCK DESCRIPTION   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both;padding-top:10mm;padding-left:2mm;padding-bottom:2mm;">
						<br/>8
    <span class="styIRS4136NBSP" style="padding-right:3mm;"/>
						<span class="styIRS4136NBSP"/>Sales by Registered Ultimate Vendors of Kerosene <br/>
						<span style="width:7.5mm"/>For Use in Aviation
<span style="width:72mm"/>
						<b>Registration No. </b>
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:8px;"/>
						<span style="font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneForAvnRegistrationNum"/>
							</xsl:call-template>
						</span>
					</div>
					<div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 8mm; margin-right: 5mm; padding-right:10mm;">
					Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the buyer, repaid 
    the amount of tax to the buyer, or has obtained the written consent of the buyer to make the claim. See the instructions for additional information to be submitted.

</div>
					<div style="width:187mm;float:left;clear:left;styBB;border-bottom:1px solid black;" id="8bFctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;border-bottom:0;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom:0px;border-top:1px solid black;">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;border-top:1px solid black;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;border-top:1px solid black;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;border-top:1px solid black;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;border-top:1px solid black;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;border-top:1px solid black;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 8A -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm; border-bottom-width:4mm;border-color:white">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade) taxed at $.219</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:1mm;text-align:center;">$ .175</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd219GalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd219CrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">355<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 8B -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;padding-right:1.5mm;           border-bottom-width:4mm;border-color:white">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;">
                  Use in commercial aviation (other than foreign trade) taxed at $.244<br/>
									</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.200</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd244GalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd244CrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">417<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 8C -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-left:4mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;">
                  Nonexempt use in noncommercial aviation<br/>
									</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.025</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnNnxmptUseInAvnGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnNnxmptUseInAvnCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">418<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 8D  -->
								<!-- LOOP -->
								<xsl:variable name="Line8DRowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
								<xsl:if test="$Line8DRowCount = 0 or ((count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt; 1) and          ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>d</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Other nontaxable uses taxed at $.244</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style=";padding-left:5mm;">.243</td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnOthNontxTxd244CrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">346
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/OtherNontaxableUseTaxedAt244) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt244">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8DRowCount"/></xsl:attribute>
													<b>d</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8DRowCount"/></xsl:attribute>Other nontaxable uses taxed at $.244
												</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8DRowCount"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnOthNontxTxd244CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8DRowCount"/></xsl:attribute>346
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row 8E  -->
								<!-- LOOP -->
								<xsl:variable name="Line8ERowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
								<xsl:if test="$Line8ERowCount = 0 or ((count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt; 1) and          ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>e</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Other nontaxable uses taxed at $.219</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.218
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE"> 360
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/OtherNontaxableUseTaxedAt219) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt219">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8ERowCount"/></xsl:attribute>
													<b>e</b>
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8ERowCount"/></xsl:attribute>Other nontaxable uses taxed at $.219</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.218</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8ERowCount"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnOthNontxTxd219CrAmt"/>
													</xsl:call-template>
													<span class="styIRS4136TableCellPad"/>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line8ERowCount"/></xsl:attribute>369
              <span class="styIRS4136TableCellPad"/>
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  Row 8F -->
								<!--  *******************************************************************************************  -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-left:4mm;">
										<b>f</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:90mm;">
										LUST tax on aviation fuels used in foreign trade</td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:5.5mm;">.001</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxSlsKrsnAvnFrgnTrdGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxSlsKrsnAvnFrgnTrdCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">433<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--   END LINE 8   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2014)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm; border-bottom:2px solid black;">
						<div style="float: left; clear: none">Form 4136 (2014)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN LINE 09   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both">
						<br/>9
    <span class="styIRS4136NBSP"/>
    Reserved
<!--    Alcohol Fuel Mixture Credit
-->
						<span style="width:95mm;"/>Registration No.
    <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:8px;"/>
						<span style="font-weight:normal">
							<!--							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelCrRegistrationNum"/>
							</xsl:call-template>-->
						</span>
						<br/>
						<br/>
					</div>
					<div class="styIRS4136DescLine" style="font-size: 7pt; margin-left: 5mm; margin-right: 5mm; padding-right:10mm;width:182mm;border:solid black 1; border-top-width:0px;border-right-width:0px;border-left-width:0px;">
						<br/>
						<br/>
						<!--Claimant produced an alcohol fuel mixture by mixing taxable fuel with alcohol. The alcohol fuel mixture was sold by the claimant to any person
for use as a fuel or was used as a fuel by the claimant.-->
					</div>
					<!--</div>-->
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons of alcohol</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 09A -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">
										<!--Alcohol fuel mixtures containing ethanol-->
									Reserved
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:4.5mm;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
										<!--$ .45*-->
									</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;background-color: lightgrey;">
										<!--
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureEthnlGalsQty"/>
										</xsl:call-template>
-->
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<!--									$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureEthnlCrAmt"/>
										</xsl:call-template>
-->
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
										<!--393-->
									</td>
								</tr>
								<!--  Row 09B  -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">
									Reserved
									<!--Alcohol fuel mixtures containing alcohol (other than ethanol)-->
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:4.5mm;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad" style="width:2.5mm;"/>
										<!--.60*-->
									</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;background-color: lightgrey;">
										<!--										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureAlcGalsQty"/>
										</xsl:call-template>-->
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<!--										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AlcoholFuelMixtureAlcCrAmt"/>
										</xsl:call-template>-->
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
										<!--									394
-->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--					<div class="styNBB" style="width:187mm;height:2mm;padding-left:8mm">
					*See instructions for possible rate changes.
					 </div>-->
					<!--   END LINE 09   -->
					<!--					<div style="width:187mm;height:2mm;padding-left:6mm;"/>
-->
					<!--   BEGIN LINE 10   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both">
						<br/>
						<br/>10
    <span class="styIRS4136NBSP"/>  
    Biodiesel or Renewable Diesel Mixture Credit
            <span style="padding-left:25mm;">Registration No.</span>
						<span style="width:2mm;"/>
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:2px;"/>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select=" $IRS4136Data/BiodieselRnwblRegistrationNum"/>
											</xsl:call-template>
										</span>
						<span style="width:2px;"/>
						<span style="font-weight:normal;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselRnwblRegistrationNum"/>
							</xsl:call-template>
						</span>
						<br/>
						<br/>
					</div>
				<div class="styIRS4136DescLine" style="font-size:7pt;margin-left:8mm;margin-right:5mm;width:182mm;border-bottom:1px solid black;">

						<b>Biodiesel mixtures.</b> Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to produce the mixture met ASTM
D6751 and met EPA’s registration requirements for fuels and fuel additives. The mixture was sold by the claimant to any person for use as a
fuel or was used as a fuel by the claimant. Claimant has attached the Certificate for Biodiesel and, if applicable, the Statement of Biodiesel
Reseller. <b>Renewable diesel mixtures.</b> Claimant produced a mixture by mixing renewable diesel with liquid fuel (other than renewable diesel).
The renewable diesel used to produce the renewable diesel mixture was derived from biomass process, met EPA’s registration requirements
for fuels and fuel additives, and met ASTM D975, D396, or other equivalent standard approved by the IRS. The mixture was sold by the
claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant has attached the Certificate for Biodiesel and, if
applicable, the Statement of Biodiesel Reseller, both of which have been edited as discussed in the Instructions for Form 4136. See the
instructions for line 10 for information about renewable diesel used in aviation.
   </div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;font-size:2.15mm;" scope="col">
										<b>(c) Gallons of biodiesel or renewable diesel</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 10A -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:.5mm">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">
									Biodiesel (other than agri-biodiesel) mixtures
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:4.5mm;">
										$1.00
									</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
																			$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select=" $IRS4136Data/BiodieselMixtureCreditAmt"/>
											</xsl:call-template>
										</span>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">
									388
									</td>
								</tr>
								<!--  Row 10B  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">
									Agri-biodiesel mixtures
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:4.5mm;;">
										$1.00
									</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select=" $IRS4136Data/AgriBiodieselMixtureCreditAmt"/>
											</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										</span>									
										</td>
									<td class="styIRS4136TableCellE">
										390
									</td>
								</tr>
								<!--  Row 10C  -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;"> 
									Renewable diesel mixtures
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:4.5mm;">
										$1.00
									</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select=" $IRS4136Data/RenewableDieselMixtureCrAmt"/>
											</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										</span>
										</td>
									<td class="styIRS4136TableCellE">
										307
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--   END LINE 10   -->
					<div style="width:187mm;height:2mm;padding-left:6mm;"/>
					<xsl:variable name="table9RowCount" select="3 + count($IRS4136Data/OtherNontaxableUseAviationGrade)"/>
					<xsl:variable name="RowCount11C" select="count($IRS4136Data/OtherNontaxableUse)"/>
					<!-- BEGIN LINE 11  Nontaxable Use of Alternative Fuel (after September 30, 2006) -->
					<xsl:variable name="RowCount11" select="count($IRS4136Data/OtherNontaxableUse)"/>
					<div class="styIRS4136NumLine" style="float: none; clear: both;">
						<br/>
						<br/>11
    <span class="styIRS4136NBSP"/>  
    Nontaxable Use of Alternative Fuel 
    <span style="width:182mm;"/>
						<br/>
					</div>
					<div style="width:187mm;padding-bottom:.5mm;border-top-width:1px;">
						<div style="float:left;padding-top:2mm;margin-left:2.5mm;padding-left:4mm">
							<b>Caution.</b> There is a reduced credit rate for use in certain intercity 
                and local buses (type of use 5) (see instructions).  
              </div>
						<span style="width:7mm;text-align:right;float:right; clear: none">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$RowCount11 + 2"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" '14ctn' "/>
							</xsl:call-template>
						</span>
					</div>
					<div style="width:187mm;float:left;clear:left;styBB;border-top:1px solid black;" id="14ctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!-- ============================================================================= -->
								<!--  Row 11A -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/NontxLiquifiedPetroleumGas)"/>
									<xsl:if test="($AGRowCount + count($IRS4136Data/BusNontxLiquifiedPetroleumGas)  = 0) or                  ((count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas) &gt; 1) and ($Print = $Separated))">
								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
									Liquefied petroleum gas (LPG)
      </td>
									<td class="styIRS4136TableCellA">
										<span class="styIRS4136TableCellPad"/>
									</td>
											<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;">$ .183</td>

									<td class="styIRS4136TableCellC" style="text-align:left;">
										<span class="styIRS4136TableCellPad"/>
										
<xsl:if test=" ((count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>

									</td>
									<td class="styIRS4136TableCellD">$
										<span class="styIRS4136TableCellPad"/>
									</td>
										<td class="styIRS4136TableCellE">419
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
																
</xsl:if>

								<!-- Adding check for the SRD -->
								
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas) &lt;= 1) ">


									<xsl:for-each select="$IRS4136Data/NontxLiquifiedPetroleumGas">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
													<b>a</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquifiedPetroleumGas) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Liquefied petroleum gas (LPG)
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Liquefied petroleum gas (LPG)
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;">$ .183</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquifiedPetroleumGas) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
               <xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>419
             <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
               <xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>419
             <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

								<!-- ====================================================================== -->
								
									<xsl:if test="count($IRS4136Data/BusNontxLiquifiedPetroleumGas) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCount = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>a</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied petroleum gas (LPG)
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;">$ .183</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
               <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>419
             <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;">
                          $
                            <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								<!-- ====================================================================== -->
																</xsl:if>
								<!-- ====================================================================== -->
								<!-- ============================================================================= -->
								<!--  Row 11B -->
<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->
								<!-- LOOP -->
																<xsl:variable name="AGRowCountb" select="count($IRS4136Data/NontxPSeriesFuels)"/>
								<xsl:if test="($AGRowCountb  + count($IRS4136Data/BusNontxPSeriesFuels)  = 0) or                  ((count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels)  &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>b</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">"P Series" fuels
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.183
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels)  &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">420
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								
								<!-- Adding check for the SRD -->
								
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxPSeriesFuels">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
													<b>b</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxPSeriesFuels) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>"P Series" fuels
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>"P Series" fuels
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxPSeriesFuels) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>

														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>420
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>420
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxPSeriesFuels) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCountb = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>b</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">"P Series" fuels
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountb"/></xsl:attribute>420
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								</xsl:if>


								<!--  Row 11C -->
<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->
								<!-- LOOP -->
								

								<xsl:variable name="AGRowCountc" select="count($IRS4136Data/NontxCompressedNaturalGas)"/>
								<xsl:if test="($AGRowCountc  + count($IRS4136Data/BusNontxCompressedNaturalGas)  = 0) or                  ((count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas)  &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>c</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.183
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas)  &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">421
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>


								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxCompressedNaturalGas">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
													<b>c</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxCompressedNaturalGas) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxCompressedNaturalGas) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>


														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>421
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>421
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxCompressedNaturalGas) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCountc = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>c</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountc"/></xsl:attribute>421
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								</xsl:if>


								<!--  Row 11D -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCountd" select="count($IRS4136Data/NontxLiquifiedHydrogen)"/>
								<xsl:if test="($AGRowCountd  + count($IRS4136Data/BusNontxLiquifiedHydrogen)  = 0) or
								                  ((count($IRS4136Data/NontxLiquifiedHydrogen) &gt; 1) + count($IRS4136Data/BusNontxLiquifiedHydrogen)  and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>d</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied hydrogen
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;"> .183</td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxLiquifiedHydrogen) + count($IRS4136Data/BusNontxLiquifiedHydrogen)  &gt; 1) and
											 ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
										
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">422
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!-- Adding check for the SRD -->
								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquifiedHydrogen) + count($IRS4136Data/BusNontxLiquifiedHydrogen)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxLiquifiedHydrogen">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>
													<b>d</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquifiedHydrogen) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>Liquefied hydrogen
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>Liquefied hydrogen
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;"> .183</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquifiedHydrogen) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute> 
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>422
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute> 
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>422
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>
									<!-- ====================================================================== -->
									<xsl:if test="count($IRS4136Data/BusNontxLiquifiedHydrogen) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCountd = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>d</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied hydrogen
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;"> .183</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute> 
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountd"/></xsl:attribute>422
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<!-- ====================================================================== -->
								</xsl:if>
								<!--  Row 11E -->

<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>e</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->


<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>f</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->

<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>g</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->

<!--								<tr>
									<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
										<b>h</b>
									</td>
									<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Reserved
      </td>
									<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:3mm;text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellC" style="text-align:left;background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="background-color: lightgrey;">
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>-->

								<xsl:variable name="AGRowCounte" select="count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal)"/>
								<xsl:if test="($AGRowCounte  + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)  = 0) or                  ((count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)  &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>e</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Fischer&#8211;Tropsch process liquid fuel from coal (including peat) </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.243
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)  &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">423
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>


								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxLiqfdFuelDerivedFromCoal">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
													<b>e</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>Fischer&#8211;Tropsch process liquid fuel from coal (including peat) </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>Fischer&#8211;Tropsch process liquid fuel from coal (including peat) </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>

														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>423
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>423
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCounte = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>e</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Fischer&#8211;Tropsch process liquid fuel from coal (including peat) </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounte"/></xsl:attribute>423
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								</xsl:if>
								
								<!--  Row 11F -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCountf" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass)"/>
								<xsl:if test="($AGRowCountf  + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)  = 0) or ((count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)  &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>f</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquid fuel derived from biomass
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.243
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)  &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">424
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>


								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontaxLiqFuelDerFromBiomass">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
													<b>f</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>Liquid fuel derived from biomass
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>Liquid fuel derived from biomass
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>


														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>424
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>424
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCountf = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>f</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquid fuel derived from biomass
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>424
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:if>


								<!--  Row 11G -->
								<!-- LOOP -->


								<xsl:variable name="AGRowCountg" select="count($IRS4136Data/NontxLiquefiedNaturalGas)"/>
								<xsl:if test="($AGRowCountg  + count($IRS4136Data/BusNontxLiquefiedNaturalGas)  = 0) or ((count($IRS4136Data/NontxLiquefiedNaturalGas) &gt; 1) + count($IRS4136Data/BusNontxLiquefiedNaturalGas)  and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>g</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied natural gas (LNG)
      </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.243
                    </td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxLiquefiedNaturalGas) + count($IRS4136Data/BusNontxLiquefiedNaturalGas) &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">425
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>

								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquefiedNaturalGas) + count($IRS4136Data/BusNontxLiquefiedNaturalGas)  &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxLiquefiedNaturalGas">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>
													<b>g</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquefiedNaturalGas) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>Liquefied natural gas (LNG)
        </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>Liquefied natural gas (LNG)
        </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquefiedNaturalGas) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>


														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>425
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>425
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxLiquefiedNaturalGas) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCountg = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>g</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied natural gas (LNG)
      </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.243</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountf"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCountg"/></xsl:attribute>425
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								</xsl:if>


								<!--  Row 11H -->
								<!-- LOOP -->
								

								<xsl:variable name="AGRowCounth" select="count($IRS4136Data/NontxLiquefiedGasBiomass)"/>
								<xsl:if test="($AGRowCounth + count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)  = 0) or ((count($IRS4136Data/NontxLiquefiedGasBiomass) + count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)  &gt; 1)  and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
											<b>h</b>
										</td>
										<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied gas derived from biomass
                    </td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="text-align:center;padding:1.25mm;">.183</td>
										<td class="styIRS4136TableCellC" style="text-align:left;">
											<span class="styIRS4136TableCellPad"/>
											<xsl:if test=" ((count($IRS4136Data/NontxLiquefiedGasBiomass) + count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)  &gt; 1) and ($Print = $Separated))">
												<xsl:attribute name="style">text-align:left;</xsl:attribute>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedGasBiomass"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">435
        <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>

								<xsl:if test="($Print != $Separated) or (count($IRS4136Data/NontxLiquefiedGasBiomass) + count($IRS4136Data/BusNontxLiquefiedGasDerBiomass) &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxLiquefiedGasBiomass">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
													<b>h</b>
												</td>
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquefiedGasDerBiomass) = 1)">
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>Liquified gas derived from biomass
                         </td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>Liquified gas derived from biomass
                         </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="(count($IRS4136Data/BusNontxLiquefiedGasDerBiomass) = 1)">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>


														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>435
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad"/>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>435
              <span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>

									<xsl:if test="count($IRS4136Data/BusNontxLiquefiedGasDerBiomass) = 1">
										<xsl:choose>
											<xsl:when test="$AGRowCounth = 0">
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<b>h</b>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">Liquefied gas derived from biomass
                    </td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">.183</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCounth"/></xsl:attribute>435
              <span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td class="styIRS4136LetterCell" style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="MaxSize" select="9"/>
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/GallonsQty"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>

								</xsl:if>

							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$RowCount11 + 2"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" '14ctn' "/>
					</xsl:call-template>
					<!--   END LINE 11   -->
					<!--					<div  style="width:187mm;height:2mm;padding-left:8mm;">* These rates apply after Septemper 30, 2012</div>
-->
					<!--   BEGIN LINE 12   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both">
						<br/>
						<br/>12
    <span class="styIRS4136NBSP"/>  
    Alternative Fuel Credit
            <span style="padding-left:66mm;">Registration No.</span>
						<span style="width:2mm;"/>
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:8px;"/>
						<span style="font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/AlternativeFuelRegistrationNum"/>
							</xsl:call-template>
						</span>
						<br/>
						<br/>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:1px solid black;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 12A -->
							<tr>
									<td class="styIRS4136LetterCell">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
									Liquefied petroleum gas (LPG)
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6mm;">$ .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedPetroleumGasGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
									
									$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedPetroleumGasCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">426<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12B  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
									"P Series" fuels
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">427<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12C  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
									Compressed natural gas (CNG) (GGE = 121 cu. ft.)
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">428<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12D  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>d</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">Liquefied hydrogen</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedHydrogenGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD"> 
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedHydrogenCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">429<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12e  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>e</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
										Fischer-Tropsch process liquid fuel from coal (including peat)
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerFromCoalGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerFromCoalCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">430<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12f  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>f</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
									Liquid fuel derived from biomass
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerBiomassGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerBiomassCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">431<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12g  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>g</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
									Liquefied natural gas (LNG)
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedNaturalGasGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedNaturalGasCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">432<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  Row 12h  -->
								<!--  ******************************************************************************************  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>h</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
										Liquefied gas derived from biomass
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">436<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  ******************************************************************************************  -->
								<!--   Row 12i  -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
										<b>i</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">
										Compressed gas derived from biomass (GGE = 121 cu. ft.)
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:9mm;"> .50</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassGGEQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">437<span class="styIRS4136TableCellPad"/></td>
								</tr>
								<!--  ******************************************************************************************* -->
							</tbody>
						</table>
					</div>
					<!--   END LINE 12   -->
					<!--   BEGIN BLOCK 13   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; padding-top:1mm;padding-bottom:2mm;">
						<div style="float: left; clear: none;padding-left:8mm">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2014)
  </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styBB" style="width:187mm; border-bottom:2 px;">
						<div style="float: left; clear: none">Form 4136 (2014)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<!--   BEGIN LINE 13   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both">
						<br/>13
    <span class="styIRS4136NBSP"/>Registered Credit Card Issuers
            <span style="padding-left:52mm;">Registration No.</span>
						<!--   <span style="width:82mm;"></span>  -->
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:8px;"/>
						<span style="font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/CreditCardIssrRegistrationNum"/>
							</xsl:call-template>
						</span>
						<br/>
						<br/>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons </b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 13a -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">Diesel fuel sold for the exclusive use of a state or local government</td>
									<td class="styIRS4136TableCellB" style="padding-left:4mm;">$ .243</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/DslFuelSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/DslFuelSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">360<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 13b  -->
								<tr>
									<td class="styIRS4136LetterCell">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">Kerosene sold for the exclusive use of a state or local government</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;text-align:center:">.243</td>
									<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnFuelSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnFuelSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">346<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- Row 13C -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;padding-bottom:4mm;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">
                  Kerosene for use in aviation sold for the exclusive use of a state or local government taxed at $.219
                   <span style="width:3px;"/>
									</td>
									<td class="styIRS4136TableCellB" style="padding-left:6.5mm;padding-top:3mm;">.218</td>
									<td class="styIRS4136TableCellC" style="padding-top:3mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 4136 line 13c(c),  AviationKeroseneGallons/@keroseneTaxRateCd</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty/@keroseneTaxRateCd"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD" style="padding-top:4mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtCrAmt"/>
											</xsl:call-template>
										</span>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE" style="padding-top:3mm;">369<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--   END LINE 13   -->
					<!--   BEGIN BLOCK 14   -->
					<!--   BEGIN LINE 14   -->
					<xsl:variable name="Line14aCount" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
					<div style="width:187mm;padding-top:10mm;"/>
					<div class="styIRS4136NumLine" style="padding-bottom:2mm;float:none;clear:both;border-bottom:0;">14
    <span class="styIRS4136NBSP">
							<br/>
						</span>Nontaxable Use of a Diesel-Water Fuel Emulsion
        <span style="font-weight:normal">
							<br/>
						</span>
					</div>
					<div style="width:187mm;font-size:6pt;padding-top:1mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="padding-left:8mm">
							<b>Caution.</b>There is a reduced credit rate for use in certain intercity and local buses (type of use 5) (see instructions).
            </div>
						<xsl:variable name="line14TableRowCount" select="1 + count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
						<div class="styGenericDiv" style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleRowCount">
								<xsl:with-param name="DataRowCount" select="$line14TableRowCount"/>
								<xsl:with-param name="containerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" '17ctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainer" id="17ctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;border-right-width:0;                   width:3mm;height:4mm;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;border-top-width:1px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellA" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center;border-top-width:1px;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 14A  -->
								<xsl:if test="($Line14aCount + count($IRS4136Data/BusNontxUseDieselWtrEmulsion) = 0) or (($Line14aCount + count($IRS4136Data/BusNontxUseDieselWtrEmulsion) &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell ">
											<b>a</b>
										</td>
										<td class="styIRS4136TableCellLine">Nontaxable use</td>
										<td class="styIRS4136TableCellA">
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-top:1mm;">
											<xsl:if test="position()=1">$ </xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:5mm; "/>
											</xsl:if>.197
              </td>
										<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
											<xsl:if test="($Line14aCount  + count($IRS4136Data/BusNontxUseDieselWtrEmulsion)) &gt;1 and $Print = $Separated">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWaterEmulsion"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styIRS4136TableCellD">
											<span class="styIRS4136TableCellPad">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
												</xsl:call-template>
											</span>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellE">309
      <span class="styIRS4136TableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($Line14aCount  + count($IRS4136Data/BusNontxUseDieselWtrEmulsion)) =1 or (($Line14aCount  + count($IRS4136Data/BusNontxUseDieselWtrEmulsion) &gt;1)  and ($Print != $Separated))">
									<xsl:for-each select="$IRS4136Data/NontxUseDieselWaterEmulsion">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell" style="padding-bottom:15mm;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>
													<b>a</b>
												</td>
												<xsl:choose>
													<xsl:when test="count($IRS4136Data/BusNontxUseDieselWtrEmulsion) =1">
														<td class="styIRS4136TableCellLine" style="padding-bottom:15mm;border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>Nontaxable use</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellLine" style="padding-bottom:15mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>Nontaxable use
                              </td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styIRS4136TableCellB" style="padding-top:1mm;">
												<xsl:if test="position()=1">$ </xsl:if>
												<xsl:if test="position()!=1">
													<span style="padding-left:3mm; text-align:center;"/>
												</xsl:if>.197
              </td>
											<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="MaxSize" select="9"/>
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<xsl:if test="position()=1">
												<xsl:choose>
													<xsl:when test="count($IRS4136Data/BusNontxUseDieselWtrEmulsion) =1">
														<td class="styIRS4136TableCellD" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>$
                              <xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
																</xsl:call-template>
															</span>
														</td>
														<td class="styIRS4136TableCellE" style="border-bottom:0;">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute> 309<span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td class="styIRS4136TableCellD">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>$
                              <xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
															</xsl:call-template>
															<span class="styIRS4136TableCellPad">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
																</xsl:call-template>
															</span>
														</td>
														<td class="styIRS4136TableCellE">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute> 309<span class="styIRS4136TableCellPad"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</tr>
									</xsl:for-each>
									<!-- ====================================================================== -->
									<xsl:if test="count($IRS4136Data/BusNontxUseDieselWtrEmulsion) = 1">
										<br/>
										<xsl:choose>
											<xsl:when test="$Line14aCount = 0">
												<tr>
													<td class="styIRS4136LetterCell ">
														<b>a</b>
													</td>
													<td class="styIRS4136TableCellLine">Nontaxable use</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-top:1mm;">
														<xsl:choose>
															<xsl:when test="count($IRS4136Data/NontxUseDieselWaterEmulsion)= 0">$ 
                        </xsl:when>
															<xsl:otherwise>
																<span style="padding-left:3mm; text-align:center;"/>
															</xsl:otherwise>
														</xsl:choose>.197
              </td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/GallonsQty"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellD">
														<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute>$
                            <xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad">
															<xsl:call-template name="SetFormLinkInline">
																<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
															</xsl:call-template>
														</span>
													</td>
													<td class="styIRS4136TableCellE">
														<xsl:attribute name="rowspan"><xsl:value-of select="$Line14aCount"/></xsl:attribute> 309<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:when>
											<xsl:otherwise>
												<tr>
													<td style="vertical-align:middle;padding-left:4mm;padding-right:1.5mm;">
</td>
													<td class="styIRS4136TableCellLine" style="vertical-align:middle;">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellA">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/FuelTaxLocalBusCd"/>
														</xsl:call-template>
														<span style="width:1mm"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/NontaxableUseOfFuelTypeCd"/>
														</xsl:call-template>
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellB" style="padding-top:1mm;">
														<xsl:choose>
															<xsl:when test="count($IRS4136Data/NontxUseDieselWaterEmulsion)= 0">$ 
                        </xsl:when>
															<xsl:otherwise>
																<span style="padding-left:3mm; text-align:center;"/>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/CreditRt"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/GallonsQty"/>
														</xsl:call-template>
													</td>
													<td class="styIRS4136TableCellD">
														<span class="styIRS4136TableCellPad"/>
													</td>
													<td class="styIRS4136TableCellE">
														<span class="styIRS4136TableCellPad"/>
													</td>
												</tr>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<!-- ====================================================================== -->
								</xsl:if>
								<!--  Row 14B OTHER NONTAXABLE USE  -->
								<td class="styIRS4136LetterCell " style="border-bottom-width:1px;">
									<b>b</b>
								</td>
								<td class="styIRS4136TableCellLine">Exported</td>
								<td class="styIRS4136TableCellA" style="background-color: lightgrey;">
									<span class="styIRS4136TableCellPad"/>
								</td>
								<td class="styIRS4136TableCellB" style="padding-left:3mm;">.198
        <span class="styIRS4136TableCellPad"/>
								</td>
								<td class="styIRS4136TableCellC" style="padding-left:2mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="MaxSize" select="19"/>
										<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDslWtrEmulsionQty"/>
									</xsl:call-template>
								</td>
								<td class="styIRS4136TableCellD" style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="MaxSize" select="19"/>
										<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDslWtrEmulsionCrAmt"/>
									</xsl:call-template>
									<span class="styIRS4136TableCellPad"/>
								</td>
								<td class="styIRS4136TableCellE">306
        <span class="styIRS4136TableCellPad"/>
								</td>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<xsl:with-param name="DataRowCount" select="$Line14aCount"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" '17ctn' "/>
					</xsl:call-template>
					<!--   END LINE 14   -->
					<!--   BEGIN BLOCK 15   -->
					<!--   BEGIN LINE 15   -->
					<div class="styIRS4136NumLine" style="padding-top:10mm;float: none; clear:both;padding-bottom:2mm;">
						<br/>15   
    <span class="styIRS4136NBSP"/>  
    Diesel-Water Fuel Emulsion Blending
            <span style="padding-left:42mm;">Registration No.</span>
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<span style="width:8px;"/>
						<span style="font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/DieselWtrBlndgRegistrationNum"/>
							</xsl:call-template>
						</span>
						<!--						<div style="width:187mm;"/>
-->
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 15A -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">
										<span style="border-bottom-width:1px"/>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">Blender credit</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .046</td>
									<td class="styIRS4136TableCellC" style="width=32mm;padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="width=35mm">$
                  <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionCrAmt"/>
											</xsl:call-template>
										</span>
									</td>
									<td class="styIRS4136TableCellE">310<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- end Line 15 -->
					<!--   BEGIN BLOCK 16   -->
					<!--   BEGIN LINE 16   -->
					<div class="styIRS4136NumLine" style="float: none; clear: both; padding-top:10mm;padding-bottom:2mm; ">
						<br/>16
    <span class="styIRS4136NBSP"/>Exported Dyed Fuels and Exported Gasoline Blendstocks
<!--  <div style="width187mm'">
							<br/>
						</div>-->
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<thead class="styIRS4136TableThead">
								<tr>
									<th style="width:3mm;height:4mm;" scope="col"/>
									<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styIRS4136TableCellB" style="text-align: center" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styIRS4136TableCellC" style="text-align: center" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styIRS4136TableCellD" style="text-align: center" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styIRS4136TableCellE" style="text-align: center" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 16a -->
								<tr>
									<td class="styIRS4136LetterCell" style="padding-bottom:4mm">
										<b>a</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:95mm;">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001</td>
									<td class="styIRS4136TableCellB" style="padding-left:2mm;text-align:center;">$ .001</td>
									<td class="styIRS4136TableCellC" style="width=32mm;padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelGalsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="width=32mm">
          $<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelCrAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">415<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!--  Row 16b -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom:1px solid black;">
										<b>b</b>
									</td>
									<td class="styIRS4136TableCellLine" style="width:100mm;">Exported dyed kerosene</td>
									<td class="styIRS4136TableCellB" style="padding-left:6mm;"> .001</td>
									<td class="styIRS4136TableCellC" style="width=32mm;padding-left:2mm;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="19"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneGallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellD" style="width=32mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneCreditAmt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styIRS4136TableCellE">416<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- end Line 16 -->
					<div style="width:187mm;padding-top:10mm;"/>
					<!-- BEGIN of line 17 -->
					<div class="styBB" style="width:187mm;font-size:7pt;float:none;clear:both;border-top-width:1px;">
						<div class="styGenericDiv" style="width:6mm;height:11mm;font-weight:bold;padding-left:1mm;padding-top:3px; font-size:8pt;">17
      </div>
						<div class="styGenericDiv" style="width:129.7mm;height:11mm;padding-left:5px;padding-top:3px;">
							<b>Total income tax credit claimed. </b>Add lines 1 through 16, column (d). Enter here and on Form 1040, line 72; Form 1120, Schedule J, line 19b; Form 1120S, line 23c; Form 1041, line 24g; or the proper line of other returns.
        <span style="padding-left:2mm">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							</span>
						</div>
						<div class="styGenericDiv" style="width:7.2mm;height:11mm;font-weight: bold;text-align:center;padding-top:7mm;border-left:1 solid black;">17
            </div>
						<div class="styGenericDiv" style="width:32.7mm;height:11mm;padding-top:6mm;text-align:right;padding-right:1mm;border-left:1 solid black;">$
          <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:11mm;height:11mm;border-left:1px solid black;background-color:lightgrey;">
							<span style="width:1px;"/>
						</div>
					</div>
					<!--   END LINE 17   -->
					<!--   END BLOCK 17   -->
					<!--   BEGIN FORM FOOTER  -->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
						<div style="float:right">
							<span style="width:80px"/>Form <span class="styBoldText">4136</span> (2014)
  </div>
					</div>
					<!--   END FORM FOOTER   -->
					<!-- <br/>
      <div class="pageEnd"></div> -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS4136Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
<!--						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 4136, Line 11a(a) - UA Registration Number</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4136Data/OtherNonTaxableUses/@UARegistrationNumber"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc"> Line 13c(c) keroseneTaxRateCd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty/@keroseneTaxRateCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Begin Separated Repeating data -->
					<!-- Begin SRD for line 1 -->
					<xsl:variable name="AFRowCount" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
					<xsl:if test="($Print = $Separated) and  ($AFRowCount &gt; 1) ">
						<span class="styRepeatingDataTitle">Form 4136, Line 1 - Nontaxable Use of Gasoline</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:3mm;height:4mm;border-right-width:0px;" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:16mm;border-left-width:0px;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Loop  -->
								<xsl:for-each select="$IRS4136Data/OtherNontaxableUseOfGasoline">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="vertical-align:top;border-right-width:0px;text-align:left;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>
												<b>c</b>
											</td>
											<td class="styDepTblCell" style="width:77mm;vertical-align:top;border-left-width:0px;text-align:left;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount"/></xsl:attribute>Other nontaxable use (see <b>Caution</b> above line 1)
            </td>
										</xsl:if>
										<td class="styIRS4136TableCellA" style="width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-top:1mm;">
											<xsl:if test="position()=1">$ </xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm; text-align:center;"/>
											</xsl:if>.183
              </td>
										<td class="styIRS4136TableCellC" style="width=32mm;padding-left:2mm;text-align:center;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblRow2Cell" style="width:32mm;text-align:right;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount "/></xsl:attribute>$
                      <xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfGasolineCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblRow2Cell" style="width:9mm;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AFRowCount "/></xsl:attribute>362
                      <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								<!-- End Loop  -->
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  Start here 222 -->
					<!-- Begin SRD for Line 2-->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/AviationNontxUseGasGalsQty) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 4136, Line 2 - Nontaxable Use of Aviation Gasoline</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:3mm;height:4mm;border-right-width:0px;" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:16mm;border-left-width:0px;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="text-align: center;width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 2A USE IN COMMERCIAL AVIATION (OTHER THAN FOREIGN TRADE) -->
								<!--  Row 2B OTHER NONTAXABLE USE  -->
								<!-- LOOP -->
								<xsl:variable name="AGRowCount" select="count($IRS4136Data/AviationNontxUseGasGalsQty)"/>
								<xsl:for-each select="$IRS4136Data/AviationNontxUseGasGalsQty">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblRow2Cell" style="vertical-align:top;width:3mm;border-right-width:0px;text-align:left;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>
												<b>b</b>
											</td>
											<td class="styDepTblRow2Cell" style="vertical-align:top;width:77mm;border-left-width:0px;text-align:left;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>Other nontaxable use (see<b> Caution </b> above line 1)
                    </td>
										</xsl:if>
										<td class="styDepTblCell" style="width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styIRS4136TableCellB" style="padding-top:1mm;">
											<xsl:if test="position()=1">$ </xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm; text-align:center;"/>
											</xsl:if>.193
              </td>
										<!--<td class="styDepTblCell" style="padding-left:3mm;text-align:center;">.193</td>-->
										<td class="styDepTblCell" style="width:32mm;border-right-width:0px;text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblRow2Cell" style="width:32mm;text-align:right;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>$
                      <xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationNontxGasCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblRow2Cell" style="width:9mm;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount"/></xsl:attribute>324
                      <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  start line 3 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
					<!-- Begin line 3 SRD table -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedDiesel) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 4136, Line 3 - Nontaxable Use of Undyed Diesel Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 3A NONTAXABLE USE  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
								<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedDiesel">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
												<b>a</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Nontaxable use
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.243
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
												<span class="styIRS4136TableCellPad"/>360
                      </td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  end line 3  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
					<!-- Begin line 4 SRD table -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedKerosene) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 4A NONTAXABLE USE  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
								<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedKerosene">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
												<b>a</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Nontaxable use taxed at $.244
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.243
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>346
                        <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- Begin line 4e SRD table -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontxUseUndyedKrsnTxdAt044) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- LOOP -->
								<xsl:variable name="UKRowCount4e" select="count($IRS4136Data/NontxUseUndyedKrsnTxdAt044)"/>
								<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxdAt044">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4e"/></xsl:attribute>
												<b>e</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4e"/></xsl:attribute>Nontaxable use taxed at $.044
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.044
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4e"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd044CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4e"/></xsl:attribute>377
                        <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Line 4e SRD table -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
						<!-- Begin line 4f SRD table -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontxUseUndyedKrsnTxd219) &gt; 2)">
						<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- LOOP -->
								<xsl:variable name="UKRowCount4f" select="count($IRS4136Data/NontxUseUndyedKrsnTxd219)"/>
								<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxd219">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4f"/></xsl:attribute>
												<b>f</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4f"/></xsl:attribute>Nontaxable use taxed at $.219
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.219
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4f"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount4f"/></xsl:attribute>369
                        <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Line 4f SRD table -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- Begin Line 5 SRD table -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 5c  $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- Begin line 5c SRD table -->
					<xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation
  <span style="font-weight:normal">(see </span>
							<b>Caution </b>
							<span style="font-weight:normal">above line 1)</span>
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 5c  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd244)"/>
								<xsl:for-each select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>c</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-             right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Nontaxable use (Other than use by state or local government) taxed at $.244
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.243
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>346
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 5c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start line 5d  $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- Begin line 5d SRD table -->
					<xsl:if test="(count($IRS4136Data/NonTxKrsnUsedInAvnTxd219) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation
  <span style="font-weight:normal">(see </span>
							<b>Caution </b>
							<span style="font-weight:normal">above line 1)</span>
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 5d  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd219)"/>
								<xsl:for-each select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>d</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Nontaxable use (Other than use by state or local government) taxed at $.219
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.218
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>369
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 5d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   bstart line 5e  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- Begin line 5e SRD table -->
					<xsl:if test="(count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 5 - LUST tax on aviation fuels used in foreign trade
                  </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 5d  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty)"/>
								<xsl:for-each select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>e</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>LUST tax on aviation fuels used in foreign trade
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Type"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.001
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>433
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   end line 5e      $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 8d   $$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- Begin line 8D SRD table -->
					<xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 8D  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
								<!-- Line8d -->
								<xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt244">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>d</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Other nontaxable uses taxed at $.244
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.243
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>$
              <xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnOthNontxTxd244CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
              346
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 8d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$start line 8e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- Begin line 8E SRD table -->
					<xsl:if test="(count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 8E  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
								<!-- Line8E -->
								<xsl:for-each select="$IRS4136Data/OtherNontaxableUseTaxedAt219">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>e</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Other nontaxable uses taxed at $.219
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1">
												<span style="padding-left:3mm;"/>
											</xsl:if>.218
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnOthNontxTxd219CrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>369
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ end line 8e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11a SRD table -->
<!--					
					<xsl:if test="(count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11a  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas)"/>
								<xsl:for-each select="$IRS4136Data/NontxLiquifiedPetroleumGas">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>a</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquefied petroleum gas (LPG)
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>419
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()=1">$</xsl:if>
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr> -->
								
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
<!--
							</tbody>
						</table>
						<br/>
					</xsl:if>
-->
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11b $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11b SRD table -->
<!--
					<xsl:if test="(count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11b  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels)"/>
								<xsl:for-each select="$IRS4136Data/NontxPSeriesFuels">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>b</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>"P Series" fuels
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>420
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/CreditRt"/>
										</xsl:call-template>
										<span style="width:2mm"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxPSeriesFuels/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>

-->

					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  11b $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11c SRD table -->
					
<!--
					<xsl:if test="(count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11b  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxCompressedNaturalGas) +                  count($IRS4136Data/BusNontxCompressedNaturalGas)"/>
								<xsl:for-each select="$IRS4136Data/NontxCompressedNaturalGas">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>c</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>421
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/CreditRt"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxCompressedNaturalGas/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>
-->

					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11c $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11d SRD table -->
					<xsl:if test="(count($IRS4136Data/NontxLiquifiedHydrogen) + count($IRS4136Data/BusNontxLiquifiedHydrogen) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 11d  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquifiedHydrogen) +                  count($IRS4136Data/BusNontxLiquifiedHydrogen)"/>
								<xsl:for-each select="$IRS4136Data/NontxLiquifiedHydrogen">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>d</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquefied hydrogen
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.183
            <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>422
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11d $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11e SRD table -->


<!--
					<xsl:if test="(count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLqfdFuelDerivedFromCoal) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11e  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) +                  count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)"/>
								<xsl:for-each select="$IRS4136Data/NontxLiqfdFuelDerivedFromCoal">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>e</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Fischer&#8211;Tropsch process liquid fuel from coal (including peat) </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>423
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>

-->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11e $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11f $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11f SRD table -->

<!--
					<xsl:if test="(count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11f  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass) +                  count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)"/>
								<xsl:for-each select="$IRS4136Data/NontaxLiqFuelDerFromBiomass">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>f</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquid fuel derived from biomass
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>424
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>

-->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11f $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11g $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11g SRD table -->
					

<!--
					<xsl:if test="(count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11g  --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquefiedNaturalGas) +                  count($IRS4136Data/BusNontxLiquefiedNaturalGas)"/>
								<xsl:for-each select="$IRS4136Data/NontxLiquefiedNaturalGas">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>g</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquefied natural gas (LNG)
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.243
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>425
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>

-->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11g $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 11h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 11h SRD table -->

<!--
					<xsl:if test="(count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">
            Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons or gasoline gallon equivalents (GGE)</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								--><!--  Row 11h --><!--
								--><!-- LOOP --><!--
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxLiquefiedGasBiomass) +                  count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)"/>
								<xsl:for-each select="$IRS4136Data/NontxLiquefiedGasBiomass">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>h</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquified gas derived from biomass
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.183
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>435
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
								--><!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& --><!--
							</tbody>
						</table>
						<br/>
					</xsl:if>
					
-->

					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 11h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  start 12h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 12h SRD table -->
					<xsl:if test="(count($IRS4136Data/LiquefiedGasDerBiomassGalsQty) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 12 - Liquified gas derived from biomass</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 12h -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/LiquefiedGasDerBiomassGalsQty)"/>
								<xsl:for-each select="$IRS4136Data/LiquefiedGasDerBiomassGalsQty">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>h</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Liquified gas derived from biomass
            </td>
										</xsl:if>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.50*
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>436
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 12h $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  start 12i $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 12i SRD table -->
					<xsl:if test="(count($IRS4136Data/CompressedGasBiomassGGEQty) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 12 - Compressed gas derived from biomass (GG = 121 cu.ft.)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 12i -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/CompressedGasBiomassGGEQty)"/>
								<xsl:for-each select="$IRS4136Data/CompressedGasBiomassGGEQty">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>i</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Compressed gas derived from biomass (GG = 121 cu.ft.)
            </td>
										</xsl:if>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1"/>
											<xsl:if test="position()!=1"/>.50*
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCreditAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>437
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!--  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 12i $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ start 14a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- Begin line 14a SRD table -->
					<xsl:if test="(count($IRS4136Data/NontxUseDieselWaterEmulsion) + count($IRS4136Data/BusNontxUseDieselWtrEmulsion) &gt;1) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 4136, Line 14 - Nontaxable Use of Diesel-Water Fuel Emuision</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th style="width:3mm;height:4mm;border-right-width:0px;" class="styDepTblCell" scope="col"/>
									<th class="styDepTblCell" style="width:77mm;border-left-width:0px;" scope="col">
										<span class="styIRS4136TableCellPad"/>
									</th>
									<th class="styDepTblCell" style="width:16mm;" scope="col">
										<b>(a) Type of use</b>
									</th>
									<th class="styDepTblCell" style="width:13mm;" scope="col">
										<b>(b) Rate</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;border-right-width:0px;" scope="col">
										<b>(c) Gallons</b>
									</th>
									<th class="styDepTblCell" style="width:32mm;" scope="col">
										<b>(d) Amount of credit</b>
									</th>
									<th class="styDepTblCell" style="width:9mm;" scope="col">
										<b>(e) CRN</b>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--  Row 14a  -->
								<!-- LOOP -->
								<xsl:variable name="UKRowCount8" select="count($IRS4136Data/NontxUseDieselWaterEmulsion) + count($IRS4136Data/BusNontxUseDieselWtrEmulsion)"/>
								<xsl:for-each select="$IRS4136Data/NontxUseDieselWaterEmulsion">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="border-right-width:0px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<b>a</b>
												<span style="width:1px;"/>
											</td>
											<td class="styDepTblCell" style="vertical-align:top;border-left-width:0px;text-align:left;width:77mm;border-right-width:1px;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>Nontaxable use
            </td>
										</xsl:if>
										<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<td style="border-bottom:1 solid black;padding-top:2mm;">
											<xsl:if test="position()=1">$</xsl:if>
											<xsl:if test="position()!=1"/>.197
                        <span class="styIRS4136TableCellPad"/>
										</td>
										<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="MaxSize" select="9"/>
												<xsl:with-param name="TargetNode" select="GallonsQty"/>
											</xsl:call-template>
											<span class="styIRS4136TableCellPad"/>
										</td>
										<xsl:if test="position()=1">
											<td class="styDepTblCell" style="text-align:right;border-right:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
												</xsl:call-template>
												<span class="styIRS4136TableCellPad"/>
											</td>
											<td class="styDepTblCell" style="text-align:center;border-left:1 solid black;vertical-align:top;">
												<xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount8"/></xsl:attribute>309
              <span class="styIRS4136TableCellPad"/>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="$UKRowCount8 mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="border:1 solid black;border-left-width:1px;width:16mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/FuelTaxLocalBusCd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/NontaxableUseOfFuelTypeCd"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td style="border-bottom:1 solid black;">
										<xsl:if test="position()!=1"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/CreditRt"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span class="styIRS4136TableCellPad"/>
									</td>
									<td class="styDepTblCell" style="border:1 solid black;text-align:right;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="MaxSize" select="9"/>
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion/GallonsQty"/>
										</xsl:call-template>
										<span class="styIRS4136TableCellPad"/>
									</td>
								</tr>
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
								<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  end 14a $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
