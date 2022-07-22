<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS3468Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form3468Data" select="$RtnDoc/IRS3468"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form3468Data)"/>
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
				<meta name="Description" content="IRS Form 3468"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS3468Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form3468">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:19mm;">
						<div class="styFNBox" style="width:34mm;">
							<div style="height:13.5mm;">
            Form <span class="styFormNumber">3468</span>
								<div style="height:0mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="height:9mm;font-family:arial;font-size:7pt; padding-top:2mm;">
								<div class="styAgency">Department of the Treasury</div>
								<span class="styAgency">Internal Revenue Service</span>
								<span class="styAgency" style="padding-left:3mm;">(99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:122mm;height:20mm;padding-top:2mm;">
							<div class="styMainTitle" style="height:12mm;">Investment Credit</div>
							<div class="styFBT" style="padding-top:1.5mm;">
								<img src="{$ImagePath}/3468_Bullet.gif" alt="bullet image"/> Attach to your tax return. 
								See instructions.</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;line-height:110%;padding-top:0mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0155</div>
							<div style="text-align:left;padding-left:3mm;">
								<div class="styTY" style="height:9.5mm;">20<span class="styTYColor">08</span>
								</div>
								<div style="padding-top:0mm;">	
                                   Attachment
                                   Sequence No.<span class="styBoldText">52</span>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:146mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:30mm;height:4mm;font-size:7pt;font-weight:bold;padding-left:2mm;">
          Identifying number<br/>
							<br/>
							<span style="width:25mm;text-align:left;font-size:7pt;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Start of Part one -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:13mm;">Part I</div>
						<span class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Information Regarding the Election To Treat the Lessee as the Purchaser of Investment Credit Property
					      </span>
					</div>
					<div style="width:187mm;padding-left:5mm;">
					      If you are claiming the investment credit as a lessee based on a section 48(d) (as in effect on November 4, 
					      1990) election, provide the following information. If you acquired more than one property as a lessee, 
					      attach a statement showing the information below.
					 </div>
					<div class="styBB" style="width:187mm;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">1</div>
							<div class="styLNDesc" style="width:25mm;height:4mm;">
                                        Name of lessor
                                      <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form3468Data/NameOfLessor"/>
								</xsl:call-template>
							</div>
							<span class="styUnderlineAmount" style="float:left; width:154mm;border-bottom-width:1px;
							   text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/NameOfLessor"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">2</div>
							<div class="styLNDesc" style="width:25mm;height:4mm;">
                                        Address of lessor
							</div>
							<span class="styUnderlineAmount" style="float:left; width:154mm;border-bottom-width:1px;
							    text-align:left;">
								<!-- <xsl:call-template name="PopulateMonthDayYear">  -->
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/USAddressOfLessor/AddressLine1"/>
								</xsl:call-template>
								<span style="width:2mm"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/USAddressOfLessor/AddressLine2"/>
								</xsl:call-template>
								<span style="width:1mm"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/USAddressOfLessor/City"/>
								</xsl:call-template>
								<span style="width:1mm"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/USAddressOfLessor/State"/>
								</xsl:call-template>
								<span style="width:1mm"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/USAddressOfLessor/ZIPCode"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3</div>
							<div class="styLNDesc" style="width:31mm;height:4mm;">
                                        Description of property
							</div>
							<span class="styUnderlineAmount" style="float:left; width:148mm;border-bottom-width:1px;
							        text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form3468Data/DescriptionOfProperty"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">4</div>
							<div class="styLNDesc" style="width:137mm;height:4mm;">
                                        Amount for which you were treated as having acquired the property
                                                           <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
                                                   <span style="width:16px;"/>.
									      <span style="width:16px;"/>.
                                             </span>
								<img src="{$ImagePath}/3468_Bullet.gif" width="7" alt="bullet image"/>
							</div>
							<span class="styUnderlineAmount" style="width:2mm;border-bottom-width:0px;">$</span>
							<span style="float:left; width:32mm;padding-top:.5mm;padding-left:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/AmountTreatedAsAcquiredProp"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Start of part 2 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part II </div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Energy Credit (For Tax Years Beginning Before October 4, 2008), Qualifying Advanced Coal Project
                               Credit, Qualifying Gasification Project Credit, and Qualifying Advanced Energy Project Credit
					      </div>
					</div>
					<!-- Start of Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm; ">5</div>
						<div class="styLNDesc" style="width:137mm;">
                                                   Energy credit: </div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm"/>
					</div>
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:98mm;font-size:7pt;">
                                          Basis of property using geothermal energy placed in service during
                                <span style="float:left;">the tax year (see instructions) </span>
									<span style="float:right;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:32mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/PropGeothermalEnergyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 10% (.10)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5a</div>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcPropGeothermalEnergyBasis"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 5a -->
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:98mm;font-size:7pt;">
                                         Basis of property using solar illumination or solar energy placed in service
                                     <span style="float:left;">during the tax year (see instructions) </span>
									<span style="float:right;">
										<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:30mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/PropSolarIllOrEnergyBasis"/>
											</xsl:call-template>
										</span>
										<span style="float:right;width:17mm;padding-top:0mm;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5b</div>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcPropSolarIllOrEnergy"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm;"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 5b -->
					<!-- Line 5c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:1mm; "/>
						<div class="styLNDesc" style="width:137mm;">
                                                   Qualified fuel cell property (see instructions): </div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm"/>
					</div>
					<!--  Line 5c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">c</div>
						<div style="width:58mm;float:left;">
                                  Basis of property installed before October
                                    <span style="float:left;"> 4, 2008</span>
							<span style="float:right;">
								<span style="width:1mm;border-botom-width:0px;float:left;padding-left:1.5mm;">$</span>
								<span class="styUnderlineAmount" style="width:25mm;padding-top:0px;
                                           padding-bottom:0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfPropInstldBeforOct"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:18mm;padding-top:0mm;">x 30% (.30)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">5c</div>
							<div class="styLNAmountBox" style="width:32.4mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfPropInstBeforOct"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5c -->
					<!--  Line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:58mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property in <b>c</b> above</span>
							<span style="float:right;width:6mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyEnergyCrdtKwCapacity"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:15mm;padding-top:0mm;">x  $1,000</span>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.1mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">5d</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyEnergyCrdtKwCapacity"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 8.5mm;width:39mm;
							      background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5d -->
					<!-- Line 5e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;">
                                                   Enter the lesser of line 5c or 5d
                                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
            </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5e</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.9mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyEnergyCrdtKwBasis"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- End of line 5e -->
					<!-- Line 5f -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">f</div>
						<div style="width:58mm;float:left;">
                                  Basis of property installed after October 3,
                                      <span style="float:left;"> 2008</span>
							<span style="float:right;">
								<span style="width:0mm;border-botom-width:0px;float:left;padding-left:0mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:1px;
                                           padding-bottom:0px;font-size:">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/EnergyCrdtPropBasis"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:17mm;padding-top:0mm;">x 30% (.30)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">5f</div>
							<div class="styLNAmountBox" style="width:32.4mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcEnergyCrdtPropBasis"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5f -->
					<!--  Line 5g -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="width:58mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property in <b>f</b> above
                                  <span style="width:2mm;"/>
							</span>
							<span style="float:right;width:4mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyEnergyCreditKwCapacity"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:15mm;padding-top:0mm;">x  $3000</span>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.1mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">5g</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcEnergyCrdtKwBasis"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 8.5mm;width:39mm;
							      background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5g -->
					<!-- Line 5h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;">
            Enter the lesser of line 5f or 5g
            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5h</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.9mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyEnergyCrdtPropBasis"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- End of line 5h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:137.1mm;">
                                 Qualified microturbine property (see instructions):	</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!--  Line 5i -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">i</div>
						<div style="width:58mm;float:left;">
                                  Basis of property installed during the tax
                                      <span style="float:left;">year</span>
							<span style="float:right;">
								<span style="width:1mm;border-botom-width:0px;float:left;padding-left:0mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropBasis"/>
									</xsl:call-template>
								</span>
								<span style="float:left;width:17mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">5i</div>
							<div class="styLNAmountBox" style="width:32.4mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMicroturbinePropBasis"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5i -->
					<!--  Line 5j -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="width:58mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property in <b>i</b> above
                                  <span style="width:2mm;"/>
							</span>
							<span style="float:right;width:4mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropKWCapacity"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:15mm;padding-top:0mm;">x  $200</span>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.1mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">5j</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMicroturbinePropKWCap"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 8.5mm;width:39mm;
							      background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5j -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">k</div>
						<div class="styLNDesc" style="width:98.1mm;">
            Enter the lesser of line 5i or 5j
            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox">5k</div>
						<div class="styLNAmountBox" style="width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyMicroturbineKwBasis"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- End of line 5k -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:137.1mm;">
                                 Combined heat and power system property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNDesc" style="padding-left:0mm;width:145.1mm;">
							<div class="styLNDesc" style="width:140mm;padding-left:3mm;">
								<b>Caution:</b> You cannot claim this credit if the electrical capacity of the property is more
								 than 50 megawatts or 67,000 horsepower.</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 8.5mm"/>
					</div>
					<!-- Line 5l -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">l</div>
						<div style="width:58mm;float:left;">
                                  Basis of property installed after October 3, 
                                      <span style="float:left;"> 2008</span>
							<span style="float:right;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfProp"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:17mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">5l</div>
							<div class="styLNAmountBox" style="width:32.4mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfProp"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5l -->
					<!-- Line 5m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">m</div>
						<div class="styLNDesc" style="width:137.1mm;">
                                 If the electrical capacity of the property is measured in:</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 5.5mm"/>
					</div>
					<!-- Line 5m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;"/>
						<div style="width:58mm;float:left;">
							<li>Megawatts, divide 15 by the megawatt capacity. Enter 1.0 if the capacity is 15
                                        megawatts or less</li>
							<li>Horsepower, divide 20,000 by the horsepower. Enter 1.0 if the capacity is
                                         20,000 horsepower or less</li>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.4mm;padding-top:12mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">5m</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/MegaHorseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 20mm;width:38.6mm;
                                     background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:20mm"/>
						<div class="styLNAmountBoxNBB" style="height: 20mm;"/>
					</div>
					<!--  End of 5m -->
					<!-- Line 5n -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">n</div>
						<div class="styLNDesc" style="width:98.3mm;height:4.5mm;">
            Multiply line 5l by 5m
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5n</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/QlfySmallWindEnergyProp"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;width:8mm;height:6mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6mm"/>
					</div>
					<!-- End of line 5n -->
					<!-- Line 5o-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:137.1mm;height:4.5mm;">
                                 Qualified small wind energy property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 5o -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">o</div>
						<div style="width:58mm;float:left;">
                                  Basis of property installed after October  3,
                                      <span style="float:left;"> 2008, and before 2009</span>
							<div style="width:57mm;">
								<span style="float:left;width:2mm;border-botom-width:0px;padding-left:0mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropertyBasis"/>
									</xsl:call-template>
								</span>
								<span style="float:left;width:18mm;padding-left:1mm;">x 30% (.30)</span>
							</div>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:6mm;padding-top:5.5mm;">5o</div>
							<div class="styLNAmountBox" style="width:32.mm;height:6mm;padding-top:5.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGeothermalEnergyPropBssCr"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:10mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:10mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 5o -->
					<!--Line 5p -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">p</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;">
            Enter the smaller of line 5o or $4,000
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="">5p</div>
						<div class="styLNAmountBox" style="width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyWindEnergyBasis"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- End of line 5p -->
					<!-- Line 5q-->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">q</div>
								<div class="styLNDesc" style="width:50mm;font-size:7pt;float:left;">
                                          Basis of property installed after 2008
                               </div>
								<span style="float:left;clear:none;">
									<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfPropInstalled"/>
										</xsl:call-template>
									</span>
									<span style="width:16.5mm;padding-top:0mm;">x 30% (.30)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">5q</div>
								<div class="styLNAmountBox" style="height:4mm;padding-top:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfPropInstalled"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:4mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of line 5q -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;"/>
						<div class="styLNDesc" style="width:137.1mm;height:4.5mm;">
                                 Geothermal heat pump systems (see in structions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- Line 5r -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">r</div>
								<div class="styLNDesc" style="width:98mm;font-size:7pt;">
                                         Basis of property installed after October 3, 2008
                                     <span style="float:left;"/>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/PropSolarIllOrEnergyBasis"/>
											</xsl:call-template>
										</span>
										<span style="float:left;width:19mm;padding-top:0mm;padding-left:2mm;">x 10% (.10)</span>
										<!--Dotted Line-->
										<span class="styBoldText" style="float:right">
											<span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
								  	                     <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  <span style="width:16px;"/>.
                                                                  
                                                                   </span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5r</div>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssOfGeothermalProp"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm;"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of line 5r -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm;"/>
						<div class="styLNDesc" style="width:137.1mm;">
                                 Qualified investment credit facility property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:0mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 0mm"/>
					</div>
					<!-- Line 5q -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;padding-bottom:0mm;">s</div>
								<div class="styLNDesc" style="width:50mm;font-size:6.5pt;float:left;padding-bottom:0mm;">
                                          Basis of property installed after 2008
                               </div>
								<span style="float:left;clear:none;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfPropInstalledAfter"/>
										</xsl:call-template>
									</span>
									<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 30% (.30)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNRightNumBox" style="height:3mm;padding-top:0mm;">5s</div>
								<div class="styLNAmountBox" style="height:3mm;padding-top:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfPropInstalledAfter"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:4mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of line 5s -->
					<!-- Line 5t -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">t</div>
						<div class="styLNDesc" style="width:137.1mm;height:4.5mm;">
				                          Total. Add lines 5a, 5b, 5e, 5h, 5k, 5n, 5p, 5q, 5r, and 5s
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                        
                                      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;">5t</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalEnergyCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 5t -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12276E</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText" style="font-size:9pt;">3468</span> (2008)</div>
					</div>
					<div style="width:187mm;padding-top:1mm;">
               Form <span class="styBoldText" style="font-size:8pt;">3468</span> (2008)
                          <span style="width:150mm;"/>
						<span style="width:10mm;">Page <span class="styBoldText" style="font-size:9pt;">2</span>
						</span>
					</div>
					<!-- END Page Header -->
					<!-- Start of part 2 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part II</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
                            Energy Credit (For Tax Years Beginning Before October 4, 2008), Qualifying Advanced Coal Project               
                            Credit, Qualifying Gasification Project Credit  and Qualifying Advanced Energy Project 
                            Credit <span style="font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">6</div>
						<div class="styLNDesc" style="padding-top:2mm;">
                                            Qualifying advanced coal project credit (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 6a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:95mm;font-size:7pt;">
                                          Basis of qualified investment in integrated gasification combined cycle
property placed in service during the tax year for projects described

                                <span style="float:left;">in section 48A(d)(3)(B)(i)</span>
									<span style="float:right;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:33mm;height:3.5mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/IntgrtGasCombCycPropInvstBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:25mm;padding-top:0mm;">x 20% (.20)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">6a</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGasCombinedCycPropInvstCr"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 6a -->
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:98mm;">
                                           Basis of qualified investment in advanced coal-based generation technology
                                            property placed in service during the tax year for projects 
                                <span style="float:left;">described in section 48A(d)(3)(B)(ii)</span>
									<span style="float:left">
										<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:28mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/EnvInAdvSubCoalGenBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 15% (.15)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">6b</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcEnvInAdvSubCoalBasedGen"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 6b -->
					<!-- Line 6c -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:98mm;">
                                                      Basis of qualified investment in advanced coal-based generation technology
                                                     property placed in service during the tax year for projects                  
              <span style="float:left;">described in section 48A(d)(3)(B)(iii)</span>
									<span style="float:left;">
										<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyEnvInAdvLigniteCoalBaseGen"/>
											</xsl:call-template>
										</span>
										<span style="width:16mm;padding-top:0mm;font-size:6.3pt;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">6c</div>
								<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcEnvInAdvLigniteCoalBaseGen"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:11mm"/>
								</div>
							</div>
						</div>
					</div>
					<!--  End of line 6c -->
					<!-- Line 6d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
				                          Total. Add lines 6a, 6b, and 6c
                                       <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 						   		  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox">6d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalQlfyAdvCoalProjectCrdt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 6d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:0mm;">7</div>
						<div class="styLNDesc" style="width:138mm;">
                                            Qualifying gasification project credit (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 7a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:95mm;font-size:7pt;">
                                          Basis of qualified investment in qualified gasification property placed
                                           in service during the tax year for which credits were allocated or
                                           reallocated after October 3, 2008, and that include equipment that
                                          separates and sequesters at least 75% of the project’s carbon dioxide
                               <span style="float:left;"> emissions
                                 <span style="width:2mm"/>
									</span>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:33mm;height:3.5mm;padding-top:0px;padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyGasificationPropertyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:39.9mm;padding-top:13mm;">
								<div class="styLNRightNumBox" style="height:3mm;padding-top:1.5mm;">7a</div>
								<div class="styLNAmountBox" style="height:3mm;padding-top:1.5mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyGasificationBasis"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:18.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:18.5mm"/>
						<!--<div class="styLNAmountBoxNBB" style="height: 2mm;background-color:yellow;width:2mm;float:left;"/>    -->
					</div>
					<!-- End of 7a -->
					<!-- Line 7b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:94mm;font-size:7pt;">
                                          Basis of qualified investment in property other than in <b>a</b> above placed
                                  <span style="float:left;">in service during the tax year</span>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/OtherQlfyInvstPropertyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 20% (.20)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">7b</div>
								<div class="styLNAmountBox" style="width:32mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOtherQlfyInvstPropCredit"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of line 7b -->
					<!-- Line 7c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:138mm;">
				                          Total. Add lines 7a and 7b
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              <span style="width:16px;"/>.
                                              
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">7c</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalQlfyGasificationProjCrdt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 7c -->
										<!-- End of Line 6d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-top:0mm;">8</div>
						<div class="styLNDesc" style="width:138mm;">
                                             Qualifying advanced energy project credit (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>

					<!--Line 8a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:106mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:98mm;font-size:7pt;">
                                          Basis of qualified investment in advanced energy project property placed  
                                  <span style="float:left;">in service after February 17, 2009</span>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;padding-left:1mm;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/BasisQlfyInvstAdvEnergy"/>
											</xsl:call-template>
										</span>
										<span style="width:19mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:81mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">8a</div>
								<div class="styLNAmountBox" style="width:32mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisQlfyInvstAdvEnergy"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 8a -->
					<!-- Line 8b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:138mm;">
				                          Credit from cooperatives. Enter the unused investment credit from cooperatives
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">8b</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CreditFromCooperatives"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 8b -->
					<!-- Line 9 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">9</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
				                          Add lines 5t, 6d, 7c, 8a, and 8b.  Report this amount on Form 3800, line 1a
				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  		<span style="width:16px;"/>.
	<span style="width:16px;"/>.

                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;">9</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CurrentYearCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 9 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
					      Rehabilitation Credit (For Tax Years Beginning in 2008) and Energy Credit (For Tax Years Beginning
                               <br/> After October 3, 2008)</div>
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:139mm;padding-top:2mm;">
                                            Rehabilitation credit (see instructions for requirements that must be met):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- End of line 10 -->
					<!-- Line 10a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:139mm;">
                                            Check this box if you are electing under section 47(d)(5) to take your qualified rehabilitation
                                            expenditures into account for the tax year in which paid (or, for self-rehabilitated property,
                                            when capitalized). See instructions. <b>Note.</b> This election applies to the current tax year 
                                            and to all later tax years. You may not revoke this election without IRS consent
        							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                         	<span style="width:16px;"/>.
	     							<span style="width:4px;"/>
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
								<span style="width:2mm;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationExpendituresUsed"/>
										<xsl:with-param name="BackupName">
										IRS3468RehabilitationExpendituresUsed</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:15.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 15.5mm"/>
					</div>
					<!-- End of line 10a -->
					<!-- Line 10b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div style="float:left;clear:none;">
							<div style="width:139mm;">
								<div class="styLNDesc" style="width:95mm;font-size:7pt;">
                                          Enter the date on which the 24- or 60-month measuring period begins
                   <!--               <span style="float:left;"></span>
									<span style="float:left;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:32mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropertyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 20% (.20)</span>
									</span>    -->
								</div>
								<span class="styUnderlineAmount" style="float:none:;width:30mm;padding-top:0px;
                                           padding-bottom:0px;text-align:center;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form3468Data/RehbltTaxPeriodBeginningDate"/>
									</xsl:call-template>
								</span>
							</div>
							<span class="styLNDesc" style="width:13mm;padding-top:0mm;;">and ends</span>
							<span class="styUnderlineAmount" style="float:none:;width:30mm;padding-top:0px;
                                           padding-bottom:0px;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form3468Data/RehbltTaxPeriodEndDate"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8.5mm"/>
						</div>
					</div>
					<!-- End of line 10b -->
					<!-- Line 10c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:139mm;padding-top:0mm;">
                                        Enter the adjusted basis of the building as of the beginning date above
                                        (or the first day of your holding period, if later)
                                        <span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
  								  	<span style="width:16px;"/>.
								  	
							</span>
							<span style="width:2mm;">$</span>
							<span style="border-style: solid; border-color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;width:29mm;height:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/AdjustedBasisOfBuildingAmount"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!-- End of line 10c -->
					<!-- Line 10d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:139mm;padding-top:0mm;">
                                       Enter the amount of the qualified rehabilitation expenditures incurred, or
treated as incurred, during the period on line 10b above
                                        <span class="styBoldText">
								<span style="width:2px;"/>
								<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
                                             <span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:16px;"/>.
 								  	<span style="width:14px;"/>.
 								  	
							</span>
							<span style="width:2mm;">$</span>
							<span style="border-style: solid; border-color:black;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;width:29mm;height:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltExpendituresAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!-- End of line 10d -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style=""/>
						<div class="styLNDesc" style="width:139mm;">
                                       Enter the amount of qualified rehabilitation expenditures and multiply by the percentage shown:</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 10e -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:90mm;">
                                          Pre-1936 buildings located in the Gulf Opportunity Zone
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendPre1936Buildings"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936BuildingsLoc"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 13% (.13)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10e</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendPre1936Buildings"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 10e -->
					<!-- Line 10f -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Pre-1936 buildings affected by a Midwestern disaster
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltPre1936BldsAffected"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 13% (.13)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10f</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcRehbltPre1936BldsAffected"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 10f -->
					<!-- Line 10g -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Other pre-1936 buildings
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyRehbltOtherPre1936Blds"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 10% (.10)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10g</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcExpendituresPre1936Blds"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 10g -->
					<!-- Line 10h -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">h</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Certified historic structures located in the Gulf Opportunity Zone
                                      <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcCertifiedHistoricStructure"/>
									</xsl:call-template>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructuresLoc"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 26% (.26)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10h</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcCertifiedHistoricStructure"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 10h -->
					<!-- Line 10i -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">i</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Certified historic structures affected by a Midwestern disaster
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/CertHistoricStructuresAffected"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 26% (.26)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10i</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcCertHistStructuresAffected"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 10i -->
					<!-- Line 10j -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.8mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">j</div>
								<div class="styLNDesc" style="width:90mm;font-size:7pt;">
                                          Other certified historic structures
                                                  <!-- dotted line -->
									<span class="styBoldText">
										<span style="width:4px;"/>
										<span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
							            </span>
								</div>
								<span style="float:left;">
									<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/OtherCertHistoricStructures"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 20% (.20)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40mm;">
								<div class="styLNRightNumBox" style="width:8mm;height:3mm;padding-top:.5mm;">10j</div>
								<div class="styLNAmountBox" style="width:31mm;height:3mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOtherCertHistoricStructure"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Line 10j -->
					<!-- header -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="width:138.9mm;padding-top:0mm;">
                                            For properties identified on lines 10h, 10i, or 10j, complete lines 10k and 10l</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:3.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 3.5mm"/>
					</div>
					<!-- End of header -->
					<!-- Line 10k -->
					<!-- Line 11k -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.9mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">k</div>
								<div class="styLNDesc" style="width:139mm;font-size:7pt;">
                                          Enter the assigned NPS project number or the pass-through entity’s
                                <span style="float:left;">employer identification number (see instructions) 
                                                  <!-- dotted line -->
										<span class="styBoldText">
											<span style="width:4px;"/>
											<span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                        <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                         <span style="width:16px;"/>.
                                                          <span style="width:4px;"/>
										</span>
									</span>
									<span style="float:left;">
										<span class="styUnderlineAmount" style="width:32mm;text-align:left;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedRehabilitationNPS"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!--End of  Line 10k -->
					<!-- Line 10l -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:146.9mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">l</div>
								<div class="styLNDesc" style="width:139mm;font-size:7pt;">
                                          Enter the date that the NPS approved the Request for Certification
                                <span style="float:left;">of Completed Work (see instructions) 
                                                  <!-- dotted line -->
										<span class="styBoldText">
											<span style="width:4px;"/>
											<span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
                                                       <span style="width:16px;"/>.
										</span>
									</span>
									<span style="float:left;">
										<span class="styUnderlineAmount" style="width:32mm;padding-top:0px;
                                           padding-bottom:0px;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/DateOfNPSApproval"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:8mm"/>
					</div>
					<!--End of Line 10l -->
					<!-- Line 10m -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:3.2mm;">m</div>
						<div class="styLNDesc" style="width:139mm;">
				                          Rehabilitation credit from an electing large partnership (Schedule K-1 (Form 1065-B), box 9)				                           <!--Dotted Line-->
							<!--	<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                 
                                       </span>     -->
						</div>
						<div class="styLNRightNumBox" style="width:8mm;border-bottom-width:0px;">10m</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/RehabilitationCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 10m -->
					<!-- Page Break and Footer-->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3468</span> (2008)</div>
					</div>
					<div style="width:187mm;padding-top:1mm;">
               Form <span class="styBoldText" style="font-size:8pt;">3468</span> (2008)
                          <span style="width:150mm;"/>
						<span style="width:10mm;">Page <span class="styBoldText" style="font-size:9pt;">3</span>
						</span>
					</div>
					<!-- END Page Header -->
					<!-- END Page Header -->
					<!-- Start of part 2 -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc" style="font-weight:bold;font-size:7.5pt;">
                            Rehabilitation Credit (For Tax Years Beginning in 2008) and Energy Credit (For Tax Years Beginning <br/>                       After October 3, 2008) <span style="font-weight:normal">(continued)</span>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style="">11</div>
						<div class="styLNDesc" style="width:138mm;">
                                            Energy credit:</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 11a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:107.1mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
								<div class="styLNDesc" style="width:98mm;font-size:7pt;">
                                          Basis of property using geothermal energy placed in service during the
                                <span style="float:left;"> tax year (see instructions)</span>
									<span style="float:right;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:32mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/GeothermalEnergyPropertyBasis"/>
											</xsl:call-template>
										</span>
										<span style="width:17mm;padding-top:0mm;">x 10% (.10)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11a</div>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcGeothermalEnergyPropBssCr"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 11a -->
					<!-- Line 11b -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:107.1mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:98mm;">
                                         Basis of property using solar illumination or solar energy placed in service 
                                         <span style="float:left;">during the tax year (see instructions) </span>
									<span style="float:right;">
										<span style="width:2mm;border-botom-width:0px;float:left;">$</span>
										<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form3468Data/SolarIllumOrEnergyPropBss"/>
											</xsl:call-template>
										</span>
										<span style="float:right;width:17mm;padding-top:0mm;">x 30% (.30)</span>
									</span>
								</div>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">11b</div>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcSolarIllumOrEngeryPropBss"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:8mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:8mm;"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 11b -->
					<!--  Line 11c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=" padding-left:1mm; "/>
						<div class="styLNDesc" style="width:138mm;">
                                                   Qualified fuel cell property (see instructions): </div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm"/>
					</div>
					<!--  Line 11c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">c</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed during the tax
                                    <span style="float:left;">year</span>
							<span style="float:right;">
								<span style="width:1mm;border-botom-width:0px;float:left;padding-left:1.5mm;">$</span>
								<span class="styUnderlineAmount" style="width:25mm;padding-top:0px;
                                           padding-bottom:0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedFuelCellPropertyBasis"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:18mm;padding-top:0mm;">x 30% (.30)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4.5mm;padding-top:3mm;">11c</div>
							<div class="styLNAmountBox" style="width:32.mm;height:4.5mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQualifiedFuelCellPropBasis"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 11c -->
					<!--  Line 11d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:59mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property in <b>c</b> above
                                  <span style="width:3mm;"/>
							</span>
							<span style="float:right;width:4mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyFuelCellPropKwCapacity"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:15mm;padding-top:0mm;">x  $3000</span>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.1mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">11d</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyFuelCellPropKwCapacity"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 8.5mm;width:39mm;
							      background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 11d -->
					<!-- Line 5e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">e</div>
						<div class="styLNDesc" style="width:99.2mm;height:4.5mm;">
            Enter the lesser of line 11c or 11d
            <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.

                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11e</div>
						<div class="styLNAmountBox" style="width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyFuelCellPropertyCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 4.5mm"/>
					</div>
					<!-- End of line 11e -->
					<!-- Line 11 -->
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-top:0mm;">
                                            Qualified microturbine property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 5.5mm"/>
					</div>
					<!--  Line 11f -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">f</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed during the tax
                                    <span style="float:left;"> year</span>
							<span style="float:right;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:1.5mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QualifiedMicroturbinePropBasis"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:18mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">11f</div>
							<div class="styLNAmountBox" style="width:31mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcQlfyMircroturbinePropBasis"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="height: 6mm; width:10mm;border-left-width:0px;"/>
					</div>
					<!-- End of line 11f -->
					<!--  Line 11g -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;">g</div>
						<div class="styLNDesc" style="width:59mm;">
							<span style="float:left;">
                                  Kilowatt capacity of property in <b>f</b> above
                                  
                                  <span style="width:3mm;"/>
							</span>
							<span style="float:right;width:5mm;"/>
							<span style="float:left;">
								<img src="{$ImagePath}/3468_Bullet.gif" style="float" alt="right arrow"/>
							</span>
							<span style="float:right;">
								<span class="styUnderlineAmount" style="width:35mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/QlfyMicroturbinePropKwCapacity"/>
									</xsl:call-template>
								</span>
								<span style="float:left;width:12mm;padding-top:0mm;">x  $200</span>
							</span>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.1mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">11g</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/TotQlfyMicroturbinePropKwCap"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 8.5mm;width:39mm;
							      background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.2mm;background-color:lightgrey;height:8.5mm;border-right-width:1px;"/>
					</div>
					<!-- End of line 11g -->
					<!-- Line 11h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">h</div>
						<div class="styLNDesc" style="width:99.2mm;height:2.5mm;">
            Enter the lesser of line 11f or 11g
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.

                                  </span>
						</div>
						<div class="styLNRightNumBox">11h</div>
						<div class="styLNAmountBox" style="width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyMircroturbinePropBasis"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height:4.5mm"/>
					</div>
					<!-- End of line 11h -->
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-top:0mm;">
                                            Combined heat and power system property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:2.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 2.5mm"/>
					</div>
					<!-- End of Line  -->
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBox" style="width:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:141.5mm;padding-top:0mm;">
							<b>Caution:</b> You cannot claim this credit if the electrical capacity of the property is more than 50
                                   megawatts or 67,000 horsepower.</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height:7.5 mm"/>
					</div>
					<!--  Line 11i -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">i</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed during the tax
                                    <span style="float:left;"> year</span>
							<span style="float:right;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:1.5mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfPropInstall"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:18mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">11i</div>
							<div class="styLNAmountBox" style="width:32mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOfPropInstall"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="height: 6mm; width:10mm;border-left-width:0px;"/>
					</div>
					<!-- End of line 11i -->
					<!-- Line 11 -->
					<div style="width:187mm; height:2.5mm;">
						<div class="styLNLeftNumBox" style="height:2.5mm;padding-top:2mm;padding-left:4mm;">j</div>
						<div class="styLNDesc" style="width:138mm;padding-top:2mm;">
                                            If the electrical capacity of the property is measured in:</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!--  Line 11i -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:mm;float:left;padding-left:4mm;"/>
						<div style="width:58.7mm;float:left;">
							<li>Megawatts, divide 15 by the megawatt capacity. Enter 1.0 if the capacity is 15
                                        megawatts or less           
                                                     <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px;"/>
									<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                  </span>
							</li>
							<li>Horsepower, divide 20,000 by the horsepower. Enter 1.0 if the capacity is
                                         20,000 horsepower or less
                                                     <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:4px;"/>
									<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                        
                                  </span>
							</li>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:40.4mm;padding-top:12mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">11j</div>
								<div class="styLNAmountBox" style="width:32.4mm;height:6mm;padding-top:3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/MegaHorsepowerAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height: 20mm;width:39mm;
                                     background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:20mm"/>
						<div class="styLNAmountBoxNBB" style="height: 20mm;"/>
					</div>
					<!-- End of line 11j -->
					<!-- Line 11k -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">k</div>
						<div class="styLNDesc" style="width:99.1mm;height:2.5mm;">
            Multiply line 11i by 11j
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.

                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:2.5mm;">11k</div>
						<div class="styLNAmountBox" style="width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/QlfySmallWindEnergyP"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height:4.5mm"/>
					</div>
					<!-- End of line 11k -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style=""/>
						<div class="styLNDesc" style="width:138mm;">
                                    Qualified small wind energy property (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!--  Line 11l -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">l</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed before 2009
                             
							<span style="float:left;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BssOfWindEnergyProp"/>
									</xsl:call-template>
								</span>
								<span style="float:left;width:18mm;padding-left:1mm;">x 30% (.30)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">11l</div>
							<div class="styLNAmountBox" style="width:32mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBssOfWindEnergyProp"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="height: 6mm; width:10mm;border-left-width:0px;"/>
					</div>
					<!-- End of line 11l -->
					<!-- Line 11m -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">m</div>
						<div class="styLNDesc" style="width:99.2mm;height:2.5mm;">
            Enter the smaller of line 11l or $4,000
                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                        <span style="width:16px;"/>.
                                  </span>
						</div>
						<div class="styLNRightNumBox" style="height:2.5mm;">11m</div>
						<div class="styLNAmountBox" style="height:2.5mm;width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/AdjQlfyWindEnergyBss"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height:4.5mm"/>
					</div>
					<!-- End of line 11m -->
					<!-- Line 11n -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">n</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed after 2008
							<span style="float:left;">
								<span style="width:0mm;border-botom-width:0px;float:left;padding-left:0mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfWindEnergyPropInstalled"/>
									</xsl:call-template>
								</span>
								<span style="float:left;width:20mm;padding-top:0mm;padding-left:1mm;">x 30% (.30)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">11n</div>
							<div class="styLNAmountBox" style="width:32mm;height:4mm;padding-top:3mm;"/>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
						<div class="styLNAmountBoxNBB" style="height: 6mm; width:10mm;border-left-width:0px;"/>
					</div>
					<!-- End of 11n -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style=""/>
						<div class="styLNDesc" style="width:138mm;">
                                    Geothermal heat pump systems (see instructions):</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!-- Line 11o -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="float:left;padding-left:4mm;">o</div>
						<div style="width:59mm;float:left;">
                                  Basis of property installed during the tax
                                      <span style="float:left;">year</span>
							<span style="float:right;">
								<span style="width:2mm;border-botom-width:0px;float:left;padding-left:1.5mm;">$</span>
								<span class="styUnderlineAmount" style="width:29mm;height:3.5mm;padding-top:0px;
                                           padding-bottom:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfWindEnergy"/>
									</xsl:call-template>
								</span>
								<span style="float:right;width:18mm;padding-top:0mm;">x 10% (.10)</span>
							</span>
						</div>
						<div style="float:left;width:40.1mm;">
							<div class="styLNRightNumBox" style="height:4mm;padding-top:3mm;">11o</div>
							<div class="styLNAmountBox" style="width:32.4mm;height:4mm;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form3468Data/CalcBasisOfWindEnergy"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNAmountBoxNBB" style="float:left;height:7mm;width:39mm;
                                        background-color:lightgrey;"/>
						<div class="styLNRightNumBoxNBB" style="width:8.3mm;
	         	                         background-color:lightgrey;height:7mm;border-right-width:1px;"/>
					</div>
					<!-- End of 11o -->
					<!-- Line 11 -->
					<div style="width:187mm; ">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:138mm;">
                                            Qualified investment credit facility property (see instructions): </div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; height: 6.5mm"/>
					</div>
					<!--  Line 11i -->
					<!-- Line 11p -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div style="width:107.2mm;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">p</div>
								<div class="styLNDesc" style="width:50mm;float:left;">
                                          Basis of property installed after 2008
                               </div>
								<span style="float:left;clear:none;">
									<span style="width:1mm;border-botom-width:0px;float:left;">$</span>
									<span class="styUnderlineAmount" style="width:29mm;padding-top:0px;padding-bottom:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form3468Data/BasisOfQlfyInvestPropInstalled"/>
										</xsl:call-template>
									</span>
									<span style="width:17mm;padding-top:0mm;">x 30% (.30)</span>
								</span>
							</div>
						</div>
						<div style="float:left;clear:none;">
							<div style="width:80mm;">
								<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">11p</div>
								<div class="styLNAmountBox" style="height:4mm;padding-top:0mm;width:31mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form3468Data/CalcOfQlfyInvestPropInstalled"/>
									</xsl:call-template>
								</div>
								<div style="float:left;">
									<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
									<div class="styLNAmountBoxNBB" style="height:4mm"/>
								</div>
							</div>
						</div>
					</div>
					<!-- End of 11p -->
					<!-- Line 11q -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">q</div>
						<div class="styLNDesc" style="width:138mm;">
				                Total. Add lines 11a, 11b, 11e, 11h, 11k, 11m, 11n, 11o, and 11p				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">11q</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalEnergyCreditPartIII"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 11q -->
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;">12</div>
						<div class="styLNDesc" style="width:138mm;">
				                Credit from cooperatives. Enter the unused investment credit from cooperatives (see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">12</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/UnusedCreditFromCooperatives"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 12 -->
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">13</div>
						<div class="styLNDesc" style="width:138mm;">
				                Add lines 10e through 10j, 10m, 11q and 12
				                                        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">13</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/SumOfRehabAndEnergyCrdt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 13 -->
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">14</div>
						<div class="styLNDesc" style="width:138mm;">
				                Rehabilitation and energy credits included on line 13 from passive activities				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/RehabEnergyPassiveActCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 14 -->
					<!-- Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">15</div>
						<div class="styLNDesc" style="width:138mm;">
				                Subtract line 14 from line 13				   
				                                    <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">15</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/RehabAndEnergyCrNetAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 15 -->
					<!-- Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">16</div>
						<div class="styLNDesc" style="width:138mm;">
				                Rehabilitation and energy credits allowed for 2008 from a passive activity				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">16</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CurrentRehabEnergyPassActCr"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 16 -->
					<!-- Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">17</div>
						<div class="styLNDesc" style="width:138mm;">
				                Carryback of rehabilitation and energy credits from 2009				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">17</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/CarrybackOfRehabEnergyCr"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 17 -->
					<!-- Line 18 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">18</div>
						<div class="styLNDesc" style="width:138mm;">
				                Add lines 15 through 17. Report this amount on Form 3800, line 29a				                           <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:4px;"/>
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
 								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
								<span style="width:16px;"/>.
                                       </span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;border-bottom-width:0px;">18</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form3468Data/TotalRehabAndEnergyCrdtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End of Line 18 -->
					<!-- BEGIN Schedule J Title -->
					<!-- *******************************************************     -->
					<!-- Adding page break -->
					<div style="width:187mm;">
						<div style="float:right;" class="styGenericDiv">Form
					       <span class="styBoldText" style="font-size:9pt;">3468</span> (2008)</div>
					</div>
					<div style="width:187mm;" class="pageend"/>
					<!-- Begininning of write-in data -->
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
							<xsl:with-param name="TargetNode" select="$Form3468Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Added the xsl:if clause here as the <tr> needs to shown only when the attribute exists.  And also added xsl:choose block if not both templates will be called resulting in display problems as both templates insert the span tag for id's.For more information look for defect 9101-->
						<xsl:if test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:110mm;" scope="row">
            Line 1g - Certified Historic Structure on File:
          </td>
								<td class="styLeftOverTableRowAmount" style="width:100mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile = '1'">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/  @historicStructureCertOnFile"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<!--         <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Line 1g - Form 4684 Indicator</xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form3468Data/CertifiedHistoricStructures/@historicStructureCertOnFile"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>    -->
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
