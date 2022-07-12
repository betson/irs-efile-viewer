<?xml version="1.0" encoding="UTF-8"?>
<!-- 04/21/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 07/17/2015 - Modified per defect 43263 - Jeremy Nichols-->
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
			
	<xsl:choose>
      <xsl:when test="($Version = '2013Q1v1.0') or ($Version = '2013Q1v1.1') or ($Version = '2013Q1v1.2') or ($Version = '2013Q1v1.3') or ($Version = '2013Q1v2.0') or ($Version = '2013Q1v2.1') or ($Version = '2013Q1v2.2')">
        <!-- beginning for versions for 2013 Q1 -->	
        <xsl:call-template name="DocumentHeader"/>
		<!--Title of Form -->
		<div class="styBB" style="width:187mm;height: 21.5mm">
			<div class="styFNBox" style="height: 21.5mm; width:31mm;font-size: 7pt">
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
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">(Rev. January 2013) </span>
				<br/>
				<span class="styAgency" style="font-size: 7.5pt; font-weight:bold">Department of the Treasury</span>
				<br/>
              <span class="styAgency" style="font-size: 7.5pt;font-weight:bold">Internal Revenue Service</span>
			</div>
			<div class="styFTBox" style="width:125mm; height: 21.5mm;">
				<div class="styMainTitle" style="height:10mm; font-weight: bold; padding-top: 4mm">Quarterly Federal Excise Tax Return</div>
				<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold; padding-top: 2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> See the Instructions for Form 720.
				</div>
				<div class="styFST" style="font-size:7pt;;font-weight:bold; padding-top: 0.2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> Information about Form 720 and its instructions is at www.irs.gov/form720.
				</div>
			</div>
			<div class="styTYBox" style="width:31mm; height: 21.5mm">
				<div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0023</div>
			</div>
		</div>
		<!--  End title of Form  -->
		<div style="height:34mm;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
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
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
											<xsl:with-param name="BackupName">IRS720FinalReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
											<xsl:with-param name="BackupName">IRS720FinalReturn</xsl:with-param>
										</xsl:call-template>
									  Final return
									  </label>
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChange"/>
											<xsl:with-param name="BackupName">IRS720AddressChange</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AddressChange"/>
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
												<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											</xsl:call-template>
											<br/>
										</th>
										<th scope="col"  valign="top" style="height:16mm;width:46mm;text-align:left;font-weight:normal">Quarter ending <br/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEnding"/>
											</xsl:call-template>
										</th>
									</tr>
									<tr>
										<td valign="top" style="height:10mm;width:78mm;">Number, street, and room or suite no. 
										    <br/>(If you have a P.O. box, see the instructions.)<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											</xsl:call-template>
										</td>
										<td valign="top" style="height:10mm;width:46mm;font-weight:bold;">Employer identification number <br/>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td valign="top" colspan="2" style="height:8mm;width:124mm;">
											  City, state, and ZIP code. (If you have a foreign address, see the instructions.)<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="MainForm">true</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</thead>
							</table>
						</th>
						<!-- Begin IRS USE ONLY Colum -->
						<th scope="col"  valign="top" style="padding-top:0px">
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
		</div>
		<!-- End Name / Employer identification number / Address -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">

			<!-- Begin Part I Section Header -->
			<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt;">
				<thead class="styTableHead">
					<tr>
						<th scope="col" colspan="8" style="height:4mm;width:187mm;float:left;clear:none;">
							<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
								<div class="styPartName" style="width:12mm; height:4mm;">Part I</div>
							</div>
						</th>
					</tr>
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>IRS No.</b>
						</th>
						<th scope="col" colspan="5" style="height:4mm;width:130mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-left:5px;text-align:left;" >
							<span style="font-size:8pt">
								<b>Environmental Taxes</b> (attach Form 6627)
                      
								<!-- Form to Form Link (Push Pin)-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/EnvironmentalTaxes"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>IRS No.</b>
						</th>
						<!-- End Part I Section Header -->
					</tr>
				</thead>
				<tfoot/>
				<tbody style="font-size:7pt;">
					<!-- Begin Part I, Environmental Tax, line 18 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Domestic petroleum oil spill tax
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;">
							<span style="float:left;">
								<xsl:if test="position()=1">$</xsl:if>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 18 -->
					<!-- Begin Part I, Environmental Tax, line 21 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Imported petroleum products oil spill tax
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 21 -->
					<!-- Begin Part I, Environmental Tax, line 98 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Ozone-depleting chemicals (ODCs)
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 98 -->
					<!-- Begin Part I, Environmental Tax, line 19 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">ODC tax on imported products
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 19 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes title -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="5" style="height:4mm;width:130mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:left; font-weight:normal;padding-left:5px;" >
							<span style="font-size:8pt">
								<b>Communications and Air Transportation Taxes</b> (see instructions)</span>
						</th>
						<th scope="col" align="center" style="height:4mm;width:34mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes title -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 22 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Local telephone service and teletypewriter exchange service
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 22 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 26 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of persons by air
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 26 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 28 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of property by air
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 28 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 27 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Use of international air travel facilities
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 27 -->
					<!-- Begin Part I, Fuel Taxes title  -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Fuel Taxes</b>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal; font-size:6pt" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Fuel Taxes title  -->
					<!-- Begin Part I, Fuel Taxes, line 60 (a)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a) <span style="width:2px;"/>Diesel, tax on removal at terminal rack
					    </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:4mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px;"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey;">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 60 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 60 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
							Diesel, tax on taxable events other than removal at terminal rack
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Lg.gif" alt="Bracket" style="height:10mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSNo"/>
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
							Diesel, tax on sale or removal of biodiesel mixture (not at terminal rack)
					    </td>
						<td style="height:6.5mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:norma; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60c/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60c/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px;"/>
						</td>
						<td style="height:6.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Diesel-water emulsion
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 104-->
					<!-- Begin Part I, Fuel Taxes, line 71-->
					<!-- Delete IRS71 <tr>
      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSNo"/>
                </xsl:call-template>
      </td>
      <td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel fuel used in trains
              </td>
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >    
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSGal"/>
                </xsl:call-template>
      </td>             
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >  
        <span style="float:left;"></span>
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSRate"/>
                </xsl:call-template>
      </td>   
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <span style="width:1px"></span>
              </td>       
            <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSTax"/>
                </xsl:call-template>
              </td>
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSNo"/>
                </xsl:call-template>
              </td>
    </tr> -->
					<!-- End Part I, Fuel Taxes, line 71-->
					<!-- Begin Part I, Fuel Taxes, line 105-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel LUST tax
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 105-->
					<!-- Begin Part I, Fuel Taxes, line 107-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed kerosene, LUST tax
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 107-->
					<!-- Begin Part I, Fuel Taxes, line 119-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax, other exempt removals (see instructions)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 119-->
					<!-- Begin Part I, Fuel Taxes, line 35 (a)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a)<span style="width:1px;"/>Kerosene, tax on removal at terminal rack (see instructions)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:20mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:10mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:12mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px;"/>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 35 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:10mm;"></span>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b)<span style="width:1px;"/>Kerosene, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:20mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:10mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1mm;"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right;padding-top:3mm; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 69-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation (see instructions)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 69-->
					<!-- Begin Part I, Fuel Taxes, line 77-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in commercial aviation (other than foreign trade) 
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 77-->
					<!-- Begin Part I, Fuel Taxes, line 111-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation, LUST tax on nontaxable uses              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 111-->
					<!-- Begin Part I, Fuel Taxes, line 79-->
					<tr>
						<td style="height:3.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3.5mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Other fuels (see instructions)

        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRS79Gal"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRS79Rate"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSNo"/>
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
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:9mm;width:1mm;"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
        Gasoline, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1mm"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 62 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 13 -->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Any liquid fuel used in a fractional ownership program aircraft
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 13 -->
					<!-- Begin Part I, Fuel Taxes, line 14-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Aviation gasoline
					    </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 14-->
					<!-- Begin Part I, Fuel Taxes, line 112-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied petroleum gas (LPG)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 112-->
					<!-- Begin Part I, Fuel Taxes, line 118-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">"P Series" fuels
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 118-->
					<!-- Begin Part I, Fuel Taxes, line 120-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Compressed natural gas (CNG) (GGE = 126.67 cu.ft.)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 120-->
					<!-- Begin Part I, Fuel Taxes, line 121-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied hydrogen
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 121-->
					<!-- Begin Part I, Fuel Taxes, line 122-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><span style="font-size:7pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</span>
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 122-->
					<!-- Begin Part I, Fuel Taxes, line 123-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquid fuel derived from biomass
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 123-->
					<!-- Begin Part I, Fuel Taxes, line 124-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied natural gas (LNG)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 124-->
					<!-- Begin Part I, Retail Taxes, Line 33 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:4mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><b>Retail Tax</b> - Truck, trailer, and semitrailer chassis and bodies, and tractors
              </td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm; font-size:6pt" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 33-->
					
					<!-- Begin Part I, Ship Passenger Tax title -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Ship Passenger Tax</b>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;font-size:6pt" >
							<b>Number of persons</b>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Ship Passenger Tax title -->
					<!-- Begin Part I, Ship Passenger Tax, line 29 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation by water
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRS29NbrPersons"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSRate"/>
							</xsl:call-template>
							<span style="font-size:6pt"> per person</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSNo"/>
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
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none; text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Obligations not in registered form
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/AmtOblig"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:3mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 31 -->
					<!-- Begin Part I, Foreign Insurance Tax title -->
					<tr>
						<th scope="col" style="height:7mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:7mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:7pt">
								<b>Foreign Insurance Taxes</b> - <span style="font-weight:normal"> Policies issued by foreign insurers</span>
							</span>
						</th>
						<th scope="col" style="height:7mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Premiums paid</b>
						</th>
						<th scope="col" colspan="2" style="height:7mm;width:30mm;float:left;clear:none; text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:7mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="height:7mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30a/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:11mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:10px; font-size:6pt">Life insurance, sickness and accident policies, and annuity contracts
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30b/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm;  text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30c/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30c/IRSRate"/>
							</xsl:call-template>
						</td>
						<td rowspan="3" style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
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
					<!-- Begin Page 1 Footer -->
					<tr>
						<td colspan="8" style="width:187mm; float:left;clear:none;border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
							<div style="float:left;">
								<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
								<span style="width:6mm;"/>                        
        Cat. No. 10175Y
      </div>
							<div style="float:right;">
								<span style="width:20px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2013)
      </div>
							<div class="pageEnd"/>
						</td>
					</tr>
					<br/>
					<br/>
					<!-- End Page 1 Footer -->
					<!-- Begin page 2 Header -->
					<tr>
						<td colspan="8" class="styBB" style="width:187mm">
							<div style="float: left; clear: none">Form 720 (Rev. 1-2013)</div>
							<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">2</span>
							</div>
						</td>
					</tr>
					<!-- End page 2 Header -->
					<!-- Begin Part I, Manufacturers Tax title -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</td>
						<td style="height:4mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
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
							<b>Rate</b>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax title -->
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Coal&#8212;Underground mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/Tons"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSRate"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSRate"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Coal&#8212;Surface mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/Tons"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSRate"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<!-- Begin Part I, Manufacturers Tax, line 39 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSRate"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires other than biasply or super single tires
              </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRS108NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 108 -->
					<!-- Begin Part I, Manufacturers Tax, line 109 -->
					<tr>
						<td style="height:6.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:6.5mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable biasply or super single tires (other than super single tires designed for steering)
              </td>
						<td colspan="2" style="height:6.5mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRS109NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--End Part I, Manufacturers Tax, line 109 -->
					<!-- Begin Part I, Manufacturers Tax, line 113 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires, super single tires designed for steering
              </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRS113NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 113 -->
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<tr>
						<td style="height:4.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:4.5mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-left:5px;">Gas guzzler tax.  Attach Form 6197.  
      
        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40"/>
							</xsl:call-template>

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
                      </span>
							<span style="width:2px"/>
							<input type="checkbox" class="styCkbox" title="Check if one-time filing">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRS40OTFCB"/>
									<xsl:with-param name="BackupName">IRS720TFCB</xsl:with-param>
								</xsl:call-template>
							</input>
							
						</td>
						<td style="height:4.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:1mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:4.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Vaccines (see instructions)
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<!-- Begin Part I, Other Excise Tax, line 136 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="font-size:5pt; font-weight:bold">Sales price </span>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</td>
					</tr>
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable medical devices
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSRate"/>
							</xsl:call-template> 
							of sales price
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 136 -->
					<!-- End Part I, Manufacturers Tax -->
					<!-- Begin Part I,  Total -->
					<tr>
						<td colspan="6" style="height:4mm;width:141mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:3mm">
								<b>1  Total.</b>  Add all amounts in Part I.  Complete Schedule A unless one-time filing. </span>
							<span style="width:36mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;font-size:6pt">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartITotal"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I,  Total -->
				</tbody>
			</table>
			<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
				<tbody>
					<!-- Begin Part II Line-->
					<tr>
						<td colspan="8">
							<div class="styPartName" style="width:12mm; height:4mm;">Part II </div>
						</td>
					</tr>
					<!-- End Part II Line-->
					<!-- Begin Part II,  Table title  -->
					<tr>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</th>
						<th style="width:66mm;text-align:left;font-weight:normal; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							<b>Patient Centered Outcomes Research Fee</b><br/> (see instructions)
						</th>
						<th style="width:22mm;height:font-size:8;text-align:center;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>(a) Avg. number of lives covered</b>
						</th>
						<th style="width:22mm;font-size:8;text-align:center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>(b) Rate for avg. covered life</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<b>Col. (a) x Col. (b)</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</th>
					</tr>
					<!-- End Part II,  Table title  -->
					<!-- Begin Part II, line 133 -->
					<tr style="height:4.5mm;">
						<td rowspan="2" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="width:65mm;height:4.5mm;text-align:left;vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							Specified health insurance policies
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/AvgNumLvesCoverd"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:4.5mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/SubTax"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket"/>
						</td>
						<td style="height:4.5mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td rowspan="2" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr style="height:4.5mm;">
						<td style="width:65mm;height:4.5mm;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-top:0px;padding-bottom:0px; ">
							Applicable self-insured health plans
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/AvgNumLvesCoverd"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/SubTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSTax"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 133 -->
					<!-- Begin Part II, line 41 -->
					<tr>
						<td rowspan="2" style="text-align: center; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSNo"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" colspan="3" style="text-align: left; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Sport fishing equipment (other than fishing rods and fishing poles)
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<b>Rate</b>
					    </td>
						<td rowspan="2" style="text-align: right; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSTax"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSRate"/>
							</xsl:call-template> of sales price
					    </td>
					</tr>
					<!-- End Part II, line 41 -->
					<!-- Begin Part II, line 110 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing rods and fishing poles (limits apply, see instructions)
              </td>
						<td colspan="2" style=" text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 110 -->
					<!-- Begin Part II, line 42 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Electric outboard motors
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 42 -->
					<!-- Begin Part II, line 114 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing tackle boxes
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 114 -->
					<!-- Begin Part II, line 44 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Bows, quivers, broadheads, and points
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 44 -->
					<!-- Begin Part II, line 106 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Arrow shafts
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSRate"/>
							</xsl:call-template> per shaft
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 106 -->
					<!-- Begin Part II, line 140 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Indoor tanning services
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSRate"/>
							</xsl:call-template> of amount paid
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 140 -->
					<!-- Begin Part II, line blank -->
					<tr>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt; width:1px"/>
						</th>
						<th scope="col" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part II, line blank -->
					<!-- Begin Part II, line 64 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Inland waterways fuel use tax
              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:20mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 64 -->
					<!-- Begin Part II, line 125 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax on inland waterways fuel use (see instructions)              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:20mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 125 -->
					<!-- Begin Part II, line 51 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Alcohol and cellulosic biofuel sold as but not used as fuel           <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRS51Gal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRS51Rate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 51 -->
					<!-- Begin Part II, line 117 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Biodiesel sold as but not used as fuel          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRS117Gal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRS117Rate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><b>Floor Stocks Tax</b>- Ozone-depleting chemicals (floor stocks). Attach Form 6627.
          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, Floor Stocks Tax, line 20 -->
					<!-- Begin Part II,  Total -->
					<tr>
						<td colspan="6" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:4mm">
								<b>2  Total.</b>  Add all amounts in Part II. </span>
							<span style="width:112mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIITotal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part II,  Total -->

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
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;"/>
						<th scope="col" colspan="3" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"/>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" />
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;"/>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;"/>
					</tr>
					<!-- End Part III,  Table title  -->
				</tbody>
			</table>
		</div>
		<!-- Begin Part III Section Header -->
		<table cellspacing="0" cellpadding="0" style="width:187mm; font-size:7pt;" border="0">
			<thead class="styTableHead">
				<tr>
					<th scope="col" style="height:1px;width:10mm;" />
					<th scope="col" style="height:1px;width:72mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
				</tr>
			</thead>
			<tfoot/>
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
                  <span style="width:5px"/>   
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>3</b>
					</td>
					<xsl:if test="$FormData/TotalTax">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTax"/>
							</xsl:call-template>
						</td>
					</xsl:if>
					<xsl:if test="$FormData/NoTax">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NoTax"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Claims"/>
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
						  <span style="width:5px"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtDepositsMadeForQuarter"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/UsedSafeHarborRule"/>
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
                  <span style="width:5px"/>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>6</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AmtPreviousOverpayment"/>
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
        Enter the amount from Form 720X <br/> included on line 6, if any
        <!--Dotted Line-->
						<span class="styBoldText">        
							<span style="width:11px"/>.            
							<span style="width:11px"/>.            
							<span style="width:11px"/>. 
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:6px"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Amt720XOverpayment"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtTotalPayments"/>
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
							<span style="width:2px"/>.            
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtTotalCredits"/>
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
							<span style="width:7px"/>.
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
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDue"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/ApplyOverpaymentToNextReturn"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/ApplyOverpaymentToNextReturn"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
								<span style="width:2px;"/>
								<b>Applied to your next return, or </b>
							</label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/RefundOverpayment"/>
									<xsl:with-param name="BackupName">IRS720ApplyOverpaymentToNextReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/RefundOverpayment"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Overpayment/OverpaymentAmt"/>
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
						<th scope="col" colspan="2" rowspan="3" style="height: 13mm; width:17.5mm;font-size: 8pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">
						  Third Party Designee
					  </th>
						<th scope="col" colspan="3" style="width: 116.5mm; padding-left:3mm;padding-bottom:1mm; text-align:left; font-size:6pt">
							Do you want to allow another person to discuss this return with the IRS (see instructions)?     
					  </th>
						<th scope="col" align="right" colspan="3" style="text-align:right; padding-left:8mm;padding-bottom:1mm; width:53mm">
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
									<b>No.</b>
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
							<xsl:call-template name="PopulatePin">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
				<tr>
					<th scope="col" rowspan="3" style="height: 13mm; width:15.5mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:0 solid black; text-align:left;padding-top:9mm" >
					  Sign Here
					  </th>
					<th scope="col" colspan="5" style="padding-left:3mm;padding-bottom:1mm;" >Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
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
							<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
						</xsl:call-template>
						<br/>
        Type or print name below signature    
      </td>
					<td colspan="3" style="width:60mm;border-bottom: 1px solid black;vertical-align:bottom;padding-left:1mm;">
        Telephone number 
        <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"/>
						</xsl:call-template>
					</td>
					<!--
      <span>Type or print name below signature.</span> 
      <br/> 
        <div style="width:105mm;float:left;clear:none"> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode" >BusinessNameLine1</xsl:with-param>
          </xsl:call-template>
          <br/> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
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
            <th scope="col" rowspan="3" style="width:20mm;text-align:left;vertical-align:center;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
              Paid<br/> 
              Preparer<br/> 
              Use Only
            </th>
            <th scope="col" style="width:167mm;">
              <table cellspacing="0" cellpadding="0" style="width:167mm;font-size:6pt;">
                <tbody>
                  <tr>
                    <th scope="col" style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                      <span>Print/Type preparer's name</span><br/>
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateReturnHeaderPreparer">
                          <xsl:with-param name="TargetNode">Name</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </th>
                  <th scope="col" style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                    <span>Preparer's signature</span><br/>
                    <span style="font-weight:normal;">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
                        <xsl:with-param name="TargetNode">Name</xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </th>
                  <th scope="col" style="width:21.25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                    Date <br/>
                    <span style="font-weight:normal;">
						<xsl:call-template name="PopulateReturnHeaderPreparer">
						  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
						</xsl:call-template>
                    </span>
                  </th>
                  <th scope="col" style="width:20.75mm;font-weight:normal;text-align:center;vertical-align:center;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
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
                  <th scope="col" style="width:25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
                    PTIN<br/>
                    <span style="font-weight:normal;">
						<xsl:if test="$RtnHdrData/Preparer/SSN">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateReturnHeaderPreparer">
						  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
						</xsl:call-template>
                    </span>
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
                    <th scope="col" style="border-bottom:1px solid black;width:22mm;font-weight:normal;vertical-align:bottom;">
                      Firm's name
                      <span style="width:2mm;"/>
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;">
						<div style="font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;width:45mm;font-weight:normal;">
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
                    <th scope="col" style="border-bottom:1px solid black;width:22mm;font-weight:normal;vertical-align:bottom;" >
                      Firm's address
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;" >
						<div style="border-top:0 solid black;font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">Country</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;font-weight:normal;width:45mm;" >
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
		</div>
		
		<table cellspacing="0" cellpadding="0" style="font-size:7pt;" border="0">
			<thead class="styTableHead">
				<!-- Begin Page 2 Footer -->
				<tr>
					<td colspan="8" style="width:187mm;float:left;clear:none;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2013)
      </div>
						<div class="pageEnd"/>
					</td>
				</tr>
				<!-- End Page 2 Footer -->
			</thead>
		</table>
				<!-- End page 3 Header -->
		<table cellspacing="0" cellpadding="0" style="height:auto;width:187mm;font-size:7pt;" border="0">
			<thead class="styTableHead">
				<!-- Begin page 3 Header -->
				<tr>
					<td colspan="8" class="styBB" style="width:187mm; border-bottom: 1px solid black">
						<div style="float: left; clear: none">Form 720 (Rev. 1-2013)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</td>
				</tr>
				<tr>
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
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<span class="styPartName" style="width:25mm; text-align:left; padding-left:3mm">Schedule A</span>
						<span class="styPartDesc" style="width:162mm; text-align:left">
        Excise Tax Liability <span class="styNormalText">(see instructions)</span>
						</span>
					</th>
				</tr>
				<tr>
					<td class="styBB" colspan="8" style="height:10mm;width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<span class="styPartDesc" style="width:187mm;">
        Note.   <span class="styNormalText" style="display:inline;">
								<i>You must complete Schedule A if you have a liability for any tax in Part I of Form 720.  Do not complete Schedule A for Part II taxes or for a one-time filing of the gas guzzler tax.</i>
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
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:12mm; text-align:center; font-weight:normal" >
						<b>1</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:135mm; font-weight:normal;padding-left:5px;text-align:left;" >               Regular method taxes
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegFirstMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>B</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegFirstMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSecondMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>D</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSecondMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegThirdMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>F</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegThirdMonth/MonthSecondHalf"/>
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
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>G</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSpecialSeptember"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegNetLiability"/>
						</xsl:call-template>
					</td>
				</tr>
				<!--  End Regular method taxes -->
				<!--  Begin Alternative method taxes -->
				<tr>
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:12mm; text-align:center; font-weight:normal" >
						<b>2</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:135mm; font-weight:normal;padding-left:5px;text-align:left;" >               Alternative method taxes (IRS Nos. 22, 26, 28, and 27)
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltFirstMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>N</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltFirstMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSecondMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>P</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSecondMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltThirdMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>R</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltThirdMonth/MonthSecondHalf"/>
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
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>S</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSpecialSeptember"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/NetLiabilityAltMethodTaxes"/>
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
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
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
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons received in a two-party exchange within a terminal, included<br/> on IRS No. 60(a) on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalDieselReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalDieselDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 35(a),<br/> 69, 77, or 111 on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalKeroseneReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalKeroseneDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 62(a) on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalGasReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalGasDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons received in a two-party exchange within a terminal,<br/> included on IRS No. 14 on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalAviationGasReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalAviationGasDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Fuel Section -->
				<!-- Begin Page 3 Footer -->
				<tr>
					<td colspan="8" style="width:187mm;float:left;clear:none;border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 1-2013)
      </div>
					</td>
				</tr>
				<!-- End Page 3 Footer -->
			</tbody>
		</table>
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>4</b>
			</div>
    Form 720 (Rev. 1-2013)
  </div>
		<!-- End Header -->
		<!-- Begin Schedule C Title -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0">
				<tbody>
					<tr>
						<th scope="col" class="styPartName" style="width:22mm;font-size:9pt;float:none;text-align:left;padding-left:0.5mm">Schedule C</th>
						<th scope="col" class="styPartDesc" style="width:74mm;padding-left:8mm;font-size:9pt;text-align:left;float:none">Claims</th>
						<th scope="col" style="width:91mm;font-size:8pt;text-align:left;float:none;font-weight:normal">Month your income tax year ends
          <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							<span style="width:1mm"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TaxYearEndMonth"/>
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
			<div style="font-size:8pt;float:left;padding-left:3mm">Attach a statement explaining each claim as required. Include your
    name and EIN on the statement (see instructions).</div>
			<br/>
			<div style="width:187mm;clear:left;padding-bottom:1mm;padding-left:5mm;font-size:8pt;text-align:justify;padding-top:1mm">
				<b>Caution. </b>
				<i>Claimant has the name and address of the person(s) who sold the fuel to the claimant, the dates of purchase, and if
				    exported, the required proof of export. For claims on lines 1a and 2b (type of use 13 and 14), 3c, 4b, and 5, claimant has not
				    waived the right to make the claim.  For alternative fuel mixtures produced after December 31, 2011, the alternative fuel mixture credit can be taken as a credit 
					only on Schedule C (Form 720) against your taxable fuel liability (gasoline, diesel fuel, and kerosene) reported on this form, 
					and any excess is not allowed.  The credit cannot be claimed on any other form, including Form 4136, Credit for Federal Tax Paid on Fuels and Schedule 3 
					(Form 8849), Certain Fuel Mixtures and the Alternative Fuel Credit.</i>
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
              <span style="width:7mm;"/><span style="font-size:7pt;">Note. <span style="font-weight:normal;">CRN is credit reference number.</span></span>
            </th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" >Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/PrdClaimTo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 1 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/PrdClaimTo"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Other nontaxable use (see <b>Caution</b> above line 1)</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/PrdClaimTo"/>
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
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/DyedDiesel"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the diesel fuel did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/DyedDiesel"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/PrdClaimTo"/>
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
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed explanation<br/>
          and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .................................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the kerosene did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
					<!--<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedKeroseneDyedKeroseneException</xsl:with-param>-->
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedKeroseneDyedKeroseneException</xsl:with-param>
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
								<b>Caution. </b>
								<i>Claims cannot be made on line 4 for kerosene sales from a blocked pump.</i>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.044
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.219
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm" >
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/PrdClaimTo"/>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top" rowspan="2" >
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">Kerosene used in commercial aviation (other than foreign trade)
taxed at $.219</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell">Nontaxable use (other than use by state or local government) taxed at $.244</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Nontaxable use (other than use by state or local government)
taxed at $.219</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--  <td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/TypeOfUse"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/CRN"/>
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
		<!-- End Line 5 Table -->
		<!-- End Line 5 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2013)
  </div>
		<!-- End Footer -->
		<!-- ========================================================================= -->
		<!-- END PAGE 4  -->
		<!-- ========================================================================= -->
		<div class="pageEnd"/>
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 5  -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>5</b>
			</div>
        Form 720 (Rev. 1-2013)
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
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:179mm" >Caution. <span style="font-weight:normal">
								<i>There is a reduced credit rate 
              for use in certain intercity and local buses (type of use 5) (see instructions).</i>
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
							<br/>Liquefied petroleum gas (LPG)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px" >Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px" >Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px;font-size:7pt" >Gallons or gasoline gallon equivalents (GGE)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px" >CRN</th>
					</tr>
					<tr>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">"P Series" fuels</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt">Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Liquefied hydrogen</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">f</td>
						<td class="styIRS720NameTableCell">Liquid fuel derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:1px">Liquefied natural gas (LNG)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther">
								<td class="styIRS720TableCellText" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:1px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther/Rate"/>
									</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:1px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width10px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:0px">Liquefied gas derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther">
								<td class="styIRS720TableCellText" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/CRN"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/PrdClaimFrom"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/PrdClaimTo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/RegNbr"/>
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
          written consent of the buyer to make the claim. Claimant certifies that the diesel fuel did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="sold the diesel fuel at a tax-excluded price">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedDieselFuelException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 7 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/CRN"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/PrdClaimFrom"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/PrdClaimTo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/RegNbr"/>
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
          the written consent of the buyer to make the claim. Claimant certifies that the kerosene did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> .............................. </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Undyed Kerosene">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedKeroseneException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Sales from a blocked pump</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Amount"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/RegNbr"/>
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
          Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Rate"/>
							</xsl:call-template><span style="width:2mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/CRN"/>
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
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/CRN"/>
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
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.244
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText">
							.244
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--  <td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
            </xsl:call-template>
          </td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;border-bottom-width:0;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.219
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" >
							.219
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--<td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
            </xsl:call-template>
          </td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--<td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/TypeOfUse"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/RegNbr"/>
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
          Claimant sold the gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 10 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use by a state or local government
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 10 Table -->
		<!-- End Line 10 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2013)
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
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>6</b>
			</div>
    Form 720 (Rev. 1-2013)
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/RegNbr"/>
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
          Claimant sold the aviation gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-bottom-width:0px;padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 11 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left;border-bottom:0px">Use by a state or local government
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Amount"/>
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
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">12</th>
						<th scope="col" style="width:81mm;text-align:left;font-size:8pt">Reserved</th>
						<th scope="col" style="width:24mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/PrdClaimTo"/>
							</xsl:call-template>
						</th>
						<th scope="col" style="width:32mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:24mm;text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/RegNbr"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 12 Title -->
		<!-- Begin Line 12 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:6mm"/>
          Reserved 
          
        </div>
		<!-- End Line 12 Explanation -->
		<!-- Begin Line 12 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt;border-bottom-width:0px">
				<tbody>
					<!-- Line 12 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2">Reserved</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm">Gal. of Alcohol</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<!-- Line 12 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Reserved</td>
						<td class="styIRS720TableCellTextRate">
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1mm;"/>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<span style="width:1mm;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 12 Table -->
		<!-- End Line 12 -->
		<!-- Begin Line 13 -->
		<!-- Begin Line 13 Title -->
			<div class="styBB" style="width:187mm">
				<table cellspacing="0" style="font-size:7pt">
					<tbody>
						<tr>
							<th scope="col" style="width:8mm;text-align:center;vertical-align:top;font-size:8pt;padding-top:1mm;">13</th>
							<th scope="col" colspan="3" style="width:99mm;text-align:left;vertical-align:top;font-size:8pt;padding-top:1mm;">Biodiesel or Renewable Diesel Mixture Credit</th>
							<th scope="col" style="width:24mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:13mm;text-align:left;font-weight:normal;font-size:6pt;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/PrdClaimFrom"/>
								</xsl:call-template>
							</th>
							<th scope="col" style="width:13mm;text-align:left;font-weight:normal;font-size:6pt;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/PrdClaimTo"/>
								</xsl:call-template>
							</th>
							<th scope="col" style="width:32mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:14mm;text-align:left;padding-bottom:0.5mm;font-weight:normal;font-size:6pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RegNbr"/>
								</xsl:call-template>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- End Line 13 Title -->
		<!-- Begin Line 13 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:30mm;font-size:6pt"/>
			<b>Biodiesel mixtures</b>. Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to produce the mixture met <br/>
	  ASTM D6751 and met EPA’s registration requirements for fuels and fuel additives. The mixture was sold by the claimant to any person<br/>
	   for use as a fuel or was used as a fuel by the claimant. Claimant has attached the Certificate for Biodiesel and, if applicable, the <br/>
	  Statement of Biodiesel Reseller. <b>Renewable diesel mixtures.</b> Claimant produced a mixture by mixing renewable diesel with liquid fuel <br/>
	   (other than renewable diesel). The renewable diesel used to produce the renewable diesel mixture was derived from biomass, met <br/>
	  EPA’s registration requirements for fuels and fuel additives, and met ASTM D975 or D396, or other equivalent standard approved<br/>
		  by the IRS. The mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant has<br/>
	  attached the Certificate for Biodiesel and, if applicable, the Statement of Biodiesel Reseller, both of which have been edited as <br/>
	  discussed in the Instructions for line 13. See the
instructions for line 13 for information about renewable diesel used in aviation.
	  
	  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix"/>
			</xsl:call-template>
		</div>
		<!-- End Line 13 Explanation -->
		<!-- Begin Line 13 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt;border-bottom-width:0px">
				<tbody>
					<!-- Line 13 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">a</th>
				  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;border-top-width:1px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
				  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gal. of biodiesel or renewable diesel</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom">
			  Biodisel (other than agri-biodiesel) mixtures
			</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 13 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;border-bottom-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Agri-biodiesel mixtures</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 13 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Renewable diesel mixtures</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 13 Table -->
		<!-- End Line 13 -->

		<!-- Begin Line 14 -->
		<!-- Begin Line 14 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">14</th>
						<th scope="col" style="width:106mm;text-align:left;font-size:8pt">Alternative Fuel Credit and Alternative Fuel Mixture Credit</th>
						<th scope="col" style="text-align:right;padding-right:1mm;font-weight:normal">Registration Number
			  <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/RegNbr"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 14 Title -->
		<!-- Begin Line 14 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:18mm;font-size:6pt;"/>
	 For the alternative fuel mixture credit, claimant produced a mixture by mixing taxable fuel with alternative fuel. Claimant certifies that it (a)
produced the alternative fuel, or (b) has in its possession the name, address, and EIN of the person(s) that sold the alternative fuel to the
claimant; the date of purchase; and an invoice or other documentation identifying the amount of the alternative fuel. The claimant also
certifies that it made no other claim for the amount of the alternative fuel, or has repaid the amount to the government. The alternative fuel
mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant.		</div>
		<!-- End Line 14 Explanation -->
		<!-- Begin Line 14 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 14 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>a</th>
				  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gallons or<br/>gasoline gallon<br/>equivalents (GGE)<br/>
							<span style="font-weight:normal; font-size:6pt">(see instructions)</span>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom">
							Liquefied petroleum gas (LPG)
			</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">"P Series" fuels</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell">Compressed natural gas (CNG) (GGE = 121 cu. ft.)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Liquefied hydrogen</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
						<td class="styIRS720NameTableCell">Fischer-Tropsch process liquid fuel from coal (including peat)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">f</td>
						<td class="styIRS720NameTableCell">Liquid fuel derived from biomass</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell">Liquefied natural gas (LNG)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell">Liquefied gas derived from biomass</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (i) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
						<td class="styIRS720NameTableCell">Compressed gas derived from biomass<br/>(GGE = 121 cu.ft.)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 14 Table -->
		<!-- End Line 14 -->
		<!-- Begin Line 15 -->
		<!-- Begin Line 15 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt;border-top:0px;border-bottom:0px;border-left:0px;border-right:0px;border-color:black;border-style:solid;">15</th>
						<th scope="col" style="width:179mm;text-align:left;font-size:8pt;border-top:0px;border-bottom:0px;border-left:0px;border-right:0px;border-color:black;border-style:solid;">Other Claims. <span style="font-weight:normal">See the instructions.</span>
						</th>
					</tr>
					<!-- Line 15 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:1px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom"  rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:134mm;border-top-width:1px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" colspan="2">
							<br/>Section 4051(d) tire credit (tax on vehicle reported on IRS No. 33)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:1px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px;border-top-width:1px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;padding-right:2px">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/Section4051d/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/Section4051d/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed kerosene 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (d) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion)">
						<!--In case there is nothing for the for-each loop to grab-->
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>
          Diesel-water fuel emulsion
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>
          Diesel-water fuel emulsion 
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 15 (e) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>          
          Registered credit card issuers
            <!--
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers"/>
              </xsl:call-template>
              -->
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>          
          Registered credit card issuers
            <!--
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers"/>
              </xsl:call-template>
              -->
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- begin new Line 15f -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>f</td>
						<td class="styIRS720NameTableCell" style="width:134mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" >
							<br/>Taxable tires other than bias ply or super single tires
 <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 15f -->
					<!-- begin new line 15g -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="font-size:7pt" >Taxable tires, bias ply or super single tires (other than super single tires designed for steering) 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 15g -->

					<!-- begin new Line 15h -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:7mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="width:115.5mm;" >Taxable tires, super single tires designed for steering 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:23mm;text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="width:33mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:8.5mm;border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End new line 15h -->
					<!-- Line 15 (i) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 15 (j) -->
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
					<!-- Line 15 (k) -->
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
					<!-- Line 15 (i) -->
					<!--<tr>
          <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
          <td class="styIRS720NameTableCell"><span style="width:1px" /></td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt"><span style="width:1px" /></td>
          <td class="styIRS720TableCellText" style="border-right-width:0px"><span style="width:1px" /></td>
        </tr>-->
				</tbody>
			</table>
		</div>
		<!-- End Line 15 Table -->
		<!-- End Line 15 -->
		<!-- Begin Line 16 -->
		<div style="width:187mm;border-top-width:0px;">
			<table cellspacing="0" class="styBB" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineNumber" style="width:8mm">16</th>
						<th scope="col" class="styIRS720RightBorder" style="width:132.7mm;font-size:6pt;font-weight:normal;text-align:left;padding-left:1mm">
							<b>Total claims. </b>Add amounts on lines 1 through 15. Enter the result here and on Form 720, Part III, line 4.</th>
						<th scope="col" class="styIRS720RightBorder" style="width:6mm;font-weight:bold;text-align:center;font-size:8pt;padding-top:0.5mm">16</th>
						<th scope="col" class="styIRS720RightBorder" style="width:32.35mm;border-bottom-width:0px;text-align:right;font-weight:normal">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TotalClaims"/>
							</xsl:call-template>
						</th>
						<th scope="col" style="width:8.75mm;background-color:lightgrey">
							<span style="width:1px"/>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 16 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 1-2013)
  </div>
		<!-- End Footer -->
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 -->
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

<xsl:for-each select="$FormData/SpecialConditionDescription">

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
        <!-- end for versions for 2013 Q1 -->
      </xsl:when>
      <xsl:otherwise>
        <!-- beginning for versions for 2013 Q2, 2013 Q3, 2013 Q4 -->
		<xsl:call-template name="DocumentHeader"/>
		<!--Title of Form -->
		<div class="styBB" style="width:187mm;height: 21.5mm">
			<div class="styFNBox" style="height: 21.5mm; width:31mm;font-size: 7pt">
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
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">(Rev. April 2013) </span>
				<br/>
				<span class="styAgency" style="font-size: 7.5pt; font-weight:bold">Department of the Treasury</span>
				<br/>
              <span class="styAgency" style="font-size: 7.5pt;font-weight:bold">Internal Revenue Service</span>
			</div>
			<div class="styFTBox" style="width:125mm; height: 21.5mm;">
				<div class="styMainTitle" style="height:10mm; font-weight: bold; padding-top: 4mm">Quarterly Federal Excise Tax Return</div>
				<div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold; padding-top: 2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> See the Instructions for Form 720.
				</div>
				<div class="styFST" style="font-size:7pt;;font-weight:bold; padding-top: 0.2mm;">
					<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/> Information about Form 720 and its instructions is at www.irs.gov/form720.
				</div>
			</div>
			<div class="styTYBox" style="width:31mm; height: 21.5mm">
				<div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0023</div>
			</div>
		</div>
		<!--  End title of Form  -->
		<div style="height:34mm;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
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
												<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											</xsl:call-template>
											<br/>
										</th>
										<th scope="col"  valign="top" style="height:16mm;width:46mm;text-align:left;font-weight:normal">Quarter ending <br/>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEnding"/>
											</xsl:call-template>
										</th>
									</tr>
									<tr>
										<td valign="top" style="height:10mm;width:78mm;">Number, street, and room or suite no. 
										    <br/>(If you have a P.O. box, see the instructions.)<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											</xsl:call-template>
										</td>
										<td valign="top" style="height:10mm;width:46mm;font-weight:bold;">Employer identification number <br/>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td valign="top" colspan="2" style="height:8mm;width:124mm;">
											  City, state, and ZIP code. (If you have a foreign address, see the instructions.)<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="MainForm">true</xsl:with-param>
											</xsl:call-template>
										</td>
									</tr>
								</thead>
							</table>
						</th>
						<!-- Begin IRS USE ONLY Colum -->
						<th scope="col"  valign="top" style="padding-top:0px">
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
		</div>
		<!-- End Name / Employer identification number / Address -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">

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
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>IRS No.</b>
						</th>
						<th scope="col" colspan="5" style="height:4mm;width:130mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-left:5px;text-align:left;" >
							<span style="font-size:8pt">
								<b>Environmental Taxes</b> (attach Form 6627)
                      
								<!-- Form to Form Link (Push Pin)-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/EnvironmentalTaxes"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>IRS No.</b>
						</th>
						<!-- End Part I Section Header -->
					</tr>
				</thead>
				<tfoot/>
				<tbody style="font-size:7pt;">
					<!-- Begin Part I, Environmental Tax, line 18 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Domestic petroleum oil spill tax
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;">
							<span style="float:left;">
								<xsl:if test="position()=1">$</xsl:if>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo18/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 18 -->
					<!-- Begin Part I, Environmental Tax, line 21 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Imported petroleum products oil spill tax
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo21/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 21 -->
					<!-- Begin Part I, Environmental Tax, line 98 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Ozone-depleting chemicals (ODCs)
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo98/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 98 -->
					<!-- Begin Part I, Environmental Tax, line 19 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">ODC tax on imported products
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo19/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Environmental Tax, line 19 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes title -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="5" style="height:4mm;width:130mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:left; font-weight:normal;padding-left:5px;" >
							<span style="font-size:8pt">
								<b>Communications and Air Transportation Taxes</b> (see instructions)</span>
						</th>
						<th scope="col" align="center" style="height:4mm;width:34mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;border-color: black; border-style: solid; border-top-width: 2px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal" >
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes title -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 22 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Local telephone service and teletypewriter exchange service
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo22/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 22 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 26 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of persons by air
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo26/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 26 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 28 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation of property by air
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo28/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 28 -->
					<!-- Begin Part I, Communications & Air Transportation Taxes,  line 27 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Use of international air travel facilities
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;height:3mm; padding-right:1mm">
							<span style="float:left;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo27/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Communications & Air Transportation Taxes,  line 27 -->
					<!-- Begin Part I, Fuel Taxes title  -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Fuel Taxes</b>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal; font-size:6pt" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Fuel Taxes title  -->
					<!-- Begin Part I, Fuel Taxes, line 60 (a)-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a) <span style="width:2px;"/>Diesel, tax on removal at terminal rack
					    </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:4mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px;"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; background:lightgrey;">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 60 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 60 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
							Diesel, tax on taxable events other than removal at terminal rack
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Lg.gif" alt="Bracket" style="height:10mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRSNo"/>
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
							Diesel, tax on sale or removal of biodiesel mixture (not at terminal rack)
					    </td>
						<td style="height:6.5mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:norma; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60c/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo60/IRS60c/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px;"/>
						</td>
						<td style="height:6.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Diesel-water emulsion
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo104/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 104-->
					<!-- Begin Part I, Fuel Taxes, line 71-->
					<!-- Delete IRS71 <tr>
      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSNo"/>
                </xsl:call-template>
      </td>
      <td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel fuel used in trains
              </td>
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >    
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSGal"/>
                </xsl:call-template>
      </td>             
      <td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >  
        <span style="float:left;"></span>
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSRate"/>
                </xsl:call-template>
      </td>   
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
        <span style="width:1px"></span>
              </td>       
            <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
        <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSTax"/>
                </xsl:call-template>
              </td>
              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
        <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo71/IRSNo"/>
                </xsl:call-template>
              </td>
    </tr> -->
					<!-- End Part I, Fuel Taxes, line 71-->
					<!-- Begin Part I, Fuel Taxes, line 105-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed diesel LUST tax
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo105/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 105-->
					<!-- Begin Part I, Fuel Taxes, line 107-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Dyed kerosene, LUST tax
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo107/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 107-->
					<!-- Begin Part I, Fuel Taxes, line 119-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax, other exempt removals (see instructions)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo119/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 119-->
					<!-- Begin Part I, Fuel Taxes, line 35 (a)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(a)<span style="width:1px;"/>Kerosene, tax on removal at terminal rack (see instructions)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:12mm;width:1mm;"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px;"></span>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px;"></span>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (a)-->
					<!-- Begin Part I, Fuel Taxes, line 35 (b)-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:10mm;"/>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b)<span style="width:1px;"/>Kerosene, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; padding-top:3mm;border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRS35b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1mm;"></span>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right;padding-top:3mm; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; padding-top:3mm;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo35/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 35 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 69-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation (see instructions)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo69/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 69-->
					<!-- Begin Part I, Fuel Taxes, line 77-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in commercial aviation (other than foreign trade) 
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo77/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 77-->
					<!-- Begin Part I, Fuel Taxes, line 111-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Kerosene for use in aviation, LUST tax on nontaxable uses              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo111/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 111-->
					<!-- Begin Part I, Fuel Taxes, line 79-->
					<tr>
						<td style="height:3.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3.5mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Other fuels (see instructions)

        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRS79Gal"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRS79Rate"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo79/IRSNo"/>
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
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62a/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket" style="height:9mm;width:1mm;"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;background:lightgrey;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">(b) <span style="width:2px;"/>
        Gasoline, tax on taxable events other than removal at terminal rack
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62b/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRS62b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1mm"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo62/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 62 (b)-->
					<!-- Begin Part I, Fuel Taxes, line 13 -->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Any liquid fuel used in a fractional ownership program aircraft
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo13/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 13 -->
					<!-- Begin Part I, Fuel Taxes, line 14-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Aviation gasoline
					    </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo14/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 14-->
					<!-- Begin Part I, Fuel Taxes, line 112-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied petroleum gas (LPG)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo112/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 112-->
					<!-- Begin Part I, Fuel Taxes, line 118-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">"P Series" fuels
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo118/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 118-->
					<!-- Begin Part I, Fuel Taxes, line 120-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Compressed natural gas (CNG) (GGE = 126.67 cu.ft.)
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm;padding-top:3mm;" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo120/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 120-->
					<!-- Begin Part I, Fuel Taxes, line 121-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied hydrogen
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo121/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 121-->
					<!-- Begin Part I, Fuel Taxes, line 122-->
					<tr>
						<td style="height:6mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><span style="font-size:7pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</span>
					    </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;padding-top:3mm; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:3mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo122/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 122-->
					<!-- Begin Part I, Fuel Taxes, line 123-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquid fuel derived from biomass
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo123/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 123-->
					<!-- Begin Part I, Fuel Taxes, line 124-->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Liquefied natural gas (LNG)
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo124/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 124-->
					<!-- Begin Part I, Retail Taxes, Line 33 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:4mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><b>Retail Tax</b> - Truck, trailer, and semitrailer chassis and bodies, and tractors
              </td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm; font-size:6pt" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo33/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Fuel Taxes, line 33-->
					
					<!-- Begin Part I, Ship Passenger Tax title -->
					<tr>
						<th scope="col" style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
								<b>Ship Passenger Tax</b>
							</span>
						</th>
						<th scope="col" style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;font-size:6pt" >
							<b>Number of persons</b>
						</th>
						<th scope="col" colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px;font-weight:normal;" >
							<b>Tax</b>
						</th>
						<th scope="col" style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part I, Ship Passenger Tax title -->
					<!-- Begin Part I, Ship Passenger Tax, line 29 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Transportation by water
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRS29NbrPersons"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSRate"/>
							</xsl:call-template>
							<span style="font-size:6pt"> per person</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo29/IRSNo"/>
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
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none; text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Obligations not in registered form
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/AmtOblig"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align:center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:3mm" >
							$
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo31/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 31 -->
					<!-- Begin Part I, Foreign Insurance Tax title -->
					<tr>
						<th scope="col" style="height:7mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="height:7mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:7pt">
								<b>Foreign Insurance Taxes</b> - <span style="font-weight:normal"> Policies issued by foreign insurers</span>
							</span>
						</th>
						<th scope="col" style="height:7mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Premiums paid</b>
						</th>
						<th scope="col" colspan="2" style="height:7mm;width:30mm;float:left;clear:none; text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:1px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col" style="height:7mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="height:7mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30a/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:11mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:6mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:10px; font-size:6pt">Life insurance, sickness and accident policies, and annuity contracts
              </td>
						<td style="height:6mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30b/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm;  text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<span style="width:1px"/>
						</td>
						<td style="height:6mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30c/PremiumsPaid"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:26mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo30/IRS30c/IRSRate"/>
							</xsl:call-template>
						</td>
						<td rowspan="3" style="height:3mm;width:4mm;float:left;clear:none;padding-left:1mm; padding-top:0mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
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
					<!-- Begin Page 1 Footer -->
					<tr>
						<td colspan="8" style="width:187mm; float:left;clear:none; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
							<div style="float:left;">
								<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
								<span style="width:6mm;"/>                        
        Cat. No. 10175Y
      </div>
							<div style="float:right;">
								<span style="width:20px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 4-2013)
      </div>
							<div class="pageEnd"/>
						</td>
					</tr>
					<br/>
					<br/>
					<!-- End Page 1 Footer -->
					<!-- Begin page 2 Header -->
					<tr>
						<td colspan="8" class="styBB" style="width:187mm">
							<div style="float: left; clear: none">Form 720 (Rev. 4-2013)</div>
							<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">2</span>
							</div>
						</td>
					</tr>
					<!-- End page 2 Header -->
					<!-- Begin Part I, Manufacturers Tax title -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</td>
						<td style="height:4mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt">
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
							<b>Rate</b>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax title -->
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Coal&#8212;Underground mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/Tons"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSRate"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo36/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 36 -->
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSRate"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo37/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 37 -->
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:36mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Coal&#8212;Surface mined
              </td>
						<td style="height:3mm;width:24mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/Tons"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; background:lightgrey" >
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSRate"/>
							</xsl:call-template>
                per ton
      </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo38/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 38 -->
					<!-- Begin Part I, Manufacturers Tax, line 39 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="float:left;"/>
							<span style="font-size:6pt;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSRate"/>
								</xsl:call-template>
                of sales price</span>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo39/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires other than biasply or super single tires
              </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRS108NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo108/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 108 -->
					<!-- Begin Part I, Manufacturers Tax, line 109 -->
					<tr>
						<td style="height:6.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:6.5mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable biasply or super single tires (other than super single tires designed for steering)
              </td>
						<td colspan="2" style="height:6.5mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRS109NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:6.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo109/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--End Part I, Manufacturers Tax, line 109 -->
					<!-- Begin Part I, Manufacturers Tax, line 113 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="height:3mm;width:100mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable tires, super single tires designed for steering
              </td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRS113NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo113/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Manufacturers Tax, line 113 -->
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<tr>
						<td style="height:4.5mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:4.5mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-left:5px;">Gas guzzler tax.  Attach Form 6197.  
      
        <!--Need to add a pushpin here for MultiRateSchedule -->
							<!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40"/>
							</xsl:call-template>

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
                      </span>
							<span style="width:2px"/>
							<input type="checkbox" class="styCkbox" title="Check if one-time filing">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRS40OTFCB"/>
									<xsl:with-param name="BackupName">IRS720TFCB</xsl:with-param>
								</xsl:call-template>
							</input>
							
						</td>
						<td style="height:4.5mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:1mm; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:4.5mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo40/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 40 -->
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="height:3mm;width:130mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Vaccines (see instructions)
              </td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo97/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Begin Part I, Manufacturers Tax, line 97 -->
					<!-- Begin Part I, Other Excise Tax, line 136 -->
					<tr>
						<td style="height:4mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td colspan="2" style="height:4mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:40mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="font-size:5pt; font-weight:bold">Sales price </span>
						</td>
						<td colspan="2" style="height:4mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 2px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width:2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</td>
					</tr>
					<tr>
						<td style="height:3mm;width:11mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:60mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Taxable medical devices
              </td>
						<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/SalesPrice"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="height:3mm;width:30mm;float:left;clear:none;text-align: center; vertical-align:bottom; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSRate"/>
							</xsl:call-template> 
							of sales price
						</td>
						<td style="height:3mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="height:3mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartIIRSNo136/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part I, Other Excise Tax, line 136 -->
					<!-- End Part I, Manufacturers Tax -->
					<!-- Begin Part I,  Total -->
					<tr>
						<td colspan="6" style="height:4mm;width:141mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:3mm">
								<b>1  Total.</b>  Add all amounts in Part I.  Complete Schedule A unless one-time filing. </span>
							<span style="width:36mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="height:4mm;width:34mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm;font-size:6pt">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartI/PartITotal"/>
							</xsl:call-template>
						</td>
						<td style="height:4mm;width:12mm;float:left;clear:none;text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part I,  Total -->
				</tbody>
			</table>
			<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
				<tbody>
					<!-- Begin Part II Line-->
					<tr>
						<td colspan="8">
							<div class="styPartName" style="width:12mm; height:4mm;">Part II </div>
						</td>
					</tr>
					<!-- End Part II Line-->
					<!-- Begin Part II,  Table title  -->
					<tr>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>IRS No.</b>
						</th>
						<th style="width:66mm;text-align:left;font-weight:normal; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							<b>Patient Centered Outcomes Research Fee</b><br/> (see instructions)
						</th>
						<th style="width:22mm;height:font-size:8;text-align:center;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>(a) Avg. number of lives covered</b>
						</th>
						<th style="width:22mm;font-size:8;text-align:center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>(b) Rate for avg. covered life</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<b>Col. (a) x Col. (b)</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<b>IRS No.</b>
						</th>
					</tr>
					<!-- End Part II,  Table title  -->
					<!-- Begin Part II, line 133 -->
					<tr style="height:4.5mm;">
						<td rowspan="2" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSNo"/>
							</xsl:call-template>
						</td>
						<td style="width:65mm;height:4.5mm;text-align:left;vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px; ">
							Specified health insurance policies
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/AvgNumLvesCoverd"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="height:4.5mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133a/SubTax"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; vertical-align:center;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<img src="{$ImagePath}/720_Bracket_Sm.gif" alt="Bracket"/>
						</td>
						<td style="height:4.5mm;text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
							<span style="width:1mm;"/>
						</td>
						<td rowspan="2" style="height:9mm;text-align: center; vertical-align:center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr style="height:4.5mm;">
						<td style="width:65mm;height:4.5mm;text-align:left;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;padding-top:0px;padding-bottom:0px; ">
							Applicable self-insured health plans
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-top:0px;padding-bottom:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/AvgNumLvesCoverd"/>
							</xsl:call-template>
						</td>
						<td style="width:22mm;height:4.5mm;font-size:8;text-align:center;vertical-align:bottom;padding-top:0px;padding-bottom:0px;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; ">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; padding-left:5px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRS133b/SubTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; vertical-align:bottom;border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo133/IRSTax"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 133 -->
					<!-- Begin Part II, line 41 -->
					<tr>
						<td rowspan="2" style="text-align: center; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSNo"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" colspan="3" style="text-align: left; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Sport fishing equipment (other than fishing rods and fishing poles)
					    </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<b>Rate</b>
					    </td>
						<td rowspan="2" style="text-align: right; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSTax"/>
							</xsl:call-template>
						</td>
						<td rowspan="2" style="text-align: center; vertical-align:bottom; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo41/IRSRate"/>
							</xsl:call-template> of sales price
					    </td>
					</tr>
					<!-- End Part II, line 41 -->
					<!-- Begin Part II, line 110 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing rods and fishing poles (limits apply, see instructions)
              </td>
						<td colspan="2" style=" text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo110/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 110 -->
					<!-- Begin Part II, line 42 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Electric outboard motors
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo42/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 42 -->
					<!-- Begin Part II, line 114 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Fishing tackle boxes
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left; width:3px"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo114/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 114 -->
					<!-- Begin Part II, line 44 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Bows, quivers, broadheads, and points
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;"/>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSRate"/>
							</xsl:call-template> of sales price
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo44/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 44 -->
					<!-- Begin Part II, line 106 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Arrow shafts
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSRate"/>
							</xsl:call-template> per shaft
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo106/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 106 -->
					<!-- Begin Part II, line 140 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="3" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Indoor tanning services
              </td>
						<td colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; font-size:6pt" >
							
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSRate"/>
							</xsl:call-template> of amount paid
      </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo140/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 140 -->
					<!-- Begin Part II, line blank -->
					<tr>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<span style="width:1px"/>
						</th>
						<th scope="col" colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">
							<span style="font-size:8pt; width:1px"/>
						</th>
						<th scope="col" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Number of gallons</b>
						</th>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
							<b>Rate</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<b>Tax</b>
						</th>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="width:1px"/>
						</th>
					</tr>
					<!-- End Part II, line blank -->
					<!-- Begin Part II, line 64 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Inland waterways fuel use tax
              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:20mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo64/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 64 -->
					<!-- Begin Part II, line 125 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">LUST tax on inland waterways fuel use (see instructions)              </td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSGal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:20mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSRate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo125/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 125 -->
					<!-- Begin Part II, line 51 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Alcohol and cellulosic biofuel sold as but not used as fuel           <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRS51Gal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRS51Rate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo51/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, line 51 -->
					<!-- Begin Part II, line 117 -->
					<tr>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="2" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;">Biodiesel sold as but not used as fuel          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRS117Gal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; font-weight:normal; padding-right:1mm" >
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRS117Rate"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal;" >
							<span style="width:1px"/>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo117/IRSNo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSNo"/>
							</xsl:call-template>
						</td>
						<td colspan="5" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"><b>Floor Stocks Tax</b>- Ozone-depleting chemicals (floor stocks). Attach Form 6627.
          <!-- Form to Form Link (Push Pin)-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20"/>
							</xsl:call-template>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSTax"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIIIRSNo20/IRSNo"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End Part II, Floor Stocks Tax, line 20 -->
					<!-- Begin Part II,  Total -->
					<tr>
						<td colspan="6" style="text-align: left; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<span style="padding-left:4mm">
								<b>2  Total.</b>  Add all amounts in Part II. </span>
							<span style="width:112mm; text-align:right">
								<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
							</span>
						</td>
						<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartII/PartIITotal"/>
							</xsl:call-template>
						</td>
						<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 2px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; background:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
					<!-- End Part II,  Total -->

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
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;"/>
						<th scope="col" colspan="3" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5px;"/>
						<th scope="col" colspan="2" style="text-align: center; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" />
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;"/>
						<th scope="col" style="text-align: center; border-style: solid; border-color: black; border-top-width:0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;"/>
					</tr>
					<!-- End Part III,  Table title  -->
				</tbody>
			</table>
		</div>
		<!-- Begin Part III Section Header -->
		<table cellspacing="0" cellpadding="0" style="width:187mm; font-size:7pt;" border="0">
			<thead class="styTableHead">
				<tr>
					<th scope="col" style="height:1px;width:10mm;" />
					<th scope="col" style="height:1px;width:72mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
					<th scope="col" style="height:1px;width:5mm;" />
					<th scope="col" style="height:1px;width:30mm;" />
				</tr>
			</thead>
			<tfoot/>
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
                  <span style="width:5px"/>   
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>3</b>
					</td>
					<xsl:if test="$FormData/TotalTax">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTax"/>
							</xsl:call-template>
						</td>
					</xsl:if>
					<xsl:if test="$FormData/NoTax">
						<td valign="top" style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NoTax"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Claims"/>
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
						  <span style="width:5px"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtDepositsMadeForQuarter"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/UsedSafeHarborRule"/>
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
                  <span style="width:5px"/>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:center; font-weight:normal;" >
						<b>6</b>
					</td>
					<td style="border-color: black; border-style: solid; border-top-width: 0px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; text-align:right; font-weight:normal;" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AmtPreviousOverpayment"/>
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
        Enter the amount from Form 720X <br/> included on line 6, if any
        <!--Dotted Line-->
						<span class="styBoldText">        
							<span style="width:11px"/>.            
							<span style="width:11px"/>.            
							<span style="width:11px"/>. 
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:11px"/>.     
							  <span style="width:11px"/>.    
							  <span style="width:6px"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Amt720XOverpayment"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtTotalPayments"/>
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
							<span style="width:2px"/>.            
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
							<xsl:with-param name="TargetNode" select="$FormData/AmtTotalCredits"/>
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
							<span style="width:7px"/>.
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
							<xsl:with-param name="TargetNode" select="$FormData/BalanceDue"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/ApplyOverpaymentToNextReturn"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/ApplyOverpaymentToNextReturn"/>
									<xsl:with-param name="BackupName">IRS720OverpaymentAmt</xsl:with-param>
								</xsl:call-template>
								<span style="width:2px;"/>
								<b>Applied to your next return, or </b>
							</label>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/RefundOverpayment"/>
									<xsl:with-param name="BackupName">IRS720ApplyOverpaymentToNextReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Overpayment/RefundOverpayment"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/Overpayment/OverpaymentAmt"/>
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
						<th scope="col" colspan="2" rowspan="3" style="height: 13mm; width:17.5mm;font-size: 8pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">
						  Third Party Designee
					  </th>
						<th scope="col" colspan="3" style="width: 116.5mm; padding-left:3mm;padding-bottom:1mm; text-align:left; font-size:6pt">
							Do you want to allow another person to discuss this return with the IRS (see instructions)?     
					  </th>
						<th scope="col" align="right" colspan="3" style="text-align:right; padding-left:8mm;padding-bottom:1mm; width:53mm">
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
									<b>No.</b>
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
							<xsl:call-template name="PopulatePin">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
				<tr>
					<th scope="col" rowspan="3" style="height: 13mm; width:15.5mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:0 solid black; text-align:left;padding-top:9mm" >
					  Sign Here
					  </th>
					<th scope="col" colspan="5" style="padding-left:3mm;padding-bottom:1mm;" >Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
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
							<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
						</xsl:call-template>
						<br/>
        Type or print name below signature    
      </td>
					<td colspan="3" style="width:60mm;border-bottom: 1px solid black;vertical-align:bottom;padding-left:1mm;">
        Telephone number 
        <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"/>
						</xsl:call-template>
					</td>
					<!--
      <span>Type or print name below signature.</span> 
      <br/> 
        <div style="width:105mm;float:left;clear:none"> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode" >BusinessNameLine1</xsl:with-param>
          </xsl:call-template>
          <br/> 
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
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
            <th scope="col" rowspan="3" style="width:20mm;text-align:left;vertical-align:center;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
              Paid<br/> 
              Preparer<br/> 
              Use Only
            </th>
            <th scope="col" style="width:167mm;">
              <table cellspacing="0" cellpadding="0" style="width:167mm;font-size:6pt;">
                <tbody>
                  <tr>
                    <th scope="col" style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                      <span>Print/Type preparer's name</span><br/>
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateReturnHeaderPreparer">
                          <xsl:with-param name="TargetNode">Name</xsl:with-param>
                        </xsl:call-template>
                      </span>
                    </th>
                  <th scope="col" style="width:50mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                    <span>Preparer's signature</span><br/>
                    <span style="font-weight:normal;">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
                        <xsl:with-param name="TargetNode">Name</xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </th>
                  <th scope="col" style="width:21.25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
                    Date <br/>
                    <span style="font-weight:normal;">
						<xsl:call-template name="PopulateReturnHeaderPreparer">
						  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
						</xsl:call-template>
                    </span>
                  </th>
                  <th scope="col" style="width:20.75mm;font-weight:normal;text-align:center;vertical-align:center;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:1px;">
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
                  <th scope="col" style="width:25mm;font-weight:normal;text-align:left;vertical-align:top;border-color:black;border-style:solid;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
                    PTIN<br/>
                    <span style="font-weight:normal;">
						<xsl:if test="$RtnHdrData/Preparer/SSN">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateReturnHeaderPreparer">
						  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
						</xsl:call-template>
                    </span>
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
                    <th scope="col" style="border-bottom:1px solid black;width:22mm;font-weight:normal;vertical-align:bottom;">
                      Firm's name
                      <span style="width:2mm;"/>
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;">
						<div style="font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;width:45mm;font-weight:normal;">
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
                    <th scope="col" style="border-bottom:1px solid black;width:22mm;font-weight:normal;vertical-align:bottom;" >
                      Firm's address
                      <img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
                    </th>
                    <th scope="col" style="text-align:left;vertical-align:bottom;border-bottom:1px solid black;border-right:1px solid black;width:100mm;" >
						<div style="border-top:0 solid black;font-weight:normal;">
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                            <xsl:with-param name="TargetNode">Country</xsl:with-param>
                          </xsl:call-template>
                        </div>
                    </th>
                    <th scope="col" colspan="2" style="vertical-align:bottom;border-bottom:1px solid black;padding-left:1mm;font-weight:normal;width:45mm;" >
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
		</div>
		
		<!-- Begin Schedule A Section Header -->
		<table cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;" border="0">
			<thead class="styTableHead">
				<!-- Begin Page 2 Footer -->
				<tr>
					<td colspan="8" style="width:187mm;float:left;clear:none;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 4-2013)
      </div>
						<div class="pageEnd"/>
					</td>
				</tr>
				<!-- End Page 2 Footer -->
				<!-- Begin page 3 Header -->
				<tr>
					<td colspan="8" class="styBB" style="width:187mm; border-bottom: 1px solid black">
						<div style="float: left; clear: none">Form 720 (Rev. 4-2013)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</td>
				</tr>
				<!-- End page 3 Header -->
				<tr>
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
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<span class="styPartName" style="width:25mm; text-align:left; padding-left:3mm">Schedule A</span>
						<span class="styPartDesc" style="width:162mm; text-align:left">
        Excise Tax Liability <span class="styNormalText">(see instructions)</span>
						</span>
					</th>
				</tr>
				<tr>
					<td class="styBB" colspan="8" style="height:10mm;width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
						<span class="styPartDesc" style="width:187mm;">
        Note.   <span class="styNormalText" style="display:inline;">
								<i>You must complete Schedule A if you have a liability for any tax in Part I of Form 720.  Do not complete Schedule A for Part II taxes or for a one-time filing of the gas guzzler tax.</i>
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
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:12mm; text-align:center; font-weight:normal" >
						<b>1</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:135mm; font-weight:normal;padding-left:5px;text-align:left;" >               Regular method taxes
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegFirstMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>B</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegFirstMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSecondMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>D</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSecondMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegThirdMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>F</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegThirdMonth/MonthSecondHalf"/>
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
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>G</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegularMethodTaxes/RegSpecialSeptember"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/RegNetLiability"/>
						</xsl:call-template>
					</td>
				</tr>
				<!--  End Regular method taxes -->
				<!--  Begin Alternative method taxes -->
				<tr>
					<td style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:12mm; text-align:center; font-weight:normal" >
						<b>2</b>
					</td>
					<td colspan="7" style="float:left;clear:none;padding-top: 3mm; border-color: black; border-style: solid; border-top-width: 0px; border-right-width:0px; border-left-width:0px; border-bottom-width:0px; width:135mm; font-weight:normal;padding-left:5px;text-align:left;" >               Alternative method taxes (IRS Nos. 22, 26, 28, and 27)
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltFirstMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>N</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltFirstMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSecondMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>P</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSecondMonth/MonthSecondHalf"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltThirdMonth/MonthFirstHalf"/>
						</xsl:call-template>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>R</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltThirdMonth/MonthSecondHalf"/>
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
                      </span>
						<span style="width:3mm; text-align:right">
							<img src="{$ImagePath}/720_Bullet.gif" alt="MediumBullet"/>
						</span>
					</td>
					<td style="height:3mm;width:5mm;float:left;clear:none;text-align: center; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<b>S</b>
					</td>
					<td style="height:3mm;width:40mm;float:left;clear:none;text-align: right; border-color: black; border-style: solid; border-top-width: 1px; border-right-width:1px; border-left-width:0px; border-bottom-width:0px; font-weight:normal" >
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/AlternativeMethodTaxes/AltSpecialSeptember"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleA/NetLiabilityAltMethodTaxes"/>
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
					<th scope="col" class="styBB" colspan="8" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
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
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons received in a two-party exchange within a terminal, included<br/> on IRS No. 60(a) on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalDieselReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Diesel fuel, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalDieselDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 35(a),<br/> 69, 77, or 111 on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalKeroseneReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Kerosene, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalKeroseneDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons received in a two-party exchange within a terminal, included on IRS No. 62(a) on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalGasReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalGasDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons received in a two-party exchange within a terminal,<br/> included on IRS No. 14 on Form 720
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalAviationGasReceived"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="height:3.5mm;width:147mm;float:left;clear:none;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; padding-left:5mm; height:8mm">
						<b>Aviation gasoline, </b> gallons delivered in a two-party exchange within a terminal
      </td>
					<td colspan="2" style="height:3.5mm;width:40mm;float:left;clear:none;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; padding-left:8px; height:8mm">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleT/GalAviationGasDelivered"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- End Fuel Section -->
				<!-- Begin Page 3 Footer -->
				<tr>
					<td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">720</span> (Rev. 4-2013)
      </div>
					</td>
				</tr>
				<!-- End Page 3 Footer -->
			</tbody>
		</table>
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 BEGIN PAGE 4 -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>4</b>
			</div>
    Form 720 (Rev. 4-2013)
  </div>
		<!-- End Header -->
		<!-- Begin Schedule C Title -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0">
				<tbody>
					<tr>
						<th scope="col" class="styPartName" style="width:22mm;font-size:9pt;float:none;text-align:left;padding-left:0.5mm">Schedule C</th>
						<th scope="col" class="styPartDesc" style="width:74mm;padding-left:8mm;font-size:9pt;text-align:left;float:none">Claims</th>
						<th scope="col" style="width:91mm;font-size:8pt;text-align:left;float:none;font-weight:normal">Month your income tax year ends
          <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							<span style="width:1mm"/>
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TaxYearEndMonth"/>
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
			<div style="font-size:8pt;float:left;padding-left:3mm">Attach a statement explaining each claim as required. Include your
    name and EIN on the statement (see instructions).</div>
			<br/>
			<div style="width:187mm;clear:left;padding-bottom:1mm;padding-left:5mm;font-size:8pt;text-align:justify;padding-top:1mm">
				<b>Caution. </b>
				<i>Claimant has the name and address of the person(s) who sold the fuel to the claimant, the dates of purchase, and if
				    exported, the required proof of export. For claims on lines 1a and 2b (type of use 13 and 14), 3c, 4b, and 5, claimant has not
				    waived the right to make the claim.</i>
			</div>
		</div>
		<!-- End Schedule C Explanation -->
		<!-- Begin Line 1 -->
		<!-- Begin Line 1 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN">1</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:113mm">
              Nontaxable Use of Gasoline 
              <span style="width:7mm;"/><span style="font-size:7pt;">Note. <span style="font-weight:normal;">CRN is credit reference number.</span></span>
            </th>
						<th scope="col" class="styIRS720LineHeaderPCRGN">Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/PrdClaimTo"/>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Gasoline (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/Gasoline/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 1 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseGasoline/GasolineExported/CRN"/>
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
						<th scope="col" class="styIRS720LineHeaderLN">2</th>
						<th scope="col" class="styIRS720LineHeaderTitle">Nontaxable Use of Aviation Gasoline</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN">Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/PrdClaimTo"/>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;font-size:7pt" rowspan="2">
							<br/>Used in commercial aviation (other than foreign trade)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/CommercialAviation/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS720NameTableCell">Other nontaxable use (see <b>Caution</b> above line 1)</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasoline/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 2 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/LUST/CRN"/>
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
						<th scope="col" class="styIRS720LineHeaderLN">3</th>
						<th scope="col" class="styIRS720LineHeaderTitle">Nontaxable Use of Undyed Diesel Fuel</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN">Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/PrdClaimTo"/>
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
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/DyedDiesel"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> ............................... </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the diesel fuel did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/DyedDiesel"/>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Nontaxable use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/NontaxableUse/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/UseInTrains/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/FarmingPurposes/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 3 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedDieselFuel/Exported/CRN"/>
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
						<th scope="col" class="styIRS720LineHeaderLN">4</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:113mm;font-size:7pt">Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN" style="width:30mm">Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/PrdClaimTo"/>
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
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed explanation<br/>
          and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> ................................... </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Claimant certifies that the kerosene did not contain visible evidence of dye">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
					<!--<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedKeroseneDyedKeroseneException</xsl:with-param>-->
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/DyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCNontaxableUseUndyedKeroseneDyedKeroseneException</xsl:with-param>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<span>
								<b>Caution. </b>
								<i>Claims cannot be made on line 4 for kerosene sales from a blocked pump.</i>
							</span>
							<br/>Nontaxable use
          </th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUse/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/IntercityAndLocalBuses/CRN"/>
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
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/FarmingPurposes/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS720NameTableCell">Exported (see <b>Caution</b> above line 1)
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.044
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt044/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 4 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">Nontaxable use taxed at $.219
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/Exported"/>
              </xsl:call-template>-->
						</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseUndyedKerosene/NontaxableUseAt219/CRN"/>
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
						<th scope="col" class="styIRS720LineHeaderLN">5</th>
						<th scope="col" class="styIRS720LineHeaderTitle">Kerosene Used in Aviation <span style="font-weight:normal">(see <b>Caution</b> above line 1)</span>
						</th>
						<th scope="col" class="styIRS720LineHeaderPCRGN">Period of claim
              <img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" class="styIRS720LineHeaderData" style="width:18mm">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/PrdClaimTo"/>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left" rowspan="2">
							<br/>Kerosene used in commercial aviation (other than foreign trade) taxed at $.244</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px">Gallons</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">Kerosene used in commercial aviation (other than foreign trade)
taxed at $.219</td>
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/KeroseneTaxedAt219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell">Nontaxable use (other than use by state or local government) taxed at $.244</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Nontaxable use (other than use by state or local government)
taxed at $.219</td>
						<td class="styIRS720TableCellText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/OtherNontaxableUsesTaxed219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 5 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--  <td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/TypeOfUse"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/KeroseneUsedComAir/LUST/CRN"/>
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
		<!-- End Line 5 Table -->
		<!-- End Line 5 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 4-2013)
  </div>
		<!-- End Footer -->
		<!-- ========================================================================= -->
		<!-- END PAGE 4  -->
		<!-- ========================================================================= -->
		<div class="pageEnd"/>
		<!-- ======================================================================== -->
		<!-- BEGIN PAGE 5  -->
		<!-- ======================================================================== -->
		<!-- Begin Header -->
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>5</b>
			</div>
        Form 720 (Rev. 4-2013)
      </div>
		<!-- End Header -->
		<!-- had to move Line 6 to next page-->
		<!-- Begin Line 6 -->
		<!-- Begin Line 6 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN">6</th>
						<th scope="col" class="styIRS720LineHeaderTitle">Nontaxable Use of Alternative Fuel</th>
					</tr>
					<tr>
						<th scope="col" class="styIRS720LineHeaderLN">
							<span style="width:1px"/>
						</th>
						<th scope="col" class="styIRS720LineHeaderTitle" style="width:179mm">Caution. <span style="font-weight:normal">
								<i>There is a reduced credit rate 
              for use in certain intercity and local buses (type of use 5) (see instructions).</i>
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
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:74mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2">
							<br/>Liquefied petroleum gas (LPG)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:24mm;border-top-width:0px">Type of use</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;border-top-width:0px">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:20mm;border-top-width:0px;font-size:7pt">Gallons or gasoline gallon equivalents (GGE)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-top-width:0px;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<div style="float:left;clear:none">$</div>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LPG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">"P Series" fuels</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/PSeriesFuels/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt">Compressed natural gas (CNG) (GGE = 126.67 cu. ft.)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/CNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Liquefied hydrogen</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedHydrogen/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
						<td class="styIRS720NameTableCell" style="font-size:6pt;">Fischer-Tropsch process liquid fuel from coal (including peat)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromCoal/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">f</td>
						<td class="styIRS720NameTableCell">Liquid fuel derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther">
								<td class="styIRS720TableCellText">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquidFuelFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:1px">Liquefied natural gas (LNG)</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther">
								<td class="styIRS720TableCellText" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:1px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUseOther/Rate"/>
									</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:1px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width10px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 6 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="border-bottom-width:0px">Liquefied gas derived from biomass</td>
						<xsl:choose>
							<xsl:when test="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther">
								<td class="styIRS720TableCellText" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther/TypeOfUse"/>
									</xsl:call-template>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUseOther/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styIRS720TableCellTextType5" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/BUSWriteIn"/>
									</xsl:call-template>
									<span style="padding-left:4.25mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/TypeOfUse"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
									<span style="float:left;clear:none;width:6px"/>
									<span style="text-align:left;padding-left:2mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/TypeOfUse5/Rate"/>
										</xsl:call-template>
									</span>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px;border-bottom-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAltFuels/LiquefiedGasFromBiomass/CRN"/>
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
						<th scope="col" style="width:8mm;text-align:center;font-size:8pt" rowspan="2">7</th>
						<th scope="col" style="width:108mm;font-size:8pt;text-align:left" rowspan="2">Sales by Registered Ultimate Vendors of Undyed Diesel Fuel</th>
						<th scope="col" style="width:35mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
              <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/PrdClaimFrom"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/PrdClaimTo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/RegNbr"/>
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
          written consent of the buyer to make the claim. Claimant certifies that the diesel fuel did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the diesel fuel included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> ............................... </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="sold the diesel fuel at a tax-excluded price">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedDieselFuelException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UndyedDieselFuel"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UsedByStateLocalGov/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 7 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedDieselFuel/UseIntercityLocalBuses/CRN"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/PrdClaimFrom"/>
								</xsl:call-template>
							</span>
						</th>
						<th scope="col" style="width:18mm;text-align:left;font-weight:normal">
							<span class="styFixedUnderline" style="width:18mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/PrdClaimTo"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/RegNbr"/>
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
          the written consent of the buyer to make the claim. Claimant certifies that the kerosene did not contain visible evidence of dye.<br/>
			<span style="font-size:8pt;font-weight:bold">Exception. </span>If any of the kerosene included in this claim <b>did </b>contain visible evidence of dye, attach a detailed<br/>
          explanation and check here <span style="width:1mm"/>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
			</xsl:call-template>
			<span class="styDotLn" style="float:none"> ............................... </span>
			<img src="{$ImagePath}/720_Bullet_Md.gif" alt="Bullet"/>
            <input type="checkbox" class="styCkbox" title="Undyed Kerosene">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
					<xsl:with-param name="BackupName">IRS720ScheduleCSalesByRUVOfUndyedKeroseneException</xsl:with-param>
				</xsl:call-template>
			</input>
			<!--<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UndyedKerosene"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UsedByStateLocalGov/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Sales from a blocked pump</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/SalesFromBlockedPump/Amount"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 8 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use in certain intercity and local buses</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfUndyedKerosene/UseIntercityLocalBuses/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/RegNbr"/>
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
          Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Rate"/>
							</xsl:call-template><span style="width:2mm;"/>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed219/CRN"/>
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
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/UsedCommercialAviationTaxed244/CRN"/>
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
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">d</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.244
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText">
							.244
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--  <td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
            </xsl:call-template>
          </td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed244/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;border-bottom-width:0;font-size:8pt;padding-right:1mm">e</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Other nontaxable uses taxed at $.219
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/TypeOfUse"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" >
							.219
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<span style="width:1px"/>
						</td>
						<!--<td class="styIRS720TableCellTextRate"><span style="float:left;clear:none;width:6px" />
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Rate"/>
            </xsl:call-template>
          </td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/NonexemptUseNoncommercial/Gallons"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/OtherNontaxableUseTaxed219/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 9 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm">f</td>
						<td class="styIRS720NameTableCell">LUST tax on aviation fuels used in foreign trade
            <!--<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/NontaxableUseAviationGas/NontaxableAviationGasExported"/>
              </xsl:call-template>-->
						</td>
						<!--<td class="styIRS720TableCellText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/TypeOfUse"/>
            </xsl:call-template>
          </td>-->
						<td class="styIRS720TableCellText" style="background-color:lightgrey">
							<span style="width:1px"/>
						</td>
						<td class="styIRS720TableCellTextRate" style="text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Rate"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfKeroseneSoldAir/LUST/CRN"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/RegNbr"/>
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
          Claimant sold the gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UsedByNonprofitEducationalOrg/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 10 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Use by a state or local government
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfGasoline/UseByStateLocalGov/Amount"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 10 Table -->
		<!-- End Line 10 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 4-2013)
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
		<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
			<div style="width:20mm;text-align:right;float:right;margin-top:0px">Page <b>6</b>
			</div>
    Form 720 (Rev. 4-2013)
  </div>
		<!-- End Header -->
		<!-- Begin Line 11 -->
		<!-- Begin Line 11 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">11</th>
						<th scope="col" style="width:120mm;text-align:left;font-size:8pt">Sales by Registered Ultimate Vendors of Aviation Gasoline</th>
						<th scope="col" style="width:35.5mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:23.5mm;text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/RegNbr"/>
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
          Claimant sold the aviation gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid<br/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-bottom-width:0px;padding-bottom:2mm;border-right-width:0px" rowspan="2">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UsedByNonprofitEducationalOrg/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 11 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left;border-bottom:0px">Use by a state or local government
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellTextRate" style="border-bottom-width:0px">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/SalesByRUVOfAviationGas/UseStateLocalGov/Amount"/>
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
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">12</th>
						<th scope="col" style="width:81mm;text-align:left;font-size:8pt">Alcohol Fuel Mixture Credit</th>
						<th scope="col" style="width:24mm;text-align:right;font-weight:normal;padding-right:1mm">Period of claim
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/PrdClaimFrom"/>
							</xsl:call-template>
						</th>
						<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/PrdClaimTo"/>
							</xsl:call-template>
						</th>
						<th scope="col" style="width:32mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:24mm;text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/RegNbr"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 12 Title -->
		<!-- Begin Line 12 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:6mm"/>
          Claimant produced an alcohol fuel mixture by mixing taxable fuel with alcohol. The alcohol fuel mixture was sold by the<br/>
          claimant to any person for use as a fuel or was used as a fuel by the claimant (see instructions). 
          
        </div>
		<!-- End Line 12 Explanation -->
		<!-- Begin Line 12 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt;border-bottom-width:0px">
				<tbody>
					<!-- Line 12 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2">Alcohol fuel mixtures containing ethanol</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm">Gal. of Alcohol</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainEthanol/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainEthanol/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainEthanol/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainEthanol/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 12 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Alcohol fuel mixtures containing alcohol (other than ethanol)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainAlcohol/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainAlcohol/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainAlcohol/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AlcoholFuelMixtureCredit/AlcoholFuelMixContainAlcohol/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 12 Table -->
		<!-- End Line 12 -->
		<!-- Begin Line 13 -->
		<!-- Begin Line 13 Title -->
			<div class="styBB" style="width:187mm">
				<table cellspacing="0" style="font-size:7pt">
					<tbody>
						<tr>
							<th scope="col" style="width:8mm;text-align:center;vertical-align:top;font-size:8pt;padding-top:1mm;">13</th>
							<th scope="col" colspan="3" style="width:91mm;text-align:left;vertical-align:top;font-size:8pt;padding-top:1mm;">Biodiesel or Renewable Diesel Mixture Credit</th>
							<th scope="col" style="width:24.5mm;text-align:right;font-weight:normal;">Period of claim
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/PrdClaimFrom"/>
								</xsl:call-template>
							</th>
							<th scope="col" style="width:10mm;text-align:left;font-weight:normal">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/PrdClaimTo"/>
								</xsl:call-template>
							</th>
							<th scope="col" style="width:32mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
								<span style="width:0.5mm"/>
								<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
							</th>
							<th scope="col" style="width:23.5mm;text-align:left;padding-bottom:0.5mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RegNbr"/>
								</xsl:call-template>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- End Line 13 Title -->
		<!-- Begin Line 13 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:30mm;font-size:6pt"/>
			<b>Biodiesel mixtures</b>. Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to produce the mixture met <br/>
      ASTM D6751 and met EPA’s registration requirements for fuels and fuel additives. The mixture was sold by the claimant to any person<br/>
       for use as a fuel or was used as a fuel by the claimant. Claimant has attached the Certificate for Biodiesel and, if applicable, the <br/>
      Statement of Biodiesel Reseller. <b>Renewable diesel mixtures.</b> Claimant produced a mixture by mixing renewable diesel with liquid fuel <br/>
       (other than renewable diesel). The renewable diesel used to produce the renewable diesel mixture was derived from biomass, met <br/>
      EPA’s registration requirements for fuels and fuel additives, and met ASTM D975 or D396, or other equivalent standard approved<br/>
          by the IRS. The mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant has<br/>
      attached the Certificate for Biodiesel and, if applicable, the Statement of Biodiesel Reseller, both of which have been edited as <br/>
      discussed in the Instructions for line 13. See the
instructions for line 13 for information about renewable diesel used in aviation.
      
      <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix"/>
			</xsl:call-template>
		</div>
		<!-- End Line 13 Explanation -->
		<!-- Begin Line 13 Table -->
		<div style="width:187mm">
			<table class="styBB" cellspacing="0" style="font-size:7pt;border-bottom-width:0px">
				<tbody>
					<!-- Line 13 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">a</th>
                  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;border-top-width:1px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
                  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm;">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gal. of Biodiesel or Renewable Diesel</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom">
              Biodisel (other than agri-biodiesel) mixtures
            </td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/BiodieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 13 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;border-bottom-width:0px;font-size:8pt;padding-right:1mm">b</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Agri-biodiesel mixtures</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/AgriBiodieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 13 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-right-width:0px;font-size:8pt;padding-right:1mm">c</td>
						<td class="styIRS7204BoldTableHeaderCell" style="border-left-width:0px;border-top-width:0px;font-weight:normal;text-align:left">Renewable diesel mixtures</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/BiodieselOrRenewableDieselMix/RenewableDieselMixtures/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 13 Table -->
		<!-- End Line 13 -->

		<!-- Begin Line 14 -->
		<!-- Begin Line 14 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">14</th>
						<th scope="col" style="width:120mm;text-align:left;font-size:8pt">Alternative Fuel Credit and Alternative Fuel Mixture Credit</th>
						<th scope="col" style="width:35.5mm;text-align:right;padding-right:1mm;font-weight:normal">Registration Number
						    <span style="width:0.5mm"/>
							<img src="{$ImagePath}/720_Bullet.gif" alt="Bullet"/>
						</th>
						<th scope="col" style="width:23.5mm;text-align:left;padding-bottom:0.5mm;font-weight:normal">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/RegNbr"/>
							</xsl:call-template>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 14 Title -->
		<!-- Begin Line 14 Explanation -->
		<div style="width:187mm">
			<div style="float:left;clear:none;width:8mm;height:18mm;font-size:6pt;"/>
     For the alternative fuel mixture credit, claimant produced a mixture by mixing taxable fuel with alternative fuel. Claimant certifies that it (a)
produced the alternative fuel, or (b) has in its possession the name, address, and EIN of the person(s) that sold the alternative fuel to the
claimant; the date of purchase; and an invoice or other documentation identifying the amount of the alternative fuel. The claimant also
certifies that it made no other claim for the amount of the alternative fuel, or has repaid the amount to the government. The alternative fuel
mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant.		</div>
		<!-- End Line 14 Explanation -->
		<!-- Begin Line 14 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<!-- Line 14 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>a</th>
                  <th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;border-bottom-width:0px;font-weight:normal;text-align:left;vertical-align:bottom"><span style="width:1mm;"/></th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:16mm">Rate</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:23mm;font-size:7pt">Gallons or<br/>gasoline gallon<br/>equivalents (GGE)<br/>
							<span style="font-weight:normal; font-size:6pt">(see instructions)</span>
						</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm">Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px">CRN</th>
					</tr>
					<tr>
						<td class="styIRS7204BoldTableHeaderCell" style="width:95mm;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom">
							Liquefied petroleum gas (LPG)
            </td>
						<td class="styIRS720TableCellTextRate">
							<div style="float:left;clear:none">$</div>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LPG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell">"P Series" fuels</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/PSeriesFuels/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell">Compressed natural gas (CNG) (GGE = 121 cu. ft.)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (d) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
						<td class="styIRS720NameTableCell">Liquefied hydrogen</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedHydrogen/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (e) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
						<td class="styIRS720NameTableCell">Fischer-Tropsch process liquid fuel from coal (including peat)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromCoal/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (f) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">f</td>
						<td class="styIRS720NameTableCell">Liquid fuel derived from biomass</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquidFuelFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (g) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell">Liquefied natural gas (LNG)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LNG/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (h) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell">Liquefied gas derived from biomass</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/LiquefiedGasFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 14 (i) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
						<td class="styIRS720NameTableCell">Compressed gas derived from biomass<br/>(GGE = 121 cu.ft.)</td>
						<td class="styIRS720TableCellTextRate">
							<span style="float:left;clear:none;width:6px"/>
							<span style="text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Rate"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Gallons"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/AltFuelCrAndAltFuelMixCr/CompressedGasFromBiomass/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 14 Table -->
		<!-- End Line 14 -->
		<!-- Begin Line 15 -->
		<!-- Begin Line 15 Title -->
		<div class="styBB" style="width:187mm">
			<table cellspacing="0" style="font-size:7pt">
				<tbody>
					<tr style="padding-top:1mm;padding-bottom:1mm">
						<th scope="col" style="width:8mm;text-align:center;vertical-align:center;padding-top:1mm;padding-bottom:1mm;font-size:8pt">15</th>
                  <th scope="col" style="width:179mm;text-align:left;font-size:8pt">Other Claims. <span style="font-weight:normal">See the instructions. For lines 15b and 15c, see the <b>Caution</b> above line 1 on page 4.</span>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 15 Title -->
		<!-- Begin Line 15 Table -->
		<div style="width:187mm">
			<table cellspacing="0" style="font-size:7pt;">
				<tbody>
					<!-- Line 15 (a) -->
					<tr>
						<th scope="col" class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom"  rowspan="2">
							<br/>a</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:134mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" colspan="2">
							<br/>Section 4051(d) tire credit (tax on vehicle reported on IRS No. 33)</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:36mm;border-top-width:0px" >Amount of claim</th>
						<th scope="col" class="styIRS7204BoldTableHeaderCell" style="width:9mm;border-right-width:0px;border-top-width:0px" >CRN</th>
					</tr>
					<tr>
						<td class="styIRS720TableCellAmount" style="font-size:7pt;padding-right:2px">
							<div style="float:left;clear:none">$</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/Section4051d/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/Section4051d/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (b) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">b</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedDieselFuel/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (c) -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">c</td>
						<td class="styIRS720NameTableCell" colspan="2">Exported dyed kerosene 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/ExportedDyedKerosene/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- Line 15 (d) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion)">
						<!--In case there is nothing for the for-each loop to grab-->
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>
          Diesel-water fuel emulsion
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">d</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>
          Diesel-water fuel emulsion 
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/DieselWaterFuelEmulsion"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 15 (e) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>          
          Registered credit card issuers
            <!--
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers"/>
              </xsl:call-template>
              -->
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">e</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<div style="float:right">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Amount/@note"/>
									</xsl:call-template>
								</div>          
          Registered credit card issuers
            <!--
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/RegisteredCreditCardIssuers"/>
              </xsl:call-template>
              -->
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- begin new Line 15f -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:8mm;border-top-width:0px;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:bottom" rowspan="2">
							<br/>f</td>
						<td class="styIRS720NameTableCell" style="width:134mm;border-top-width:0px;border-left-width:0px;font-weight:normal;text-align:left;vertical-align:bottom" rowspan="2" >
							<br/>Taxable tires other than bias ply or super single tires
 <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresOther/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 15f -->
					<!-- begin new line 15g -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">g</td>
						<td class="styIRS720NameTableCell" style="font-size:7pt" >Taxable tires, bias ply or super single tires (other than super single tires designed for steering) 
            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresBiasplyOthSprSngle/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!--end new line 15g -->

					<!-- begin new Line 15h -->
					<tr>
						<td class="styIRS720TableCellLineNumber" style="width:7mm;border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">h</td>
						<td class="styIRS720NameTableCell" style="width:115.5mm;" >Taxable tires, super single tires designed for steering              <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:23mm;text-align:right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;padding-right:1mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/NumberOfTires"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellAmount" style="width:37mm;font-size:7pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/Amount"/>
							</xsl:call-template>
						</td>
						<td class="styIRS720TableCellText" style="width:8.5mm;border-right-width:0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/TaxableTiresSuprSingleSteering/CRN"/>
							</xsl:call-template>
						</td>
					</tr>
					<!-- End new line 15h -->
					<!-- Line 15 (i) -->
					<xsl:if test="not($FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510)">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:for-each select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510">
						<tr>
							<td class="styIRS720TableCellLineNumber" style="border-bottom-width:0px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
							<td class="styIRS720NameTableCell" colspan="2">
								<span style="width:1px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/OtherClaims/OtherClaimsPub510"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellAmount" style="font-size:7pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amount"/>
								</xsl:call-template>
							</td>
							<td class="styIRS720TableCellText" style="border-right-width:0px">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CRN"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<!-- Line 15 (j) -->
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
					<!-- Line 15 (k) -->
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
					<!-- Line 15 (i) -->
					<!--<tr>
          <td class="styIRS720TableCellLineNumber" style="border-bottom-width:1px;border-right-width:0px;font-size:8pt;padding-right:1mm;vertical-align:top">i</td>
          <td class="styIRS720NameTableCell"><span style="width:1px" /></td>
          <td class="styIRS720TableCellAmount" style="font-size:7pt"><span style="width:1px" /></td>
          <td class="styIRS720TableCellText" style="border-right-width:0px"><span style="width:1px" /></td>
        </tr>-->
				</tbody>
			</table>
		</div>
		<!-- End Line 15 Table -->
		<!-- End Line 15 -->
		<!-- Begin Line 16 -->
		<div style="width:187mm">
			<table cellspacing="0" class="styBB" style="font-size:7pt">
				<tbody>
					<tr>
						<td class="styIRS720LineNumber" style="width:8mm">16</td>
						<td class="styIRS720RightBorder" style="width:113.5mm;font-size:6pt;font-weight:normal;text-align:left;padding-left:2mm;border-right-width:0px;">
							<b>Total claims. </b>Add amounts on lines 1 through 15. Enter the result here and on Form 720, Part III, line 
						</td>
						<td class="styIRS720RightBorder" style="font-weight:bold;text-align:center;font-size:8pt;padding-top:0.5mm">
							<table cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td class="styIRS720RightBorder" style="width:15mm;font-size:6pt;font-weight:normal;text-align:left;">
											4.
										</td>
										<td class="styIRS720LineNumber" style="width:8mm;text-align:center;">16</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td class="styIRS720RightBorder" style="width:33mm;border-bottom-width:0px;text-align:right;font-weight:normal">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS720ScheduleC/TotalClaims"/>
							</xsl:call-template>
						</td>
						<td scope="col" style="width:8.75mm;background-color:lightgrey">
							<span style="width:1px"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- End Line 16 -->
		<!-- Begin Footer -->
		<div style="width:187mm;text-align:right;right;padding-top:0.5mm">
    Form <span style="font-size:8pt;font-weight:bold">720</span> (Rev. 4-2013)
  </div>
		<!-- End Footer -->
		<div class="pageEnd"/>
		<!-- ========================================================================= -->
		<!-- END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 END PAGE 6 -->
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

<xsl:for-each select="$FormData/SpecialConditionDescription">

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
<!-- end for versions for 2013 Q2, 2013 Q3, 2013 Q4 -->
    </xsl:otherwise>
  </xsl:choose>
      </form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>