<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120SScheduleK1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleK1"/>
	<xsl:template name="RowWriterCore">
		<!-- Updated 05/07/2012 (CJ) R8_D2   -->
		<tr>
			<td class="styLeftNumBox">
				<span style="width:1px;"/>
			</td>
			<td height="10px;" style="height:4.5mm;font-size:7pt;text-align:left;width:172mm;" class="styIRS1120SScheduleK1BBtable">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<!-- This template displays tables populated with data of the CodeAndAmountType data types      -->
	<!-- The data is displayed in a dependency data style table. There is an optional parameter         -->
	<!-- that indicates whether to display the associated push pin that comes from the Code element  -->
	<!-- By default, this field is set to false unless the caller set it to true.                   -->
	<xsl:template name="DisplayCodeAndAmountTable">
		<xsl:param name="TargetNode"/>
		<xsl:param name="SubTargetNode"/>
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
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
							</xsl:when><xsl:otherwise>styDepTblRow2
							</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--First column -->
							<td class="styDepTblCell" style="text-align:left;width:50mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="*"/>
								</xsl:call-template>
								<xsl:choose>
									<xsl:when test="$DisplayPushPin = 'true'">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="*"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</td>
							<!-- Second Column -->
							<td class="styDepTblCell" style="text-align:right;width:136mm;">
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
	<!-- This template displays a line or lines of data for the IRS1120S Schedule K1 Part III Line 10 Code/Amount fields  -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is              -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table.              -->
	<xsl:template name="SpecialPopulateUSAddressTemplate">
		<xsl:param name="TargetNode"/>
		<xsl:variable name="addressLine2" select="$TargetNode/AddressLine2Txt"/>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine1Txt"/>
		</xsl:call-template>
		<!-- Only create line space for AddressLine 2 if it exists -->
		<xsl:if test="$addressLine2 != ''">
			<br/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/AddressLine2Txt"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Only create line space for the City, State, and ForeignPostalCd if they exist-->
		<xsl:if test="$TargetNode/CityNm != ''or $TargetNode/StateAbbreviationCd != '' or $TargetNode/ZIPCd != ''">
			<br/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/CityNm"/>
			</xsl:call-template>
			<!-- Only display a comma between city and state if both city and state exist-->
			<xsl:if test="$TargetNode/CityNm != '' and $TargetNode/StateAbbreviationCd != ''">,
				<span style="width:2px;">
				</span>
			</xsl:if>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/StateAbbreviationCd"/>
			</xsl:call-template>
			<span style="width:7px;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode/ZIPCd"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
				<meta name="Description" content="IRS Form 1120SScheduleK1"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- Comment out out for separate print -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120SScheduleK1Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<!-- Standard Header -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- Form Display Starts Here -->				
				<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family:Verdana; font-size: 7pt;">
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="font-family: Courier New, monospace; font-size: 13pt; text-align: right; width: 186mm;">671121</span>
						</td>
					</tr>
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="width: 186mm;">
								<span style="float: right; margin-bottom: 0.5mm;">
									<input alt="Final K-1 Ind" type="checkbox" class="styCkbox" name="checkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
											<xsl:with-param name="backupName">IRS1120SScheduleK1/Final K-1 Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalK1Ind"/>
											<xsl:with-param name="BackupName">Final K-1 Ind</xsl:with-param>
										</xsl:call-template>
										<span style="vertical-align: bottom;">Final K-1</span>
									</label>
									<span style="width: 11mm;"/>
									<!-- *********** Important note: No schema data to match this checkbox ********-->
									<input type="checkbox" alt="Amended K-1" class="styCkbox" name="checkbox" id="dummyID2" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedK1Ind"/>
											<xsl:with-param name="backupName">IRS1120SScheduleK1/Amended K-1 Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="vertical-align: bottom;" for="dummyID2">Amended K-1</label>
									<span style="width: 11mm;"/>
									<!-- *********** Important note: No schema data to match this checkbox ********-->                 
                                        OMB No. 1545-0123
			           			</span>
							</span>
						</td>
					</tr>
					<tr>
						<td style="width: 93mm;" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" style="border-right: 2px solid black;">
								<tr>
									<td style="width: 93mm;">
										<div style="width: 93mm;">
											<!-- Width necessary to prevent table from shrinking -->
											<span class="styFormNumber" style="font-size: 10pt;padding-top:2mm;float: left; clear: none;">Schedule K-1<br/>(Form 1120-S)
											</span>
											<div class="styTY" style="float: right; clear: none; padding-right: 0mm;">
												20<span class="styTYColor" style="padding-right: 2mm;">21</span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 7pt;">Department of the Treasury<br/>
										<span style="float: left; clear: none;">Internal Revenue Service</span>
										<span style="float: left; clear:none;padding-left:1mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData"/>
											</xsl:call-template>
											<span style="width:2mm;"/>
											<!-- Push Pin -->
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 1120S Schedule K-1, Top Left Margin - Section 1377 (A)(2) Election Indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/@section1377a2Cd"/>
											</xsl:call-template>
										</span>
										<span style="float: right; clear: none; padding-right: 2mm;">For calendar year 2021 or tax year 
										</span>
										<span style="float: left; clear: both; padding-right: 1mm;">beginning
											<span style="width: 26mm; border-bottom: 1px solid black; text-align: center;">
												<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
											</span>
											<span style="float: right; clear: both; padding-left :16mm;">ending
												<span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
													<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
												</span>
											</span>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="styMainTitle" style="font-size: 12pt;">Shareholder's Share of Income, Deductions,
										</span>
										<br/>
										<span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits,etc.</span>
										<span style="float: right; clear: none; font-weight: bold; font-size: 7pt; padding-right: 1mm;padding-top: 0.5mm;">
											<img src="{$ImagePath}/1120SSchK1_Bullet.gif" width="4" height="7" alt="Right pointing arrow image" border="0"/> See separate instructions.</span>
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid black; border-top: 2px solid black;height: 7.mm;background-color:lightgrey;">
										<!-- Part I header -->
										<span class="IRS1120SScheduleK1_partName" style="margin: 2mm;">Part I</span>
										<span class="IRS1120SScheduleK1_partDesc">
											Information About the Corporation</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
										<!-- Line A -->
										<span style="font-weight: bold;">A</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Corporation's employer identification number</span>
										<br/>
										<span style="width: 6mm;"/>
										<xsl:choose>
											<xsl:when test="normalize-space($FormData/CorporationEIN)">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
												</xsl:call-template>
												<span style="width: 2px"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
												</xsl:call-template>
												<span style="width: 2px"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line B -->
										<span style="font-weight: bold;">B</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Corporation's name, address, city, state, and ZIP code</span>
										<span style="width: 6mm;"/>
										<span style="width: 80mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="not($FormData/CorporationName/BusinessNameLine2Txt='' or  not ($FormData/CorporationName/BusinessNameLine2Txt))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<!-- Display Corporation US Address -->
											<xsl:if test="$FormData/CorporationUSAddress and $FormData/CorporationUSAddress != ''">
												<xsl:call-template name="SpecialPopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/CorporationUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<!-- Display Corporation Foreign Address -->
											<xsl:if test="$FormData/CorporationForeignAddress and $FormData/CorporationForeignAddress != ''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/CorporationForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 9mm;">
										<!-- Line C -->
										<span style="font-weight: bold;">C</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">IRS Center where corporation filed return</span>
										<br/>
										<span style="width: 6mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ServiceCenterWhereRetFiledCd"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 20mm;">
										<!-- Line D -->
										<span style="font-weight: bold;">D</span>									
										<span style="width: 68; padding-left:3mm;float:left: clear: none;">Corporation's total number of shares</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">Beginning of tax year 
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.....</span>											
										</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorpTotBeginTaxYearSharesCnt"/>
											</xsl:call-template>
										</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">End of tax year
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.......</span>
										</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorpTotEndTaxYearSharesCnt"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid black; border-top: 1px solid black; height: 8mm;background-color: lightgrey;">
										<!-- Part II header -->
										<span class="IRS1120SScheduleK1_partName" style="margin: 2mm;">Part II</span>
										<span class="IRS1120SScheduleK1_partDesc">Information About the Shareholder
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
										<!-- Line E -->
										<span style="font-weight: bold;">E</span>
										<span style="width: 3mm;"/>Shareholder's identifying number<br/>
										<!-- If EIN exists -->
										<xsl:if test="not($FormData/ShareholderEIN='' or not($FormData/ShareholderEIN))">
											<span style="width: 7mm;"/>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderEIN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else if SSN exists -->
										<xsl:if test="not($FormData/ShareholderSSN='' or not($FormData/ShareholderSSN))">
											<span style="width: 7mm;"/>
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderSSN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else reason for no EIN/SSN -->
										<xsl:if test="not($FormData/MissingSSNEINReasonCd='' or not($FormData/MissingSSNEINReasonCd))">
											<span style="width: 7mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReasonCd"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line F -->
										<span style="font-weight: bold;">F</span>
										<span style="width: 3mm;"/>Shareholder's name, address, city, state, and ZIP code
										<!-- Part II, line E pen and ink image -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120S Schedule K-1, Line F - Shareholder's Name Control
											</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderNameControlTxt"/>
										</xsl:call-template>
										<br/>
										<span style="width: 7mm;"/>
										<span style="width: 80mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="not($FormData/ShareholderName/BusinessNameLine2Txt='' or not ($FormData/ShareholderName/BusinessNameLine2Txt))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/ShareholderUSAddress and $FormData/ShareholderUSAddress !=''">
												<xsl:call-template name="SpecialPopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:if test="$FormData/ShareholderForeignAddress and  $FormData/ShareholderForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 7mm;">
										<!-- Line G -->
										<span style="font-weight: bold;">G</span>									
										<span style="width: 70; padding-left:3mm;float:left: clear: none;">Current year allocation percentage
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.....</span>
										</span>
										<span style="width: 18mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentYrAllocationPct"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 20mm;">
										<!-- Line H -->
										<span style="font-weight: bold;">H</span>									
										<span style="width: 68; padding-left:3mm;float:left: clear: none;">Shareholder's number of shares</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">Beginning of tax year 
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.....</span>											
										</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/BeginTaxYearSharesCnt"/>
											</xsl:call-template>
										</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">End of tax year
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.......</span>
										</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/EndTaxYearSharesCnt"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 20mm;">
										<!-- Line I -->
										<span style="font-weight: bold;">I</span>									
										<span style="width: 68; padding-left:3mm;float:left: clear: none;">Loans from shareholder</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">Beginning of tax year 
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.....</span>											
										</span>
										<span style="width:1px;">$</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/LoansFromShareholderBOYAmt"/>
											</xsl:call-template>
										</span>
										<br/><br/>
										<span style="width: 68; padding-left:8mm;float:left: clear: none;">End of tax year
									   <!--Dotted Line-->
											<span class="styDotLn" style="float:right;padding-left:2mm;">.......</span>
										</span>
										<span style="width:1px;">$</span>
										<span style="width: 32mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/LoansFromShareholderEOYAmt"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height:135mm; vertical-align: middle">
										<!-- IRS Use Only box -->
										<img src="{$ImagePath}/1120SSchK1_For_IRS_Use_Only.gif" width="24" height="91" alt="For IRS Use Only" style="position: relative; left: -2mm"/>
									</td>
								</tr>
							</table>
							<!-- End inner table - Header, Part I, Part II -->
						</td>
						<td width="93mm" style="width: 93mm;" valign="top">
							<table width="93mm" border="0" cellpadding="0" cellspacing="0" nowrap="yes" style="border-top: 2px solid black; border-bottom: 0px;border-right: 2px solid black;">
								<!-- Inner table - Part III -->
								<tr>
									<td colspan="2">
										<!-- Part III header -->
										<table cellpadding="0" cellspacing="0" nowrap="yes">
											<tr>
												<td class="IRS1120SScheduleK1_tdPartName" style="width: 15mm;">
													<span class="IRS1120SScheduleK1_partName" style="vertical-align: top;">
													Part III</span>
												</td>
												<td class="IRS1120SScheduleK1_tdPartDesc">
													<span class="IRS1120SScheduleK1_partDesc">Shareholder's Share of Current Year Income, Deductions, Credits, and Other Items</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="border-right: 1px solid black;">
											<!-- Part III columns 1-12 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 1 -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;text-align: center;">1</div>
														<div style="width:40.3mm;">Ordinary business income (loss)
														</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;padding-top:2mm;">
															<span style="float:left;padding-left:2px;">
																<!-- Schedule K-1 Part III Line 1 Push Pin -->
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLossAmt"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 2 -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;text-align: center;">2</div>
														<div style="width:40.3mm;font-size: 6.3pt">Net rental real estate income (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;padding-top:2mm;">
															<span style="float:left;padding-left:2px;">
																<!--Schedule K-1 Part III Line 2 Push Pin -->
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/RealEstateNetIncomeLossAmt"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 3 -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">3</div>
														<div style="width:40.3mm;">Other net rental income (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;padding-top:2mm;">
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
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 4 -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">4</div>
														<div style="width:40.3mm;">Interest income</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height:5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 5a -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">5a</div>
														<div style="width:40.3mm;">Ordinary dividends</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;text-align: right;height: 5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 5b -->
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">5b</div>
														<div style="width:40.3mm;">Qualified dividends</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;text-align: right;height: 5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 6 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">6</div>
														<div style="width:40.3mm;">Royalties</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;text-align: right;height: 5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRyltsAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 7 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">7</div>
														<div style="width:40.3mm;font-size: 6.5pt;">	Net short-term capital gain (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;text-align: right;height: 5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 8a -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">													
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">8a</div>
														<div style="width:40.3mm;font-size: 6.5pt;">Net long-term capital gain (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;text-align: right;height: 5mm;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 8b -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">8b</div>
														<div style="width:40.3mm;font-size: 7pt;">Collectibles (28%) gain (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;text-align: right;padding-top:2mm;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLossAmt"/>
															</xsl:call-template>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 8c -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">													
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align:right;width:5.3mm;">8c</div>
														<div style="width:40.3mm;font-size: 7pt;">Unrecaptured section 1250 gain
														</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;padding-top:2mm;">
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
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 9 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">													
													<div style="width: 46.5mm;">
														<div class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">9</div>
														<div style="width:40.3mm;">Net section 1231 gain (loss)</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height: 5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;padding-top:2mm;">
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
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 10 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:8mm;text-align:center;float:left;vertical-align:top;border-right:1px solid black;">10</div>
													<div style="width:40.5mm;vertical-align:top;height:8mm;padding-left:1mm; ">
														<span style="float:left;padding-right:4.5mm">Other income (loss)</span>
														<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1OtherIncmLossGrp) &gt;4)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherIncmLossGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="4"/>
																	<xsl:with-param name="containerID" select=" 'SchK10Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:46.5mm;float:none;clear:both;" id="SchK10Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated)  or (count($FormData/IRS1120SSchK1OtherIncmLossGrp) &lt;=4)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1OtherIncmLossGrp">
																		<tr>
																			<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left;border-top:1px dotted gray;border-right:1px solid black; font-size:7pt;">
																				<span style="padding-top:2mm;">
																					<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherIncmLossCd"/>
																					</xsl:call-template>
																				</span>
																			</td>
																			<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm;border-top:1px dotted gray; width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right">
																				<span style="float:left;padding-left:2px;">																					
																					<span style="width:1mm;"/>
																					<xsl:call-template name="SetFormLinkInline">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherIncmLossCd"/>
																					</xsl:call-template>
																				</span>
																				<span style="float:right;">
																					<xsl:call-template name="PopulateAmount">
																						<xsl:with-param name="TargetNode" select="Amt"/>
																					</xsl:call-template>
																				</span>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1OtherIncmLossGrp) &lt; 4">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="10"/>
																		<xsl:with-param name="numRows" select="4 - count($FormData/IRS1120SSchK1OtherIncmLossGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1OtherIncmLossGrp) &gt; 4) and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="10"/>
																		<xsl:with-param name="numRows" select="4"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
											<!-- Line 11 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width:46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.3mm;">11</span>
														<div style="width:40.3mm;">Section 179 deduction</div>
														<div class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:5mm;"/>
														<div class="IRS1120SScheduleK1_amountBox" style="width:40.3mm;height: 5mm;text-align:right;padding-top:2mm;">
															<span style="float:left;padding-left:2px;">
																<xsl:call-template name="SetFormLinkInline">
																	<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
																</xsl:call-template>
															</span>
															<span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeductionAmt"/>
																</xsl:call-template>
															</span>
														</div>
													</div>
												</td>
											</tr>
											<!-- Line 12 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:9mm;text-align:center;float:left;vertical-align:top; border-right:1px solid black;">12</div>
													<div style="width:40.5mm;vertical-align:top;height:9mm;padding-left:1mm; ">
														<span style="float:left;padding-right:4.5mm">Other deductions</span>
														<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1OtherDedGrp) &gt;7)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherDedGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="7"/>
																	<xsl:with-param name="containerID" select=" 'SchK12Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:46.5mm;float:none;clear:both;" id="SchK12Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated)  or (count($FormData/IRS1120SSchK1OtherDedGrp) &lt;=7)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1OtherDedGrp">
																		<tr>
																			<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left; border-top:1px dotted gray;  border-right:1px solid black;font-size:7pt;"> 
																				<span style="padding-top:2mm;">
																					<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherDedCd"/>
																					</xsl:call-template>
																				</span>
																			</td>
																			<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm; border-top:1px dotted gray; width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right;">
																				<span style="float:left;padding-left:2px;">																					
																					<span style="width:1mm;"/>
																					<xsl:call-template name="SetFormLinkInline">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherDedCd"/>
																					</xsl:call-template>
																				</span>
																				<span style="float:right;">
																					<xsl:call-template name="PopulateAmount">
																						<xsl:with-param name="TargetNode" select="Amt"/>
																					</xsl:call-template>
																				</span>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1OtherDedGrp) &lt; 7">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="12"/>
																		<xsl:with-param name="numRows" select="8 - count($FormData/IRS1120SSchK1OtherDedGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1OtherDedGrp) &gt; 7) 	and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="12"/>
																		<xsl:with-param name="numRows" select="8"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<!-- Part III columns 13-19 -->
									<td valign="top">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0">
											<!-- Line 13 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:8.9mm;text-align:center;float:left;vertical-align:top;border-right:1px solid black;">13</div>
													<div style="width:43mm;vertical-align:top;height:8.9mm;padding-left:1mm;">
														<span style="float:left;padding-right:4.5mm">Credits</span>
														<xsl:if test="($Print != $Separated)  and (count($FormData/IRS1120SSchK1CreditsGrp) &gt;4)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1CreditsGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="4"/>
																	<xsl:with-param name="containerID" select=" 'SchK13Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:49mm;float:none;clear:both;" id="SchK13Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated) or (count($FormData/IRS1120SSchK1CreditsGrp) &lt;=4)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1CreditsGrp">
																		<tr>
																			<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left;border-top:1px dotted gray; border-right:1px solid black;font-size:7pt;">
																				<span style="padding-top:2mm;">	
																					<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1CreditsCd"/>
																					</xsl:call-template>
																				</span>
																			</td>
																			<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm; border-top:1px dotted gray;  width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right;">
																				<span style="float:left;padding-left:2px;">																					
																					<span style="width:1mm;"/>
																					<xsl:call-template name="SetFormLinkInline">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1CreditsCd"/>
																					</xsl:call-template>
																				</span>
																				<span style="float:right;">
																					<xsl:call-template name="PopulateAmount">
																						<xsl:with-param name="TargetNode" select="Amt"/>
																					</xsl:call-template>
																				</span>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1CreditsGrp) &lt; 4">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="13"/>
																		<xsl:with-param name="numRows" select="4 - count($FormData/IRS1120SSchK1CreditsGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1CreditsGrp) &gt; 4) 	and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="13"/>
																		<xsl:with-param name="numRows" select="4"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
												<!-- Line 14 -->
											<!-- There is a misalignment between the code box of line 14 and "A" in the print preview. It is an display issue of IE8 limitation -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:11mm;text-align:center;float:left;vertical-align:top;border-right:1px solid black;">14</div>
													<div style="width:43mm;vertical-align:top;height:11mm;padding-left:1mm;">
													
														<span>Schedule K-3 is attached if checked.
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode"  select="$FormData/ScheduleK3AttachedInd"/>
														</xsl:call-template>	
														
															<span style="padding-top:1mm;">											
															<!--Dotted Line-->
																<span class="styDotLn" style="float:right;padding-left:2mm;">...</span>																
															</span>
															<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>	
														
													
													<span style="float:right;margin-bottom: 0.5mm;">
														<input alt="Schedule K-3 is attached" type="checkbox" class="styCkbox" name="checkbox" onclick="return false;">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/ScheduleK3AttachedInd"/>
																<xsl:with-param name="backupName">IRS1120SScheduleK1/ScheduleK-3attachedInd</xsl:with-param>
															</xsl:call-template>
														</input>
														<label>
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="$FormData/ScheduleK-3attachedInd"/>
																<xsl:with-param name="BackupName">ScheduleK-3 attached Ind</xsl:with-param>
															</xsl:call-template>												
														</label>
														<span style="padding-left:5mm; "></span>
														</span>
														
													</span>
												
														<xsl:if test="($Print != $Separated)	and (count($FormData/IRS1120SSchK1FrgnTransGrp) &gt;6)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1FrgnTransGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="6"/>
																	<xsl:with-param name="containerID" select=" 'SchK14Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:49mm;float:none;clear:both;" id="SchK14Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated)  or (count($FormData/IRS1120SSchK1FrgnTransGrp) &lt;=6)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1FrgnTransGrp">
																		<tr>
																			<xsl:choose>
																				<xsl:when test="ForeignCountryOrUSPossessionCd
																				 or CountryOrPossessionCd  or ForeignRegulatedInvestmtCompCd">
																					<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left; border-top:1px dotted gray; border-right:1px solid black; font-size:7p;">
																						<xsl:call-template name="PopulateText">
																							<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
																						</xsl:call-template>
																					</td>
<!--																					<td class="IRS1120SScheduleK1_codeBox" style="width:1mm;height:8mm;padding-top:1mm;border-top:1px dotted gray; border-right:0px; font-size:6pt;text-align:left;">
																					</td>-->
																					<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm; border-top:1px dotted gray;  width:40.50mm;font-size:6.8pt;padding-left:1mm;text-align:left;">
																						<span style="float:left;padding-left:2px;">
																							<xsl:choose>
																								<xsl:when test="CountryOrPossessionCd and ForeignCountryOrUSPossessionCd ">																									
																									<span style="width:1mm;"/>
																									<xsl:call-template name="SetFormLinkInline">
																										<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
																									</xsl:call-template>
																									<span style="width:1mm;"/>
																									<xsl:call-template name="PopulateText">
																										<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																									</xsl:call-template>
																								</xsl:when>
																								<xsl:otherwise>
																							<!-- **********************************************************************************************************-->
																									<span style="width:1mm;"/>
																									<xsl:call-template name="SetFormLinkInline">
																										<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
																									</xsl:call-template>
																									<span style="width:1mm;"/>
																									<xsl:call-template name="PopulateText">
																										<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
																								</xsl:call-template>
																							<!-- **********************************************************************************************************-->
																					</xsl:otherwise>
																				</xsl:choose>
																						</span>
																						<span style="float:right;padding-left:0mm">
																						<span style="float:right;padding-left:6mm">
																							<xsl:call-template name="PopulateAmount">
																								<xsl:with-param name="TargetNode" select="Amt"/>
																							</xsl:call-template>
																						</span></span>
																					</td>
																				</xsl:when>
																				<xsl:otherwise>
																						<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left; border-top:1px dotted gray; border-right:1px solid black; font-size:7p;">
																						<xsl:call-template name="PopulateText">
																							<xsl:with-param name="TargetNode" select="IRS1120SSchK1FrgnTransCd"/>
																						</xsl:call-template>
																					</td>
																					<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm;border-top:gray dotted 1px;width:40.5mm;padding-left:1mm;text-align:left;">
																						<span style="width:1mm"/>
																						<xsl:call-template name="SetFormLinkInline">
																							<xsl:with-param name="TargetNode" select="IRS1120SSchK1FrgnTransCd"/>
																						</xsl:call-template>
																						<span style="float:right;padding-left:0mm">
																						<!--</span>-->
																						<span style="float:right;padding-left:6mm">
																							<xsl:call-template name="PopulateAmount">
																								<xsl:with-param name="TargetNode" select="Amt"/>
																							</xsl:call-template>
																						</span></span>
																					</td>
																				</xsl:otherwise>
																			</xsl:choose>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1FrgnTransGrp) &lt; 6">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="14"/>
																		<xsl:with-param name="numRows" select="6 - count($FormData/IRS1120SSchK1FrgnTransGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1FrgnTransGrp) &gt; 6) 	and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="14"/>
																		<xsl:with-param name="numRows" select="6"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
											<!-- The font size of description is small because it aligns with the toggle button, otherwise the toggle button will be push to next line -->
											<!-- Line 15 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:10mm;text-align:center;float:left;vertical-align:top; border-right:1px solid black;">15</div>
													<div style="width:43mm;vertical-align:top;height:10mm;padding-left:1mm;">
														<span style="float:left;font-size: 7pt;">
														Alternative minimum tax (AMT) items</span>
														<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1AMTItemsGrp) &gt;4)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AMTItemsGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="4"/>
																	<xsl:with-param name="containerID" select=" 'SchK15Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:49mm;float:none;clear:both;" id="SchK15Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated)  or (count($FormData/IRS1120SSchK1AMTItemsGrp) &lt;=4)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1AMTItemsGrp">
																		<tr>																		
																		<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left;border-top:1px dotted gray;border-right:1px solid black; font-size:7pt;">
																			<span style="padding-top:2mm;">
																				<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1AMTItemsCd"/>
																					</xsl:call-template>
																			</span>
																		</td>																			
																		<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm;border-top:1px dotted gray; width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right;">
																			<span style="float:left;padding-left:2px;">																					
																				<span style="width:1mm;"/>
																				<xsl:call-template name="SetFormLinkInline">
																					<xsl:with-param name="TargetNode" select="IRS1120SSchK1AMTItemsCd"/>
																				</xsl:call-template>
																			</span>
																			<span style="float:right;">
																				<xsl:call-template name="PopulateAmount">
																					<xsl:with-param name="TargetNode" select="Amt"/>
																				</xsl:call-template>
																			</span>
																		</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1AMTItemsGrp) &lt; 4">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="15"/>
																		<xsl:with-param name="numRows" select="4 - count($FormData/IRS1120SSchK1AMTItemsGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1AMTItemsGrp) &gt; 4) and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="15"/>
																		<xsl:with-param name="numRows" select="4"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
											<!-- The font size of description is small because it aligns with the toggle button, otherwise the toggle button will be push to next line -->
											<!-- Line 16 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:8mm;text-align:center;float:left;vertical-align:top; border-right:1px solid black;">16</div>
													<div style="width:43mm;vertical-align:top;height:8mm;padding-left:1mm;">
														<span style="float:left;font-size: 7pt;">	Items affecting shareholder basis</span>
														<xsl:if test="($Print != $Separated)  and (count($FormData/IRS1120SSchK1AffectngShrBssGrp) &gt;4)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AffectngShrBssGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="4"/>
																	<xsl:with-param name="containerID" select=" 'SchK16Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:49mm;float:none;clear:both;" id="SchK16Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated) 	or (count($FormData/IRS1120SSchK1AffectngShrBssGrp) &lt;=4)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1AffectngShrBssGrp">
																		<tr>
																			<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left;border-top:1px dotted gray;border-right:1px solid black; font-size:7pt;">
																				<span style="padding-top:2mm;">	
																					<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1AffectngShrBssCd"/>
																					</xsl:call-template>
																				</span>
																			</td>
																			<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;border-top:gray dotted 1px; width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right;">
																				<span style="float:left;padding-left:2px;">																					
																					<span style="width:1mm;"/>
																				</span>
																				<span style="float:right;">
																					<xsl:call-template name="PopulateAmount">
																						<xsl:with-param name="TargetNode" select="Amt"/>
																					</xsl:call-template>
																				</span>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1AffectngShrBssGrp)  &lt; 4">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="16"/>
																		<xsl:with-param name="numRows" select="4 - count($FormData/IRS1120SSchK1AffectngShrBssGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1AffectngShrBssGrp) &gt; 4)  and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="16"/>
																		<xsl:with-param name="numRows" select="4"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
											<!-- Line 17 -->
											<!-- There is a misalignment between the code box of line 15 and "*" in the print preview. It is an display issue of IE8 limitation -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div class="IRS1120SScheduleK1_itemLabel" style="width:5.3mm;height:9mm;text-align:center;float:left;vertical-align:top; border-right:1px solid black;">17</div>
													<div style="width:43mm;vertical-align:top;height:8mm;padding-left:1mm;">
														<span style="float:left;padding-right:4.5mm">Other information</span>
														<xsl:if test="($Print != $Separated)  and (count($FormData/IRS1120SSchK1OtherInfoGrp) &gt;3)">
															<span style="float:right;">
																<xsl:call-template name="SetDynamicTableToggleButton">
																	<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherInfoGrp"/>
																	<xsl:with-param name="headerHeight" select="0"/>
																	<xsl:with-param name="containerHeight" select="3"/>
																	<xsl:with-param name="containerID" select=" 'SchK17Ctn' "/>
																</xsl:call-template>
															</span>
														</xsl:if>
													</div>
													<div class="styTableContainer" style="width:49mm;float:none;clear:both;" id="SchK17Ctn">
														<table cellpadding="0" cellspacing="0" style="auto;">
															<tbody>
																<xsl:if test="($Print != $Separated)  or (count($FormData/IRS1120SSchK1OtherInfoGrp) &lt;=3)">
																	<xsl:for-each select="$FormData/IRS1120SSchK1OtherInfoGrp">
																		<tr>
																			<td class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;height:8mm;float:left;border-top:1px dotted gray;border-right:1px solid black; font-size:7pt;">
																				<span style="padding-top:2mm;">
																					<xsl:call-template name="PopulateText">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherInfoCd"/>
																					</xsl:call-template>
																				</span>
																			</td>
																			<td class="IRS1120SScheduleK1_amountBox" style="height:8mm;padding-top:1mm;border-top:1px dotted gray; width:40.50mm;font-size:7pt;padding-left:1mm;text-align:right;">
																				<span style="float:left;padding-left:2px;">																					
																					<span style="width:1mm;"/>
																					<xsl:call-template name="SetFormLinkInline">
																						<xsl:with-param name="TargetNode" select="IRS1120SSchK1OtherInfoCd"/>
																					</xsl:call-template>
																				</span>
																				<span style="float:right;">
																					<xsl:call-template name="PopulateAmount">
																						<xsl:with-param name="TargetNode" select="Amt"/>
																					</xsl:call-template>
																				</span>
																			</td>
																		</tr>
																	</xsl:for-each>
																</xsl:if>
																<xsl:if test="count($FormData/IRS1120SSchK1OtherInfoGrp) &lt; 3">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="17"/>
																		<xsl:with-param name="numRows" select="3 - count($FormData/IRS1120SSchK1OtherInfoGrp)"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="(count($FormData/IRS1120SSchK1OtherInfoGrp) &gt; 3) and ($Print = $Separated)">
																	<xsl:call-template name="PrintBlanksLines">
																		<xsl:with-param name="lineNumber" select="17"/>
																		<xsl:with-param name="numRows" select="3"/>
																	</xsl:call-template>
																</xsl:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<!-- Line 18 -->
								<tr>
									<td colspan="2" style="height:8mm;font-family: Verdana; font-size: 7pt;border-top: 1px solid black;padding-top:4mm;">
										<span style="width: 83mm;">
										<span style="width:6mm;float:left;padding-left:2mm;padding-top:1mm;">18</span>
											<span style="float: left; margin-bottom: 0.5mm;">
												<input alt="More than one activity for at-risk purposes" type="checkbox" class="styCkbox" name="checkbox" onclick="return false;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/Sect465AtRiskAggregatedActyInd"/>
														<xsl:with-param name="backupName">IRS1120SScheduleK1/Sect465AtRiskAggregatedActyInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/Sect465AtRiskAggregatedActyInd"/>
														<xsl:with-param name="BackupName">At Risk Aggregated Ind</xsl:with-param>
													</xsl:call-template>												
												</label>											
											</span>
											<span style="padding-top:1mm;padding-left:2mm;">More than one activity for at-risk purposes*
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode"  select="$FormData/Sect465AtRiskAggregatedActyInd"/>
												</xsl:call-template>
											</span> 
										</span>										
									</td>
								</tr>
								<!-- Line 19 -->
								<tr>
									<td colspan="2" style="height:6mm;font-family: Verdana; font-size: 7pt;border-top: 0px solid black;">
										<span style="width: 83mm;">
										<span style="width:6mm;float:left;padding-left:2mm;padding-top:1mm;">19</span>
											<span style="float: left; margin-bottom: 0.5mm;">
												<input alt="More than one activity for passive activity purposes" type="checkbox" class="styCkbox" name="checkbox" onclick="return false;">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/Sect469PALGroupedActyInd"/>
														<xsl:with-param name="backupName">IRS1120SScheduleK1/Sect469PALGroupedActyInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/Sect469PALGroupedActyInd"/>
														<xsl:with-param name="BackupName">Sect469PALGroupedActyInd</xsl:with-param>
													</xsl:call-template>												
												</label>											
											</span>
										    <span style="padding-top:1mm;padding-left:2mm;">More than one activity for passive activity purposes*
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode"  select="$FormData/Sect469PALGroupedActyInd"/>
												</xsl:call-template>
											</span>
										</span>										
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height:12.3mm;font-family: Verdana; font-size: 7pt;border-top: 1px solid black;text-align: center;">
										* See attached statement for additional information.
									</td>
								</tr>
							</table>
							<!-- End inner table - Part III -->
						</td>
					</tr>
					<tr>
						<td width="187mm" colspan="2" style="width: 187mm; font-family: Verdana; font-size: 6pt;font-weight: bold; border-top: 2px solid black;">
							<span style="width: 88mm;">For Paperwork Reduction Act Notice, see Instructions for Form 1120-S.</span>
							<span style="font-weight: normal;width: 25mm;">www.irs.gov/Form1120S</span>
							<span style="font-weight: normal;width: 25mm;padding-left:7mm">Cat. No. 11520D</span>
							<span style="width: 51.5mm;text-align:right;">Schedule K-1 (Form 1120-S) 2021</span>
						</td>
					</tr>
				</table>
				<!-- FORM DISPLAY STUFF ENDS HERE -->
				<br/>
				<div class="pageEnd" style="width:187mm"/>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1OtherIncmLossGrp) &gt;4)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherIncmLossGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'SchK10Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1OtherDedGrp) &gt;7)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherDedGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'SchK12Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1CreditsGrp) &gt;4)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1CreditsGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'SchK13Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1FrgnTransGrp) &gt;6)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1FrgnTransGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'SchK14Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1AMTItemsGrp) &gt;4)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AMTItemsGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'SchK15Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1AffectngShrBssGrp) &gt;4)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AffectngShrBssGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'SchK16Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="($Print != $Separated) and (count($FormData/IRS1120SSchK1OtherInfoGrp) &gt;4)">
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherInfoGrp"/>
						<xsl:with-param name="headerHeight" select="0"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'SchK17Ctn' "/>
					</xsl:call-template>
				</xsl:if>
				<!-- From 1120S form -->
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
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 1120S Schedule K-1,Top Left Margin - Section 1377 (A)(2) Election Indicator</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/@section1377a2Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 1120S Schedule K-1, Line F - Shareholder's Name Control
						</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ShareholderNameControlTxt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<!-- END Left Over Table -->
				<!-- Additonal Data Table for separated data from Part III, Line 10 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherIncmLossGrp) &gt;4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherIncmLossGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1OtherIncmLossGrp/IRS1120SSchK1OtherIncmLossCd"/>
						  <xsl:with-param name="CodeAndAmountTableTitle"> Form 1120S Schedule K1, Part III, Line 10 - Other income (loss):
					    </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 10 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 12 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherDedGrp) &gt; 7) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherDedGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1OtherDedGrp/IRS1120SSchK1OtherDedCd"/>
						  <xsl:with-param name="CodeAndAmountTableTitle"> Form 1120S Schedule K1, Part III, Line 12 - Other deductions:
					    </xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 12 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 13 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1CreditsGrp) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1CreditsGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1CreditsGrp/IRS1120SSchK1CreditsCd"/>
						  <xsl:with-param name="CodeAndAmountTableTitle"> Form 1120S Schedule K1, Part III, Line 13 - Credits:
						</xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 13 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 14 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1FrgnTransGrp) &gt; 6) ">
					<br/>
					<span class="styRepeatingDataTitle">Form 1120S Schedule K1, Part III, Line 14 - Foreign transactions:
				    </span>
					<table class="styDepTbl" style="font-size:7pt">
						<thead class="styTableTHead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:70mm;">Country or Possession Code OR IRS Code</th>
								<th class="styDepTblCell" scope="col" style="width:70mm;">Foreign Country Or US Possession Cd</th>
								<th class="styDepTblCell" scope="col" style="width:70mm;">Foreign Regulated Investmt Comp Cd</th>
								<th class="styDepTblCell" scope="col" style="width:30mm;">Amount </th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRS1120SSchK1FrgnTransGrp">
								<tr>
									<!--Define background colors to the rows -->
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
									</xsl:attribute>
									<!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
									<!-- display Country/Possession Code + Country/Possession Name -->
									<xsl:choose>
										<xsl:when test="ForeignCountryOrUSPossessionCd or CountryOrPossessionCd or ForeignRegulatedInvestmtCompCd">							
											<!--First column -->
											<td class="styDepTblCell" style="text-align:left;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
												</xsl:call-template>
												<span style="width:1mm"></span>
												<xsl:call-template name="SetFormLinkInline">
												  <xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
												</xsl:call-template>
											</td>
											<!--Second column -->
											<td class="styDepTblCell" style="width:68mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
												<span style="width:1mm"/>
												<!--<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
												</xsl:call-template>-->
											</td>
											<!--Third column -->
											<td class="styDepTblCell" style="width:68mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
												</xsl:call-template>
												<span style="width:1mm"/>
												<!--<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="CountryOrPossessionCd"/>
												</xsl:call-template>-->
											</td>
											<!--fourth column -->
											<td class="styDepTblCell" style="width:68mm;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
											</td>
										</xsl:when>
										<!-- Otherwise, display Code + Amount -->
										<xsl:otherwise>
											<!--First Column -->
											<td class="styDepTblCell" style="text-align:left;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IRS1120SSchK1FrgnTransCd"/>
												</xsl:call-template>
												<span style="width:1mm"/>
												<!-- Schedule K-1 Part III Line 14 Pushpin -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="IRS1120SSchK1FrgnTransCd"/>
												</xsl:call-template>
											</td>
											<!--Second column -->
											<td class="styDepTblCell" style="width:68mm;text-align:left;">
												<span style="width:2mm;"/>N/A
											</td>
											<!--third column -->
											<td class="styDepTblCell" style="width:68mm;text-align:left;">
												<span style="width:2mm;"/>N/A
											</td>
											<!--fourth Column -->
											<td class="styDepTblCell" style="width:68mm;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Amt"/>
												</xsl:call-template>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Part III Line 14 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 15  -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1AMTItemsGrp) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AMTItemsGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1AMTItemsGrp/IRS1120SSchK1AMTItemsCd"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
                           Form 1120S Schedule K1, Part III, Line 15 - Alternative minimum tax (AMT) items:
						</xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 15 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 16 -->
				<xsl:if test="($Print = $Separated)  and (count($FormData/IRS1120SSchK1AffectngShrBssGrp) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AffectngShrBssGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1AffectngShrBssGrp/IRS1120SSchK1AffectngShrBssCd"/>
						<xsl:with-param name="CodeAndAmountTableTitle">Form 1120S Schedule K1, Part III, Line 16 - Items affecting hareholder basis:
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 16 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 17 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherInfoGrp) &gt; 3) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherInfoGrp"/>
						<xsl:with-param name="SubTargetNode" select="$FormData/IRS1120SSchK1OtherInfoGrp/IRS1120SSchK1OtherInfoCd"/>
						<xsl:with-param name="CodeAndAmountTableTitle">Form 1120S Schedule K1, Part III, Line 17 - Other information:
						</xsl:with-param>
						<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 17 separated data -->
			</body>
		</html>
	</xsl:template>
	<xsl:template name="PrintBlanksLines">
		<xsl:param name="lineNumber"/>
		<xsl:param name="numRows"/>
		<xsl:if test="$numRows &gt; 0">
			<tr style="height:8mm;">
				<td class="IRS1120SScheduleK1_codeBox" style="height: 5mm;border-top:1px dotted gray; border-right:gray dotted 1px;border-right:1px solid black;">
					<xsl:if test="(($numRows = 4) and (($lineNumber = 10) or ($lineNumber = 13) 
					or ($lineNumber = 15) or ($lineNumber = 16))) or
										(($numRows = 6) and (($lineNumber = 14))) or
										(($numRows = 7) and (($lineNumber = 12))) or
										(($numRows = 3) and (($lineNumber = 17)))">
						<xsl:attribute name="style">width:5.3mm;height: 5mm;border-top:0;</xsl:attribute>
					</xsl:if>
				</td>
				<xsl:if test="(($lineNumber = 14)) and ($Print != $Separated)">
					<td class="IRS1120SScheduleK1_codeBox" style="height: 5mm;border-top:1px dotted gray; width:3mm;border-right:0px;">
						<xsl:if test="$numRows = 6">
							<xsl:attribute name="style">border-top:0;width:3mm;height: 5mm;border-right:0px;</xsl:attribute>
						</xsl:if>
					</td>
				</xsl:if>
				<td class="IRS1120SScheduleK1_amountBox" style="border-top:gray dotted 1px; width:41mm;height: 5mm;" valign="bottom">
					<xsl:if test="(($numRows = 4) and (($lineNumber = 10))) or
										(($numRows = 7) and (($lineNumber = 12)))">
						<xsl:attribute name="style">border-top:0; width:41mm;height: 5mm;</xsl:attribute>
					</xsl:if>
					<xsl:if test="(($numRows = 4) and (($lineNumber = 13) or ($lineNumber = 15) 
					or ($lineNumber = 16))) or (($numRows = 3) and (($lineNumber = 17)))">
						<xsl:attribute name="style">border-top:0; width:43mm;height: 5mm;</xsl:attribute>
					</xsl:if>
					<xsl:if test="(($numRows = 6) and ($lineNumber = 14))">
						<xsl:attribute name="style">border-top:0; width:35.5mm;height: 5mm;</xsl:attribute>
					</xsl:if>
					<div style="padding-left:1mm;float:left;font-size:6pt;">
						<xsl:if test="($lineNumber = 10) and ($numRows = 4) and ($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherIncmLossGrp) &gt; 4)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherIncmLossGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 12) and ($numRows = 7) and ($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherDedGrp) &gt; 7)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherDedGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 13) and ($numRows = 4) and ($Print = $Separated) and (count($FormData/IRS1120SSchK1CreditsGrp) &gt; 4)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1CreditsGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 14) and ($numRows = 6) and ($Print = $Separated) and (count($FormData/IRS1120SSchK1FrgnTransGrp) &gt; 6)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1FrgnTransGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 15) and ($numRows = 4) 	and ($Print = $Separated) and (count($FormData/IRS1120SSchK1AMTItemsGrp) &gt; 4)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AMTItemsGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 16) and ($numRows = 4)  and ($Print = $Separated) and (count($FormData/IRS1120SSchK1AffectngShrBssGrp) &gt; 4)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1AffectngShrBssGrp"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($lineNumber = 17) and ($numRows = 3) 	and ($Print = $Separated) and (count($FormData/IRS1120SSchK1OtherInfoGrp) &gt; 3)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120SSchK1OtherInfoGrp"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</td>
			</tr>
			<xsl:call-template name="PrintBlanksLines">
				<xsl:with-param name="lineNumber" select="$lineNumber"/>
				<xsl:with-param name="numRows" select="$numRows - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>