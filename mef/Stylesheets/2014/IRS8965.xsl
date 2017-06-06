<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8965Data" select="$RtnDoc/IRS8965"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8965Data)"/>
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
				<meta name="Description" content="IRS Form 8965"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="margin-bottom:10px">
				<form name="Form8965">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right:none;vertical-align:bottom;">
							Form <span class="styFormNumber">8965</span>
							<div style="padding-top:0mm;">
								<br/>
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:19mm;">
							<div class="styMainTitle">	
								Health Coverage Exemptions
							</div>
							<div class="styFBT" style="height:4mm;margin-top:0mm;">
								<br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
								<span style="font-weight:normal">Attach to Form 1040, Form 1040A, or Form 1040EZ.</span><br/>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
								Information about Form 8965 and its separate instructions is at <i>www.irs.gov/form8965</i>.
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;border-left:none;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="line-height:30px;">20<span class="styTYColor">14</span></div>
							<div style="margin-left:3mm; text-align:left;">
								Attachment<br/>Sequence No. <span class="styBoldText">75</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					
					<!-- Begin Name and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:145mm;height:8mm;font-size:6pt;">
							Name as shown on return<br/>
							<div style="font-family:verdana;font-size:7pt;padding-top:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styEINBox" style="width:41mm;height:8mm;padding-left:2mm;font-size:6pt;font-weight:normal;">
							Your social security number<br/>
							<span style="text-align:center;width:34mm;font-size:7pt;padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
						
					<div class="styBB" style="width:187mm;">
						<div class="styWhoMustFileBox" style="width:187mm;height:8mm;font-size:7pt;padding-top:2mm;">
							Complete this form if you have a Marketplace-granted coverage exemption or you are claiming a coverage exemption on your return.
						</div>
					</div>
						
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<div style="padding-top:1.6mm;float:left;">
							<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part I</div>
						</div>
						<div class="styPartDesc" style="width:173.9mm;padding-left:2mm;">Marketplace-Granted Coverage Exemptions for Individuals: <span style="font-weight:normal;">If you and/or a member of your tax</span><br/>
							<div style="float:left;font-weight:normal;">household have an exemption granted by the Marketplace, complete Part I.</div>
							<div style="float:right;text-align:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8965Data/ObtndExemptCvrTaxHsldGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="containerID" select=" 'FirmDiv' "/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- BEGIN Table -->
					<!--Lines 1-6-->
					<div class="styTableContainer" id="FirmDiv" style="border-bottom:none;width:187mm;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-color:black;" cellspacing="0">
							<thead class="styTableThead">
								<tr style="height:8.4mm;">
									<th scope="col" class="styTableCell" style="background-color:lightgrey;border-bottom-width:0px;"><div style="width:10mm;"><br/></div></th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;width:auto;border-bottom-width:0px;">
										<div style="width:80mm">a<br/>Name of Individual</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;width:auto;border-bottom-width:0px;">
										<div style="width:37mm">b<br/>SSN</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:none;border-bottom-width:0px;">
										<div style="width:52.6mm;">c<br/>Exemption Certificate Number</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>									
								<xsl:for-each select="$Form8965Data/ObtndExemptCvrTaxHsldGrp">
									<!-- If the print parameter is not set to be Separated, or there are less elements than the container height (6), execute-->
									<xsl:if test="($Print != $Separated) or (count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt;=6)">
										<tr style="height:12.2mm;">
											<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
												<br/>
												<xsl:if test="position() &lt;= 6">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<!--Name-->
											<td class="styTableCell" style="width:100%;text-align:left;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">		
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</td>					
											<!--SSN-->
											<td class="styTableCell" style="width:100%;text-align:center;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
												<br/>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SSN"/>
												</xsl:call-template>
											</td>
											<!--Exemption Certificate Number-->
											<td class="styTableCell" style="width:100%;text-align:center;border-right:none;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExemptionCertificateNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 1 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt; 6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											1
										</td>
										<td class="styTableCell" style="text-align:left;vertical-align:bottom;width:100%;bottom;border-bottom-width:0px;border-top-width:1px;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt; 6) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8965Data/ObtndExemptCvrTaxHsldGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 2 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											2
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 3 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											3
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 4 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											4
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 5 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											5
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &lt; 6 or ((count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12.2mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;bottom;border-bottom-width:0px;border-top-width:1px;">
											6
										</td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;bottom;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8965Data/ObtndExemptCvrTaxHsldGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'FirmDiv' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
							
					<div class="styBB" style="width:187mm;float:none;clear:both;border-top:1px solid black;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part II</div>
						<div class="styPartDesc" style="width:173.9mm;padding-left:2mm;">Coverage Exemptions for Your Household Claimed on Your Return:</div>
					</div>
						
					<!--  Line 7a-->
					<div style="width:187mm;padding-top:2mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:10mm;text-align:center;padding-top:1mm;">7a</div>
						<div class="styLNDesc" style="width:152mm;height:4mm;float:left;padding-top:1mm;padding-left:1mm;">
							<span style="float:left;">Are you claiming an exemption because your household income is below the filing threshold?</span>
							<!--Dotted Line-->
							<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">......</span>
						</div>
						<div style="height:8mm;font-size:7pt;padding-top:1mm;float:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
										<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
							</label><b>Yes</b>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
										<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form8965Data/HsldIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">HsldIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
							</label><b>No</b>
							<span style="width:4mm;"/>
						</div>
					</div>
						
					<!--  Line 7b-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;width:10mm;text-align:center;">b</div>
						<div class="styLNDesc" style="width:152mm;float:left;padding-top:1mm;padding-left:1mm;">
							<span style="float:left;">Are you claiming a hardship exemption because your gross income is below the filing threshold?</span>
							<!--Dotted Line-->
							<span style="float:right;padding-right:3mm;letter-spacing:3.5mm;font-weight:bold;">.....</span>
						</div>
						<div style="font-size:7pt;padding-top:1mm;float:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
										<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
							</label><b>Yes</b>
							<span style="width:4mm;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
										<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form8965Data/GrossIncmBelowFlngThresholdInd"/>
									<xsl:with-param name="BackupName">GrossIncmBelowFlngThresholdInd</xsl:with-param>
								</xsl:call-template>
							</label><b>No</b>
							<span style="width:4mm;"/>
						</div>
					</div>
						
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div style="padding-top:1.6mm;float:left;">
							<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part III</div>
						</div>
						<div class="styPartDesc" style="width:173.9mm;padding-left:2mm;">Coverage Exemptions for Individuals Claimed on Your Return: <span style="font-weight:normal;">If you and/or a member of your tax</span><br/>
							<div style="float:left;font-weight:normal;">household are claiming an exemption on your return, complete Part III.</div>
							<div style="float:right;text-align:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form8965Data/RequestExemptCvrTaxHsldGrp"/>
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="containerID" select=" 'FirmDiv2' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</div>
					</div>
					
					<!-- BEGIN Table -->
					<!--Lines 8-13-->
					<div class="styTableContainer" id="FirmDiv2" style="border-bottom-width:0px;height:0mm;width:187mm;">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size:7pt;border-color:black;" cellspacing="0">
							<thead class="styTableThead">
								<tr style="height:11.6mm;">
									<th scope="col" class="styTableCell" style="background-color:lightgrey;border-bottom-width:0px;"><div style="width:10mm;"><br/></div></th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;width:auto;border-bottom-width:0px;">
										<div style="width:42mm;text-align:center;"><b>a</b><br/>Name of Individual</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;width:auto;border-bottom-width:0px;">
										<div style="width:22mm;"><b>b</b><br/>SSN</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;width:auto;border-bottom-width:0px;">
										<div style="width:15mm;"><b>c</b><br/>Exemption<br/>Type</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-left-width:1px; border-right-width:2px;border-bottom-width:0px;">
										<b>d</b><br/>Full<br/>Year
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>e</b><br/>Jan
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>f</b><br/>Feb
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>g</b><br/>Mar
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>h</b><br/>Apr
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>i</b><br/>May
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>j</b><br/>June
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>k</b><br/>July
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>l</b><br/>Aug
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>m</b><br/>Sept
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>n</b><br/>Oct
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-bottom-width:0px;">
										<b>o</b><br/>Nov
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:none;border-bottom-width:0px;">
										<b>p</b><br/>Dec
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>									
								<xsl:for-each select="$Form8965Data/RequestExemptCvrTaxHsldGrp">
									<!-- If the print parameter is not set to be Separated, or there are less elements than the container height (6), execute-->
									<xsl:if test="($Print != $Separated) or (count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt;=6)">
										<tr style="height:12mm;">
											<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
												<br/>
												<xsl:if test="position() &lt;= 6">
													<xsl:value-of select="position() + 7"/>
												</xsl:if>
											</td>
											<!--Name-->
											<td class="styTableCell" style="text-align:left;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">				
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>						
											</td>
											<!--SSN-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<br/>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SSN"/>
												</xsl:call-template>						
											</td>
											<!--Exemption Reason Code-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExemptionReasonCd"/>
												</xsl:call-template>
											</td>
											<!--All Year Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-left-width:1px;border-right-width:2px;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AllYearInd"/>
												</xsl:call-template>
											</td>
											<!--January Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JanuaryInd"/>
												</xsl:call-template>
											</td>
											<!--February Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/FebruaryInd"/>
												</xsl:call-template>
											</td>
											<!--March Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/MarchInd"/>
												</xsl:call-template>
											</td>
											<!--April Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/AprilInd"/>
												</xsl:call-template>
											</td>
											<!--May Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/MayInd"/>
												</xsl:call-template>
											</td>
											<!--June Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JuneInd"/>
												</xsl:call-template>
											</td>
											<!--July Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JulyInd"/>
												</xsl:call-template>
											</td>
											<!--August Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/AugustInd"/>
												</xsl:call-template>
											</td>
											<!--September Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/SeptemberInd"/>
												</xsl:call-template>
											</td>
											<!--October Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/OctoberInd"/>
												</xsl:call-template>
											</td>
											<!--November Indicator-->
											<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/NovemberInd"/>
												</xsl:call-template>
											</td>
											<!--December Indicator-->
											<td class="styTableCell" style="text-align:center;border-right:none;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/DecemberInd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Table Filler Rows -->
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 1 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											8
										</td>
										<td class="styTableCell" style="text-align:left;vertical-align:bottom;width:100%;border-bottom-width:0px;border-top-width:1px;">
											<span style="width:4px"/>
											<xsl:if test="((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8965Data/RequestExemptCvrTaxHsldGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 2 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											9
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 3 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											10
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 4 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											11
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 5 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											12
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form8965Data/RequestExemptCvrTaxHsldGrp) &lt; 6 or ((count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt;6) and ($Print = $Separated))">
									<tr style="height:12mm;">
										<td class="styTableCell" style="font-size:6pt;text-align:center;font-weight:bold;vertical-align:bottom;border-bottom-width:0px;border-top-width:1px;">
											13
										</td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-left-width:1px; border-right-width:2px;border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-bottom-width:0px;border-top-width:1px;"><br/></td>
										<td class="styTableCell" style="border-right:none;border-bottom-width:0px;border-top-width:1px;"><br/></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8965Data/RequestExemptCvrTaxHsldGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'FirmDiv2' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; font-size:7pt;border-top:2px solid black; padding-top:0.5mm;text-align:right;">
						<div style="float:left;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:10mm;"/>                        
							Cat. No. 37787G
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8965</span> (2014)
						</div>						
					</div>

					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="-1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8965Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>		
					
					<!-- Separated Data -->
					<xsl:if test="($Print = $Separated) and (count($Form8965Data/ObtndExemptCvrTaxHsldGrp) &gt; 6)">
						<span class="styRepeatingDataTitle">Part I - Marketplace-Granted Coverage Exemptions for Individuals</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styDepTblHdr">
								<tr>
									<th scope="col" class="styTableCell" style="border-right:1px solid black;border-bottom:1px solid black;"><div style="width:10mm;"><br/></div></th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<div style="width:80mm">a<br/>Name of Individual</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<div style="width:37mm">b<br/>SSN</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:none;border-bottom:1px solid black;">
										<div style="width:52.6mm;">c<br/>Exemption Certificate Number</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8965Data/ObtndExemptCvrTaxHsldGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCell" style="text-align:center;">
											<xsl:if test="position() &lt;= 6">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<!--Name-->
										<td class="styTableCell" style="width:100%;text-align:left;vertical-align:bottom;">		
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
										</td>					
										<!--SSN-->
										<td class="styTableCell" style="width:100%;text-align:center;vertical-align:bottom;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SSN"/>
											</xsl:call-template>
										</td>
										<!--Exemption Certificate Number-->
										<td class="styTableCell" style="width:100%;text-align:center;border-right:none;vertical-align:bottom;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExemptionCertificateNum"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form8965Data/RequestExemptCvrTaxHsldGrp) &gt; 6)">
						<br/>
						<span class="styRepeatingDataTitle">Part III - Coverage Exemptions for Individuals Claimed on Your Return</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styDepTblHdr">
								<tr>
									<th scope="col" class="styTableCell" style="border-right:1px solid black;border-bottom:1px solid black;"><div style="width:10mm;"><br/></div></th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;width:auto;">
										<div style="width:42mm;text-align:center;"><b>a</b><br/>Name of Individual</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;width:auto;">
										<div style="width:22mm;"><b>b</b><br/>SSN</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<div style="width:15mm;"><b>c</b><br/>Exemption<br/>Type</div>
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>d</b><br/>Full<br/>Year
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>e</b><br/>Jan
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>f</b><br/>Feb
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>g</b><br/>Mar
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>h</b><br/>Apr
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>i</b><br/>May
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>j</b><br/>June
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>k</b><br/>July
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>l</b><br/>Aug
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>m</b><br/>Sept
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>n</b><br/>Oct
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:1px solid black;border-bottom:1px solid black;">
										<b>o</b><br/>Nov
									</th>
									<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:bold;vertical-align:middle;border-right:none;border-bottom:1px solid black;">
										<b>p</b><br/>Dec
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8965Data/RequestExemptCvrTaxHsldGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCell" style="text-align:center;">
											<xsl:if test="position() &lt;= 6">
												<xsl:value-of select="position() + 7"/>
											</xsl:if>
										</td>
										<!--Name-->
										<td class="styTableCell" style="text-align:left;vertical-align:bottom;width:100%;">				
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>						
										</td>
										<!--SSN-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SSN"/>
											</xsl:call-template>						
										</td>
										<!--Exemption Reason Code-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExemptionReasonCd"/>
											</xsl:call-template>
										</td>
										<!--All Year Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AllYearInd"/>
											</xsl:call-template>
										</td>
										<!--January Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JanuaryInd"/>
											</xsl:call-template>
										</td>
										<!--February Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/FebruaryInd"/>
											</xsl:call-template>
										</td>
										<!--March Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/MarchInd"/>
											</xsl:call-template>
										</td>
										<!--April Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/AprilInd"/>
											</xsl:call-template>
										</td>
										<!--May Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/MayInd"/>
											</xsl:call-template>
										</td>
										<!--June Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JuneInd"/>
											</xsl:call-template>
										</td>
										<!--July Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/JulyInd"/>
											</xsl:call-template>
										</td>
										<!--August Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/AugustInd"/>
											</xsl:call-template>
										</td>
										<!--September Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/SeptemberInd"/>
											</xsl:call-template>
										</td>
										<!--October Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/OctoberInd"/>
											</xsl:call-template>
										</td>
										<!--November Indicator-->
										<td class="styTableCell" style="text-align:center;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/NovemberInd"/>
											</xsl:call-template>
										</td>
										<!--December Indicator-->
										<td class="styTableCell" style="text-align:center;border-right:none;vertical-align:bottom;width:100%;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MonthIndicatorGrp/DecemberInd"/>
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
</xsl:stylesheet>