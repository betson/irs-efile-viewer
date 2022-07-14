<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8912Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8912Data" select="$RtnDoc/IRS8912"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8912Data)"/>
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
				<meta name="Description" content="IRS Form 8912"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8912Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8912">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right:none;vertical-align:bottom;">
							Form <span class="styFormNumber">8912</span>
							<div class="styAgency" style="margin-top:1.8mm">
								<br/>						
        Department of the Treasury
      <br/>
        Internal Revenue Service
      </div>
</div>
<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
<div style="height:13.5mm;" class="styMainTitle">
								<br/>
		Credit to Holders of Tax Credit Bonds
      </div>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/8912_Bullet.gif" alt="Bullet Image"/>
        Attach to your tax return.    
      </div>
						</div>
						<div class="styTYBox" style="width:32mm;border-left:none;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-2025</div>
							<div class="styTaxYear">
          20<span class="styTYColor">10</span>
							</div>
							<div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">154</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Name and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
            Name(s) shown on return<br/>
							<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
<div class="styEINBox" style="width:46mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
<!-- BEGIN Part I Title -->
<!--Begin BondInformation Table Blank Form-->
<xsl:if test=" (count($Form8912Data/BondInformation) &lt; 1)">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName">Part I</div>
							<div class="styPartDesc" style="height:4mm;width:120mm;text-align:left">Current Year Credit</div>
						</div>
<!--Line 1a-->
	<div class="styBB" style="width:187mm;">
							<div class="styGenericDiv" style="width:187mm;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
							1a</div>
								<div class="styLNDesc" style="width:60mm;height:4.5mm;">
                           Bond issuer's name, city or town, and state 
<!--Dotted Line-->
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="border-left-width: 0px;height:4.5mm;font-size:7pt;width:118.5mm;">
			</div>
							</div>
<!--Line 1b Bond issuer's employer identification number-->
	<div class="styGenericDiv" style="width:187mm;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
							<span
							style="width:1.5mm"></span>b</div>
								<div class="styLNDesc" style="width:80mm;height:4.5mm;">
                    Bond issuer's employer identification number
                           <!--Dotted Line-->
                           <span style="letter-spacing:3.8mm;font-weight:bold;">....</span>
					<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="border-left-width: 0px;height:4.5mm;font-size:7pt;width:98mm;">
			</div>
							</div>
<!--Line 2a-->
							<div class="styBB" style="width:187mm;border-bottom-width: 0px;  ">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
								2a</div>
								<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond issued    
                          <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
						<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/DateBondIssued"/>
									</xsl:call-template>
								</div>
							</div>
<!--Line 2b Date bond matures-->
				<div class="styBB" style="width:187mm;border-bottom-width: 0px;  ">
				<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
								<span
							style="width:1.5mm"></span>b</div>
								<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                        Date bond matures  
                          <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
						<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
									<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondMaturityDt"/>
									</xsl:call-template>
								</div>
							</div>
<!--Line 3-->
	<div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									3</div>
								<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond disposed of (if applicable)     
                            <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">.....................</span>
									<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;border-bottom-width: 0px; ">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/DateBondDisposedOf"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END Part I Title -->
<div class="styTableContainer" id="CREYCtable1" style="border-bottom-width: 1px;height:0mm;width:187mm;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="font-size:7pt;border-color:black;height:76.4mm;" cellspacing="0" summary="Table displaying Bond payment information" name="CREYCtable1" id="CREYCtable1">
								<thead class="styTableThead">
									<tr>
<th scope="col" class="styTableCell" style="width:50mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;" colspan="2">
											<b>(a)</b>
<div class="styBB" style="width:50mm;border-bottom-width: 0px;text-align:left" >
CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.) 
</div>
</th>
<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(b)</b>
				<br/>Outstanding<br/> bond principal (or for build America bonds, interest payable)</th>
										<th scope="col" class="styTableCell" style="width:23mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(c)</b>
											<br/>Credit <br/>rate</th>
										<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(d)</b>
											<br/>Multiply<br/>(b) x (c)</th>
										<th scope="col" class="styTableCell" style="width:15mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(e)</b>
											<br/>% </th>
										<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(f)</b>
											<br/>Multiply <br/>(d) x (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
<xsl:if test="($Print != $Separated) or (count($Form8912Data/BondInformation) &lt;= 15)">
										<xsl:for-each select="BondCreditType">
											<tr>
												<td class="styTableCell" style="width:4mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<xsl:value-of select="4"/>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px;"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:45mm;text-align:center;">
												<xsl:if test="$Form8912Data/BondInformation/BondCreditType/CUSIPNumber">
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CUSIPNumber"/>
													</xsl:call-template>
														<span style="width:4px;"/>,
													</xsl:if>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PrinPaymentDates"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:23mm;text-align:center;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="CreditRate"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndgBondPrinCrdtRteAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:15mm;text-align:center;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="Percent"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CreditAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!--Blank lines-->
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 1 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:value-of select="4"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 2 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 3 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 4 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 5 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 6 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 7 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 8 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 9 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 10 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 11 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 12 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 13 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 14 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 15 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print != $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part I Line 5-->
						<div style="width:187mm; ">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">
								5</div>
							<div class="styLNDesc" style="width:139.60mm;height:4mm;float:left;padding-top:1mm;">
						 Add the amounts on line 4, column (f)
						 <span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
							5</div>
							<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/CreditSumAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 6 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
							6</div>
							<div class="styLNDesc" style="width:139.60mm;height:4.5mm;">
        For a <b>new </b> clean renewable energy bond or a qualified energy conservation bond, multiply the <br/>amount on line 5 by 70% (.70). For a clean renewable energy bond, Midwestern tax credit bond, <br/>qualified forestry conservation bond, qualified zone academy bond, qualified school construction <br/>bond, or build America bond, enter the amount from line 5. See the instructions for how to report <br/>as interest income  
         <!--Dotted Line-->
								<span style="letter-spacing:3.8mm;font-weight:bold;"> .................</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;height:17mm;padding-top:0mm;border-bottom-width: 1px;">
								<div style="width:6.50mm;border-left-width:0px;background-color:lightgrey;height:12mm;padding-top:0mm;"/>     
						6</div>
							<div class="styLNAmountBox" style="height:17mm;padding-top:12mm;width:32mm;font-size:7pt;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/CrComputationOrCrSumAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<!--end if Bond information is equal to 1 and less than 1-->
<!--if Bond information table is greater than 1 put in additional data section or display in form-->
					<xsl:if test=" ((count($Form8912Data/BondInformation) &gt; 1) and ($Print = $Separated))">
						<div class="styBB" style="width:187mm;">
							<div class="styPartName">Part I</div>
							<div class="styPartDesc">Current Year Credit</div>
						</div>
<!--Line 1a-->
<div class="styBB" style="width:187mm;">
<div style="width:187mm;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									1a</div>
<div class="styLNDesc" style="width:59mm;height:4.5mm;">
                           Bond issuer's name, city or town, and state<br/>
									<!--Dotted Line-->
									<xsl:if test="$Form8912Data/BondInformation/NameOfBondIssuer/BusinessNameLine2 != ''">
										<span style="letter-spacing:3.8mm;font-weight:bold;">.............</span>
										<br/>
									</xsl:if>
									<span style="letter-spacing:3.8mm;font-weight:bold;">.............</span>
									<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;border-left-width: 0px;height:8mm;padding-bottom:none;width:119.5mm;font-size:7pt;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
								</div>
							</div>
							<!--Line 1b-->
							<div style="width:187mm; ">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									b</div>
								<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                        Bond issuer's employer identification number   
                          <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
									<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondIssuerEIN"/>
									</xsl:call-template>
								</div>
							</div>
	<!--Line 2a -->
	<div style="width:187mm; ">
	<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									2a</div>
	<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond issued    
                          <!--Dotted Line-->
	<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
			<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/DateBondIssued"/>
			</xsl:call-template>
								</div>
							</div>
							<!--Line 2b -->
	<div style="width:187mm; ">
	<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									b</div>
	<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond matures 
                          <!--Dotted Line-->
	<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
			<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondMaturityDt"/>
			</xsl:call-template>
								</div>
							</div>
							<!--Line 3-->
							<div style="width:187mm;  ">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									3</div>
								<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond disposed of (if applicable)     
                            <!--Dotted Line-->
									<span style="letter-spacing:2.5mm;font-weight:bold;">.............................</span>
									<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
								</div>
								<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;border-bottom-width: 0px; ">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END Part I Title -->
						<div class="styTableContainer"  id="CREYCctn2" style="border-bottom-width: 0px;">
							<xsl:call-template name="SetInitialState"/>
							<table style="font-size:7pt;border-color:black;  " class="styTable" cellspacing="0" summary="Table displaying Bond payment information" name="CREYCtable2" id="CREYCtable2">
								<thead class="styTableThead">
									<tr>
										<th scope="col" class="styTableCell" style="width:50mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;" colspan="2">
											<b>(a)</b>
				<br/>CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.) </th>
										<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(b)</b>
											<br/>Outstanding<br/> bond principal (or for build America bonds, interest payable)</th>
										<th scope="col" class="styTableCell" style="width:23mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(c)</b>
											<br/>Credit <br/>rate</th>
										<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(d)</b>
											<br/>Multiply<br/>(b) x (c)</th>
										<th scope="col" class="styTableCell" style="width:15mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(e)</b>
											<br/>% </th>
										<th scope="col" class="styTableCell" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											<b>(f)</b>
											<br/>Multiply <br/>(d) x (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
						<xsl:if test="($Print != $Separated) or (count($Form8912Data/BondInformation/BondCreditType) &lt;16)">
										<xsl:for-each select="BondCreditType">
											<tr>
												<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<xsl:value-of select="4"/>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px;"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:45mm;text-align:center;">
													<xsl:if test="$Form8912Data/BondInformation/BondCreditType/CUSIPNumber">
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CUSIPNumber"/>
													</xsl:call-template>
														<span style="width:4px;"/>,
													</xsl:if>
														
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PrinPaymentDates"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:23mm;text-align:center;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="CreditRate"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndgBondPrinCrdtRteAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:15mm;text-align:center;">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="Percent"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:33mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CreditAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!--Blank lines-->
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 1 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:value-of select="4"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 2 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 3 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))or (count($Form8912Data/BondInformation) &lt; 2)">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 4 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))or (count($Form8912Data/BondInformation) &lt; 2)">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 5 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 6 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 7 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 8 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 9 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 10 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 11 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 12 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 13 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 14 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 15 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part I Line 5-->
						<div  style="width:187mm; ">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">
								5</div>
							<div class="styLNDesc" style="width:139.60mm;height:4mm;float:left;padding-top:1mm;">
						 Add the amounts on line 4, column (f)
						 <span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:7mm;height:5mm;padding-top:1mm;">
							5</div>
							<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:6pt;padding-top:1mm;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part I, Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
								6</div>
							<div class="styLNDesc" style="width:139.6mm;height:4.5mm;">
        For a <b>new </b> clean renewable energy bond or a qualified energy conservation bond, multiply the <br/>amount on line 5 by 70% (.70). For a clean renewable energy bond, Midwestern tax credit bond, <br/>qualified forestry conservation bond, qualified zone academy bond, qualified school construction <br/>bond, or build America bond, enter the amount from line 5. See the instructions for how to report <br/>as interest income  
         <!--Dotted Line-->
								<span style="letter-spacing:3.8mm;font-weight:bold;"> .................</span>
							</div>
							<div class="styLNRightNumBox" style="width:7mm;height:17mm;padding-bottom:none;padding-top:0mm;">
								<div class="" style="width:6.50mm;border-left-width:0px;background-color:lightgrey;height:12mm;padding-top:0mm;"/>     
						6</div>
							<div class="styLNAmountBox" style="height:17mm;padding-bottom:none;padding-top:12mm;width:32mm;font-size:6pt;border-bottom-width: 1px;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<!--end BondInformationTable-->
<!--Begin BondInformation Table Drawn Form For inline form for greater than 1-->
					<xsl:if test="($Print != $Separated) and (count($Form8912Data/BondInformation) &gt;= 1)">
						<xsl:for-each select="$Form8912Data/BondInformation">
							<table class="styTable" style="font-size:7pt;" cellspacing="0" summary="Table showing Bond Payment information" name="CYCtable" id="CYCtable">
								<thead class="styTableThead"/>
								<tfoot/>
								<tbody>
									<tr>
										<td class="styTableCellHeader" style="border-bottom-width: 0px;">
											<div class="styBB" style="border-top-width: 1px;width:187mm;">
												<div class="styPartName" style="height:4mm;width:15mm;">Part I</div>
					<div class="styPartDesc" style="height:4mm;width:120mm;text-align:left">Current Year Credit</div>
											</div>
										</td>
									</tr>
<tr>
<td class="styTableCell" style="text-align:left;border-bottom-width: 0px; border-style: solid; border-color: black;border-right-width: 0px;">
<!--Line 1-->
<div class="styGenericDiv" style="width:187mm;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
1a</div>
<div class="styLNDesc" style="width:59mm;height:4.5mm;">
                           Bond issuer's name, city or town, and state<br/>
													<!--Dotted Line-->
<xsl:if test="NameOfBondIssuer/BusinessNameLine2 != ''">
<span style="letter-spacing:3.8mm;font-weight:bold;">.............</span>
														<br/>
													</xsl:if>
													<span style="letter-spacing:3.8mm;font-weight:bold;">.............</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;border-left-width: 0px;height:8mm;padding-bottom:none;width:119.5mm;font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine1"/>
													</xsl:call-template>
													<xsl:if test="$Form8912Data/BondInformation/NameOfBondIssuer/BusinessNameLine2 != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="City"/>
													</xsl:call-template>,          
              <xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="State"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												</div>
											</div>
										</td>
									</tr>
									<tr>
<!--Line 1b-->
<td class="styTableCell" style="text-align:left;border-bottom-width: 0px; border-style: solid; border-color: black;border-right-width: 0px;">
<div class="styGenericDiv" style="width:187mm; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
<span style="width:2mm;"></span>b</div>
<div class="styLNDesc" style="width:109mm;height:4.5mm;text-align:left">
Bond issuer's employer identification number 
 <!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">...........</span>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:69mm;font-size:7pt;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
	</xsl:call-template>
</div>
</div>
</td>
</tr>
<tr>
<!--Line 2a-->
<td class="styTableCell" style="text-align:left;border-bottom-width: 0px; border-style: solid; border-color: black;border-right-width: 0px;">
<div class="styGenericDiv" style="width:187mm; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
2a</div>
<div class="styLNDesc" style="width:144mm;height:4.5mm;">
 Date bond issued    
 <!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="DateBondIssued"/>
	</xsl:call-template>
</div>
</div>
</td>
</tr>
<tr>
<!--Line 2b-->
<td class="styTableCell" style="text-align:left;border-bottom-width: 0px; border-style: solid; border-color: black;border-right-width: 0px;">
<div class="styGenericDiv" style="width:187mm; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
<span style="width:2mm;"></span>b</div>
<div class="styLNDesc" style="width:144mm;height:4.5mm;">
Date bond matures
 <!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
	</xsl:call-template>
</div>
</div>
</td>
</tr>
									<tr>
										<td class="styTableCell" style="text-align:left;border-bottom-width: 1px; border-style: solid; border-color: black;border-right-width: 0px;">
											<!--Line 3-->
											<div class="styGenericDiv" style="width:187mm;  ">
												<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
												3</div>
												<div class="styLNDesc" style="width:144mm;height:4.5mm;">
                         Date bond disposed of (if applicable)     
                            <!--Dotted Line-->
													<span style="letter-spacing:2.5mm;font-weight:bold;">.............................</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:35mm;font-size:7pt;border-bottom-width: 0px; ">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateBondDisposedOf"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
<table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CREYCtable" id="CREYCtable">
								<thead class="styTableThead">
									<tr style="width:187mm;">
										<th scope="col" class="styTableCellHeader" style="width:50mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 1px;border-bottom-width: 0px; " colspan="2">
											<b>(a)</b>
				<br/>CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.) </th>
										<th scope="col" class="styTableCellHeader" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 1px;border-bottom-width: 0px; ">
											<b>(b)</b>
											<br/>Outstanding<br/> bond principal (or for build America bonds, interest payable)</th>
										<th scope="col" class="styTableCellHeader" style="width:23mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 1px;border-bottom-width: 0px; ">
											<b>(c)</b>
											<br/>Credit <br/>rate</th>
										<th scope="col" class="styTableCellHeader" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 1px;border-bottom-width: 0px; ">
											<b>(d)</b>
											<br/>Multiply<br/>(b) x (c)</th>
										<th scope="col" class="styTableCellHeader" style="width:15mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 1px;border-bottom-width: 0px; ">
											<b>(e)</b>
											<br/>% </th>
										<th scope="col" class="styTableCellHeader" style="width:33mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-color: black;border-right-width: 0px;border-bottom-width: 0px; ">
											<b>(f)</b>
											<br/>Multiply <br/>(d) x (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="BondCreditType">
										<tr style="width:187mm;">
											<td class="styTableCell" style="width:4mm;font-size:7pt;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 0px;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<!--<xsl:value-of select="position()"/> --> 4
		              </xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell" style="width:40mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
											<xsl:if test="$Form8912Data/BondInformation/BondCreditType/CUSIPNumber">
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CUSIPNumber"/>
													</xsl:call-template>,
														<span style="width:2px;"/>
													</xsl:if>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="PrinPaymentDates"/>
													</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:35mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<div style="text-align:right">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCell" style="width:17mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="CreditRate"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:35mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OutstndgBondPrinCrdtRteAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:17mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="Percent"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:35mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CreditAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<!--Blank lines-->
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 1 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:value-of select="4"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
												<span style="width:1px;"/>
											</td>
<td class="styTableCell" style="width:45mm;text-align:center;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form8912Data/BondInformation/BondCreditType"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:33mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;border-bottom-width: 0px; border-top-width: 1px;border-style: solid; border-color: black;border-right-width: 1px;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 2 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 3 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))or (count($Form8912Data/BondInformation) &lt; 2)">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 4 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))or (count($Form8912Data/BondInformation) &lt; 2)">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 5 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 6 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 7 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 8 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 9 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 10 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 11 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 12 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 13 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 14 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation/BondCreditType)&lt; 15 or ((count($Form8912Data/BondInformation/BondCreditType) &gt; 15) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:5mm;font-size:6pt;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:45mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:23mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:15mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:33mm;">
												<span style="width:1px;"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
							<table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CYtable" id="CYtable">
								<tbody>
									<tr>
										<!-- Part I Line 5-->
<td class="styTableCell" style="text-align:left;border-bottom-width:0px;border-top-width:1px;border-style:solid; border-color: black;border-right-width: 0px;">
				<div style="width:187mm;padding-top:0mm;">
					<div class="styLNLeftNumBoxSD" style="height:5mm;">
													5</div>
				<div class="styLNDesc" style="width:139.6mm;height:5mm;">
						 Add the amounts on line 4, column (f)
						 <span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
				</div>
					<div class="styLNRightNumBoxNBB" style="width:6.5mm;height:5mm;border-bottom-width: 1px;">
							5</div>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;border-bottom-width: 1px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CreditSumAmt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Part I, Line 6 -->
<td class="styTableCell" style="padding-top:0mm;text-align:left;border-bottom-width: 0px; border-style: solid; border-color: black;border-right-width: 0px;">
<div class="styBB" style="width:187mm;padding-top:0mm;">
<div class="styLNLeftNumBoxSD" style="height:17mm;">
													6</div>
<div class="styLNDesc" style="width:139.6mm;height:17mm;">
       For a <b>new </b> clean renewable energy bond or a qualified energy conservation bond, multiply the <br/>amount on line 5 by 70% (.70). For a clean renewable energy bond, Midwestern tax credit bond, <br/>qualified forestry conservation bond, qualified zone academy bond, qualified school construction <br/>bond, or build America bond, enter the amount from line 5. See the instructions for how to report <br/>as interest income  
         <!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> ..........................</span>
												</div>
<div style="width:39mm;height:17mm;float:left;clear:none">
<div class="styLNRightNumBox" style="width:6.5mm;background-color:lightgrey;height:12mm;padding-top:0mm;border-bottom-width: 0px;"/>    
<div class="styLNAmountBox" style="height:12mm;padding-top:0mm;width:32mm;border-bottom-width: 0px;"/>
<div class="styLNRightNumBoxNBB" style="width:6.5mm;height:5mm;border-bottom-width: 1px;padding-top:0mm;">
						6</div>
	<div class="styLNAmountBox" style="height:5mm;width:32mm;padding-top:0mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CrComputationOrCrSumAmt"/>
													</xsl:call-template>
												</div>			</div>	
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:if>
					<!-- Part I, Line 7 -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">
						7</div>
						<div class="styLNDesc" style="width:139.9mm;height:4mm;">
          Enter the line 6 amount from page 1 of Form 8912 for each additional bond, if more than one (see <br/>
          instructions) 
        <!--Dotted Line-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8912Data/OtherBondCreditTotalAmt"/>
							</xsl:call-template>
							<span style="letter-spacing:3.8mm;font-weight:bold;"> .........................</span>
						</div>
			<div class="styLNRightNumBox" style="width:6.4mm;height:9mm;padding-top:0mm;">
							<div class="" style="width:6.4mm;border-left-width:0px;background-color:lightgrey;height:5mm;"/>          
          7
        </div>
						<div class="styLNAmountBox" style="height:9mm;width:32mm;font-size:7pt;border-top:1px;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/OtherBondCreditTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 8 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">
							8</div>
						<div class="styLNDesc" style="width:139.9mm;height:4mm;">
        Bond credits from partnerships, S corporations, estates, and trusts.    
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> ..........</span>
						</div>
						<div class="styLNRightNumBox" style="width:6.7mm;height:4mm;padding-bottom:none;">8</div>
						<div class="styLNAmountBox" style="height:4.0mm;padding-bottom:none;width:32mm;font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/BondCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 9 -->
					<div class="styGenericDiv" style="width:187mm; float:none;clear:both;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">
					9</div>
						<div class="styLNDesc" style="width:139.9mm;height:4mm;">
     Carryforward of credits for qualified tax credit bonds and build America bonds to 2010 (see instructions) 
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"/>
						</div>
						<div class="styLNRightNumBox" style="width:6.7mm;height:4mm;padding-bottom:none;">9</div>
						<div class="styLNAmountBox" style="height:4.0mm;padding-bottom:none;width:32mm;font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/CreditCarryforwardFromPYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 10 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4mm;">
						10</div>
						<div class="styLNDesc" style="width:139.9mm;height:4mm;">
							<b>Total credit.</b> Add lines 6 through 9. Estates and trusts figuring the credit for a clean renewable energy <br/>
						bond or Midwestern tax credit bond, go to line 11: partnerships and S corporations, report this amount on
						Schedule K; all others, go to Part II.   
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> .............</span>
						</div>
						<div class="styLNRightNumBox" style="width:6.4mm;height:10.5mm;padding-bottom:none;padding-top:0mm;">
							<div class="" style="width:6.4mm;border-left-width:0px;background-color:lightgrey;height:6mm;padding-top:0mm;"/>          
						10</div>
						<div class="styLNAmountBox" style="height:10.5mm;padding-bottom:none;padding-top:6mm;width:32mm;font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/TotalCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 11 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">
						11</div>
						<div class="styLNDesc" style="width:139.9mm;height:5mm;">Amount allocated to the beneficiaries of the estate or trust (see instructions)  
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> ........</span>
						</div>
						<div class="styLNRightNumBox" style="width:6.7mm;height:5mm;padding-bottom:none;padding-top:1mm;">11</div>
						<div class="styLNAmountBox" style="height:5mm;padding-bottom:none;width:32mm;font-size:7pt;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/AmtAllocatedBeneficiariesEstTr"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I, Line 12 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">
						12</div>
						<div class="styLNDesc" style="width:139.9mm;height:4mm;">
							<b> Estates and trusts.</b> Subtract line 11 from line 10. Use this amount to complete Part II
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> ......</span>
						</div>
						<div class="styLNRightNumBox" style="width:6.7mm;height:5mm;padding-bottom:none;padding-top:1mm; border-bottom-width: 0px;">12</div>
						<div class="styLNAmountBox" style="height:5mm;padding-bottom:none;width:32mm;font-size:7pt;padding-top:1mm; border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/EstTrCYBondCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Part I -->
					<!--Page end-->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="width:110px;"/>                      
      Cat. No. 37722B
      <span style="width:130px;"/>  
      Form <span class="styBoldText">8912</span>(2010)
    </div>
					<br class="pageend"/>
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8912 (2010)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Allowable Credit</div>
					</div>
					<!-- END Part II Title -->
					<!-- Part II, Line 13 -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm">
							<div class="styLNLeftNumBox ">13</div>
							<div style="float:left;">
         Regular tax before credits:
          </div>
			<div style="float:right">
	<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
<div style="width:187mm">
<div class="styLNLeftNumBox"/>
							<div style="float:left">
<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/> Individuals. Enter the amount from Form 1040, line 44 or Form 1040NR, line 42</div>
<div style="float:right">
								<span class="styDotLn">.....<span style="width:7px;"/>
								</span>
								<div class="styIRS8912LNLeftNumBox" style="position:relative;width:4mm;">
					<span style="z-index:1;position:absolute;top:8px;right:2mm;">
		<img src="{$ImagePath}/8912_Bracket_Lger.gif" alt="Curly Bracket Image"/>
									</span>
								</div>
<div class="styIRS8912LNLeftNumBox" style="position:relative;width:2mm;">
				<span style="z-index:1;position:absolute;top:8px;right:2mm;">				
									</span>
								</div>
<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
      Corporations. Enter the amount from Form 1120, Schedule J, line 2, or the applicable line
     </div>
							<div style="float:right">
								<div class="styIRS8912LNLeftNumBox" style="width:15mm;"/>
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<div style="width:187mm;height:4.5mm;">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
       of your return  
     </div>
							<div style="float:right">
								<span class="styDotLn" style="">.............................<span style="width:7px;"/>
								</span>
								<div class="styIRS8912LNRightNumBox" style="height:4.50mm;padding-top:0.80mm;">13</div>
								<div class="styIRS8912LNAmountBox" style="font-size:7pt;height:4.50mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/RegularTaxBeforeCredit"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>  Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G, lines 1a 
       </div>
							<div style="float:right">
								<div class="styIRS8912LNLeftNumBox" style="width:15mm;"/>
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
    and 1b, or the amount from the applicable line of your return
     </div>
							<div style="float:right">
								<span class="styDotLn">............<span style="width:15px;"/>
								</span>
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<!-- Part II, Line 14 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox ">14</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<div style="float:left;">
         Alternative minimum tax:
          </div>
							</div>
							<div style="float:right">
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;;height:4.5mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/> Individuals. Enter the amount from Form 6251, line 35
     </div>
							<div style="float:right">
								<span class="styDotLn">..............</span>
								<div class="styIRS8912LNLeftNumBox" style="position:relative;width:2mm;">
									<span style="z-index:1;position:absolute;right:2mm;">
										<img src="{$ImagePath}/8912_Bracket_md.gif" align="top" alt="Curly Bracket Image"/>
									</span>
								</div>
								<div class="styIRS8912LNLeftNumBox" style="position:relative;width:2mm;">
									<span style="z-index:1;position:absolute;top:8px;right:2mm;">
																			</span>
								</div>
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
      Corporations. Enter the amount from Form 4626, line 14
   </div>
							<div style="float:right">
								<span class="styDotLn">..............<span style="width:9px;"/>
								</span>
								<div class="styIRS8912LNRightNumBox" style="height:4.5mm;padding-top:0.70mm;">14
      </div>
								<div class="styIRS8912LNAmountBox" style="font-size:7pt;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/AlternativeMinimumTax"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>  Estates and trusts. Enter the amount from Schedule l (Form 1041) line 56
       </div>
							<div style="float:right">
								<span class="styDotLn">........<span style="width:9px;"/>
								</span>
								<div class="styIRS8912LNRightNumBox" style="background-color:lightgrey;border-bottom:0;height:4.5mm;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						<!-- Part II, Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<div style="float:left;">
          Add line 13 and line 14
          </div>
								<div style="float:right;">
									<!--Dotted Line-->
									<span style="letter-spacing:3.5mm;font-weight:bold;">.........................</span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;">    
        15
     </div>
							<div class="styLNAmountBox" style="height:5mm;font-size:7pt;width:33mm;">
								<span style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/SumRegularTaxAndAMT"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Part II, Line 16a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">16a</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">					
        Foreign tax credit   
             </div>
								<div style="float:right;">
									<!--Dotted Line-->
									<span style="letter-spacing:3.5mm;font-weight:bold;">.................</span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16a</div>
							<div class="styLNAmountBox" style="height:4.5mm;font-size:7pt;">
								<span style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/ForeignTaxCredit"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 16b -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1.4mm;"/>b</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
          Personal credits from Form 1040 or 1040NR (see instructions)  
             <span class="styBoldText">
										<span class="styNBSP"/>.
        <span class="styNBSP"/>.
       
      </span>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-top:0mm;border-bottom:1px black solid;">
								
          	16b
        </div>
							<div class="styLNAmountBox" style="height:4.5mm;font-size:7pt;padding-top:0mm;">
								<span style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/CreditsFromOtherForms"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 16c -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1.4mm;"/>c</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
            General business credit (see instructions)
            </div>
								<div style="float:right;">
									<!--Dotted Line-->
									<span style="letter-spacing:3.5mm;font-weight:bold;"/>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16c</div>
							<div class="styLNAmountBox" style="height:4.5mm;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/GeneralBusinessCredit"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
						</div>
						<!-- Part II Line 16d -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1.4mm;"/>d</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
        Credit for prior year minimum tax (Form 8801, line 25; or Form 8827, line 8b)
        <span class="styBoldText">
		<span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
         <span class="styNBSP"/>.
        <span class="styNBSP"/>.
           <span class="styNBSP"/>.
      </span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">16d</div>
							<div class="styLNAmountBox" style="height:8mm;font-size:7pt;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/CreditForPriorYearMinimumTax"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 16e -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">
								<span style="width:1.4mm;"/>e</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<div style="float:left;">
         Add lines 16a through 16d
          </div>
								<div style="float:right;">
									<!-- Dotted Line -->
									<span style="letter-spacing:3.5mm;font-weight:bold;">........................</span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16e</div>
							<div class="styLNAmountBox" style="height:4.5mm;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/TotalOfCredits"/>
								</xsl:call-template>
							</div>
							
						</div>
						<!-- Line Part II, Line 17 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4.5mm;">17</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<div style="float:left;">
            Net income tax. Subtract line 16e from line 15
          </div>
								<div style="float:right;">
									<!--Dotted Line-->
									<span style="letter-spacing:3.5mm;font-weight:bold;">..................</span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17
      </div>
							<div class="styLNAmountBox" style="height:4.5mm;font-size:7pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/NetIncomeTax"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part II, Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;text-align:justified;padding-right:2mm; ">
								<span class="styBoldText">Credit to holders of tax credit bonds allowed for the current year.</span> Enter the 
<span class="styBoldText">smallest</span> of line<br/>
10, line 17, or the amount as limited by the formula in the instructions for line 18 (if line 18 is smaller
than line 10, see instructions).
<span class="styBoldText"> Estates and trusts,</span> enter the <span class="styBoldText">smallest</span> of line 12, line 17, or the<br/> amount as limited by the formula in the instructions for line 18 (if line 18 is smaller than line 12, see
instructions). Report this amount on Form 1040, line
53 or Form 1040NR, line 50; Form 1120,<br/> Schedule J, line 5e; Form 1041, Schedule G, line 2d; or
the applicable line of your return            
<!--Dotted Line-->
								<span style="letter-spacing:3.5mm;font-weight:bold;">.....</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:20mm;padding-top:0mm;border-bottom:0px black solid;">
								<div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top:1mm; height:15mm;border-left-width:0px;background-color:lightgrey;">
								
								</div>
          	18
        </div>
							<div class="styLNAmountBoxNBB" style="height:20mm;border-bottom:0px black solid;font-size:7pt;">
								<span style="vertical-align:baseline;height:100%;"/>
								<span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/CYAllowableCr"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<span class="styBoldText"/>
						<span style="width:190px;"/>
						<span style="width:426px;"/>  
      Form <span class="styBoldText">8912</span>(2010)
    </div>
					<br class="pageend"/>
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
							<xsl:with-param name="TargetNode" select="$Form8912Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Begin Separated Repeating data table -->
					<!-- Separated Data for Section B -->
					<xsl:if test="($Print = $Separated) and (count($Form8912Data/BondInformation) &gt; 1)">
						<span class="styRepeatingDataTitle">Form 8912 - Part 1 Current Year Credit</span>
						<br/>
						<xsl:for-each select="$Form8912Data/BondInformation">
							<table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table showing Bond Payment information" name="CYCtable" id="CYCtable">
								<thead class="styTableThead"/>
								<tfoot/>
								<tbody>
									<tr>
										<!-- Define background colors to the rows -->
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
<xsl:otherwise>styDepTblRow2</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
										<td class="styDepTblCell" style="border-bottom-width: 0px;">
											<div class="styBB" style="border-top-width: 1px;width:182mm;">
												<div class="styPartName" style="height:4mm;width:15mm;">Part I</div>
												<div class="styPartDesc" style="height:4mm;width:120mm;text-align:left">Current Year Credit</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="border-top-width: 0px;text-align:left;">
											<!--Line 1a-->
											<div class="styLNLeftNumBox" style="height:8mm;width:4mm;">
												1a</div>
											<div class="styLNDesc" style="width:59mm;height:8mm;padding-left:2mm;">
                           Bond issuer's name, city or town, and state<br/>
												<!--Dotted Line-->
												<xsl:if test="$Form8912Data/BondInformation/NameOfBondIssuer/BusinessNameLine2 != ''">
													<span style="letter-spacing:3.8mm;font-weight:bold;">.............</span>
													<br/>
												</xsl:if>
												<span style="letter-spacing:3mm;font-weight:bold;">..............</span>
												<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
											</div>
											<div class="styIRS8912TextBox" style="text-align: left;border-left-width: 0px;height:8mm;padding-bottom:none;width:119.5mm;font-size:7pt;padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="$Form8912Data/BondInformation/NameOfBondIssuer/BusinessNameLine2 != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine2"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="City"/>
												</xsl:call-template>,          
              <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="State"/>
												</xsl:call-template>
												<span style="width:1mm;"/>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--Line 1b-->
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styGenericDiv" style=" ">
												<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">
												b</div>
												<div class="styLNDesc" style="width:154mm;height:4.5mm;padding-left:2mm;">
                        Bond issuer's employer identification number  
                          <!--Dotted Line-->
													<span style="letter-spacing:3.8mm;font-weight:bold;">...................</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:22mm;font-size:7pt;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
										<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--Line 2a-->
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styGenericDiv" style=" ">
												<div class="styLNLeftNumBox" style="height:3.5mm;width:4mm;">
												2a</div>
												<div class="styLNDesc" style="width:144mm;height:3.5mm;padding-left:2mm;padding-top:2mm;">
                         Date bond issued    
                          <!--Dotted Line-->
													<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;height:3.5mm;padding-bottom:none;width:32mm;font-size:7pt;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateBondIssued"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--Line 2b-->
										<td class="styDepTblCell" style="text-align:left;">
											<div class="styGenericDiv" style=" ">
												<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">
												b</div>
												<div class="styLNDesc" style="width:144mm;height:4.5mm;padding-left:2mm;">
                      Date bond matures    
                          <!--Dotted Line-->
													<span style="letter-spacing:3.8mm;font-weight:bold;">........................</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:32mm;font-size:7pt;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<!--Line 3-->
											<div class="styGenericDiv" style=" ">
												<div class="styLNLeftNumBox" style="height:4.5mm;width:4mm;">
												3</div>
												<div class="styLNDesc" style="width:144mm;height:4.5mm;padding-left:2mm;">
                         Date bond disposed of (if applicable)     
                            <!--Dotted Line-->
													<span style="letter-spacing:2.5mm;font-weight:bold;">.............................</span>
													<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
												</div>
												<div class="styIRS8912TextBox" style="text-align: left;height:4.5mm;padding-bottom:none;width:32mm;font-size:7pt;border-bottom-width: 0px; ">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateBondDisposedOf"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Table expand/collapse toggle button -->
							<div class="styGenericDiv" style="float:right;height:1mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="BondCreditType"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CREYCctn' "/>
								</xsl:call-template>
							</div>
							<table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CREYCtable" id="CREYCtable">
								<thead class="styTableThead">
									<tr class="styDepTblHdr" style="width:187mm;">
										<th scope="col" class="styDepTblCell" style="width:40mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top;" colspan="2">(a)<br/>CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.) </th>
										<th scope="col" class="styDepTblCell" style="width:35mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b)<br/>Outstanding<br/> bond principal (or for build America bonds, interest payable)</th>
										<th scope="col" class="styDepTblCell" style="width:17mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(c)<br/>Credit <br/>rate</th>
										<th scope="col" class="styDepTblCell" style="width:35mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(d)<br/>Multiply<br/> (b) x (c)</th>
										<th scope="col" class="styDepTblCell" style="width:17mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(e)<br/>% </th>
										<th scope="col" class="styDepTblCell" style="width:35mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(f)<br/>Multiply <br/>(d) x (e)</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="BondCreditType">
										<tr style="width:187mm;">
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="width:5mm;font-size:7pt;border-right:none;font-weight:bold;vertical-align:top;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<!--<xsl:value-of select="position()"/> --> 4
		              </xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styDepTblCell" style="border-left:none;width:40mm;text-align:center;font-size:6pt;font-weight:normal;font-family:verdana">
												<xsl:if test="$Form8912Data/BondInformation/BondCreditType/CUSIPNumber">
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CUSIPNumber"/>
													</xsl:call-template>,
														<span style="width:2px;"/>
													</xsl:if>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="PrinPaymentDates"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:35mm;font-weight:normal;">
												<div style="text-align:right">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styDepTblCell" style="width:17mm;text-align:center">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="CreditRate"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:35mm;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OutstndgBondPrinCrdtRteAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:17mm;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="Percent"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:35mm;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CreditAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CYtable" id="CYtable">
								<tbody>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- Part I Line 5-->
										<td class="styDepTblCell" style="width:182mm;height:4mm;text-align:left;padding-top:0mm;padding-bottom:0mm;">
											<div class="styGenericDiv" style="width:182mm; ">
												<div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;width:4mm;">
													<span style="width:1mm;"/>5</div>
												<div class="styLNDesc" style="width:138mm;height:4mm;float:left;padding-top:1mm;padding-left:2mm;">
						 Add the amounts on line 4, column (f)
						 <span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
												</div>
												<div class="styLNRightNumBox" style="width:7mm;height:6mm;padding-top:1mm;border-bottom-width: 0px;">
							5</div>
												<div class="styLNAmountBox" style="height:6mm;padding-bottom:0mm;;width:32mm;font-size:7pt;padding-top:1mm;border-bottom-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CreditSumAmt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- Part I, Line 6 -->
										<td class="styDepTblCell" style="text-align:left;padding-top:0mm;height:8mm;padding-bottom:0mm;;">
											<div class="styGenericDiv" style="width:182mm;">
												<div class="styLNLeftNumBox" style="height:8mm;width:4mm;text-align:top;">
													<span style="width:1mm;"/>6</div>
												<div class="styLNDesc" style="width:138mm;height:8mm;padding-left:2mm;">
        For a <b>new </b> clean renewable energy bond or a qualified energy conservation bond, multiply the <br/>amount on line 5 by 70% (.70). For a clean renewable energy bond, Midwestern tax credit bond, <br/>qualified forestry conservation bond, qualified zone academy bond, qualified school construction <br/>bond, or build America bond, enter the amount from line 5. See the instructions for how to report <br/>as interest income  
         <!--Dotted Line-->
													<span style="letter-spacing:3.8mm;font-weight:bold;"> ..................</span>
												</div>
												<div class="styLNRightNumBox" style="width:7mm;height:17mm;padding-bottom:none;padding-top:0mm;border-bottom-width: 0px;">
													<div class="" style="width:6.50mm;border-left-width:0px;background-color:lightgrey;height:12mm;padding-top:0mm;border-bottom-width: 0px;"/>     
						6</div>
												<div class="styLNAmountBox" style="height:17mm;padding-bottom:none;padding-top:12mm;width:32mm;font-size:7pt;border-bottom-width: 0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CrComputationOrCrSumAmt"/>
													</xsl:call-template>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<br class="pageend"/>
						</xsl:for-each>
					</xsl:if>
					<!-- /Separated Data for Part 1-->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
