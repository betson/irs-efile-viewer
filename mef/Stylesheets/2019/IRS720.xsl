<?xml version="1.0" encoding="UTF-8"?>
<!-- 01/12/2018 - Modified per UWR #205558 - Jeremy Nichols-->
<!-- 02/08/2018 - Modified per UWR #208207 - Jeremy Nichols-->
<!-- 10/26/2018 - Modified per UWR #214980 - Jeremy Nichols-->
<!-- 01/15/2019 - Modified per defect #127590 - Jeremy Nichols-->
<!-- 01/16/2019 - Modified per defect #127591 - Jeremy Nichols-->
<!-- 03/15/2019 - Modified per KISAM IM00505957 and defect 62895 - Jeremy Nichols-->
<!-- 03/18/2019 - Modified per defect #127814 - Jeremy Nichols-->
<!-- 05/12/2020 - Modified per defect #127826 - Jeremy Nichols-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS720Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS720"/>
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
				<meta name="Description" content="Form IRS720"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS720Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form720">
			
	<xsl:call-template name="DocumentHeader"/>
        <!--Title of Form -->
        <div style="display:block;">
		<div class="styBB" style="width:187mm;height: 20mm">
			<div class="styFNBox" style="height: 20mm; width:31mm;font-size: 7pt">
				<br/>
				<span style="font-size:8pt">Form</span>
				<span class="styMainTitle" style="font-size:17pt; font-weight:bold; padding-left:7px;padding-right:2mm">720</span>
                
					<!-- Form to Form Link (Push Pin)-->
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$FormData"/>
					</xsl:call-template>

					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Form 720, Top Left Margin - Section 6114 Treaty</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/@section6114TreatyIndicator"/>
					</xsl:call-template>
					
					<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Form 720, Top Left Margin - Special Condition Description</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
					</xsl:call-template>
				<br/>
              <span class="styAgency" style="font-size: 7.5pt; font-weight:normal">(Rev. January 2019) </span>
				<br/>
				<span class="styAgency" style="font-size: 7.5pt; font-weight:normal">Department of the Treasury</span>
				<br/>
              <span class="styAgency" style="font-size: 7.5pt;font-weight:normal">Internal Revenue Service</span>
			</div>
			<div class="styFTBox" style="width:125mm; height: 20mm;">
				<div class="styMainTitle" style="height:10mm; font-weight: bold; padding-top: 4mm">Quarterly Federal Excise Tax Return</div>
				<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold; padding-top: 2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> See the Instructions for Form 720.
				</div>
				<div class="styFST" style="font-size:7pt;;font-weight:bold; padding-top: 0.2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> Go to <i>www.irs.gov/Form720</i> for instructions and the latest information.
				</div>
			</div>
			<div class="styTYBox" style="width:31mm; height: 20mm">
				<div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0023</div>
			</div>
		</div>
		<!--  End title of Form  -->
		<div style="height:34mm;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px;display:block;">
			<table class="styTable" cellspacing="0" border="0" style="height:auto;width:187mm;">
				<thead class="styTableThead" style="font-size:7pt">
					<tr>
						<th scope="col"  valign="top" style="height:auto;width:29mm;text-align:left;">
							<!-- Begin text from 1st colum -->
							<div class="styNameBox" style="width:29mm;font-size:7pt;font-weight:bold; height:16mm; border-right-width:0px">
								<br/>
								<span style="font-size:8pt; font-weight:normal">Check here if: <br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS720FinalReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS720FinalReturn</xsl:with-param>
										</xsl:call-template>
									  Final return
									  </label>
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS720AddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
											<xsl:with-param name="BackupName">IRS720AddressChange</xsl:with-param>
										</xsl:call-template>
									  Address change
									  </label>
								</span>
							</div>
							<!-- End text from 1st colum -->
						</th>
						<th scope="col"  align="center" style="height:auto;width:2mm;">
							<span style="width:2mm;"/>
						</th>
						<th scope="col"  valign="top" style="height:auto;width:124mm;font-size:7pt; padding-top:3mm">
							<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="height:auto;width:124mm;">
								<thead class="styTableThead" style="font-size:7pt">
									<tr>
										<th scope="col"  valign="top" style="text-align:left;height:16mm;width:78mm;font-weight:normal">Name<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
										</th>
										<th scope="col"  valign="top" style="height:16mm;width:46mm;text-align:left;font-weight:normal">Quarter ending <br/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
										</th>
									</tr>
									<tr>
										<td valign="top" style="height:10mm;width:78mm;font-weight:normal;">Number, street, and room or suite no. 
										    <br/>(If you have a P.O. box, see the instructions.)<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
										</td>
										<td valign="top" style="height:10mm;width:46mm;font-weight:normal;"><b>Employer identification number</b> <br/>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td valign="top" colspan="2" style="height:8mm;width:124mm;font-weight:normal;">
											  City or town, state or province, country and ZIP or foreign postal code<br/>
											  <xsl:choose>
												<xsl:when test="$RtnHdrData/Filer/ForeignAddress ">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
													</xsl:call-template>,<span style="width:0.5mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
													</xsl:call-template><span style="width:0.5mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
													</xsl:call-template><span style="width:0.5mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
													</xsl:call-template>,<span style="width:0.5mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
													</xsl:call-template><span style="width:0.5mm;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
													</xsl:call-template> 
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</thead>
							</table>
						</th>
						<!-- Begin IRS USE ONLY Colum -->
						<th scope="col"  valign="top" style="height:auto;width:32mm;padding-top:0px">
							<div style="border-color: black; border-style: solid; padding-left:2mm;padding-top:2mm; padding-bottom:2mm; border-right-width: 0px; border-left-width: 1px; border-top-width: 0px; border-bottom-width: 0px;width:32mm">
								<span class="BoldText" style="font-weight:bold;">FOR IRS USE ONLY</span>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span class="BoldText" style="font-weight:bold;">T</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span style="width:1px"/>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span class="BoldText" style="font-weight:bold;">FF</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span style="width:1px"/>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span class="BoldText" style="font-weight:bold;">FD</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span style="width:1px"/>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span class="BoldText" style="font-weight:bold;">FP</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span style="width:1px"/>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span class="BoldText" style="font-weight:bold;">I</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 0px;">
								<span style="width:1px"/>
							</div>
							<div style="float:left; clear:none;width:20mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 1px;">
								<span class="BoldText" style="font-weight:bold;">T</span>
							</div>
							<div style="float:left; clear:none;width:12mm; border-color: black; border-style: solid; padding-left:2mm;padding-top:0.5mm; padding-bottom:0.5mm;border-right-width: 0px; border-left-width: 1px; border-top-width: 1px; border-bottom-width: 1px;">
								<span style="width:1px"/>
							</div>
						</th>
						<!-- End IRS USE ONLY Colum -->
					</tr>
				</thead>
			</table>
		</div><br/><br/><br/><br/><br/><br/><br/><br/>
		<!-- End Name / Employer identification number / Address -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px;display:block;">
			<!-- Begin Part I Section Header -->
			<table cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
				<thead class="styTableHead">
					<tr>
						<th scope="col" colspan="8" style="height:4mm;width:187mm;float:left;clear:none;">
							<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
								<div class="styPartName" style="width:12mm; height:4mm;">Part I</div>
							</div>
						</th>
					</tr>
					<tr>
						<th scope="col" style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; height:4mm; width:11mm; text-align:center; font-weight:normal;float:left;clear:none;" >
							<b>IRS No.</b>
						</th>
						<th scope="col" colspan="5" style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; height:4mm; width:131mm; font-weight:normal;padding-left:5px;text-align:left;float:left;clear:none;" >
							<span style="font-size:8pt">
								<b>Environmental Taxes</b> (attach Form 6627)
                      
								<!-- Form to Form Link (Push Pin)-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/EnvironmentalTaxes"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; height:4mm; width:33mm;font-weight:normal;float:left;clear:none;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; height:4mm; width:12mm; text-align:center; font-weight:normal;float:left;clear:none;" >
							<b>IRS No.</b>
						</th>
						<!-- End Part I Section Header -->
					</tr>
				</thead>
				<tfoot/>
				<tbody style="font-size:7pt;">
					<!-- Begin Part I, Environmental Tax, line 18 -->
								<tr>
									<td style=" height:3mm; width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum18/IRSNum"/>
										</xsl:call-template>
									</td>
									<td colspan="5" style=" height:3mm; width:131mm;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;float:left;clear:none;">Domestic petroleum oil spill tax
									</td>
									<td style=" height:3mm; width:33mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;float:left;clear:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum18/TaxAmt"/>
										</xsl:call-template>
									</td>
									<td style=" height:3mm; width:12mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum18/IRSNum"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- End Part I, Environmental Tax, line 18 -->
								<!-- Begin Part I, Environmental Tax, line 21 -->
								<tr>
									<td style="height:3mm; width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum21/IRSNum"/>
										</xsl:call-template>
									</td>
									<td colspan="5" style="height:3mm; width:131mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;float:left;clear:none;">Imported petroleum products oil spill tax
						  </td>
									<td style="height:3mm; width:33mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;float:left;clear:none;">
										<span style="float:left;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum21/TaxAmt"/>
										</xsl:call-template>
									</td>
									<td style="height:3mm; width:12mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:left;clear:none;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum21/IRSNum"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- End Part I, Environmental Tax, line 21 -->
					<!-- Begin Part I, Environmental Tax, line 98 -->
					<tr>
						<td style="height:3mm; width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum98/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm; width:131mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;float:left;clear:none;">Ozone-depleting chemicals (ODCs)
              </td>
						<td style="height:3mm; width:33mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;float:left;clear:none;">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum98/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm; width:12mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum98/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 98 -->
					<!-- Begin Part I, Environmental Tax, line 19 -->
					<tr>
						<td style="height:3mm;width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum19/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:131mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;float:left;clear:none;">ODC tax on imported products
              </td>
						<td style="height:3mm;width:33mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;float:left;clear:none;">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum19/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum19/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 19 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes title -->
					<tr>
						<th scope="col" style="border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; width:11mm; height:4mm; text-align:center; font-weight:normal;float:left;clear:none;" >
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="5" style="border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; width:131mm; height:4mm; text-align:left; font-weight:normal;padding-left:5px;float:left;clear:none;" >
							<span style="font-size:8pt">
								<b>Communications and Air Transportation Taxes</b> (see instructions)</span>
						</th>
						<th scope="col" align="center" style="border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; width:33mm; height:4mm; text-align:center; font-weight:normal;float:left;clear:none;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="border-color: black; border-style: solid; border-top-width: 2px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:12mm; height:4mm; text-align:center; font-weight:normal;float:left;clear:none;" >
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes title -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 22 -->
					<tr>
						<td style="width:11mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum22/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="width:131mm; height:3mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Local telephone service and teletypewriter exchange service
					    </td>
						<td style="width:33mm; height:3mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum22/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="width:12mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum22/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 22 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 26 -->
					<tr>
						<td style="width:11mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum26/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="width:131mm; height:3mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of persons by air
              </td>
						<td style="width:33mm; height:3mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum26/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="width:12mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum26/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 26 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 28 -->
					<tr>
						<td style="width:11mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum28/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="width:131mm; height:3mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of property by air
              </td>
						<td style="width:33mm; height:3mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum28/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="width:12mm; height:3mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum28/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 28 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 27 -->
					<tr>
						<td style="width:11mm; height:3.5mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum27/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="width:131mm; height:3.5mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Use of international air travel facilities
              </td>
						<td style="width:33mm; height:3.5mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum27/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="width:12mm; height:3.5mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum27/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 27 -->
					<!-- Begin Part I, Fuel Taxes title  -->
					<tr>
						<th scope="col"  style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; height:4mm;width:11mm;float:left;clear:none;">
							<span style="width:1px"/>
						</th>
						<th scope="col"  colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; height:4mm;width:60mm;float:left;clear:none;">
							<span style="font-size:8pt">
								<b>Fuel Taxes</b>
							</span>
						</th>
						<th scope="col" style="text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;height:4mm;width:35mm; font-size:6pt;float:left;clear:none;" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal; height:4mm;width:36mm;float:left;clear:none;" >
							<b>Rate</b>
						</th>
						<th scope="col" style="text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;height:4mm; width:33mm;float:left;clear:none;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; height:4mm;width:12mm;float:left;clear:none;" >
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Fuel Taxes title  -->
					<!-- Begin Part I, Fuel Taxes, line 60 (a)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a) <span style="width:2px;"/>Diesel tax on removal at terminal rack
					    </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60a/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:4mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60a/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:3mm;"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey;">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 60 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 60 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
							Diesel tax on taxable events other than removal at terminal rack
					    </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60b/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60b/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-bottom:2mm;  text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Lg.gif" alt="Bracket" style="height:10mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 60 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 60 (c)-->
					<tr>
						<td style="height:6.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px;"/>
						</td>
						<td colspan="2" style="height:6.5mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(c) <span style="width:2px;"/>
							Diesel tax on sale or removal of biodiesel mixture (not at terminal rack)
					    </td>
						<td style="height:6.5mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:norma; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60c/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum60/IRSNum60c/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:3mm;"/>
						</td>
						<td style="height:6.5mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey;">
							<span style="width:1px;"/>
						</td>
						<td style="height:6.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 60 (c)-->
					<!-- Begin Part I, Fuel Taxes, line 104-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum104/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Diesel-water fuel emulsion
              </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum104/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum104/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum104/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum104/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 104-->
					<!-- Begin Part I, Fuel Taxes, line 71-->
					<!-- Delete IRS71 <tr>
      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum71/IRSNum"/>
                </xsl:call-template>
      </td>
      <td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel fuel used in trains
              </td>
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >    
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum71/GallonsQty"/>
                </xsl:call-template>
      </td>             
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >  
        <span style="float:left;"></span>
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum71/Rt"/>
                </xsl:call-template>
      </td>   
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <span style="width:1px"></span>
              </td>       
            <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum71/TaxAmt"/>
                </xsl:call-template>
              </td>
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum71/IRSNum"/>
                </xsl:call-template>
              </td>
    </tr> -->
					<!-- End Part I, Fuel Taxes, line 71-->
					<!-- Begin Part I, Fuel Taxes, line 105-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum105/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel, LUST tax
              </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum105/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum105/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum105/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum105/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 105-->
					<!-- Begin Part I, Fuel Taxes, line 107-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum107/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed kerosene, LUST tax
              </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum107/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum107/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum107/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum107/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 107-->
					<!-- Begin Part I, Fuel Taxes, line 119-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum119/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax, other exempt removals (see instructions)
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum119/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum119/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum119/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum119/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 119-->
					<!-- Begin Part I, Fuel Taxes, line 35 (a)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a)<span style="width:1px;"/>Kerosene, tax on removal at terminal rack (see instructions)
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum35a/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum35a/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:12mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm;background:lightgrey;">
							<span style="width:1px;"/>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;background:lightgrey;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 35 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px;"/>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b)<span style="width:1px;"/>Kerosene, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum35b/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum35b/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px;"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum35/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 69-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum69/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation (see instructions)
              </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum69/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum69/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum69/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum69/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 69-->
					<!-- Begin Part I, Fuel Taxes, line 77-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum77/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in commercial aviation (other than foreign trade) 
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum77/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum77/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum77/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum77/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 77-->
					<!-- Begin Part I, Fuel Taxes, line 111-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum111/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation, LUST tax on nontaxable uses              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum111/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum111/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum111/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum111/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 111-->
					<!-- Begin Part I, Fuel Taxes, line 79-->
					<tr>
						<td style="height:3.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:0.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3.5mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Other fuels (see instructions)

        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:0.5mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:0.5mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:0.5mm;">
							<span style="width:1px"/>
						</td>
						<td style="height:3.5mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:0.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum79/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 79-->
					<!-- Begin Part I, Fuel Taxes, line 62 (a)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a) <span style="width:2px;"/>Gasoline, tax on removal at terminal rack
					    </td>
						<td style="height:3mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum62a/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum62a/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:9mm;width:1mm;"/>
						</td>
						<td style="height:3mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey;">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 62 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 62 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
        Gasoline, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum62b/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum62b/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum62/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 62 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 13 -->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum13/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Any liquid fuel used in a fractional ownership program aircraft
					    </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum13/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum13/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum13/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum13/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 13 -->
					<!-- Begin Part I, Fuel Taxes, line 14-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum14/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Aviation gasoline
					    </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum14/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum14/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum14/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum14/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 14-->
					<!-- Begin Part I, Fuel Taxes, line 112-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum112/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied petroleum gas (LPG) (see instructions)
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum112/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum112/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum112/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum112/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 112-->
					<!-- Begin Part I, Fuel Taxes, line 118-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum118/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">"P Series" fuels
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum118/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum118/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum118/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum118/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 118-->
					<!-- Begin Part I, Fuel Taxes, line 120-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum120/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Compressed natural gas (CNG) (see instructions)
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum120/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum120/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum120/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum120/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 120-->
					<!-- Begin Part I, Fuel Taxes, line 121-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum121/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied hydrogen
              </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum121/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum121/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum121/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum121/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 121-->
					<!-- Begin Part I, Fuel Taxes, line 122-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum122/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><span style="font-size:7pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</span>
					    </td>
						<td style="height:6mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum122/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum122/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum122/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum122/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 122-->
					<!-- Begin Part I, Fuel Taxes, line 123-->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum123/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquid fuel derived from biomass
              </td>
						<td style="height:4mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum123/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum123/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum123/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum123/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 123-->
					<!-- Begin Part I, Fuel Taxes, line 124-->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum124/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied natural gas (LNG) (see instructions)
              </td>
						<td style="height:4mm;width:35mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum124/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:32mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum124/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:33mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum124/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum124/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 124-->
				</tbody>
			</table>
			
			<!-- Begin Page 1 Footer -->
			<div style="width:187mm;float:left;clear:none; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
				<div style="float:left;">
					<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
					<span style="width:6mm;"/>                        
					Cat. No. 10175Y
				  </div>
				<div style="float:right;">
					<span style="width:20px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2019)
			  </div>
			</div>
			</div>
			</div>
			<div class="pageEnd"/>
					<!-- End Page 1 Footer -->
					
					<!-- Begin page 2 Header -->
			<div style="display:block">
				<div  class="styBB" style="width:187mm">
					<div style="float: left; clear: none">Form 720 (Rev. 1-2019)</div>
					<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">2</span>
					</div>
				</div>
				<!-- End page 2 Header -->
					
					<!-- Begin Part I, Retail Taxes, Line 33 -->
			<div style="height:34mm;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px;display:block;">
				<table class="styTable" cellspacing="0" border="0" style="height:auto;width:187mm;">
				<tbody>
					<tr>
						<th style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</th>
						<th scope="col"  colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<span style="font-size:7pt"></span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="font-size:7pt"></span>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col"  style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col"  style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</th>
					</tr>
					<tr>
						<td style="height:3.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum33/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3.5mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;font-size:7pt;"><b>Retail Tax</b> - Truck, trailer, and semitrailer chassis and bodies, and tractor
              </td>
						<td colspan="2" style="height:3.5mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm; font-size:6pt" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum33/Rt"/>
							</xsl:call-template> of sales price
      </td>
						<td style="height:3.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum33/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum33/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 33-->
					
					<!-- Begin Part I, Ship Passenger Tax title -->
					<tr>
						<th scope="col"  style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; ">
							<span style="width:1px"/>
						</th>
						<th scope="col"  colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Ship Passenger Tax</b>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;font-size:6pt" >
							<b>Number of persons</b>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal; " >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Tax</b>
						</th>
						<th scope="col"  style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Ship Passenger Tax title -->
					<!-- Begin Part I, Ship Passenger Tax, line 29 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum29/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation by water
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum29/PersonCnt"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum29/Rt"/>
							</xsl:call-template>
							<span style="font-size:6pt"> per person</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum29/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum29/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Ship Passenger Tax, line 29-->
					<!-- Begin Part I, Other Excise Tax title -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Other Excise Tax</b>
							</span>
						</td>
						<td style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="font-size:5pt; font-weight:bold">Amount of obligations </span>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Rate</b>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax title -->
					<!-- Begin Part I, Other Excise Tax, line 31 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum31/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Obligations not in registered form
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum31/PrincipalObligationAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:3mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum31/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum31/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum31/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 31 -->
					<!-- Begin Part I, Foreign Insurance Tax title -->
					<tr>
						<th scope="col"  style="height:7mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col"  colspan="2" style="height:7mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:7pt">
								<b>Foreign Insurance Taxes</b> - <span style="font-weight:normal"> Policies issued by foreign insurers</span>
							</span>
						</th>
						<th scope="col" style="height:7mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Premiums paid</b>
						</th>
						<th scope="col" colspan="2" style="height:7mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col"  style="height:7mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col"  style="height:7mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</th>
					</tr>
					<!-- End Part I, Foreign Insurance Tax title -->
					<!-- Begin Part I, Foreign Insurance Tax, line 30 (a)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:10px;">Casualty insurance and indemnity bonds
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30a/PremiumsPaidAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							$							
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30a/Rt"/>
							</xsl:call-template><span style="width:4mm;"/>
						</td>
						<td rowspan="3" style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:1mm;  text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Lg.gif" alt="Bracket" style="height:10mm;width:1mm;"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Foreign Insurance Tax, line 30 (a)-->
					<!-- Begin Part I, Foreign Insurance Tax, line 30 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:10px; font-size:6pt">Life insurance, sickness and accident policies, and annuity contracts
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30b/PremiumsPaidAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30b/Rt"/>
							</xsl:call-template>
						</td>
						<td rowspan="3" style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm;  text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Foreign Insurance Tax, line 30 (b)-->
					<!-- Begin Part I, Foreign Insurance Tax, line 30 (c)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:10px;">Reinsurance
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30c/PremiumsPaidAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum30/IRSNum30c/Rt"/>
							</xsl:call-template>
						</td>
						<td rowspan="3" style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm;  text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I,  Manufacturers Tax, line 30 (c)-->
					<!-- Begin Part I, Manufacturers Tax title -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:10mm;"></span>
						</td>
						<td style="height:4mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:7pt">
								<b>Manufacturers Taxes</b>
							</span>
						</td>
						<td style="height:4mm;width:24mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:7pt" >
							<b>Number of tons</b>
						</td>
						<td style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Sales price</b>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="width:10mm;"></span>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:10mm;"></span>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:10mm;"></span>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax title -->
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum36/IRSNum"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm; padding-left:5px;">Coal&#8212;Underground mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum36/TonQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum36/Rt"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum36/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum36/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum37/IRSNum"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum37/SalesPriceAmt"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum37/Rt"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum37/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum37/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum38/IRSNum"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:1.5mm; padding-left:5px;">Coal&#8212;Surface mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum38/TonQty"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum38/Rt"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum38/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum38/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<!-- Begin Part I, Manufacturers Tax, line 39 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum39/IRSNum"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum39/SalesPriceAmt"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum39/Rt"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum39/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum39/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 39 -->
					<!-- Begin Part I, Manufacturers Tax, line 108 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="3" style="height:4mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;font-weight:bold">Number of tires
        
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center;font-weight:bold; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">Tax
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; font-weight:bold; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">IRS No
							<span style="width:1px"/>
						</td>
					</tr>
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum108/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires other than bias ply or super single tires
					    </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum108/TireCnt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum108/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum108/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 108 -->
					<!-- Begin Part I, Manufacturers Tax, line 109 -->
					<tr>
						<td style="height:3.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum109/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3.5mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable bias ply or super single tires (other than super single tires designed for steering)
              </td>
						<td colspan="2" style="height:3.5mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum109/TireCnt"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum109/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum109/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--End Part I, Manufacturers Tax, line 109 -->
					<!-- Begin Part I, Manufacturers Tax, line 113 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum113/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires, super single tires designed for steering
              </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum113/TireCnt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum113/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum113/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 113 -->
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<tr>
						<td style="height:4.5mm;width:11mm;float:left;clear:none;text-align: center; padding-top:1mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum40/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:4.5mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="vertical-align:bottom;padding-bottom:1mm;" >Gas guzzler tax.  Attach Form 6197.  </span>
      
        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum40"/>
							</xsl:call-template>
							
							<span style="vertical-align:bottom;padding-bottom:1mm;" >
								Check if one-time filing
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.            
								    <span style="width:11px"/>.
							   	    <span style="width:11px"/>.  
							    	<span style="width:11px"/>.
								    <span style="width:11px"/>.            
								    <span style="width:11px"/>.
								    <span style="width:11px"/>.  
								    <span style="width:11px"/>.   
								    <span style="width:11px"/>.   
								    <span style="width:11px"/>.   
								    <span style="width:11px"/>. 
								</span>
								<span style="width:2px"/>
							</span>
							<input type="checkbox" class="styCkbox" title="Check if one-time filing">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum40/OneTimeFilingInd"/>
									<xsl:with-param name="BackupName">IRS720TFCB</xsl:with-param>
								</xsl:call-template>
							</input>
						</td>
						<td style="height:4.5mm;width:34mm;float:left;clear:none;text-align: right; padding-top:1mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum40/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:4.5mm;width:12mm;float:left;clear:none;text-align: center; padding-top:1mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum40/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum97/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Vaccines (see instructions)
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum97/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum97/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<!-- Begin Part I, Other Excise Tax, line 136 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="font-size:6pt; font-weight:bold">Sales price </span>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="width:10mm;"/>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum136/IRSNum"/>
							</xsl:call-template>-->
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							Reserved for future use
					    </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;background:lightgrey" >
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum136/SalesPriceAmt"/>
							</xsl:call-template>-->
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum136/Rt"/>
							</xsl:call-template> 
							of sales price
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm;background:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum136/TaxAmt"/>
							</xsl:call-template>-->
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;background:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/PartIIRSNum136/IRSNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 136 -->
					<!-- End Part I, Manufacturers Tax -->
					<!-- Begin Part I,  Total -->
					<tr>
						<td colspan="6" style="height:4mm;width:141mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:3mm">
								<b>1  Total.</b>  Add all amounts in Part I.  Complete Schedule A unless one-time filing. </span>
							<span style="width:51mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;font-size:6pt">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartI/QrtlyFederalExciseTaxPartIAmt"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I,  Total -->
				</tbody>
			</table>
			</div>
			<div style="padding-top:58.5mm;display:block;">
		 <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
				<tbody>
					<!-- Begin Part II Line-->
					<tr>
						<td colspan="8" style="height:4mm;width:187mm;">
							<div class="styPartName" style="width:12mm; height:4mm;">Part II </div>
						</td>
					</tr>
					<!-- End Part II Line-->
					<!-- Begin Part II,  Table title  -->
					<tr>
						<th scope="col" style="text-align: center;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</th>
						<th style="text-align:left;font-weight:normal; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							<b>Patient Centered Outcomes Research Fee</b> (see instructions)
						</th>
						<th style="height:font-size:8;text-align:center;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							(a) Avg. number of<br/> lives covered <span style="font-weight:normal">(see inst.)</span>
						</th>
						<th style="font-size:8;text-align:center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							(b) Rate for avg. covered life
						</th>
						<th scope="col" colspan="2" style="width:37mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							(c) Fee <br/><span style="font-weight:normal">(see instructions)</span>
						</th>
						<th scope="col" style="width:36mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</th>
					</tr>
					<!-- End Part II,  Table title  -->
					<!-- Begin Part II, line 133 -->
					<tr style="">
						<td rowspan="6" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum"/>
							</xsl:call-template>
						</td>
						<td style="width:60mm;height:3mm;text-align:left;vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							Specified health insurance policies
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;background:lightgrey ">
							<span style="width:1mm;"/>
						</td>
						<td style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td style="text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td rowspan="2" style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px; background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td rowspan="6" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr style="">
						<td style="width:60mm;height:3mm;font-size:6pt;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-right:1mm;padding-top:0px;padding-bottom:0px; ">
							(a) With a policy year ending before October 1, <br/>2017 <span class="styDotLn" style="letter-spacing:1mm;font-size:6pt;float:right;display:inline;">..........................</span>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133a/AverageLivesCoveredCnt"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133a/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133a/Fee"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr style="">
						<td style="width:60mm;height:3mm;font-size:6pt;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-right:1mm;padding-top:0px;padding-bottom:0px; ">
							(b) With a policy year ending on or after October 1, 2017 and before October 1, 2018  <span class="styDotLn" style="letter-spacing:1mm;font-size:6pt;float:right;display:inline;">........</span>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133b/AverageLivesCoveredCnt"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133b/Rt"/>
							</xsl:call-template>
						</td>
						<td style="width:31mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133b/Fee"/>
							</xsl:call-template>
						</td>
						<td rowspan="3" style="height:6mm;text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket"/>
						</td>
						<td style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<tr style="">
						<td style="width:60mm;height:3mm;text-align:left;vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							Applicable self insured health plans
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;background:lightgrey ">
							<span style="width:1mm;"/>
						</td>
						<td style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td style="text-align: right; vertical-align:bottom;padding-bottom:3.5mm;padding-right:1mm;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/TaxAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr style="">
						<td style="width:60mm;height:3mm;font-size:6pt;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-right:1mm;padding-top:0px;padding-bottom:0px; ">
							(c) With a plan year ending before October 1, <br/>2017 <span class="styDotLn" style="letter-spacing:1mm;font-size:6pt;float:right;display:inline;">..........................</span>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133c/AverageLivesCoveredCnt"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133c/Rt"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133c/Fee"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px; padding-left:5px;background:lightgrey">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<tr style="">
						<td style="width:60mm;height:3mm;font-size:6pt;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-right:1mm;padding-top:0px;padding-bottom:0px; ">
							(d) With a plan year ending on or after October 1, 2017 and before October 1, 2018  <span class="styDotLn" style="letter-spacing:1mm;font-size:6pt;float:right;display:inline;">........</span>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133d/AverageLivesCoveredCnt"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:3mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133d/Rt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum133/IRSNum133d/Fee"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;	">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<!-- End Part II, line 133 -->
					<!-- Begin Part II, line 41 -->
					<tr>
						<td rowspan="2" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum41/IRSNum"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Sport fishing equipment (other than fishing rods and fishing poles)
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<b>Rate</b>
					    </td>
						<td rowspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum41/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum41/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum41/Rt"/>
							</xsl:call-template> of sales price
					    </td>
					</tr>
					<!-- End Part II, line 41 -->
					<!-- Begin Part II, line 110 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum110/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing rods and fishing poles (limits apply, see instructions)
					    </td>
						<td colspan="2" style=" text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum110/Rt"/>
							</xsl:call-template> of sales price
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum110/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum110/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 110 -->
					<!-- Begin Part II, line 42 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum42/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Electric outboard motors
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum42/Rt"/>
							</xsl:call-template> of sales price
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum42/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum42/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 42 -->
					<!-- Begin Part II, line 114 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum114/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing tackle boxes
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum114/Rt"/>
							</xsl:call-template> of sales price
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum114/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum114/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 114 -->
					<!-- Begin Part II, line 44 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum44/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Bows, quivers, broadheads, and points
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum44/Rt"/>
							</xsl:call-template> of sales price
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum44/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum44/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 44 -->
					<!-- Begin Part II, line 106 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum106/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Arrow shafts
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum106/Rt"/>
							</xsl:call-template> per shaft
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum106/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum106/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 106 -->
					<!-- Begin Part II, line 140 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum140/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Indoor tanning services
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum140/Rt"/>
							</xsl:call-template> of amount paid
					    </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum140/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum140/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 140 -->
					<!-- Begin Part II, line blank -->
					<tr>
						<th scope="col"  style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col"  colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt; width:1px"/>
						</th>
						<th scope="col" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col"  style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col"  style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part II, line blank -->
					<!-- Begin Part II, line 64 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum64/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Inland waterways fuel use tax
              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum64/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; " >
							<span style="float:left;display:inline;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum64/Rt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum64/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum64/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 64 -->
					<!-- Begin Part II, line 125 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum125/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax on inland waterways fuel use (see instructions)              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum125/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: center;  border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="float:left;display:inline;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum125/Rt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum125/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum125/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 125 -->
					<!-- Begin Part II, line 51 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Section 40 fuels (see instructions)<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; padding-right:1mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: center;font-size:7pt;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51/Rt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum51/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 51 -->
					<!-- Begin Part II, line 117 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Biodiesel sold as but not used as fuel          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117/Rt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum117/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 117 -->
					<!-- Begin Part II, Floor Stocks Tax title -->
					<!--<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="5" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<b>Floor Stocks Tax</b>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</td>
					</tr>-->
					<!-- End Part II, Floor Stocks Tax title -->
					<!-- Begin Part II, Floor Stocks Tax, line 20 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum20/IRSNum"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><b>Floor Stocks Tax</b>- Ozone-depleting chemicals (floor stocks). Attach Form 6627.
          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum20"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum20/TaxAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/PartIIIRSNum20/IRSNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, Floor Stocks Tax, line 20 -->
					<!-- Begin Part II,  Total -->
					<tr>
						<td colspan="6" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:4mm;display:inline;">
								<b>2  Total.</b>  Add all amounts in Part II. </span>
							<span style="width:5mm; text-align:right;float:right;padding-right:1mm;display:inline;">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QrtlyFederalExciseTaxPartII/QrtlyFederalExciseTaxPartIIAmt"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part II,  Total -->
					</tbody>
				  </table>
						<!-- END PREPARER SIGNATURE SECTION -->
					
			<!-- Begin Page 2 Footer -->
			<div style="width:187mm;float:left;clear:none; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
				<div style="float:left;">
					<span class="styBoldText"> </span>
					<span style="width:6mm;"/>
				  </div>
				<div style="float:right;">
					<span style="width:20px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2019)
			  </div>
			</div>
			</div>
			</div>
			<div class="pageEnd"/>
					<!-- End Page 2 Footer -->
					
					<!-- Begin page 3 Header -->
				<div  class="styBB" style="width:187mm">
					<div style="float: left; clear: none">Form 720 (Rev. 1-2019)</div>
					<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">3</span>
					</div>
				</div>
				<!-- End page 3 Header -->
				
					<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt;" border="0">
					<!-- Begin Part III Line-->
					<tr>
						<td colspan="8">
							<div class="styBB" style="width:187mm;">
								<div class="styPartName" style="width:14mm; height:4mm;">Part III </div>
							</div>
						</td>
					</tr>
					<!-- End Part III Line-->
					<!-- Begin Part III,  Table title  -->
					<tr>
						<th scope="col"  style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;"/>
						<th scope="col"  colspan="3" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"/>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" />
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;" />
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;" />
					</tr>
					<!-- End Part III,  Table title  -->
			</table>
		<!-- Begin Part III Section Header -->
		<table cellspacing="0" cellpadding="0" style="width:187mm; font-size:7pt;" border="0">
			<thead>
				<tr>
					<th scope="col" style="height:1px;width:7mm;" />
					<th scope="col" style="height:1px;width:75mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
				</tr>
			</thead>
			<tbody style="font-size:7pt;">
				<!--  Begin Part III, line # 3 -->
				<tr>
					<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-left:1mm" >
						<b>3</b>
					</td>
					<td valign="top" colspan="5" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >      
        Total tax.  Add Part I, line 1, and  Part II, line 2
        <!--Dotted Line-->
						<span class="styBoldText">
							<span style="width:8px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>. 
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.      
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.     
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>3</b>
					</td>
					<xsl:if test="$FormData/TotalTaxAmt">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</td>
					</xsl:if>
					<xsl:if test="$FormData/NoTaxToReportCd">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NoTaxToReportCd"/>
							</xsl:call-template>
						</td>
					</xsl:if>
				</tr>
				<!-- End Part III, line # 3 -->
				<!--  Begin Part III, line # 4 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-left:1mm" >
						<b>4</b>
					</td>
					<td colspan="3" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >     
        Claims (see instructions; complete Schedule C)
        <!--Dotted Line-->
						<span class="styBoldText">
                  <span style="width:1mm"/>.          
                  <span style="width:2mm"/>.
                  <span style="width:2mm"/>.  
                  <span style="width:2mm"/>.
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>.    
                  <span style="width:2mm"/>.  
                  <span style="width:2mm"/>.
                      </span>
						<span style="width:5mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>4</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ClaimAmt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 4 -->
				<!--  Begin Part III, line # 5 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-left:1mm" >
						<b>5</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >     
        Deposits made for the quarter
        <!--Dotted Line-->
						<span class="styBoldText">
							<span style="width:2mm"/>. 
						  <span style="width:11px"/>.     
						  <span style="width:11px"/>.    
						  <span style="width:11px"/>.     
						  <span style="width:11px"/>.    
						  <span style="width:11px"/>.     
						  <span style="width:11px"/>.    
						</span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:center; font-weight:normal;" >
						<b>5</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DepositsMadeForQuarterAmt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 5 -->
				<!--  Begin Part III, line # 5 continue -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
						<span style="width:1px"/>
					</td>
					<td colspan="3" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >
						<span style="font-weight:normal">
							<input type="checkbox" class="styCkbox" title="Used Safe Harbor Rule">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SafeHarborRuleInd"/>
									<xsl:with-param name="BackupName">IRS720UsedSafeHarborRule</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/UsedSafeHarborRule"/>
									<xsl:with-param name="BackupName">IRS720UsedSafeHarborRule</xsl:with-param>
								</xsl:call-template>
							</label>-->
						</span>
						<span style="padding-left:5px;">Check here if you used the safe harbor rule to make your deposits.</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 5 continue -->
				<!--  Begin Part III, line # 6 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-left:1mm" >
						<b>6</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >     
						Overpayment from previous quarters.
                  <span style="width:5px"/>.     
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>.     
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>.
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>6</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PreviousQuarterOverpaymentAmt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 6 -->
				<!--  Begin Part III, line # 7 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; text-valign:top;font-weight:normal; padding-bottom:1mm; padding-left:1mm" >
						<b>7</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left; padding-top:5px" >     
        Enter the amount from Form 720X <br/> included on line 6, if any.
        <!--Dotted Line-->
						<span class="styBoldText">        
							<span style="width:11px"/>.            
							<span style="width:11px"/>.            
							<span style="width:11px"/>. 
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:11px"/>.  
						</span> <span style="width:1mm;"/>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:center; font-weight:normal;padding-top:3mm" >
						<b>7</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:right; font-weight:normal;padding-top:3mm" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form720XOverpaymentAmt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 7 -->
				<!--  Begin Part III, line # 8 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-bottom:1mm; padding-left:1mm" >
						<b>8</b>
					</td>
					<td colspan="3" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >     
        Add lines 5 and 6
        <!--Dotted Line-->
						<span class="styBoldText">     
						  <span style="width:11px"/>.
						  <span style="width:11px"/>.  
						  <span style="width:11px"/>.          
						  <span style="width:11px"/>.
						  <span style="width:11px"/>.  
						  <span style="width:11px"/>.  
						  <span style="width:11px"/>.          
						  <span style="width:11px"/>.
						  <span style="width:11px"/>.                   
						  <span style="width:11px"/>.          
						  <span style="width:11px"/>.
						  <span style="width:11px"/>. 
						  <span style="width:11px"/>.   
						  <span style="width:11px"/>.              
							<span style="width:11px"/>.            
							<span style="width:11px"/>.            
							<span style="width:11px"/>.   
                      </span>
						<span style="width:5mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:center; font-weight:normal;" >
						<b>8</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentAmt"/>
						</xsl:call-template>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; background:lightgrey" >
						<span style="width:1px;"/>
					</td>
				</tr>
				<!-- End Part III, line # 8 -->
				<!-- Begin Part III, line # 9 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-left:1mm" >
						<b>9</b>
					</td>
					<td colspan="5" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >     
        Add lines 4 and 8
        <!--Dotted Line-->
						<span class="styBoldText">
							<span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>. 
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>. 
                  <span style="width:11px"/>.       
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.    
                  <span style="width:11px"/>. 
                  <span style="width:11px"/>. 
                      </span>
						<span style="width:5mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>9</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalCreditAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Part III, line # 9 -->
				<!-- Begin Part III, line # 10 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-bottom:3mm" >
						<b>10</b>
					</td>
					<td colspan="5" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >
						<b>Balance Due.</b> If line 3 is greater than line 9, enter the difference. Pay the full amount with the return(see <br/>instructions)        <!--Dotted Line-->
						<span class="styBoldText">
							<span style="width:14px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
		          <span style="width:11px"/>.

                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.            
                 <span style="width:11px"/>.
                      <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.       
                  <span style="width:11px"/>.
 <span style="width:11px"/>.
                      <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
</span>
						<span style="width:5mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;padding-top:5mm" >
						<b>10</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal; padding-top:5mm" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Part III, line # 10 -->
				<!-- Begin Part III, line # 11 -->
				<tr>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal; padding-bottom:3mm" >
						<b>11</b>
					</td>
					<td colspan="5" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;text-align:left;" >
						<b>Overpayment.</b>  If line 9 is greater than line 3, enter the difference.  Check if you want the<br/> overpayment:  
        <span style="font-weight:normal">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
								<span style="width:2px;"/>
								<b>Applied to your next return, or </b>
							</label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS720ApplyOverpaymentToNextReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS720ApplyOverpaymentToNextReturn</xsl:with-param>
								</xsl:call-template>
								<span style="width:5px;"/>
								<b>Refunded to you.</b>
							</label>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;padding-top:5mm" >
						<b>11</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal; padding-top:5mm" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaymentAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Part III, line # 11 -->
				<!-- Begin Line break-->
			</tbody>
		</table>
		<!-- End Part III line -->
		<!-- Begin signature section -->
		<!-- Begin Implementing the 3rd party designee section in table -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
			<table border="0" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
				<tbody>
					<tr>
						<th scope="col"  colspan="2" rowspan="3" style="height: 13mm; width:17.5mm;font-size: 8pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">
						  Third Party Designee
					  </th>
						<th scope="col"  colspan="3" style="width: 116.5mm; padding-left:3mm;padding-bottom:1mm; text-align:left; font-size:6pt;font-weight:normal;">
							Do you want to allow another person to discuss this return with the IRS (see instructions)?     
					  </th>
						<th scope="col"  align="right" colspan="3" style="text-align:right; padding-left:8mm;padding-bottom:1mm; width:53mm">
							<span style="font-weight:normal; font-size:6pt">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
										<xsl:with-param name="BackupName">IRS720DiscussWithThirdPartyYes</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
										<xsl:with-param name="BackupName">IRS720DiscussWithThirdPartyYes</xsl:with-param>
									</xsl:call-template>
									<span style="width:2px;"/>
									<b>Yes.</b>  Complete the following.
							  </label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
										<xsl:with-param name="BackupName">IRS720DiscussWithThirdPartyNo</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
										<xsl:with-param name="BackupName">IRS720DiscussWithThirdPartyNo</xsl:with-param>
									</xsl:call-template>
									<span style="width:5px;"/>
									<b>No</b>
								</label>
							</span>
						</th>
					</tr>
					<tr>
						<td colspan="2" style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm; padding-left:3mm;">
							Designee<br/> name
							<span style="width:5mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneeName"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm;">
							Phone<br/> no.
							<span style="width:5mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePhone"/>
							</xsl:call-template>
						</td>
						<td style="width:50mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm;">
							Personal identification<br/> number (PIN)
							<span style="width:5mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateIndividualSizableLetterBox">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
								  <xsl:with-param name="BoxNum" select="1"/>
								  <xsl:with-param name="BoxWidth" select="'3.5mm'"/>
								  <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
								  <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
								</xsl:call-template>
								<span style="width:0.5mm;float:left;clear:none"/>
								<xsl:call-template name="PopulateIndividualSizableLetterBox">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
								  <xsl:with-param name="BoxNum" select="2"/>
								  <xsl:with-param name="BoxWidth" select="'3.5mm'"/>
								  <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
								  <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
								</xsl:call-template>
								<xsl:call-template name="PopulateIndividualSizableLetterBox">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
								  <xsl:with-param name="BoxNum" select="3"/>
								  <xsl:with-param name="BoxWidth" select="'3.5mm'"/>
								  <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
								  <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
								</xsl:call-template>
								<span style="width:0.5mm;float:left;clear:none"/>
								<xsl:call-template name="PopulateIndividualSizableLetterBox">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
								  <xsl:with-param name="BoxNum" select="4"/>
								  <xsl:with-param name="BoxWidth" select="'3.5mm'"/>
								  <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
								  <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
								</xsl:call-template>
								<span style="width:0.5mm;float:left;clear:none"/>
								<xsl:call-template name="PopulateIndividualSizableLetterBox">
								  <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
								  <xsl:with-param name="BoxNum" select="5"/>
								  <xsl:with-param name="BoxWidth" select="'3.5mm'"/>
								  <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
								  <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
				<tr>
					<th scope="col" rowspan="3" style="height: 13mm; width:15.5mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:0 solid black; text-align:left;padding-top:9mm" >
					  Sign Here
					  </th>
					<th scope="col" colspan="5" style="padding-left:3mm;padding-bottom:1mm;font-size:6pt;font-weight:normal;text-align:left;" >
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and
						belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
					  </th>
				</tr>
				<tr>
					<td rowspan="2" style="border-bottom:0 solid black;padding-left:3mm;">
						<img src="{$ImagePath}/720_Bullet_Jumbo.gif" alt="Big Right Arrow"/>
					</td>
					<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;border-right:1px solid black;">
						<xsl:call-template name="PopulateReturnHeaderOfficer">
							<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
						</xsl:call-template>
						<span style="width:1px;"/>
					</td>
					<td style="width:20mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:1mm;">
						<xsl:call-template name="PopulateReturnHeaderOfficer">
							<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
						</xsl:call-template>
					</td>
					<td rowspan="2" style="border-bottom:0 solid black;padding-left:1mm;">
						<img src="{$ImagePath}/720_Bullet_Jumbo.gif" alt="Big Right Arrow"/>
					</td>
					<td style="width:50mm;border-bottom:1px solid black;vertical-align:bottom;">
						<xsl:call-template name="PopulateReturnHeaderOfficer">
							<xsl:with-param name="TargetNode">Title</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td style="border-bottom:0 solid black;vertical-align:top;">Signature</td>
					<td style="border-bottom:0 solid black;vertical-align:top;padding-left:1mm;">Date</td>
					<td style="border-bottom:0 solid black;vertical-align:top;">Title</td>
				</tr>
				<tr>
					<td rowspan="3" style="width:17mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">
						<span style="width:2px"/>
					</td>
					<td colspan="5" style="padding-left:1mm;padding-bottom:1mm;">
						<span style="width:2px"/>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="border-bottom: 1px solid black;padding-left:1mm;">
						<span style="width:2px"/>
					</td>
					<td style="width:105mm;border-bottom: 1px solid black;vertical-align:bottom;border-right:0 solid black;">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
						</xsl:call-template>
						<br/>
					Type or print name below signature. 
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
				  </td>
					<td colspan="3" style="width:60mm;border-bottom: 1px solid black;vertical-align:bottom;padding-left:1mm;">
						Telephone number 
						<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/PhoneNum"/>
						</xsl:call-template>
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/ForeignPhoneNum"/>
						</xsl:call-template>
					</td>
					<!--
      <span>Type or print name below signature.</span> 
      <br/> 
        <div style="width:105mm;float:left;clear:none"> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode" >BusinessNameLine1Txt</xsl:with-param>
          </xsl:call-template>
          <br/> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
          </xsl:call-template>
        </div> 
        <div style="width:60mm;float:left;clear:none"> 
        <br/> Telephone number 
        <span style="padding-left:2mm"> 
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
          </xsl:call-template> 
        </span> 
        </div> -->
				</tr>
			</table>
			<!-- End Implementing the 3rd party designee section in table -->
			
			<!-- BEGIN PREPARER SIGNATURE SECTION -->
			<!-- Implementing the Preparer section in table -->
			<table cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
        <tbody>
          <tr>
            <th scope="col"  rowspan="3" style="width:20mm;text-align:left;vertical-align:center;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
              Paid<br/> 
              Preparer<br/> 
              Use Only
            </th>
            <th scope="col"  style="width:167mm;">
              <table cellspacing="0" cellpadding="0" style="width:167mm;font-size:6pt;">
                <tbody>
                  <tr>
                    <th scope="col"  style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                      <span>Print/Type preparer's name</span><br/>
                      <xsl:choose>
							<xsl:when test="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm">
								<span style="text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
									</xsl:call-template>
								</span>
							</xsl:when>
							<xsl:otherwise>
								<span style="text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">BusinessName</xsl:with-param>
									</xsl:call-template>
								</span>
							</xsl:otherwise>
						</xsl:choose>
                    </th>
                  <th scope="col" style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;" >
                    <span>Preparer's signature</span><br/>
                    <span style="font-weight:normal;width:1mm;"/>
                  </th>
                  <th scope="col" style="width:21.25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;" >
                    Date <br/>
                    <span style="font-weight:normal;">
						<xsl:call-template name="PopulateReturnHeaderPreparer">
						  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
						</xsl:call-template>
                    </span>
                  </th>
                  <th scope="col" style="width:20.75mm;font-weight:normal;text-align:center;vertical-align:center;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;" >
                    Check            
                    <input class="styCkbox" type="checkbox" style="width:4mm;" title="Preparer Self Employed">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
                        <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
                        <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    if<br/>
                    self-employed
                  </th>
                  <th scope="col" style="width:25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;" >
                    PTIN<br/>
                    <xsl:choose>
					<xsl:when test="$RtnHdrData/Preparer/SSN">
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:otherwise>
				</xsl:choose>
                  </th>
                  </tr>
                </tbody>
              </table>
            </th>
          </tr>
          <tr>
            <td style="width:167mm;">
              <table cellspacing="0" cellpadding="0" style="width:167mm;font-size:6pt;">
                <tbody>
                  <tr>
                    <th scope="col" style="border-bottom:1px solid black;width:22mm;font-weight:normal;vertical-align:bottom;" >
                      Firm's name
                      <span style="width:2mm;"/>
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;" >
						<div style="font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="font-weight:normal;vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;width:45mm;" >
                      Firm's EIN
                      <span style="width:2mm;"/>
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                      <span style="width:4mm;"/>
						<span style="font-weight:normal;">
						  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
						  </xsl:call-template>
						</span>
                    </th>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
          <tr>
            <td style="width:167mm;">
              <table cellspacing="0" cellpadding="0" style="width:167mm;font-size:6pt;">
                <tbody>
                  <tr>
                    <th scope="col" style="font-weight:normal;border-bottom:1px solid black;width:22mm;vertical-align:bottom;" >
                      Firm's address
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;" >
						<div style="border-top:0 solid black;font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                          </xsl:call-template>
                          <span style="width:1mm;"/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="font-weight:normal;vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;width:45mm;" >
                      Phone no. 
					  <span style="font-weight:normal;">
						  <xsl:call-template name="PopulateReturnHeaderPreparer">
							<xsl:with-param name="TargetNode">Phone</xsl:with-param>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateReturnHeaderPreparer">
							<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
						  </xsl:call-template>
					  </span>
                    </th>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
			<!-- END PREPARER SIGNATURE SECTION -->
		
		<!-- Begin Page 3 Footer -->
			<div style="width:187mm;float:left;clear:none; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
				<div style="float:left;">
					<span class="styBoldText"> </span>
					<span style="width:6mm;"/>
				  </div>
				<div style="float:right;">
					<span style="width:20px;"/>  
				Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2019)
			  </div>
			</div>
			</div>
			<div class="pageEnd"/>
					<!-- End Page 3 Footer -->
					
					<!-- Begin page 4 Header -->
				<div  class="styBB" style="width:187mm">
					<div style="float: left; clear: none">Form 720 (Rev. 1-2019)</div>
					<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">4</span>
					</div>
				</div>
				<!-- End page 4 Header -->
				
		<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt;" border="0">
			<thead class="styTableHead">
				<tr >
					<th scope="col" style="height:1px;width:10mm;" />
					<th scope="col" style="height:1px;width:39mm;" />
					<th scope="col" style="height:1px;width:10mm;" />
					<th scope="col" style="height:1px;width:39mm;" />
					<th scope="col" style="height:1px;width:10mm;" />
					<th scope="col" style="height:1px;width:39mm;" />
					<th scope="col" colspan="2" style="height:1px;width:40mm;" />
				</tr>
				<!-- Begin Schedule A Section Header -->
				<tr >
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;" >
						<span class="styPartName" style="width:25mm; text-align:left; padding-left:3mm">Schedule A</span>
						<span class="styPartDesc" style="width:162mm; text-align:left">
							Excise Tax Liability <span class="styNormalText">(see instructions)</span>
						</span>
					</th>
				</tr>
				<tr>
					<td class="styBB" colspan="8" style="height:10mm;width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<span class="styPartDesc" style="width:187mm;padding-left:0mm;">
							Note:   <span class="styNormalText" style="display:inline;">
								You must complete Schedule A if you have a liability for any tax in Part I of Form 720.  Don't complete Schedule A for Part II taxes or for a one-time filing of the gas guzzler tax.
							</span>
						</span>
					</td>
				</tr>
				<!-- End Schedule A Section Header -->
			</thead>
			<tfoot/>
			<tbody style="font-size:7pt;">
				<!-- Begin Schedule A Section -->
				<!--  Begin Regular method taxes -->
				<tr>
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:7mm; text-align:center; font-weight:normal" >
						<b>1</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:180mm; font-weight:normal;padding-left:5px;text-align:left;" >               Regular method taxes
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<b>(a) Record of Net<br/>
							<span style="padding-left:18px">Tax Liability</span>
						</b>
					</td>
					<td colspan="4" style="height:3mm;width:90mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>Period</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<span style="width:40mm;"/>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>1st - 15th day</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>16th - last day</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						First month
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>A</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxFirstMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>B</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxFirstMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						Second month
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>C</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxSecondMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>D</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxSecondMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						Third month
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>E</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxThirdMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>F</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegMethodTaxThirdMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td colspan="3" style="height:3mm;width:90mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px; background:lightgrey">
						Special rule for September* 
						<!--Dotted Line-->
						<span class="styBoldText">
							  <span style="width:11px"/>.            
							  <span style="width:11px"/>.
							  <span style="width:11px"/>.  
							  <span style="width:11px"/>.            
							  <span style="width:11px"/>.            
							  <span style="width:11px"/>.
							  <span style="width:11px"/>.  
							  <span style="width:11px"/>.
							  <span style="width:11px"/>.  
							  <span style="width:11px"/>.
						</span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;background:lightgrey" >
						<b>G</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;background:lightgrey" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/SpecialSeptemberRuleAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:6.5mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
						<span style="width:1px"/>
					</td>
					<td colspan="5" style="height:6.5mm;width:135mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<br/>
						<b>(b)</b> Net liability for regular method taxes. Add the amounts for each semimonthly period.
				    </td>
					<td colspan="2" style="height:6.5mm;width:45mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:10px;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/NetLiabilityRegMethodTaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<!--  End Regular method taxes -->
				<!--  Begin Alternative method taxes -->
				<tr>
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:7mm; text-align:center; font-weight:normal" >
						<b>2</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:180mm; font-weight:normal;padding-left:5px;text-align:left;" >               Alternative method taxes (IRS Nos. 22, 26, 28, and 27)
				    </td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<b>(a) Record of Taxes<br/>
							<span style="padding-left:18px">Considered as Collected</span>
						</b>
					</td>
					<td colspan="4" style="height:3mm;width:90mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>Period</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px;"/>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<span style="width:1px"/>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>1st - 15th day</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>16th - last day</b>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
        First month
              </td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>M</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxFirstMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>N</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxFirstMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
        Second month
              </td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>O</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxSecondMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>P</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxSecondMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
        Third month
              </td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>Q</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxThirdMonthDetail/FirstHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>R</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltMethodTaxThirdMonthDetail/SecondHalfMonthAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:3mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
						<span style="width:1px"/>
					</td>
					<td colspan="3" style="height:3mm;width:90mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px; background:lightgrey">
        Special rule for September* 
        <!--Dotted Line-->
						<span class="styBoldText">
							<span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.            
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.  
                  <span style="width:11px"/>.  
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;background:lightgrey" >
						<b>S</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;background:lightgrey" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/SpecialSeptemberRuleAmt"/>
						</xsl:call-template>
					</td>
					<td colspan="2" style="height:3mm;width:45mm;float:left;clear:none;text-align: left; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:10px; background:lightgrey">
						<span style="width:1px"/>
					</td>
				</tr>
				<tr>
					<td style="height:6.5mm;width:7mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
						<span style="width:1px"/>
					</td>
					<td colspan="5" style="height:6.5mm;width:135mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:8px;">
						<br/>
						<b>(b)</b> Alternative method taxes.  Add the amounts for each semimonthly period.
              </td>
					<td colspan="2" style="height:6.5mm;width:45mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:10px;">
						<br/>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxesAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="8" style="height:3mm;width:187mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:2mm; padding-left:9mm">
						*Complete only as instructed (see instructions).
      </td>
				</tr>
				<!--  End Alternative method taxes -->
				<!-- End Schedule A Section -->
				<tr>
					<td colspan="8" class="styBB" style="width:187mm; border-bottom: 2px solid black">
						<span style="width:1px"/>
					</td>
				</tr>
				<!-- Begin Schedule T Section Header -->
				<tr >
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;" >
						<span class="styPartName" style="width:25mm; text-align:left; padding-left:3mm">Schedule T</span>
						<span class="styPartDesc" style="width:162mm; text-align:left">
        Two-Party Exchange Information Reporting <span class="styNormalText">(see instructions)</span>
						</span>
					</th>
				</tr>
				<!-- End Schedule T Section Header -->
				<!-- Begin Fuel Section -->
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm">
						<b>Fuel</b>
					</td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px;">
						<b>Number of gallons</b>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons received in a two-party exchange within a terminal, included<br/> on IRS No. 60(a) on Form 720
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:3mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsDieselReceivedQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm;padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:2mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsDieselDeliveredQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 35(a),<br/> 69, 77, or 111 on Form 720
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:3mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsKeroseneReceivedQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm;padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:2mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsKeroseneDeliveredQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm;padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 62(a) on Form 720
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:2mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsGasolineReceivedQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm;padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:2mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsGasolineDeliveredQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons received in a two-party exchange within a terminal,<br/> included on IRS No. 14 on Form 720
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:3mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsAviationGasolineRcvdQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:7mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-top:2mm;padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:7mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-top:2mm;padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GallonsAviationGasolineDlvrQty"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Fuel Section -->
				<!-- Begin Page 4 Footer -->
				<tr>
					<td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2019)
      </div>
					</td>
				</tr>
				<!-- End Page 4 Footer -->
			</tbody>
		</table>
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 5 BEGIN PAGE 5 BEGIN PAGE 5 BEGIN PAGE 5 BEGIN PAGE 5 BEGIN PAGE 5 -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div style="display:block;">
		<div class="styBB" style="width:187mm;border-bottom:2px solid black;clear:none; padding-bottom:0.5mm;display:block;">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>5</b>
			</div>
    Form 720 (Rev. 1-2019)
  </div>
		<!-- End Header -->
		<!-- Begin Schedule C Title -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0">
				<tbody>
					<tr>
						<th scope="col" class="styPartName" style="width:22mm;font-size:9pt;float:none;text-align:left;padding-left:0.5mm" >Schedule C</th>
						<th scope="col" class="styPartDesc" style="width:74mm;padding-left:8mm;font-size:9pt;text-align:left;float:none" >Claims</th>
						<th scope="col" style="width:91mm;font-size:8pt;text-align:left;float:none;font-weight:normal" >Month your income tax year ends
						  <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							<span style="width:1mm"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TaxYearEndMonthNum"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Schedule C Title -->
		<!-- Begin Schedule C Explanation -->
		<div class="styBB" style="width:187mm">
			<div style="float:left">
				<img src="{$ImagePath}/720_Bullet_Round.gif" alt="Bullet"/>
			</div>
			<div class="styIRS720LargeBoldText">Complete Schedule C for claims <i>only </i>if you
    are reporting liability in Part I or II of Form 720.</div>
			<br/><span style="height:0.5mm;width:187mm;"/>
			<div style="float:left">
				<img src="{$ImagePath}/720_Bullet_Round.gif" alt="Bullet"/>
			</div>
			<div style="font-size:8pt;float:left;padding-left:3mm;display:inline;">Attach a statement explaining each claim as required. Include your
    name and EIN on the statement (see instructions).</div>
			<br/>
			<div style="width:187mm;clear:left;padding-bottom:1mm;padding-left:5mm;font-size:8pt;text-align:justify;padding-top:1mm">
				<b>Caution: </b>
				Claimant has the name and address of the person(s) who sold the fuel to the claimant, the dates of purchase, and if
				exported, the required proof of export. For claims on lines 1a and 2b (type of use 13 and 14), 3c, 4b, and 5, claimant hasn't
				waived the right to make the claim.
			</div>
		</div>
		<!-- End Schedule C Explanation -->
		<!-- Begin Line 1 -->
		<!-- Begin Line 1 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >1</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:113mm" >
              Nontaxable Use of Gasoline 
              <span style="width:7mm;"/><span style="font-size:7pt;">Note: <span style="font-weight:normal;">CRN is credit reference number.</span></span>
            </th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" >Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/ClaimPeriodBeginDt"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/ClaimPeriodEndDt"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 1 Title -->
		<!-- Begin Line 1 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 1 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2" >
							<br/>Gasoline (see <b>Caution</b> above line 1)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px" >Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/Gasoline/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 1 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/GasolineExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/GasolineExported/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/GasolineExported/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/GasolineExported/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfGasoline/GasolineExported/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 1 Table -->
		<!-- End Line 1 -->
		<!-- Begin Line 2 -->
		<!-- Begin Line 2 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >2</th>
						<th scope="col" class="styIRS720LineHeaderTitle" >Nontaxable Use of Aviation Gasoline</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" >Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/ClaimPeriodBeginDt"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/ClaimPeriodEndDt"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 2 Title -->
		<!-- Begin Line 2 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 2 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;font-size:7pt" rowspan="2" >
							<br/>Used in commercial aviation (other than foreign trade)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px" >Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/CommercialAviation/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/CommercialAviation/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/CommercialAviation/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/CommercialAviation/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Other nontaxable use (see <b>Caution</b> above line 1)</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/OtherNontaxableUseAviation/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/OtherNontaxableUseAviation/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/OtherNontaxableUseAviation/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/OtherNontaxableUseAviation/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/OtherNontaxableUseAviation/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--<tr>
         <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm"><span style="width:1px" /></td>
          <td class="styIRS720NameTableCell" colspan="6" style="border-right-width:0px;">
                *This rate applies after February 29, 2008 unless changed by late legislation (see instructions).
          </td>
          </tr>-->
				</tbody>
			</table>
		</div>
		<!-- End Line 2 Table -->
		<!-- End Line 2 -->
		<!-- Begin Line 3 -->
		<!-- Begin Line 3 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >3</th>
						<th scope="col" class="styIRS720LineHeaderTitle" >Nontaxable Use of Undyed Diesel Fuel</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" >Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ClaimPeriodBeginDt"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ClaimPeriodEndDt"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 3 Title -->
		<!-- Begin Line 3 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:11mm"/>
          Claimant certifies that the diesel fuel did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span><span style="width:1mm"/>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the diesel fuel did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
					<!--<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedDieselFuelDyedDieselException</xsl:with-param>-->
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/DyedDiesel"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedDieselFuelDyedDieselException</xsl:with-param>
				</xsl:call-template>
			</label>-->
		</div>
		<!-- End Line 3 Explanation -->
		<!-- Begin Line 3 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 3 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2" >
							<br/>Nontaxable use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm" >Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Use in trains</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell">Use in certain intercity and local buses<br/>(see <b>Caution</b> above line 1)</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">Use on a farm for farming purposes</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ExportedFuel"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ExportedFuel/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ExportedFuel/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ExportedFuel/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/ExportedFuel/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 3 Table -->
		<!-- End Line 3 -->
		<!-- Begin Line 4 -->
		<!-- Begin Line 4 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >4</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:113mm;font-size:7pt" >Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" style="width:30mm" >Period of claim
						  <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ClaimPeriodBeginDt"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ClaimPeriodEndDt"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 4 Title -->
		<!-- Begin Line 4 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:11mm"/>
          Claimant certifies that the kerosene did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span><span style="width:1mm"/>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed explanation<br/>
          and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/UndyedKeroseneUseExceptionInd"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .................................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the kerosene did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/UndyedKeroseneUseExceptionInd"/>
					<!--<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseOfUndyedKeroseneDyedKeroseneException</xsl:with-param>-->
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/DyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseOfUndyedKeroseneDyedKeroseneException</xsl:with-param>
				</xsl:call-template>
			</label>-->
		</div>
		<!-- End Line 4 Explanation -->
		<!-- Begin Line 4 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 4 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2" >
							<span>
								<b>Caution: </b>
								Claims cannot be made on line 4 for kerosene sales from a blocked pump.
							</span>
							<br/>Nontaxable use
          </th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm" >Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/AllwblNontxUseUndyedDslFuel/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/AllwblNontxUseUndyedDslFuel/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/AllwblNontxUseUndyedDslFuel/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/AllwblNontxUseUndyedDslFuel/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/AllwblNontxUseUndyedDslFuel/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">Use in certain intercity and local buses<br/>(see <b>Caution</b> above line 1)</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseIntrctyAndLclBuses/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseIntrctyAndLclBuses/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseIntrctyAndLclBuses/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseIntrctyAndLclBuses/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS720NameTableCell">Use on a farm for farming purposes</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseFarmingPurposes/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseFarmingPurposes/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseFarmingPurposes/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxFuelUseFarmingPurposes/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ExportedFuel"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ExportedFuel/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ExportedFuel/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ExportedFuel/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/ExportedFuel/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.044
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd044/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd044/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd044/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd044/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd044/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.219
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd219/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd219/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd219/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd219/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfUndyedKerosene/NontxUndyedKrsnNotAvnTxd219/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 4 Table -->
		<!-- End Line 4 -->
		<!-- Begin Line 5 -->
		<!-- Begin Line 5 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >5</th>
						<th scope="col" class="styIRS720LineHeaderTitle" >Kerosene Used in Aviation <span style="font-weight:normal">(see <b>Caution</b> above line 1)</span>
						</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" >Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/ClaimPeriodBeginDt"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/ClaimPeriodEndDt"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 5 Title -->
		<!-- Begin Line 5 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 5 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-bottom:4.5mm;padding-right:1mm;vertical-align:top" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2" >
							<br/>Kerosene used in commercial aviation (other than foreign trade) taxed at $.244</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px" >Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt244/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt244/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt244/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt244/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-bottom:0.5mm;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell" style="padding-top:0.75mm;">Kerosene used in commercial aviation (other than foreign trade)
taxed at $.219</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt219/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt219/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt219/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/CommercialAviationTaxedAt219/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-bottom:0.5mm;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" style="padding-top:0.75mm;">Nontaxable use (other than use by state or local government) taxed at $.244</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt244/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt244/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt244/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt244/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt244/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-bottom:0.5mm;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell" style="padding-top:0.75mm;">Nontaxable use (other than use by state or local government)
taxed at $.219</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt219/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt219/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt219/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt219/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/OtherNontaxableUsesTaxedAt219/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-bottom:0mm;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell" style="padding-top:0.75mm;">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--  <td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/LUST/NontaxableUseOfFuelTypeCd"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/LUSTTaxAviationUseForeignTrade/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/LUSTTaxAviationUseForeignTrade/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedInAviationClaims/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- <tr>
         <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm"><span style="width:1px" /></td>
          <td class="styIRS720NameTableCell" colspan="6" style="border-right-width:0px;">
                *This rate applies after February 29, 2008, unless changed by late legislation (see instructions).
          </td>
          

        </tr>-->
				</tbody>
			</table>
		</div>
		</div>
		<!-- End Line 5 Table -->
		<!-- End Line 5 -->
		<!-- Begin Footer -->
		<div style="width:187mm;border-top:1px solid black;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2019)
  </div>
		<!-- End Footer -->
		<!-- ========================================================================= -->
		<!-- END PAGE 5  -->
		<!-- ========================================================================= -->
		<div class="pageEnd"/>
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 6  -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div style="display:block;">
		<div class="styBB" style="width:187mm;border-bottom:2px solid black;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>6</b>
			</div>
        Form 720 (Rev. 1-2019)
      </div>
		<!-- End Header -->
		<!-- had to move Line 6 to next page-->
		<!-- Begin Line 6 -->
		<!-- Begin Line 6 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >6</th>
						<th scope="col" class="styIRS720LineHeaderTitle" >Nontaxable Use of Alternative Fuel</th>
					</tr>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN" >
							<span style="width:1px"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:179mm" >Caution: <span style="font-weight:normal">
								There is a reduced credit rate for use in certain intercity and local buses (type of use 5) (see instructions).
							</span>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 6 Title -->
		<!-- Begin Line 6 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 6 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2" >
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" >
							<br/>Liquefied petroleum gas (LPG) (see instructions)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px;font-size:7pt" >Gallons, or gasoline or diesel gallon equivalents</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">"P Series" fuels</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt">Compressed natural gas (CNG) (see instructions)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxCNG/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Liquefied hydrogen</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">f</td>
						<td class="styIRS720NameTableCell">Liquid fuel derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:1px">Liquefied natural gas (LNG) (see instructions)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:1px">
									<span style="text-align:left;padding-left:3.5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/Rt"/>
									</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width10px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLNG/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:0px">Liquefied gas derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail">
								<td class="styIRS720TableCellText" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
									</xsl:call-template>
									<span style="width:1mm;" />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellText" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="text-align:left;padding-left:3.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/Rt"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 6 Table -->
		<!-- End Line 6 -->
		<!-- Begin Line 7 -->
		<!-- Begin Line 7 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" style="width:8mm;text-align:center;font-size:8pt" rowspan="2" >7</th>
						<th scope="col" style="width:108mm;font-size:8pt;text-align:left" rowspan="2" >Sales by Registered Ultimate Vendors of Undyed Diesel Fuel</th>
						<th scope="col" style="width:35mm;text-align:right;font-weight:normal;padding-right:1mm" >Period of claim
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal" >
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/ClaimPeriodBeginDt"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/ClaimPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</th>
					</tr>
					<tr>
						<td style="text-align:right;padding-right:1mm">Registration Number
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</td>
						<td style="text-align:left;padding-bottom:0.5mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/ClaimantRegistrationNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 7 Title -->
		<!-- Begin Line 7 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:14mm"/>
          Claimant certifies that it sold the diesel fuel at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained<br/>
          written consent of the buyer to make the claim. Claimant certifies that the diesel fuel didn't contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception.<span style="width:1mm"/> </span>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/SalesUndyedDieselExceptionInd"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="sold the diesel fuel at a tax-excluded price">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/SalesUndyedDieselExceptionInd"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedDieselFuelException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/UndyedDieselFuel"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedDieselFuelException</xsl:with-param>
				</xsl:call-template>
			</label>-->
		</div>
		<!-- End Line 7 Explanation -->
		<!-- Begin Line 7 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 7 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:97mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Use by a state or local government</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:17mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUsedByStateLocalGovt/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUsedByStateLocalGovt/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUsedByStateLocalGovt/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 7 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUseIntercityLocalBuses/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUseIntercityLocalBuses/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUseIntercityLocalBuses/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfUndyedDsl/FuelUseIntercityLocalBuses/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 7 Table -->
		<!-- End Line 7 -->
		<!-- Begin Line 8 -->
		<!-- Begin Line 8 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" style="width:8mm;text-align:center;font-size:8pt;vertical-align:top;padding-top:0.5mm" rowspan="2">8</th>
						<th scope="col" style="width:108mm;font-size:8pt;text-align:left">Sales by Registered Ultimate Vendors of Undyed Kerosene</th>
						<th scope="col" style="width:35mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/ClaimPeriodBeginDt"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/ClaimPeriodEndDt"/>
								</xsl:call-template>
							</span>
						</th>
					</tr>
					<tr>
						<td style="font-size:8pt;text-align:left;font-weight:bold;padding-bottom:0.5mm">(Other Than Kerosene For Use in Aviation)</td>
						<td style="text-align:right;padding-right:1mm">Registration Number
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</td>
						<td style="text-align:left;padding-bottom:0.5mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/ClaimantRegistrationNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 8 Title -->
		<!-- Begin Line 8 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:14mm"/>
          Claimant certifies that it sold the kerosene at a tax-excluded price, repaid the amount of tax to the buyer, or has obtained<br/>
          the written consent of the buyer to make the claim. Claimant certifies that the kerosene didn't contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception.<span style="width:1mm"/> </span>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/SlsUndyedKeroseneExceptionInd"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Undyed Kerosene">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/SlsUndyedKeroseneExceptionInd"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedKeroseneException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/UndyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedKeroseneException</xsl:with-param>
				</xsl:call-template>
			</label>-->
		</div>
		<!-- End Line 8 Explanation -->
		<!-- Begin Line 8 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 8 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:97mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Use by a state or local government</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:17mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUsedByStateLocalGovt/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUsedByStateLocalGovt/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUsedByStateLocalGovt/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Sales from a blocked pump</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelSalesFromBlockedPump/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelSalesFromBlockedPump/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelSalesFromBlockedPump/ClaimAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUseIntercityLocalBuses/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUseIntercityLocalBuses/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUseIntercityLocalBuses/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrUndyedKerosene/FuelUseIntercityLocalBuses/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 8 Table -->
		<!-- End Line 8 -->
		<!-- Begin Line 9 -->
		<!-- Begin Line 9 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:2mm;padding-bottom:2mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:2mm;padding-bottom:2mm;font-size:8pt">9</th>
						<th scope="col" style="width:110mm;text-align:left">Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</th>
						<th scope="col" style="text-align:right;padding-right:1mm;font-weight:normal">Registration Number
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/ClaimantRegistrationNum"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 9 Title -->
		<!-- Begin Line 9 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:10mm"/>
          Claimant sold the kerosene for use in aviation at a tax-excluded price and hasn't collected the amount of tax from the<br/>
          buyer, repaid the amount of tax to the buyer, or has obtained written consent of the buyer to make the claim. See the<br/>
          instructions for additional information to be submitted.
        </div>
		<!-- End Line 9 Explanation -->
		<!-- Begin Line 9 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 9 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:84mm;border-left-width:0px;font-weight:normal;text-align:left;font-size:6pt;vertical-align:bottom" rowspan="2">
							<br/>Use in commercial aviation (other than foreign trade) taxed at $.219</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:14mm">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt219/Rt"/>
							</xsl:call-template><span style="width:2mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt219/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt219/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt219/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt">Use in commercial aviation (other than foreign trade) taxed at $.244</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:left;padding-left:3.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt244/Rt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt244/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt244/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/CommercialAviationTaxedAt244/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Nonexempt use in noncommercial aviation</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:left;padding-left:3.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptFuelUseCommercialAvn/Rt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptFuelUseCommercialAvn/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptFuelUseCommercialAvn/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptFuelUseCommercialAvn/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.244
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt244"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt244/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="text-align:left;padding-left:3.5mm;">
							0.243
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--  <td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptUseNoncommercial/Rt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptUseNoncommercial/GallonsQty"/>
							</xsl:call-template>
						  </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt244/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt244/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;border-bottom-width:0;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.219
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt219"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt219/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="text-align:left;padding-left:3.5mm;">
							0.218
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--<td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptUseNoncommercial/Rt"/>
							</xsl:call-template>
						  </td>
						  <td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/NonexemptUseNoncommercial/GallonsQty"/>
							</xsl:call-template>
						  </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt219/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/OtherNontaxableUsesTaxedAt219/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseOfAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--<td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/LUST/NontaxableUseOfFuelTypeCd"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:left;padding-left:3.5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/LUSTTaxAviationUseForeignTrade/Rt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/LUSTTaxAviationUseForeignTrade/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrKeroseneSoldAvn/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--  <tr>
          <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm"><span style="width:1px" /></td>
          <td class="styIRS720NameTableCell" colspan="6" style="border-right-width:0px;">
                *This rate applies after February 29, 2008, unless changed by late legislation (see instructions).
          </td>
          

        </tr>-->
				</tbody>
			</table>
		</div>
		<!-- End Line 9 Table -->
		<!-- End Line 9 -->
		<!-- Begin Line 10 -->
		<!-- Begin Line 10 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:2mm;padding-bottom:2mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:2mm;padding-bottom:2mm;font-size:8pt">10</th>
						<th scope="col" style="width:110mm;text-align:left;font-size:8pt">Sales by Registered Ultimate Vendors of Gasoline</th>
						<th scope="col" style="text-align:right;padding-right:1mm;font-weight:normal">Registration Number
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/ClaimantRegistrationNum"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 10 Title -->
		<!-- Begin Line 10 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:10mm"/>
          Claimant sold the gasoline at a tax-excluded price and hasn't collected the amount of tax from the buyer, repaid the<br/>
          amount of tax to the buyer, or has obtained written consent of the buyer to take the claim; and obtained an unexpired<br/>
          certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for<br/>
          additional information to be submitted.
        </div>
		<!-- End Line 10 Explanation -->
		<!-- Begin Line 10 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 10 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:97mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Use by a nonprofit educational organization
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUseNonprofitEducationalOrg"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:17mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUseNonprofitEducationalOrg/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUseNonprofitEducationalOrg/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUseNonprofitEducationalOrg/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:choose>
								<xsl:when test="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/CreditReferenceNum ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<!-- Line 10 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use by a state or local government
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfGas/FuelUsedByStateLocalGovt/ClaimAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
		<!-- End Line 10 Table -->
		<!-- End Line 10 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2019)
  </div>
		<!-- End Footer -->
		<!-- ========================================================================= -->
		<!-- END PAGE 6  -->
		<!-- ========================================================================= -->
		<div class="pageEnd"/>
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 7  -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div style="display:block;">
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>7</b>
			</div>
    Form 720 (Rev. 1-2019)
  </div>
		<!-- End Header -->
		<!-- Begin Line 11 -->
		<!-- Begin Line 11 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">11</th>
						<th scope="col" style="width:110mm;text-align:left;font-size:8pt">Sales by Registered Ultimate Vendors of Aviation Gasoline</th>
						<th scope="col" style="text-align:right;padding-right:1mm;font-weight:normal">Registration Number
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/ClaimantRegistrationNum"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 11 Title -->
		<!-- Begin Line 11 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:10mm"/>
          Claimant sold the aviation gasoline at a tax-excluded price and hasn't collected the amount of tax from the buyer, repaid<br/>
          the amount of tax to the buyer, or has obtained written consent of the buyer to take the claim; and obtained an unexpired<br/>
          certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for<br/>
          additional information to be submitted.
        </div>
		<!-- End Line 11 Explanation -->
		<!-- Begin Line 11 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 11 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:97mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Use by a nonprofit educational organization
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUseNonprofitEducationalOrg"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:17mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUseNonprofitEducationalOrg/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUseNonprofitEducationalOrg/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUseNonprofitEducationalOrg/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-bottom-width:0px;padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 11 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left;border-bottom:0px">Use by a state or local government
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUsedByStateLocalGovt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
							<span style="text-align:left;padding-left:3.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUsedByStateLocalGovt/Rt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUsedByStateLocalGovt/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRegdVndrOfAviationGas/FuelUsedByStateLocalGovt/ClaimAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--<tr>
          <td class="styIRS720TableCellLineNumber" style="border-bottom-width:0;1px;border-right-width:0px;font-size:8pt;padding-right:1mm"><span style="width:1px" /></td>
          <td class="styIRS720NameTableCell" colspan="6" style="border-right-width:0px;border-bottom-width:0px">
                *This rate applies after February 29, 2008, unless changed by late legislation (see instructions).
          </td>
          

        </tr>-->
				</tbody>
			</table>
		</div>
		<!-- End Line 11 Table -->
		<!-- End Line 11 -->
		<!-- Begin Line 12 -->
		<!-- Begin Line 12 Title -->
			<div class="styBB" style="width:187mm">
				<table cellspacing="0" style="font-size:7pt">
					<tbody>
						<tr>
							<th scope="col" style="width:8mm;text-align:center;vertical-align:top;font-size:8pt;padding-top:1mm;">12</th>
							<th scope="col" colspan="3" style="width:93mm;text-align:left;vertical-align:top;font-size:8pt;padding-top:1mm;"><b>Reserved for future Use</b></th>
							<th scope="col" style="width:24mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:16mm;text-align:left;font-weight:normal;font-size:6pt;">
								<!--<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/ClaimPeriodBeginDt"/>
								</xsl:call-template>-->
							</th>
							<th scope="col" style="width:16mm;text-align:left;font-weight:normal;font-size:6pt;">
								<!--<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/ClaimPeriodEndDt"/>
								</xsl:call-template>-->
							</th>
							<th scope="col" style="width:32mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:14mm;text-align:left;padding-bottom:0.5mm;font-weight:normal;font-size:6pt;">
								<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/ClaimantRegistrationNum"/>
								</xsl:call-template>-->
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- End Line 12 Title -->
		<!-- Begin Line 12 Explanation -->
		<div style="width:187mm;height:12mm;padding-left:8mm;">
			Reserved for future Use
		</div>
		<!-- End Line 12 Explanation -->
		<!-- Begin Line 12 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt;border-bottom-width:0px">
				<tbody>
					<!-- Line 12 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;border-top-width:1px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gal. of biodiesel or renewable diesel</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<div style="">$</div>
							<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/BiodieselMixtures/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/BiodieselMixtures/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/BiodieselMixtures/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/BiodieselMixtures/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 12 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/AgriBiodieselMixtures/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/AgriBiodieselMixtures/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/AgriBiodieselMixtures/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/AgriBiodieselMixtures/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 12 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/RenewableDieselMixtures/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/RenewableDieselMixtures/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/RenewableDieselMixtures/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDslMixCr/RenewableDieselMixtures/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 12 Table -->
		<!-- End Line 12 -->

		<!-- Begin Line 13 -->
		<!-- Begin Line 13 Title -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">13</th>
						<th scope="col" style="width:106mm;text-align:left;font-size:8pt"><b>Reserved for future Use</b></th>
						<th scope="col" style="text-align:right;padding-right:1mm;font-weight:normal">Registration Number
			  <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/ClaimantRegistrationNum"/>
							</xsl:call-template>-->
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 13 Title -->
		<!-- Begin Line 13 Explanation -->
		<div style="width:187mm;height:12mm;padding-left:8mm;border-top:1px solid black;">
				Reserved for future Use
			</div>
		<!-- End Line 13 Explanation -->
		<!-- Begin Line 13 Table -->
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 13 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>a</th>
				  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gallons, or gasoline or diesel gallon equivalents <span style="font-weight:normal">(see instructions)</span>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<div style="">$</div>
							<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedPetroleumGas/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedPetroleumGas/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedPetroleumGas/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedPetroleumGas/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/PSeriesFuelCredit/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/PSeriesFuelCredit/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/PSeriesFuelCredit/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/PSeriesFuelCredit/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedNaturalGas/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedNaturalGas/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedNaturalGas/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedNaturalGas/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedHydrogen/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedHydrogen/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedHydrogen/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedHydrogen/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromCoal/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromCoal/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromCoal/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromCoal/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromBiomass/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromBiomass/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromBiomass/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquidFuelFromBiomass/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">g</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedNaturalGas/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedNaturalGas/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedNaturalGas/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedNaturalGas/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">h</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedGasFromBiomass/Rt"/>
								</xsl:call-template>
							</span>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedGasFromBiomass/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedGasFromBiomass/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/LiquefiedGasFromBiomass/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
					<!-- Line 13 (i) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">i</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">
							Reserved for future Use
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:right;padding-right:0.5mm;background-color:lightgrey">
							<!--<span style="">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedGasFromBiomass/Rt"/>
								</xsl:call-template>
							</span-->>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedGasFromBiomass/GallonsQty"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedGasFromBiomass/ClaimAmt"/>
							</xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;background-color:lightgrey">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlternativeFuelAndFuelMixCr/CompressedGasFromBiomass/CreditReferenceNum"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</tbody>
			</table>
		<!-- End Line 13 Table -->
		<!-- End Line 13 -->
		<!-- Begin Line 14 -->
		<!-- Begin Line 14 Title -->
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt;border-top:0px;border-bottom:0px;border-left:0px;border-right:0px;border-color:black;border-style:solid;">14</th>
						<th scope="col" colspan="2" style="width:134mm;text-align:left;font-size:7pt;border-top:0px;border-bottom:0px;border-left:0px;border-right:1px;border-color:black;border-style:solid;">Other Claims. <span style="width:130mm;font-weight:normal;display:inline;">See the instructions.  For lines 14b and 14c, see the <b>Caution</b> above line 1 on page 5.</span>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px;border-bottom-width:0px;" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;" >CRN</th>
					</tr>
					<!-- Line 14 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:1px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom">
							a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:134mm;border-top-width:1px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom"  colspan="2">
							Section 4051(d) tire credit (tax on vehicle reported on IRS No. 33)</th>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;padding-right:2px;border-top-width:1px;">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/Section4051dTireCredit/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-top-width:1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/Section4051dTireCredit/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedDslFuelAndExpGasoline"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedDslFuelAndExpGasoline/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedDslFuelAndExpGasoline/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed kerosene 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedKeroseneOthExciseClaims"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedKeroseneOthExciseClaims/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/ExpDyedKeroseneOthExciseClaims/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (d) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/NontxDieselWaterFuelEmulsion)">
						<!--In case there is nothing for the for-each loop to grab-->
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ClaimAmt/@note"/>
									</xsl:call-template>
								</div>
								  Diesel-water fuel emulsion            
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ClaimAmt/@claimantRegistrationNum"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/NontxDieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/NontxDieselWaterFuelEmulsion">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ClaimAmt/@note"/>
									</xsl:call-template>
								</div>
								  Diesel-water fuel emulsion             
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ClaimAmt/@claimantRegistrationNum"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/NontxDieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 14 (e) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/RegisteredCreditCardIssuers)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ClaimAmt/@note"/>
									</xsl:call-template>
								</div>                 
							    Registered credit card issuers            
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ClaimAmt/@claimantRegistrationNum"/>
								</xsl:call-template>
								
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/RegisteredCreditCardIssuers"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/RegisteredCreditCardIssuers">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ClaimAmt/@note"/>
									</xsl:call-template>
								</div>                   
							    Registered credit card issuers            
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ClaimAmt/@claimantRegistrationNum"/>
								</xsl:call-template>
								
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/RegisteredCreditCardIssuers"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- begin new Line 14f -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>f</td>
						<td class="styIRS720NameTableCell" style="width:110mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" >
							<br/>Taxable tires other than bias ply or super single tires
 <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresOther"/>
							</xsl:call-template>
						</td>
						<td style="width:24mm;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;font-weight:bold" >Number of tires
        </td>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px;border-top-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresOther/TireCnt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresOther/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresOther/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 14f -->
					<!-- begin new line 14g -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="font-size:7pt" >Taxable tires, bias ply or super single tires (other than super single tires designed for steering) 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresBiasPlyOthSuperSingle"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresBiasPlyOthSuperSingle/TireCnt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresBiasPlyOthSuperSingle/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresBiasPlyOthSuperSingle/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 14g -->

					<!-- begin new Line 14h -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:7mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="width:110mm;" >Taxable tires, super single tires designed for steering 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresSuperSingleSteering"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:23mm;text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresSuperSingleSteering/TireCnt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="width:33mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresSuperSingleSteering/ClaimAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:8.5mm;border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/TxblTiresSuperSingleSteering/CreditReferenceNum"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- End new line 14h -->
					<!-- Line 14 (i) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/OtherClaimsPub510)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="width:7mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2" style="width:135mm;">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="width:36mm;font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="width:8.5mm;border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/OtherClaimsPub510">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="width:7mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2" style="width:135mm;">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherExciseLiabilityClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="width:36mm;font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="ClaimAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="width:8.5mm;border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 14 (j) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">j</td>
						<td class="styIRS720NameTableCell" colspan="2">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- Line 14 (k) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">k</td>
						<td class="styIRS720NameTableCell" colspan="2">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<span style="width:1px"/>
						</td>
					</tr>
				</tbody>
			</table>
					<!-- Line 14 (i) -->
					<!--<tr>
          <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
          <td class="styIRS720NameTableCell"><span style="width:1px" /></td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt"><span style="width:1px" /></td>
          <td class="styIRS720TableCellText" style="border-right-width:0px"><span style="width:1px" /></td>
        </tr>-->
		<!-- End Line 14 Table -->
		<!-- End Line 14 -->
		<!-- Begin Line 15 -->
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<td class="styIRS720LineNumber" style="width:8mm;border-bottom:1px solid black;">15</td>
						<td class="styIRS720RightBorder" style="width:129mm;font-size:6pt;font-weight:normal;text-align:left;padding-left:1mm;border-right-width:1px;border-bottom:1px solid black;">
							<b>Total claims. </b>Add amounts on lines 1 through 14. Enter the result here and on Form 720, Part III, line 4.
						</td>
						<td class="styIRS720LineNumber" style="width:5mm;text-align:center;border-right:1px solid black;border-bottom:1px solid black;">15</td>
						<td class="styIRS720RightBorder" style="width:36mm;border-bottom-width:0px;text-align:right;font-weight:normal;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TotalClaimsAmt"/>
							</xsl:call-template>
						</td>
						<td scope="col" style="width:8.75mm;border-bottom:1px solid black;background-color:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 15 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2019)
  </div>
		<!-- End Footer -->
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- END PAGE 7 END PAGE 7 END PAGE 7 END PAGE 7 END PAGE 7 END PAGE 7 END PAGE 7 -->
		<!-- ========================================================================= -->
		<!-- Begin Left Over Data Table -->
		<!-- Begin Additonal Data Title Bar and Button -->
		<div class="styLeftOverTitleLine" id="LeftoverData">
			<div class="styLeftOverTitle">
      Additional Data        
    </div>
			<div class="styLeftOverButtonContainer">
				<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage  ();"/>
			</div>
		</div>
		<!-- End Additional Data Title Bar and Button -->
		<table class="styLeftOverTbl">
			<xsl:call-template name="PopulateCommonLeftover">
				<xsl:with-param name="TargetNode" select="$FormData"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
				<xsl:with-param name="Desc">Form 720, Top Left Margin - Section 6114 Treaty</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$FormData/@section6114TreatyIndicator"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
		</table>
		<!--Special Condition Description -->
<br />
<span class="styRepeatingDataTitle">Form 720, Special Condition Description: </span>


<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">

<thead class="styTableThead">

<tr class="styDepTblHdr">

<th scope="col" class="styDepTblCell"  rowspan="2" style="width:179mm;font-size:8pt;">

Special Condition Description</th>

</tr>

</thead>

<tfoot/>

<tbody>

<xsl:for-each select="$FormData/SpecialConditionDesc">

<tr style="border-color:black;height:6mm;">

<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>

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
      </form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>