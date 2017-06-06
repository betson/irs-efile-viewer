<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065BScheduleK1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065BSchK1Data" select="$RtnDoc/IRS1065BScheduleK1"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065BSchK1Data)"/>
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
				<meta name="Description" content="IRS Form 1065-B Schedule K-1"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065BScheduleK1Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065BSchK1">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Void and Corrected Check Boxes -->
					<div class="styBB" style="width:187mm;border-bottom:none;">
						<span style="width:2mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:30mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
								</xsl:call-template>CORRECTED
                            </label>
						</span>
						<span style="width:19mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:61mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
								</xsl:call-template> PUBLICLY TRADED PARTNERSHIP
                            </label>
						</span>
						<!--<span style="font-size: 6pt;">(99)</span>-->
					</div>
					<!-- End Void and Corrected Check Boxes -->
					<!--copy start-->
					<div class="styBB" style="width:187mm;height:26mm;border-top:none;">
						<!-- Name and address box -->
						<div class="styIRS1065BSchK1leftBox" style="width:83mm;height:26mm;border-top:1px solid black;">
							<span style="width:4px;"/>
							<span style="font-size: 6pt">PARTNERSHIP’S name, street address, city, state, and ZIP code.</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
							</xsl:call-template>
							<br/>														
						</div>
						<!-- Form Title and Info box -->
						<div class="styIRS1065BSchK1leftBox" style="width:37mm;height:8mm;border-top:1px solid black;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">1</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								<span style="width:14px;"/>
								<span style="font-size: 6pt;">passive activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossPassiveActy"/>
									</xsl:call-template>
								</span>
							</span>
							<br/>
							<span class="styIRS1065BSchK1leftBox" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">2</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								
								<span style="width:14px;"/>								
								<span style="font-size: 6pt;">other activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossOtherActy"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<!-- Year and Form Box -->
						<div class="styIRS1065BSchK1rightBox" style="width:37.5mm;height:20mm;text-align:right;border-right:none;border-top:none;border-left:none;">
							<br/>
							<span style="font-size:10pt;font-weight:bold;padding-left:6mm;">Partner’s Share of Income (Loss) From an Electing Large Partnership</span>
						</div>
						<div class="styIRS1065BSchK1rightBox" style="width:29mm;height:26mm;text-align:center;border-top:1px solid black;">
							<span style="font-size: 6pt">OMB No. 1545-1626</span>
							<br/>
							<!--<span style="padding-top:4mm;height:auto;">james-->
								<div class="styTY" style="padding-top:3mm;font-size:26;">20<span class="styTYColor">08                       
                                 </span>
								</div>
								<br/>
							<!--</span>james-->
							<span class="styFN" style="font-size:7pt;font-weight:bold;">Schedule K-1 <br>(Form 1065-B)
                             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data"/>
								</xsl:call-template></br>
							</span>
						</div>
					</div>
					
					<div style="width:187mm;height:40mm;">
						<!-- Left boxes (Identification Number, Shareholder's ID, Shareholder's Name and Info) -->
						<div style="width:83mm;height:38mm;float:left;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:43mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNERSHIP’S Employer I.D. number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:39.5mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S identifying number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerSSN!=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerSSN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerEIN!=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/MissingSSNEINReason!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/MissingSSNEINReason"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:12mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S name</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine1"/>
								</xsl:call-template>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine2"/>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:17.5mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">Street address (including apt. no.)</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">City, state, and ZIP code</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress"/>
								</xsl:call-template>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/Country"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							
<!--Partner’s share of liabilities Box-->							
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-bottom:.5mm;padding-left:4px;height:15mm;width:83mm;">
								<span style="font-size: 6pt">Partner’s share of liabilities:</span>
								<br/>
								<span style="width:48mm">
									<span class="styBoldText">a</span>
									<span style="width:4px;"/>Nonrecourse
                                    <span class="styBoldText">
										<span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span> 
    $
                                <span style="border-bottom:solid black 1;text-align:right;width:29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Nonrecourse"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">b</span>
									<span style="width:4px;padding-bottom:2mm;"/>Qualified nonrecourse financing
          <span class="styBoldText">
										
                                    </span>
								</span> 
    $
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedNonrecourseFinancing"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">c</span>
									<span style="width:4px;padding-bottom:2mm;"/>Other
                                    <span class="styBoldText">
						<span style="width:16px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span>
    $ 
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/ShareOfLiabilitiesOther"/>
									</xsl:call-template>
								</span>
								
							</span>
							<!--
                            <span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-left:4px;height:9.5mm;width:87mm">
                                <span style="font-size: 6pt;">Tax shelter registration number</span>
                                <br/>
                                <span style="padding-top:2mm;width:40mm;float:bottom;text-align:right">
                                    <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxShelterRegistration"/>
                                    </xsl:call-template>
                                </span>
                            </span>
                            -->
						</div>
						<!-- Middle Boxes (1a, 1b, 1c,...) -->
						<!-- Tanuja - Removed two elements PostMay5Gain, Qualified5YearGain as part of CR-80 Schema updates and also renumbered the fields accordingly-->
						<div style="width:75mm;height:40mm;float:left;">
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">3</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Qualified dividends</span>
									<span style="padding-top:4mm;width:32mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedDividends"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;background-color:gray;width:37.4mm;border-right-width:1"/>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4a</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss) from</span>
									<span style="width:19px;"/>
									<span style="font-size: 6pt;">passive activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossPassiveActy"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4b</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss)</span>
									
									<span style="width:6mm;"/>
									<span style="font-size: 6pt;">from other activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossOtherActy"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">5</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net passive AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetPassiveAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">6</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net other AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetOtherAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">7</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">General credits</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/GeneralCredits"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">8</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Low-income housing credit</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/LowIncomeHousingCredit"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:42.8mm;width:75mm;float:left;border-right-width:1">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">9</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Other 
            <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Other"/>
									</xsl:call-template>
								</span>
								<br/>
								<xsl:for-each select="$Form1065BSchK1Data/Other/Item">
									<span style="width:68mm;padding-left:1mm">
										<span style="width:33mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Code"/>
											</xsl:call-template>
										</span>
										<span style="width:33mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</span>
									</span>
								</xsl:for-each>
							</span>
						</div>
						<!-- copy end-->
						<!-- Stylesheet will always show only Copy B box as per customer request -->
						<div style="width:29mm;height:70mm;float:left;text-align:right;padding-bottom:0mm">
							<span class="styIRS1065BSchK1rightBoxWithBottom" style="height:83.3mm;width:29mm;float:left;padding-bottom:0mm;border-left-width:0;border-right-width:0;">
								<div style="font-size: 9pt;font-weight:bold;height:6mm;padding-top:1mm;padding-bottom:3mm">Copy A</div>
								<span class="styBoldText" style="font-size: 7.5pt;">For 
        <br>Internal Revenue</br>
        Service Center
        </span>
								<br/>        
								<span class="styBoldText" style="font-size:6pt;">File with Form 1065-B.</span>
								<br/>
								<span style="font-size:6.5pt;text-align:right;">
      <br>For  Paperwork</br>
      Reduction Act
      <br>Notice and</br>
      instructions for
      completing this
      <br>form, see the</br>
		<span class="styBoldText">2008 Instructions
      <br>or Form 1065-B,</br></span>
									
      U.S. Return of
      <br>Income for Electing</br>
      Large Partnerships.
      </span>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<span style="font-weight:bold;width:82mm;font-size:8pt">Schedule K-1 (Form 1065-B)</span>
						<span style="width:45mm;font-size: 6pt;">Cat. No. 25437H</span>
						<span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
						<br/>
						<span style="width:187mm;text-align:center;font-size:8pt;padding-top:1mm;" class="StyBoldText">Do NOT Cut or Separate Forms on This Page</span>
					</div>
					<br/>
					<div class="pageEnd" style="width:187mm;"/>
				</form>
			</body>
			<!--	End of A	-->
			
			
			<!--Begin Part B-->
			<body class="styBodyClass">
				<form name="Form1065BSchK1">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Void and Corrected Check Boxes -->
					<div class="styBB" style="width:187mm;border-bottom:none;">
						<span style="width:2mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:40mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
								</xsl:call-template>CORRECTED<span style="font-size: 8pt;"> (if checked)</span>
                            </label>
						</span>
						<span style="width:15mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:85mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
								</xsl:call-template> PUBLICLY TRADED PARTNERSHIP<span style="font-size: 8pt;"> (if checked)</span>
                            </label>
						</span>
						<!--<span style="font-size: 6pt;">(99)</span>-->
					</div>
					<!-- End Void and Corrected Check Boxes -->
					<!--copy start-->
					<div class="styBB" style="width:187mm;height:26mm;border-top:none;">
						<!-- Name and address box -->
						<div class="styIRS1065BSchK1leftBox" style="width:83mm;height:26mm;border-top:1px solid black;">
							<span style="width:4px;"/>
							<span style="font-size: 6pt">PARTNERSHIP’S name, street address, city, state, and ZIP code.</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
							</xsl:call-template>
							<br/>																					
						</div>
						<!-- Form Title and Info box -->
						<div class="styIRS1065BSchK1leftBox" style="width:37mm;height:8mm;border-top:1px solid black;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">1</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								<span style="width:14px;"/>
								<span style="font-size: 6pt;">passive activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossPassiveActy"/>
									</xsl:call-template>
								</span>
							</span>
							<br/>
							<span class="styIRS1065BSchK1leftBox" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">2</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								
								<span style="width:14px;"/>								
								<span style="font-size: 6pt;">other activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossOtherActy"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<!-- Year and Form Box -->
						<div class="styIRS1065BSchK1rightBox" style="width:37.5mm;height:20mm;text-align:right;border-right:none;border-top:none;border-left:none;">
							<br/>
							<span style="font-size:10pt;font-weight:bold;padding-left:6mm;">Partner’s Share of Income (Loss) From an Electing Large Partnership</span>
						</div>
						<div class="styIRS1065BSchK1rightBox" style="width:29mm;height:26mm;text-align:center;border-top:1px solid black;">
							<span style="font-size: 6pt">OMB No. 1545-1626</span>
							<br/>
							<!--<span style="padding-top:4mm;height:auto;">james-->
								<div class="styTY" style="padding-top:3mm;font-size:26;">20<span class="styTYColor">08                       
                                 </span>
								</div>
								<br/>
							<!--</span>james-->
							<span class="styFN" style="font-size:7pt;font-weight:bold;">Schedule K-1 <br>(Form 1065-B)
                             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data"/>
								</xsl:call-template></br>
							</span>
						</div>
					</div>
					
					<div style="width:187mm;height:40mm;">
						<!-- Left boxes (Identification Number, Shareholder's ID, Shareholder's Name and Info) -->
						<div style="width:83mm;height:38mm;float:left;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:43mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNERSHIP’S Employer I.D. number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:39.5mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S identifying number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerSSN!=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerSSN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerEIN!=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/MissingSSNEINReason!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/MissingSSNEINReason"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:12mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S name</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine1"/>
								</xsl:call-template>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine2"/>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:17.5mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">Street address (including apt. no.)</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">City, state, and ZIP code</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress"/>
								</xsl:call-template>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/Country"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							
<!--Partner’s share of liabilities Box-->							
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-bottom:.5mm;padding-left:4px;height:15mm;width:83mm;">
								<span style="font-size: 6pt">Partner’s share of liabilities:</span>
								<br/>
								<span style="width:48mm">
									<span class="styBoldText">a</span>
									<span style="width:4px;"/>Nonrecourse
                                    <span class="styBoldText">
										<span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span> 
    $
                                <span style="border-bottom:solid black 1;text-align:right;width:29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Nonrecourse"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">b</span>
									<span style="width:4px;padding-bottom:2mm;"/>Qualified nonrecourse financing
          <span class="styBoldText">
										
                                    </span>
								</span> 
    $
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedNonrecourseFinancing"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">c</span>
									<span style="width:4px;padding-bottom:2mm;"/>Other
                                    <span class="styBoldText">
						<span style="width:16px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span>
    $ 
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/ShareOfLiabilitiesOther"/>
									</xsl:call-template>
								</span>
								
							</span>
							<!--
                            <span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-left:4px;height:9.5mm;width:87mm">
                                <span style="font-size: 6pt;">Tax shelter registration number</span>
                                <br/>
                                <span style="padding-top:2mm;width:40mm;float:bottom;text-align:right">
                                    <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxShelterRegistration"/>
                                    </xsl:call-template>
                                </span>
                            </span>
                            -->
						</div>
						<!-- Middle Boxes (1a, 1b, 1c,...) -->
						<!-- Tanuja - Removed two elements PostMay5Gain, Qualified5YearGain as part of CR-80 Schema updates and also renumbered the fields accordingly-->
						<div style="width:75mm;height:40mm;float:left;">
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">3</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Qualified dividends</span>
									<span style="padding-top:4mm;width:32mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedDividends"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;background-color:gray;width:37.4mm;border-right-width:1"/>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4a</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss) from</span>
									<span style="width:19px;"/>
									<span style="font-size: 6pt;">passive activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossPassiveActy"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4b</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss)</span>
									
									<span style="width:6mm;"/>
									<span style="font-size: 6pt;">from other activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossOtherActy"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">5</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net passive AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetPassiveAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">6</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net other AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetOtherAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">7</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">General credits</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/GeneralCredits"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">8</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Low-income housing credit</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/LowIncomeHousingCredit"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:42.8mm;width:75mm;float:left;border-right-width:1">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">9</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Other 
            <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Other"/>
									</xsl:call-template>
								</span>
								<br/>
								<xsl:for-each select="$Form1065BSchK1Data/Other/Item">
									<span style="width:68mm;padding-left:1mm">
										<span style="width:33mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Code"/>
											</xsl:call-template>
										</span>
										<span style="width:33mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</span>
									</span>
								</xsl:for-each>
							</span>
						</div>
						<!-- copy end-->
						<!-- Stylesheet will always show only Copy B box as per customer request -->
						<div style="width:28mm;height:70mm;float:left;text-align:right;">
							<span class="styIRS1065BSchK1rightBoxWithBottom" style="height:83.3mm;width:28mm;float:left;padding-bottom:1mm;border-left-width:0;border-right-width:0;">
								<div style="font-size: 9pt;font-weight:bold;height:6mm;padding-top:1mm;padding-bottom:3mm">Copy B</div>
								<span class="styBoldText">         For Partner<br/>
								</span>
								
								See the separate
								
								<span class="styBoldText" style="font-size:6pt;">Partner's
								
								<br>Instructions for</br>
								
								Schedule K-1
								
								<br>(Form 1065-B).</br></span>
								
								<span style="font-size:6pt;">
								
								
								<br>This is important tax</br>
								information and is
								<br>being furnished to the</br>
								Internal Revenue
								<br>Service. If you are</br>
								required to file a return,
								<br>a negligence penalty or</br>
								other sanction may be
								<br>imposed on you if this</br>
								income is taxable and
								<br>the IRS determines that</br>
								it has not been
								<br>reported.</br>
								</span>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<span style="font-weight:bold;width:82mm;font-size:8pt">Schedule K-1 (Form 1065-B)</span>
						<span style="width:45mm;font-size: 6pt;">(Keep for your records)</span>
						<span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
					</div>
					<br/>
					<div class="pageEnd" style="width:187mm;"/>
				</form>
			</body>
			<!--	End of B	-->
			<!--Begin Part C-->
			<body class="styBodyClass">
				<form name="Form1065BSchK1">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Void and Corrected Check Boxes -->
					<div class="styBB" style="width:187mm;border-bottom:none;">
						<span style="width:5mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:36mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
								</xsl:call-template>CORRECTED
                            </label>
						</span>
						<span style="width:19mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
								<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:61mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership"/>
									<xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
								</xsl:call-template> PUBLICLY TRADED PARTNERSHIP
                            </label>
						</span>
						<!--<span style="font-size: 6pt;">(99)</span>-->
					</div>
					<!-- End Void and Corrected Check Boxes -->
					<!--copy start-->
					<div class="styBB" style="width:187mm;height:26mm;border-top:none;">
						<!-- Name and address box -->
						<div class="styIRS1065BSchK1leftBox" style="width:83mm;height:26mm;border-top:1px solid black;">
							<span style="width:4px;"/>
							<span style="font-size: 6pt">PARTNERSHIP’S name, street address, city, state, and ZIP code.</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
							<xsl:call-template name="PopulateReturnHeaderFiler">
                                <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                            </xsl:call-template>
                            <br/>							
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
                            <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
							</xsl:call-template>
							<br/>																					
						</div>
						<!-- Form Title and Info box -->
						<div class="styIRS1065BSchK1leftBox" style="width:37mm;height:8mm;border-top:1px solid black;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">1</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								<span style="width:14px;"/>
								<span style="font-size: 6pt;">passive activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossPassiveActy"/>
									</xsl:call-template>
								</span>
							</span>
							<br/>
							<span class="styIRS1065BSchK1leftBox" style="height:4mm;border-left:none;width:100%;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">2</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Taxable income (loss) from</span>
								
								<span style="width:14px;"/>								
								<span style="font-size: 6pt;">other activities</span>
								<br/>
								<span style="vertical-align:baseline;height:25%;"/>
								<span style="width:33mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossOtherActy"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<!-- Year and Form Box -->
						<div class="styIRS1065BSchK1rightBox" style="width:37.5mm;height:20mm;text-align:right;border-right:none;border-top:none;border-left:none;">
							<br/>
							<span style="font-size:10pt;font-weight:bold;padding-left:6mm;">Partner’s Share of Income (Loss) From an Electing Large Partnership</span>
						</div>
						<div class="styIRS1065BSchK1rightBox" style="width:29mm;height:26mm;text-align:center;border-top:1px solid black;">
							<span style="font-size: 6pt">OMB No. 1545-1626</span>
							<br/>
							<!--<span style="padding-top:4mm;height:auto;">james-->
								<div class="styTY" style="padding-top:3mm;font-size:26;">20<span class="styTYColor">08                       
                                 </span>
								</div>
								<br/>
							<!--</span>james-->
							<span class="styFN" style="font-size:7pt;font-weight:bold;">Schedule K-1 <br>(Form 1065-B)
                             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data"/>
								</xsl:call-template></br>
							</span>
						</div>
					</div>
					
					<div style="width:187mm;height:40mm;">
						<!-- Left boxes (Identification Number, Shareholder's ID, Shareholder's Name and Info) -->
						<div style="width:83mm;height:38mm;float:left;">
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:43mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNERSHIP’S Employer I.D. number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:39.5mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S identifying number</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerSSN!=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerSSN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerEIN!=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/MissingSSNEINReason!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/MissingSSNEINReason"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:12mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">PARTNER’S name</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine1"/>
								</xsl:call-template>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine2"/>
								</xsl:call-template>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:17.5mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">Street address (including apt. no.)</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:if test="$Form1065BSchK1Data/PartnerUSAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:83mm;">
								<span style="width:4px;"/>
								<span style="font-size: 6pt">City, state, and ZIP code</span>
								<br/>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress"/>
								</xsl:call-template>
								<xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
									<br/>
									<span style="width:4px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/Country"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							
<!--Partner’s share of liabilities Box-->							
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-bottom:.5mm;padding-left:4px;height:15mm;width:83mm;">
								<span style="font-size: 6pt">Partner’s share of liabilities:</span>
								<br/>
								<span style="width:48mm">
									<span class="styBoldText">a</span>
									<span style="width:4px;"/>Nonrecourse
                                    <span class="styBoldText">
										<span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span> 
    $
                                <span style="border-bottom:solid black 1;text-align:right;width:29mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Nonrecourse"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">b</span>
									<span style="width:4px;padding-bottom:2mm;"/>Qualified nonrecourse financing
          <span class="styBoldText">
										
                                    </span>
								</span> 
    $
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedNonrecourseFinancing"/>
									</xsl:call-template>
								</span>
								<span style="width:48mm">
									<span class="styBoldText">c</span>
									<span style="width:4px;padding-bottom:2mm;"/>Other
                                    <span class="styBoldText">
						<span style="width:16px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                        <span style="width:10px"/>.
                                    </span>
								</span>
    $ 
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/ShareOfLiabilitiesOther"/>
									</xsl:call-template>
								</span>
								
							</span>
							<!--
                            <span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-left:4px;height:9.5mm;width:87mm">
                                <span style="font-size: 6pt;">Tax shelter registration number</span>
                                <br/>
                                <span style="padding-top:2mm;width:40mm;float:bottom;text-align:right">
                                    <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxShelterRegistration"/>
                                    </xsl:call-template>
                                </span>
                            </span>
                            -->
						</div>
						<!-- Middle Boxes (1a, 1b, 1c,...) -->
						<!-- Tanuja - Removed two elements PostMay5Gain, Qualified5YearGain as part of CR-80 Schema updates and also renumbered the fields accordingly-->
						<div style="width:75mm;height:40mm;float:left;">
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">3</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Qualified dividends</span>
									<span style="padding-top:4mm;width:32mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedDividends"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;background-color:gray;width:37.4mm;border-right-width:1"/>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4a</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss) from</span>
									<span style="width:19px;"/>
									<span style="font-size: 6pt;">passive activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossPassiveActy"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">4b</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net capital gain (loss)</span>
									
									<span style="width:6mm;"/>
									<span style="font-size: 6pt;">from other activities</span>
									
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossOtherActy"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">5</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net passive AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetPassiveAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">6</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Net other AMT adjustment</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetOtherAMTAdjustment"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<div style="width:75mm;">
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.5mm;">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">7</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">General credits</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/GeneralCredits"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:5.5mm;width:37.4mm;border-right-width:1">
									<span style="width:4px;"/>
									<span style="font-size: 6pt;font-weight:bold;">8</span>
									<span style="width:4px;"/>
									<span style="font-size: 6pt;">Low-income housing credit</span>
									<span style="padding-top:2mm;width:33mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/LowIncomeHousingCredit"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<span class="styIRS1065BSchK1leftBoxWithBottom" style="height:42.8mm;width:75mm;float:left;border-right-width:1">
								<span style="width:4px;"/>
								<span style="font-size: 6pt;font-weight:bold;">9</span>
								<span style="width:4px;"/>
								<span style="font-size: 6pt;">Other 
            <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Other"/>
									</xsl:call-template>
								</span>
								<br/>
								<xsl:for-each select="$Form1065BSchK1Data/Other/Item">
									<span style="width:68mm;padding-left:1mm">
										<span style="width:33mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Code"/>
											</xsl:call-template>
										</span>
										<span style="width:33mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amount"/>
											</xsl:call-template>
										</span>
									</span>
								</xsl:for-each>
							</span>
						</div>
						<!-- copy end-->
						<!-- Stylesheet will always show only Copy B box as per customer request -->
						<div style="width:28mm;height:70mm;float:left;text-align:right;">
							<span class="styIRS1065BSchK1rightBoxWithBottom" style="height:83.3mm;width:28mm;float:left;border-left-width:0;border-right-width:0;">
								<div style="font-size: 9pt;font-weight:bold;height:6mm;padding-top:1mm;padding-bottom:3mm">Copy C</div>
								<span class="styBoldText">For Electing<br>Large Partnership</br>
								</span>
								<br/>	
								<span style="font-size:7pt;">
								

								<br>For Paperwork</br>
								Reduction Act
								<br>Notice and</br>
								instructions for
								<br>completing this</br>
								form, see the
								<span class="styBoldText"><br>2008 Instructions</br></span>
								
									<span class="styBoldText">for Form 1065-B,</span>
								U.S. Return of
								<br>Income for Electing</br>
								Large Partnerships.
								</span>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<span style="font-weight:bold;width:82mm;font-size:8pt">Schedule K-1 (Form 1065-B)</span>
						<span style="width:45mm;font-size: 6pt;"/>
						<span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
					</div>
					<!--End of Part C-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="pageEnd" style="width:187mm;"/>
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
							<xsl:with-param name="TargetNode" select="$Form1065BSchK1Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
