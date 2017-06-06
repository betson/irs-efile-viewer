<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1099RStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1099RData" select="$RtnDoc/IRS1099R"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1099RData)"/>
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
				<meta name="Description" content="IRS Form 1099R"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					  <xsl:call-template name="IRS1099RStyle"/>
					  <xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1099R">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Corrected Check Box and Pen Image for Standard or NonStandard Cd-->
					<div class="styBB" style="width:187mm;border-bottom:none;">
					  	<span style="width:1mm;"/>
						<xsl:call-template name="LinkToLeftoverDataTableInline">
                           <xsl:with-param name="Desc">Standard or NonStandard Cd</xsl:with-param>
                           <xsl:with-param name="TargetNode" select="$Form1099RData/StandardOrNonStandardCd"/>
                        </xsl:call-template>
                        <span style="width:54.66mm;"/>
						<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1099RData/CorrectedInd"/>
								<xsl:with-param name="BackupName">Form1099RDataCorrectedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>
						<span style="width:45mm;font-size: 10pt;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1099RData/CorrectedInd"/>
									<xsl:with-param name="BackupName">Form1099RDataCorrectedInd</xsl:with-param>
								</xsl:call-template> CORRECTED (if checked)
                                 </label>
						</span>
					</div>
					<!-- End Corrected Check Box -->
					<!-- Big box covers Payer's name, Payer's fed id, Recipient's name, Boxes 1-6, OMB No, Distributions
                          From box and Copy B box -->
					<div class="styBB" style="width:187mm;height:67mm;border-top-width:0px;border-bottom:none;">
						<!-- PAYER'S Name and address box, PAYER'S fed Id and RECIPIENT'S id num and Recipient's Name -->
						<div class="styIRS1099RleftBox" style="width:97.5mm;height:67mm; border-top:1px solid black;">
							<!-- PAYER'S Name and address box -->
							<div class="styIRS1099RleftBox" style="width:97.5mm;height:34.27mm;
                                  border-left:0px solid black;border-bottom:1px solid black;border-right:0px solid black">
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt">
                                         PAYER'S name, street address, city, state, and ZIP code</span>
								<br/>
								<span style="width:.5mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1099RData/PayerNameControl"/>
								</xsl:call-template>
								<!--<span style="width:.5mm;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormW2Data/EmployerNameControl"/>
								</xsl:call-template>-->
								<br/>
								<span style="width:1mm;"/>
								<span style="font-size:6pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/PayersName/BusinessNameLine1"/>
									</xsl:call-template>
								</span>
								<br/>
								<span style="width:1mm;"/>
								<span style="font-size:6pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/PayersName/BusinessNameLine2"/>
									</xsl:call-template>
								</span>
								<br/>
								<xsl:if test="$Form1099RData/PayersUSAddress">
									<span style="width:1mm;"/>
									<span style="font-size:6pt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersUSAddress/AddressLine1"/>
										</xsl:call-template>
										<br/>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersUSAddress/AddressLine2"/>
										</xsl:call-template>
										<br/>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateCityStateInfo">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersUSAddress"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<xsl:if test="$Form1099RData/PayersForeignAddress">
									<span style="width:1mm;"/>
									<span style="font-size:6pt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<br/>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/AddressLine2"/>
										</xsl:call-template>
										<br/>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/City"/>
										</xsl:call-template>, 
                                                 <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/ProvinceOrState"/>
										</xsl:call-template>&#160;
                                                 <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/PostalCode"/>
										</xsl:call-template>
										<br/>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/PayersForeignAddress/Country"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</div>
							<!-- PAYER'S federal identification -->
							<div class="styIRS1099RleftBox" style="width:48.8mm;height:16.5mm;border-top:0px solid black;
      		                     border-bottom:0px solid black;border-left:0px solid black;">
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt">PAYER's federal identification</span>
								<br/>
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt;">number</span>
								<span style="width:6px;"/>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$Form1099RData/PayerFederalIdNumber"/>
								</xsl:call-template>
							</div>
							<!-- RECIPIENT'S identification number -->
							<div class="styIRS1099RleftBoxWithBottom" style="height:16.5mm;width:48.5mm;
                                 border-left:1px solid black;border-bottom:1px;border-right:0px solid black;">
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt">RECIPIENT’S identification</span>
								<br/>
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt;">number</span>
								<span style="width:6px;"/>
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsIdNumber"/>
								</xsl:call-template>
							</div>
							<!--RECIPIENT'S Name -->
							<span class="styIRS1099RleftBox" style="height:19.2mm;width:97.6mm;
                                 border-left:0px solid black;border-right:0px solid black;border-top:1px solid black;">
								<span style="width:1mm;"/>
								<span style="font-size: 6.5pt">RECIPIENT’S name</span>
								<br/>
								<span style="width:1mm;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsName"/>
								</xsl:call-template>
							</span>
						</div><!-- Closes Box for PAYER'S Name and addr, PAYER'S fed Id and RECIPIENT'S id num and
                                         Recipient's name -->
						<!-- Big box covers Boxes 1, 2a, 2b, 3, 4, 5, 6, OMB No., Distributions wording and Copy B 
                               wording -->
						<div class="styBB" style="float:right;width:89mm;height:67mm;border-bottom:none; ">
							<!-- Big box covers Box 1, Box 2a, OMB No., and Distributions, etc -->
							<div class="styBB" style="float:right;width:89mm;height:25mm;border-bottom:none; ">
								<!-- Boxes 1 and 2a (Gross Distribution and Taxable amt) -->
								<div class="styIRS1099RleftBox" style="width:31.3mm;height:25mm;
                                       border-top:1px solid black;">
									<!-- Box 1 Gross Distribution -->
									<span class="styIRS1099RleftBox" style="height:12.5mm;
                                             border-left:2px solid black;border-top:2px solid black;
                                             border-right:2px solid black;border-bottom:1px solid black;width:31.3mm;">
										<span style="width:3px;"/>
										<span style="font-size: 7.5pt;font-weight:bold;">1</span>
										<span style="width:6px;"/>
										<span style="font-size: 6.5pt;">Gross distribution</span>
										<br/>
										<br/>
										<span style="width:4px;"/>
										<span style="padding-top:1.5mm;width:27mm;text-align:right;float:bottom;
                                                   font-size:6pt;padding-right:.5mm">
											<span style="font-size:9pt;float:left;padding-left:.1mm">$</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1099RData/GrossDistributionAmt"/>
											</xsl:call-template>
										</span>
									</span>
									<!-- Box 2a Taxable Amount -->
									<span class="styIRS1099RleftBox" style="height:12.5mm;
                                             border-left:2px solid black;border-right: 2px solid black;
                                             border-bottom: 3px solid black; width:31.3mm;">
										<span style="width:2px;"/>
										<span style="font-size: 7.5pt;font-weight:bold;">2a</span>
										<span style="width:3px;"/>
										<span style="font-size: 6.5pt;">Taxable amount</span>
										<br/>
										<br/>
										<span style="width:4px;"/>
										<span style="padding-top:1.5mm;width:27mm;text-align:right;float:bottom;
                                                  font-size:6pt;padding-right:.5mm">
											<span style="font-size: 9pt;float:left;padding-left:.1mm">$</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1099RData/TaxableAmt"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
								<!-- Closes Box for Gross Distribution and Taxable amt -->
								<!-- Box covers OMB No , Year and Form name -->
								<div class="styIRS1099RleftBox" style="width:27.6mm;height:25.2mm;text-align:center;
                                       border-top:1px solid black;border-right:1px solid black;
                                       border-bottom: 1px solid black;">
									<span style="font-size: 6pt">OMB No. 1545-0119</span>
									<br/>
									<br/>
									<span style="padding-top:4mm;height:auto;">
										<div class="styTY" style="padding-top:3mm; font-size:30">
                                                 20<span class="styTYColor">09</span>
										</div>
									</span>
									<span style="padding-top:6mm;font-size:6pt;">
										<br/>Form </span>
									<span style="padding-top:6mm;font-size:8pt;font-weight:bold;">&#160;1099-R </span>
								</div>
								<!-- Distributions from Pensions, etc. -->
								<div class="styIRS1099RrightBox" style="width:29.7mm;height:25.2mm;text-align:right;
                                      border-right:none;border-top:none;border-left:none;border-bottom:1px solid black;">
									<span style="font-size: 7pt;font-weight:bold;">Distributions From<br/>
                                            Pensions, Annuities,<br/>Retirement or<br/>Profit-Sharing<br/>Plans, IRAs,<br/>
                            	            Insurance<br/>Contracts, etc.<br/>
									</span>
								</div>
							</div><!-- Closes box for Box 1, Box 2a, OMB No., Distributions, etc -->
							<!-- Big box covers Box 2b, Box 3, Box 4, Box 5, Box 6 and Copy B, etc -->
							<div class="styIRS1099RrightBoxWithBottom" style="width:89mm;height:42mm;
                                 border-right:none;">
								<!-- Big box covers Box 2b, Box 3, Box 4, Box 5, Box 6 -->
								<div class="styIRS1099RrightBoxWithBottom" style="width:68mm;height:42mm;
                                      border-right:none;border-left:none;border-bottom:none ">
									<!-- Big Box for Box 2b (Taxable Amount not determined and Total Distribution) -->
									<div style="width:68mm;height:8.87mm;border-right:0px solid black;
                                           border-left:0px solid black;padding-top:.3mm">
										<!--  Taxable Amount not determined -->
										<span class="styIRS1099RrightBoxWithBottom" style="height:8.868mm;width:32mm;
                                                border-bottom:0px solid black;border-right:0px solid black;
                                                border-left:0px solid black">
											<span style="width:28mm;font-size: 7pt">
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1099RData/TxblAmountNotDeterminedInd"/>
														<xsl:with-param name="BackupName">Form1099RTxblAmountNotDeterminedInd</xsl:with-param>
													</xsl:call-template>
													<span style="width:4px;"/>
													<span style="font-weight:bold;"> 2b </span>
													<span style="width:2px;"/>
													<span style="font-size:6.5pt">Taxable amount
                                                                <span style="width:23px"/>not determined</span>
												</label>
											</span>
											<span style="width:.5px;"/>
											<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1099RData/TxblAmountNotDeterminedInd"/>
													<xsl:with-param name="BackupName">Form1099RTxblAmountNotDeterminedInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
										<!--  Total Distribution -->
										<span class="styIRS1099RrightBoxWithBottom" style="height:8.87mm;width:35.7mm;
                                              border-bottom:0px solid black;border-left:0px solid black">
											<span style="width:29mm;font-size: 7.5pt">
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form1099RData/TotalDistributionInd"/>
														<xsl:with-param name="BackupName">Form1099RTotalDistributionInd</xsl:with-param>
													</xsl:call-template>
													<span style="width:33px;"/>
													<span style="font-size:6.5pt;">Total
                                                                 <br/>
														<span style="width:32px;"/>distribution</span>
												</label>
											</span>
											<!--<span style="width:.5px;"/> -->
											<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form1099RData/TotalDistributionInd"/>
													<xsl:with-param name="BackupName">Form1099RTotalDistributionInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</span>
									</div><!--Closes Box 2b -->
									<!-- Big Box for Boxes 3 and 4 (Capital Gain and Federal Income Tax withheld) -->
									<!--<div style="width:75mm;height:14mm;float:left;border-top:1 solid black;">-->
									<div style="width:68.25mm;height:16mm;border-right:0px solid black">
										<!-- Box 3 Capital Gain included in box 2a -->
										<span class="styIRS1099RleftBoxWithBottom" style="height:16mm;width:31.5mm;
                                              border-top:1px solid black;border-left:0px solid black;font-size:6pt">
											<span style="width:4px;"/>
											<span style="font-size: 7.5pt;font-weight:bold;">3</span>
											<span style="width:6px;"/>Capital gain (included<br/>
											<span style="width:20px;"/>in box 2a)<br/>
											<br/>
											<span style="padding-top:4.3mm;width:29.3mm;float:bottom;text-align:right;
                                                  font-size:6pt;padding-right:.5mm">
												<span style="font-size:9pt;float:left;padding-left:.7mm">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1099RData/CapitalGainAmt"/>
												</xsl:call-template>
											</span>
										</span>
										<!-- Box 4 Federal income tax withheld -->
										<span class="styIRS1099RrightBoxWithBottom" style="height:16.5mm;width:36.7mm;
                                              font-size:6.5pt;border-left:3px solid black;border-bottom:3px solid black;
                                              border-right:3px solid black;border-top:2 solid black;">
											<span style="width:4px;"/>
											<span style="font-size: 7.5pt;font-weight:bold;">4</span>
											<span style="width:6px;"/>
											<span style="font-weight:bold;">Federal Income tax
                                               </span>
											<br/>
											<span style="width:16px;"/>
											<span style="font-weight:bold;">withheld</span>
											<br/>
											<br/>
											<span style="padding-top:3mm;width:32mm;float:bottom;text-align:right;
                                                 font-size:6pt;padding-right:.7mm">
												<span style="font-size:9pt;float:left;padding-left:1mm">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1099RData/FederalIncomeTaxWithheldAmt"/>
												</xsl:call-template>
											</span>
										</span>
									</div><!--Closes boxes 3 and 4-->
									<!-- Big Box for Boxes 5 and 6 -->
									<div style="width:68.25mm;height:18.09mm;border-right:0px solid black">
										<!-- Box 5 Employee contributions / Designated Roth contributions or ins 
                                                premiums -->
										<span class="styIRS1099RleftBox" style="height:18.09mm;width:31.5mm;
                                               border-left:none;font-size:6pt">
											<span style="width:4px;"/>
											<span style="font-size: 7.5pt;font-weight:bold;">5</span>
											<span style="width:3px;"/>Employee contributions<br/>
											<span style="width:17px;"/>/Designated Roth<br/>
											<span style="width:17px;"/>contributions or<br/>
											<span style="width:17px;"/>insurance premiums<br/>
											<span style="padding-top:2.6mm;width:29.3mm;float:bottom;text-align:right;
                                                   padding-right:.5mm">
												<span style="font-size: 9pt;float:left;padding-left:.7mm">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1099RData/EmployeeContributionsAmt"/>
												</xsl:call-template>
											</span>
										</span>
										<!-- Box 6 for Net unrealized appreciation in employer's securities -->
										<span class="styIRS1099RleftBox" style="height:18.09mm;width:36.9mm;
                                                border-right:1px solid black;font-size:6.5pt">
											<span style="width:4px;"/>
											<span style="font-size: 7.5pt;font-weight:bold;">6</span>
											<span style="width:2.5px;"/>Net unrealized<br/>
											<span style="width:12px;"/>appreciation in<br/>
											<span style="width:12px;"/>employer's securities<br/>
											<br/>
											<span style="width:32.2mm;padding-top:1.7mm;float:bottom;text-align:right;
                                                      padding-right:.5mm;font-size:6pt">
												<span style="font-size: 9pt;float:left;padding-left:.7mm">$</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1099RData/NetUnrlzdSecuritiesApprcnAmt"/>
												</xsl:call-template>
											</span>
										</span>
									</div><!--Closes Boxes 5 and 6  -->
								</div><!-- Closes Boxes 2b, 3, 4, 5 and 6 -->
								<!-- Big box covers Copy B wording to right -->
								<div class="styIRS1099RrightBox" style="width:20mm;height:38.2mm;text-align:right;
                                      border-right:none;border-top:none; border-left:none;padding-top:1mm;font-size:6.5pt;
                                      font-weight:bold">
									<span style="font-size:7.5pt">Copy B</span>
									<br/>
                                        Report this<br/>
                                        income on your<br/>
                                        federal tax<br/>
                                        return. If this<br/>
                                        form shows<br/>      
                                        federal income<br/> 
                            	        tax withheld in<br/>
                                        box 4, attach<br/>
                                        this copy to<br/>
                                        your return.
                                </div><!-- Closes box for Copy B wording to right -->
							</div><!-- Closes big box for 2b, 3, 4, 5, 6 and Copy B wording to right -->
						</div><!-- Closes Big box for Boxes 1, 2a, 2b, 3, 4, 5, 6, OMB No., Distributions wording and 
                                     Copy B wording -->
					</div><!-- Closes box for Payer's name, Payer's fed id and all the way across to Copy B wording -->
					<!-- Big box for Recipient's Street Addr; City, State, zip; Boxes 7, 8, 9a, 9b and Box for This 
                          information....-->
					<div style="width:187mm;height:23mm;">
						<!-- Big box for Recipient's Street Addr; City, state,zip,-->
						<div style="width:98mm;float:left;">
							<!--Recipient's street address -->
							<span class="styIRS1099RleftBox" style="height:13.85mm;width:98.05mm;border-top:none;
                                 font-size:6.5pt">
								<span style="width:1mm;"/>Street address (including apt. no.)<br/>
								<xsl:if test="$Form1099RData/RecipientsUSAddress">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsUSAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsUSAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1099RData/PayersForeignAddress">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsForeignAddress/AddressLine1"/>
									</xsl:call-template>
									<br/>
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsForeignAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<!--Recipient's City, State and Zip -->
							<span class="styIRS1099RleftBoxWithBottom" style="height:9.2mm;width:98mm;font-size:6.5pt">
								<span style="width:.7mm;"/>City, state, and ZIP code<br/>
								<span style="width:1mm;"/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsUSAddress"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$Form1099RData/RecipientsForeignAddress"/>
								</xsl:call-template>
								<xsl:if test="$Form1099RData/RecipientsForeignAddress">
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/RecipientsForeignAddress/Country"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div><!-- Closing box for Recipient's addr, city, state, and zip-->
						<!-- Boxes 7, 8, 9a and 9b -->
						<div style="width:69mm;height:22.6mm;float:left">
							<!-- Boxes 7 and 8 (Distribution Codes and Other) -->
							<div style="width:69mm;">
								<!-- Box 7 Distribution codes-->
								<span class="styIRS1099RleftBoxWithBottom" style="height:13.85mm;width:20.5mm;
                                         font-size:7pt">
									<span style="width:4px;"/>
									<span style="font-size: 7.5pt;font-weight:bold;">7</span>
									<span style="width:4px;"/>Distribution<br/>
									<span style="width:14px;"/>code(s)
                                          <span style="padding-top:4mm;width:18mm;float:bottom;text-align:left;
                                            padding-left:1mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1099RData/F1099RDistributionCd"/>
										</xsl:call-template>
									</span>
								</span>
								<!--  IRA / SEP/ SIMPLE -->
								<span class="styIRS1099RrightBoxWithBottom" style="height:13.8mm;width:11.3mm;
                                         border-bottom:1px solid black;border-right:0 solid black;font-size:6.5pt;">
									<span style="width:1mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1099RData/IRASEPSIMPLEInd"/>
											<xsl:with-param name="BackupName">Form1099RDataIRASEPSIMPLEInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:4px;"/>
										<span style="padding-left:.5mm">IRA/</span>
										<br/>
										<span style="width:4px;"/>
										<span style="padding-left:1mm">SEP/</span>
										<span style="width:4px;"/>
										<span style="padding-left:.3mm">SIMPLE</span>
										<br/>
									</label>
									<span style="padding-left:4mm;">
										<input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1099RData/IRASEPSIMPLEInd"/>
												<xsl:with-param name="BackupName">Form1099RDataIRASEPSIMPLEInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</span>
								<!-- Box 8 Other -->
								<span class="styIRS1099RleftBoxWithBottom" style="height:13.8mm;width:24.4mm;
                                                             border-right:1px solid black">
									<span style="width:4px;"/>
									<span style="font-size: 7.5pt;font-weight:bold;">8</span>
									<span style="width:6px;"/>
									<span style="font-size: 7.5pt;">Other</span>
									<br/>
									<br/>
									<span style="padding-top:3mm;width:24.4mm;float:bottom;text-align:right">
										<span style="font-size: 8.5pt;float:left;padding-left:.3mm">$</span>
										<span style="font-size: 6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1099RData/OtherDistributionAmt"/>
											</xsl:call-template>
										</span>
										<span style="width:.2mm"/>
									</span>
								</span>
								<!--  Blank box to right of Box 8 (Other) -->
								<span class="styIRS1099RrightBoxWithBottom" style="height:13.8mm;width:12mm;
                                         border-bottom:1px solid black;border-right:1px solid black;
                                         border-left:0px solid black">
									<br/>
									<br/>
									<br/>
									<span style="padding-bottom:.1mm;width:12mm;font-size:6pt;float:bottom;
                                                  text-align:right">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form1099RData/RcpntOthDistributionPct"/>
										</xsl:call-template>
									</span>
								</span>
							</div><!-- Closes Boxes 7 and 8 (Distribution Codes and Other) -->
							<!-- Boxes 9a and 9b (Your percentage of total distribution and Total Employee 
                                      contributions) -->
							<div style="width:68.8mm;height:9.2mm;">
								<!-- Box 9a Your percentage of total distribution -->
								<span class="styIRS1099RleftBoxWithBottom" style="height:9.2mm;width:31.7mm;
                                         padding-top:.5mm;border-bottom:0px">
									<span style="width:3px;"/>
									<span style="font-size: 7.5pt;font-weight:bold;">
                                                 9a</span>
									<span style="width:2px;"/>
									<span style="font-size: 6pt;">
                                                   Your percentage of <br/>
										<span style="width:2px;padding-top:1mm"/>
                                                    total distribution
                                               </span>
									<span style="font-size:6pt">
										<span style="width:.3px;"/>
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form1099RData/RcpntTotalDistributionPct"/>
										</xsl:call-template>
									</span>
								</span>
								<!-- Box 9b Total employee contributions -->
								<span class="styIRS1099RleftBoxWithBottom" style="height:9.2mm;width:37mm;
                                         border-right-width:1;border-bottom:0px;padding-top:.5mm">
									<span style="width:2px;"/>
									<span style="font-size: 7pt;font-weight:bold;">
                                                 9b</span>
									<span style="width:2px;"/>
									<span style="font-size: 6pt;">Total employee contributions</span>
									<br/>
									<span style="font-size:6pt;width:35mm;padding-top:.5mm;float:bottom;
                                                 text-align:right">
										<span style="font-size: 9pt;float:left;padding-left:1mm">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1099RData/TotalEmployeeContributionsAmt"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
						</div><!-- Closing box for Boxes 7, 8, 9a and 9b -->
						<!-- Box for wording.. For Privacy Act..  2008 General Instructions -->
						<div class="styIRS1099RrightBoxWithBottom" style="height:22.5mm;width:19.975mm;
                             text-align:right;border-left-width:0;border-right-width:0;border-bottom:0px ">
							<span style="font-size: 6pt;">
								<br/>
                                          This information is<br/>
                                          being furnished to<br/>
                                          the Internal<br/>
                                          Revenue Service.<br/>
							</span>
						</div>
					</div><!-- Closes Big box for Recipient's Street Addr; City, State, Zip; Boxes 7, 8, 9a, 9b and Box
                                   for This information....-->
					<!--Big Box for Blank Box; 1st year of desig. Roth contrib; account number; Boxes 10-15 -->
					<div style="width:187mm;height:24mm">
						<!--Big Box for Blank Box, 1st year of desig. Roth contrib. and account number -->
						<div style="width:98mm;height:24mm;float:left">
							<!--Big Box for Blank Box and 1st year of desig. Roth contrib. -->
							<div style="width:98.04mm;height:12.2mm;float:left">
								<!--Blank Box -->
								<span class="styIRS1099RleftBoxWithBottom" style="padding-left:4px;height:12.31mm;
                                      width:49mm;">
									<span style="font-size: 6pt"/>
								</span>
								<!--1st year of desig. Roth contrib. -->
								<span class="styIRS1099RleftBoxWithBottom" style="padding-left:2px;height:12.31mm;
                                      width:49mm;border-right-width:0px">
									<span style="width:1.74mm;"/>
									<span style="font-size: 6.25pt;">1st year of desig. Roth contrib.<br/>
										<br/>
									</span>
									<span style="padding-top:1mm;width:35mm;float:bottom;text-align:right">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$Form1099RData/RothContributionFirstYear"/>
										</xsl:call-template>
									</span>
								</span>
							</div>
							<!-- Box for Account number (see instructions) -->
							<span class="styIRS1099RleftBoxWithBottom" style="padding-left:2mm;height:12.31mm;
                                width:98.04mm;">
								<span style="font-size: 6.5pt;">Account number (see instructions)</span>
								<br/>
								<span style="padding-top:2mm;width:40mm;float:bottom;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1099RData/PayerRecipientAccountNumber"/>
									</xsl:call-template>
								</span>
							</span>
							<br/>
						</div>
						<!-- Boxes 10, 11, 12, 13, 14 and 15 -->
						<div style="float:left;clear:none">
						  <!-- Code for No Data in Boxes 10, 11, 12, 13, 14 and 15 or less than 2 data items-->
						  <xsl:if test="(count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &lt;=2)">
						    <!-- Box 10 -->
						    <td valign="top">
						      <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
							      <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
								      <tbody>
									    <xsl:if test="($Print != $Separated) or 
									      (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &lt;= 2)">
										  <tr>
										    <td scope="col" style="font-size:6.5pt;padding-bottom:0mm;border-right:1px solid black;
										      border-left:1px solid black">
										      <span style="width:1mm"/>
											  <span style="font-weight:bold">10</span>
											  <span style="width:1.5mm"/>State tax withheld
                                          	</td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
										      border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										      border-left:1px solid black"><!--valign="bottom">-->
										      <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
											  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
											      <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateAmount">
												      <xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
											        </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
										      font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
										      border-left:1px solid black"><!--valign="bottom">-->
											  <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
											  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
											      <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateAmount">
												      <xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 11 -->
						    <td valign="top">
						      <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
							      <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
								      <tbody>
									    <xsl:if test="($Print != $Separated) or 
									      (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &lt;= 2)">
										  <tr>
										    <td scope="col" style="font-size:6pt;border-left-width:0px;padding-bottom:0mm;
                                              border-right:1px solid black;">
										      <span style="width:.3mm"/>
											  <span style="font-weight:bold">11</span>
											  <span style="width:.3mm"/>State/Payer's state no.
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:5mm;width:31.5mm;
										      border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										      text-align:left" valign="bottom">&#160;
                                              <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
											      <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
												    </xsl:call-template>/
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="PayersStateIdNumber"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;text-align:left;
										      border-top:0px;width:31.5mm;font-size:6pt;border-bottom:1px solid black;
										      border-right:1px solid black;" valign="bottom">&#160;
                                              <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
												    </xsl:call-template>/
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="PayersStateIdNumber"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
							        </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 12 -->
						    <td valign="top" class="">
						      <table width="25.53mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <!--<td colspan="3" class="styIRS1099R_tdRight">-->
								    <table border="0" cellpadding="0" cellspacing="0" style="width:25.53mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or 
										  (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &lt;= 2)">
										  <tr>
										    <td scope="col" style="font-size:6.5pt;height:3.7mm;border-left-width:0px;padding-bottom:0mm;
                                              border-right:0px solid black;border-top:1px solid black;">
											  <span style="width:.2mm"/>
											  <span style="font-weight:bold">12</span>
											  <span style="width:.5mm"/>
											  <span style="font-size:6pt">State distribution</span>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;font-size:6pt;
                                              width:25.5mm;border-bottom:1px solid black;border-right:0px solid black;">
                                              <!--valign="bottom">-->
											  <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
											  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="StateDistributionAmt"/>
												    </xsl:call-template>
												    <span style="width:1mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
									      </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.4mm;font-size:6pt;
										      border-top:0px;width:25.5mm;border-right:0px solid black;
										      border-bottom-width:1px solid black;" valign="bottom">
											  <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
											  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="StateDistributionAmt"/>
												    </xsl:call-template>
												    <span style="width:1mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
								    </table>
								  <!--</td>-->
							    </tr>
							  </table>
						    </td>
						    <!-- Box 13 -->
						    <td valign="top">
							  <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or
						(count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp) &lt;= 2)">
									      <tr>
										    <td scope="col" style="font-size:7pt;padding-bottom:0mm;border-top:0px;
                                              border-right:1px solid black;border-left:1px solid black">
											  <span style="width:1mm"/>
											  <span style="font-weight:bold">13</span>
											  <span style="width:1.5mm"/>Local tax withheld</td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
										      border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										      border-left:1px solid black" valign="bottom">
											  <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
											  <xsl:for-each 
						select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
										      font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
										      border-left:1px solid black" valign="bottom">
         									  <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
											  <xsl:for-each
						 select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 14 -->
						    <td valign="top">
							  <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or
										  (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp)
                        	               &lt;= 2)">
										  <tr>
										    <td scope="col" style="font-size:7pt;border-left-width:0px;padding-bottom:0mm;
                                              border-right:1px solid black;border-top:0px solid black">
											  <span style="width:.5mm"/>
											  <span style="font-weight:bold">14</span>
											  <span style="width:1mm"/>Name of locality
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.5mm;
										      border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										      text-align:left" valign="bottom">&#160;
                                              <xsl:for-each 
                         select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
												    </xsl:call-template>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.5mm;
										      font-size:6pt;border-bottom-width:1px solid black;border-right:1px solid black;
										      text-align:left" valign="bottom">&#160;
                                              <xsl:for-each
                         select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
	                                            <xsl:choose>
												  <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
												    </xsl:call-template>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 15 -->
						    <td>
							  <!--<table width="25.53mm" border="0" cellpadding="0" cellspacing="0" style="float:left;">-->
							    <tr>
								  <td colspan="4" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:25.53mm;float:left">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or
										  (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp)
										   &lt;= 2)">
										  <tr>
										    <div class="GenericDiv">
										      <td scope="col" style="font-size:6.5pt;height:3.5mm;border-left-width:0px;padding-bottom:0mm;
										        border-right:0px solid black;">
											    <span style="width:.5mm"/>
											    <span style="font-weight:bold">15</span>
											    <span style="width:1mm"/>
											    <span style="font-size:6pt">Local distribution</span>
											  </td>
										    </div>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.2mm;width:25.3mm;
										      font-size:6pt;border-bottom:1px solid black;border-right:0px solid black;"> 
										      <!--valign="bottom">-->
                                         	  <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
											  <xsl:for-each 
						 select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
										        <xsl:choose>
												  <xsl:when test="position() = 1">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalDistributionAmt"/>
												    </xsl:call-template>
												    <span style="width:1mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
										  <tr>
										    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.37mm;font-size:6pt;
										      border-top:0px;width:25.3mm;border-bottom-width:1px solid black;
                                              border-right:0px solid black;clear:none" valign="bottom">
											  <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
											  <xsl:for-each
						 select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
											    <xsl:choose>
												  <xsl:when test="position() = 2">
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalDistributionAmt"/>
												    </xsl:call-template>
												    <span style="width:1mm;"/>
												  </xsl:when>
											    </xsl:choose>
											  </xsl:for-each>
										    </td>
										  </tr>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  <!--</table>-->
						    </td>
						  </xsl:if>
						
                          <!-- See Additional Table Message when Boxes 10, 11, 12, 13, 14 and 15 are > than 2 data items-->
						  <xsl:if test="(count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &gt;=3) 
						    and ($Print = $Separated)">
						    <!-- Box 10 -->
						    <td valign="top">
							  <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
								      <tbody>
									    <tr>
										  <td scope="col" style="font-size:6.5pt;padding-bottom:0mm;border-right:1px solid black;
										    border-left:1px solid black">
										    <span style="width:1mm"/>
										    <span style="font-weight:bold">10</span>
										    <span style="width:1.5mm"/>State tax withheld
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.3mm;width:31.9mm;
										    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										    border-left:1px solid black">
                                            <!--<span style="width:1px"/>-->
										    <xsl:call-template name="PopulateAdditionalDataTableMessage">
											  <xsl:with-param name="TargetNode"
											   select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp"/>
										    </xsl:call-template>
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.9mm;
										    font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
										    border-left:1px solid black">&#160;
   									      </td>
									    </tr>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 11 -->
						    <td valign="top">
							  <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
								      <tbody>
									    <tr>
										  <td scope="col" style="font-size:6pt;border-left-width:0px;padding-bottom:0mm;
                                            border-right:1px solid black;">
										    <span style="width:.3mm"/>
										    <span style="font-weight:bold">11</span>
										    <span style="width:.3mm"/>State/Payer's state no.
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.5mm;
										    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;text-align:left" 
										    valign="bottom">&#160;
                                          </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;text-align:left;
										    border-top:0px;width:31.5mm;font-size:6pt;border-bottom:1px solid black;
										    border-right:1px solid black;" valign="bottom">&#160;
                                          </td>
									    </tr>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 12 -->
						    <td valign="top" class="">
							  <table width="25.3mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <!--<td colspan="3" class="styIRS1099R_tdRight">-->
								    <table border="0" cellpadding="0" cellspacing="0" style="width:25.3mm;float:left;">
									  <tbody>
									    <tr>
										  <td scope="col" style="font-size:6.5pt;border-left-width:0px;padding-bottom:0mm;
										    border-right:0px solid black;border-top:1px solid black;">
										    <span style="width:.2mm"/>
										    <span style="font-weight:bold">12</span>
										    <span style="width:.5mm"/>
										    <span style="font-size:6pt">State distribution</span>
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.3mm;width:25.5mm;
										    font-size:6pt;border-bottom:1px solid black;border-right:0px solid black;">&#160;
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.5mm;font-size:6pt;
										    border-top:0px;width:25.5mm;border-right:0px solid black;
										    border-bottom-width:1px solid black;">&#160;
                                          </td>
									    </tr>
									  </tbody>
								    </table>
								  <!--</td>-->
							    </tr>
							  </table>
						    </td>
						    <!-- Box 13 -->
						    <td valign="top">
							  <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
									  <tbody>
									    <tr>
										  <td scope="col" style="font-size:7pt;padding-bottom:0mm;border-top:0px;
										    border-right:1px solid black;border-left:1px solid black">
										    <span style="width:1mm"/>
										    <span style="font-weight:bold">13</span>
										    <span style="width:1.5mm"/>Local tax withheld
									      </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.3mm;width:31.9mm;
										    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										    border-left:1px solid black">&#160;
                                          </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:5.2mm;width:31.9mm;
										    font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
										    border-left:1px solid black">&#160;
                                          </td>
									    </tr>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 14 -->
						    <td valign="top">
							  <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
									  <tbody>
									    <tr>
										  <td scope="col" style="font-size:7pt;border-left-width:0px;padding-bottom:0mm;
										    border-right:1px solid black;border-top:0px solid black">
										    <span style="width:.5mm"/>
										    <span style="font-weight:bold">14</span>
										    <span style="width:1mm"/>Name of locality
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.3mm;width:31.5mm;
										    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
										    text-align:left">&#160;
                                          </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:5.2mm;width:31.5mm;
										    font-size:6pt;border-bottom-width:1px solid black;border-right:1px solid black;
										    text-align:left">&#160;
                                          </td>
									    </tr>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 15 -->
						    <td valign="top">
							  <table width="25.5mm" border="0" cellpadding="0" cellspacing="0">
							    <tr>
								  <!--<td colspan="3">-->
								    <table border="0" cellpadding="0"  cellspacing="0" style="width:25.5mm;float:left;">
									  <tbody>
									    <tr>
										  <td scope="col" style="font-size:6.5pt;border-left-width:0px;padding-bottom:0mm;width:35.5mm;
										    border-right:0px solid black;">
										    <span style="width:.2mm"/>
										    <span style="font-weight:bold">15 </span>
										    <span style="width:.5mm"/>
										    <span style="font-size:6pt">Local distribution  </span> 
										  </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.38mm;width:25.5mm;
										    font-size:6pt;border-bottom:1px solid black;border-right:0px solid black;">&#160;
									      </td>
									    </tr>
									    <tr>
										  <td class="styIRS1099RLNAmountBoxNLB" style="height:5.2mm;width:25.5mm;
                                            font-size:6pt;border-top:0px;border-bottom-width:1px solid black;
                                            border-right:0px solid black;">&#160;
										  </td>
									    </tr>
									  </tbody>
								    </table>
								  <!--</td>-->
							    </tr>
							  </table>
						    </td>
						  </xsl:if>						
						
						  <!-- Code for Data in Boxes 10, 11, 12, 13, 14 and 15 or greater than 3 data items-->
                          <xsl:if test="(count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &gt;=3) and 
						   ($Print != $Separated) ">
						    <!-- Box 10 -->
						    <td valign="top">
							  <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or 
									      (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &gt;= 3)">
									      <tr>
										    <td scope="col" style="font-size:6.5pt;padding-bottom:0mm;border-right:1px solid black;
										      border-left:1px solid black">
											  <span style="width:1mm"/>
											  <span style="font-weight:bold">10</span>
											  <span style="width:1.5mm"/>State tax withheld
                                            </td>
										  </tr>
										  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
                                                    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
                                                    border-left:1px solid black"><!--valign="bottom">-->
												    <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </td>
											    </tr>
											  </xsl:when>
										      <xsl:otherwise>
										        <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
												    font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
												    border-left:1px solid black"><!--valign="bottom">-->
												    <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </td>
											    </tr>
											  </xsl:otherwise>
										    </xsl:choose>
										  </xsl:for-each>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 11 -->
						    <td valign="top">
							  <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or 
									      (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &gt;= 3)">
										  <tr>
										    <td scope="col" style="font-size:6pt;border-left-width:0px;padding-bottom:0mm;
                                              border-right:1px solid black;">
											  <span style="width:.3mm"/>
											  <span style="font-weight:bold">11</span>
											  <span style="width:.3mm"/>State/Payer's state no.
										    </td>
										  </tr>
										  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:5mm;width:31.5mm;
												    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
												    text-align:left" valign="bottom">
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
												    </xsl:call-template>/
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="PayersStateIdNumber"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </td>
											    </tr>
											  </xsl:when>
											  <xsl:otherwise>
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;text-align:left;
												    border-top:0px;width:31.5mm;font-size:6pt;border-bottom:1px solid black;
												    border-right:1px solid black;" valign="bottom">
                                                    <xsl:call-template name="PopulateText">
												      <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
												    </xsl:call-template>/
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="PayersStateIdNumber"/>
												    </xsl:call-template>
												    <span style="width:1.5mm;"/>
												  </td>
										        </tr>
											  </xsl:otherwise>
										    </xsl:choose>
										  </xsl:for-each>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 12 -->
						    <td valign="top">
							  <table width="25.3mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
							    <tr>
								  <td colspan="3" class="styIRS1099R_tdRight">
								    <table border="0" cellpadding="0" cellspacing="0" style="width:25.3mm;float:left;">
									  <tbody>
									    <xsl:if test="($Print != $Separated) or
									     (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp) &gt;= 3)">
									      <tr>
										    <td scope="col" style="font-size:6.5pt;border-left-width:0px;padding-bottom:0mm;height:3.7mm;
                                              border-right:0px solid black;border-top:0px solid black;">
											  <span style="width:.2mm"/>
											  <span style="font-weight:bold">12</span>
											  <span style="width:.5mm"/>
											  <span style="font-size:6pt">State distribution</span>
										    </td>
										  </tr>
										  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:25.5mm;
												    font-size:6pt;border-bottom:1px solid black;border-right:0px solid black;"
												    valign="bottom">
												    <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
												    <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="StateDistributionAmt"/>
												    </xsl:call-template>
												    <span style="width:1mm;"/>
											      </td>
											    </tr>
											  </xsl:when>
										      <xsl:otherwise>
											    <tr>
											      <div class="GenericDiv">
												    <td class="styIRS1099RLNAmountBoxNLB" style="height:4.4mm;font-size:6pt;
												      border-top:0px;width:25.5mm;border-right:0px solid black;
												      border-bottom-width:1px solid black;" valign="bottom">
                                                      <span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
												      <xsl:call-template name="PopulateAmount">
													    <xsl:with-param name="TargetNode" select="StateDistributionAmt"/>
												      </xsl:call-template>
												      <span style="width:1mm;"/>
												    </td>
												  </div>
											    </tr>
											  </xsl:otherwise>
										    </xsl:choose>
										  </xsl:for-each>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 13 -->
						    <td valign="top">
							  <table width="31.9mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
								<tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
									<table cellpadding="0" cellspacing="0" style="width:31.9mm;float:left;">
									  <tbody>
										<xsl:if test="($Print != $Separated) or 
										  (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp)
                        	               &gt;= 3)">
										  <tr>
											<td scope="col" style="font-size:7pt;padding-bottom:0mm;border-top:0px;
                                              border-right:1px solid black;border-left:1px solid black">
											  <span style="width:1mm"/>
											  <span style="font-weight:bold">13</span>
											  <span style="width:1.5mm"/>Local tax withheld</td>
										  </tr>
										  <xsl:for-each 
						 select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
												<tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
                                                    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
                                                    border-left:1px solid black" valign="bottom">
													<span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
													  <xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
													  </xsl:call-template>
													  <span style="width:1.5mm;"/>
												  </td>
												</tr>
											  </xsl:when>
											  <xsl:otherwise>
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4mm;width:31.9mm;
												    font-size:6pt;border-bottom:1px solid black;border-right:1px solid black;
												    border-left:1px solid black" valign="bottom">
                                                    <span style="font-size: 7.5pt;float:left;padding-left:1.5mm">$</span>
													<xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalTaxWithheldAmt"/>
													</xsl:call-template>
													<span style="width:1.5mm;"/>
												  </td>
												</tr>
											  </xsl:otherwise>
											</xsl:choose>
										  </xsl:for-each>
										</xsl:if>
									  </tbody>
									</table>
								  </td>
								</tr>
							  </table>
							</td>
							<!-- Box 14 -->
							<td valign="top">
							  <table width="31.5mm" border="0" cellpadding="0" cellspacing="0" style="float:left">
								<tr>
								  <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
									<table cellpadding="0" cellspacing="0" style="width:31.5mm;float:left;">
									  <tbody>
										<xsl:if test="($Print != $Separated) or
										 (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp)
                       	                  &gt;= 3)">
			 	                          <tr>
										    <td scope="col" style="font-size:7pt;border-left-width:0px;padding-bottom:0mm;
                                              border-right:1px solid black;border-top:0px solid black">
											  <span style="width:.5mm"/>
											  <span style="font-weight:bold">14</span>
											  <span style="width:1mm"/>Name of locality
										    </td>
										  </tr>
										  <xsl:for-each
					     select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.5mm;
												    border-bottom:1px solid black;font-size:6pt;border-right:1px solid black;
												    text-align:left" valign="bottom">
											        <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
												    </xsl:call-template>
												  </td>
											    </tr>
											  </xsl:when>
											  <xsl:otherwise>
											    <tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.6mm;width:31.5mm;
												    font-size:6pt;border-bottom-width:1px solid black;border-right:1px solid black;
												    text-align:left" valign="bottom">
                                                    <xsl:call-template name="PopulateText">
													  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
												    </xsl:call-template>
												  </td>
											    </tr>
											  </xsl:otherwise>
										    </xsl:choose>
										  </xsl:for-each>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    <!-- Box 15 -->
						    <div>
						    <td>
							  <table width="25.53mm" border="0" cellpadding="0" cellspacing="0" style="float:left;">
							    <tr>
							      <td colspan="3" class="styIRS1099R_tdRight" style="border-top-width:0px">
								    <table cellpadding="0" cellspacing="0" style="width:25.51mm;float:left">
									  <tbody>
									  	<xsl:if test="($Print != $Separated) or
									  	 (count($Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp)
                        	              &gt;= 3)">
										  <tr>
											<td scope="col" style="font-size:6.5pt;border-left-width:0px;padding-bottom:0mm;
                                              border-right:0px solid black;height:3.5mm">
											  <span style="width:.5mm"/>
											  <span style="font-weight:bold">15</span>
											  <span style="width:1mm"/>
											  <span style="font-size:6pt">Local distribution</span>
											</td>
										  </tr>
										  <xsl:for-each 
						 select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp/F1099RLocalTaxGrp">
										    <xsl:choose>
											  <xsl:when test="position() = 1">
												<tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.2mm;width:25.3mm;
												    font-size:6pt;border-bottom:1px solid black;border-right:0px solid black;" valign="bottom">
													<span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
													<xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalDistributionAmt"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												  </td>
												</tr>
											  </xsl:when>
											  <xsl:otherwise>
												<tr>
												  <td class="styIRS1099RLNAmountBoxNLB" style="height:4.37mm;font-size:6pt;
												    border-top:0px;width:25.3mm;border-bottom-width:1px solid black;
                                                    border-right:0px solid black;clear:none" valign="bottom">
													<span style="font-size:6.5pt;float:left;padding-left:.5mm">$</span>
										            <xsl:call-template name="PopulateAmount">
													  <xsl:with-param name="TargetNode" select="LocalDistributionAmt"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
												  </td>
												</tr>
											  </xsl:otherwise>
											</xsl:choose>
										  </xsl:for-each>
									    </xsl:if>
									  </tbody>
								    </table>
								  </td>
							    </tr>
							  </table>
						    </td>
						    </div>
						  </xsl:if>
						</div><!-- Closes Boxes 10, 11, 12, 13, 14 and 15 -->
					</div>
					<!-- Last lines under form -->
					<div style="width:187mm;">
						<span style="font-size:6pt">Form </span>
						<span style="font-weight:bold;width:80mm;font-size:7.5pt">1099-R</span>
						<!--<span style="width:40mm;font-size: 6pt;">Cat. No. 14436Q</span>-->
						<span style="width:38mm"/>
						<span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
						
						<!-- Code for Embedded spaces &#160;&#160;&#160-->
					</div>
					
					<div class="pageEnd" style="width:187mm;"/>
					<!-- BEGIN Left Over Table -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" 
							onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1099RData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1099RData/PayerNameControl"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard or NonStandard Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1099RData/StandardOrNonStandardCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					
					<!-- Optional Separated Print for Repeating Data Table for Lines 10, 11, 12, 13, 14 and 15 -->
					<xsl:if test="($Print = $Separated) and (count($Form1099RData/F1099RStateLocalTaxGrp) &gt;2)">
					  <br/>
						<span class="styRepeatingDataTitle"> Form 1099R, Lines 10, 11, 12, 13, 14 and 15</span>
						  <table class="styDepTbl" style="font-size:6pt;">
							<thead class="styTableThead">
							  <!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>10</b> State tax withheld</th>
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>11</b> State/Payer's state no.</th>
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>12</b> State distribution</th>
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>13</b> Local tax withheld</th>
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>14</b> Name of Locality</th>	
								  <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
									<b>15</b> Local distribution</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
							  <xsl:for-each select="$Form1099RData/F1099RStateLocalTaxGrp/F1099RStateTaxGrp">
							    <tr style="border-color:black;">
								  <!-- Define background colors to the rows -->
								  <xsl:attribute name="class">
								    <xsl:choose>
									  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									  <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
								  </xsl:attribute>
								  <!-- First Column -->
								  <td class="styDepTblCell" align="right">
								    <div style="width:25mm;">
								      <xsl:if test="StateTaxWithheldAmt">
								        <span style="float:left;padding-left:1.5mm">$</span>
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
									    </xsl:call-template>
									  </xsl:if>
									</div>
								  </td>
								  <!-- Second Column -->
								  <td class="styDepTblCell" align="left">
								    <div style="width:38mm;">
									  <xsl:if test="StateAbbreviationCd">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
										</xsl:call-template>/
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" select="PayersStateIdNumber"/>
										</xsl:call-template>
									  </xsl:if>
									</div>
								  </td>
								  <!-- Third Column -->
								  <td class="styDepTblCell" align="right">
								    <div style="width:24mm;">
									  <xsl:if test="StateDistributionAmt">
									    <span style="float:left;padding-left:.5mm">$</span>
									  	<xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="StateDistributionAmt"/>
										</xsl:call-template>
                                      </xsl:if>
									</div>
								  </td>
								  <!-- Fourth Column -->
								  <td class="styDepTblCell" align="right">
								    <div style="width:25mm;">
									  <xsl:if test="F1099RLocalTaxGrp/LocalTaxWithheldAmt">
									    <span style="float:left;padding-left:1.5mm">$</span>
									  	<xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" 
										         select="F1099RLocalTaxGrp/LocalTaxWithheldAmt"/>
										</xsl:call-template>
									  </xsl:if>
									</div>
								  </td>
								  <!-- Fifth Column -->
								  <td class="styDepTblCell" align="left">
								    <div style="width:36mm;">
									  <xsl:if test="F1099RLocalTaxGrp/NameOfLocality">
										<xsl:call-template name="PopulateText">
										  <xsl:with-param name="TargetNode" 
										  		select="F1099RLocalTaxGrp/NameOfLocality"/>
										</xsl:call-template>
									  </xsl:if>
									</div>
								  </td>
								  <!-- Sixth Column -->
								  <td class="styDepTblCell" align="right">
								    <div style="width:25mm;">
									  <xsl:if test="F1099RLocalTaxGrp/LocalDistributionAmt">
									    <span style="float:left;padding-left:1.5mm">$</span>
									    <xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" 
	                                             select="F1099RLocalTaxGrp/LocalDistributionAmt"/>
		  							    </xsl:call-template>
									  </xsl:if>
									</div>
							      </td>
							    </tr>
							  </xsl:for-each>
						    </tbody>
						  <!--</thead>-->
				        </table>
					  </xsl:if>
					<!--</div>-->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
