<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8864Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8864"/>
	<xsl:template name="RowWriterCore"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="TY 2005 IRS Form 8864"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<!--  Updated 05/22/2014 (WT) UWR 101606/111640 for R9.5_D2   -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8864Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8864" id="Form8864">
					<!-- Standard Warning Lines -->
					<xsl:call-template name="DocumentHeader"/>
					<!--Begin Form Number and Name-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:29mm;height:18mm;">
							<div style="height:10mm;">
								 Form <span class="styFormNumber">8864</span>
									<br/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData"/>
									</xsl:call-template>
							</div>
							<div style="height:8mm;padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:18mm;">
							<div class="styMainTitle" style="height:9.5mm;padding-top:1.5mm;">
							  Biodiesel and Renewable Diesel Fuels Credit          
							</div>
							<div class="styFST" style="height:8mm;font-size:7pt;padding-top:1mm;">
								<div style="height:4mm;">
									<img src="{$ImagePath}/8864_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
									  Attach to your tax return.
								</div>
								<div style="height:4mm;">  
									<img src="{$ImagePath}/8864_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/> Go to 
								<a href="http://www.irs.gov/form8864" title="Link to IRS.gov"><i>www.irs.gov/Form8864</i></a> for instructions and the latest information.
							    </div>
							</div>   
						</div>
						<!-- This can be taken out later -->
						<div class="styTYBox" style="width:30mm;height:18mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-1924</div>
							<div class="styTY" style="height:7.5mm;font-size:24pt;">
                                20<span class="styTYColor">18</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:7.5pt;">141</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- Start Name and EIN Line -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:132mm; height:10mm; font-size:7pt;">Name(s) shown on return
						<br/>
							<xsl:choose>
								<!-- Name from 1040 Return Header -->
								<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
								  <br/>
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								  </xsl:call-template>
								</xsl:when>
								<!--<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</xsl:when>-->
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
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;"> Identifying number 
                          <br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<!--<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>-->
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- end Name and Ein Line -->
					<!-- Start Caution Line -->
					<div class="styBB" style="width:187mm;height:23mm;font-size:8.5pt;">
						
						<span class="styNormalText" style="width: 187mm;">
							<b>Caution:</b><span style="width:2mm"/>You cannot claim any amounts on Form 8864 that you claimed (or will claim) on Form 720 (Schedule C), Form 8849, or Form 4136.
						</span>
						<span class="styNormalText" style="width: 187mm;">
							Claimant has a certificate from the producer or importer of biodiesel or renewable diesel reported on lines 1 through 6 below and, if
							applicable, claimant also has a statement from the reseller. Claimant has no reason to believe that the information in the certificate or
							statement is false. Claimant may need to attach a copy of the certificate and statement. See <i>Certification</i> in the instructions.
                        </span>
					</div>
					<!-- end Caution Line -->
					<!--Table header Begin -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" align="center" style="width:110.9mm;height:11mm;font-size:7pt;text-align:center;padding-top:4mm;">
						  Type of Fuel
						</div>
						<div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;text-align: center;padding-top:.5mm;">
							<span class="styBoldText">(a)</span>
							<br/>Number of Gallons <br/>Sold or Used
						</div>
						<div class="styNameBox" align="center" style="width:12.1mm;height:11mm;font-size:7pt;text-align: center;padding-top:2mm;">
							<span class="styBoldText">(b)</span>
							<br/>Rate      
                         </div>
						<div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;border-right-width:0px;text-align: center;padding-top:2mm;">
							<span class="styBoldText">(c)</span>
							<br/>Column (a) x Column (b)
						</div>
					</div>
					<!--Table header end -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:3mm;">1</div>
						<div class="styLNDesc" style="width:97.7mm;height:6mm;padding-top:3mm;">
							<span style="float:left;">Biodiesel (other than agri-biodiesel)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;width:5mm;padding-right:1mm;">1</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:3mm;width:32mm;padding-right:1mm;">
							<!-- Line 1a  -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselGallonsQty"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselAfter2008Gallons</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 1b  -->
						<div class="styLNAmountBox" style="height:6mm;padding-top:3mm;width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:3mm;">
							<!-- Line 1c -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselAmt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselAfter2008Amount</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Agri-biodiesel</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right:2mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">2</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 2a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselGallonsQty"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselGallons</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 2b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Line 2c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselAmt"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselAmount</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Renewable diesel</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">3</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 3a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselGallonsQty"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDiesel</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 3b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Line 3c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselAmt"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselAmount</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Biodiesel (other than agri-biodiesel) included in a biodiesel mixture</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">4</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 4a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselMixtureGallonsQty"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselMixAfter2008Gallons</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 4b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Line 4c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselMixAmt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselMixAfter2008Amt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Agri-biodiesel included in a biodiesel mixture</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">5</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 5a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselIncludedGalsQty"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselIncldGals</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 5b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Line 5c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselIncludedAmt"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselIncldAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Renewable diesel included in a renewable diesel mixture</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">6</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 6a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselMixtureGalsQty"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselIncludedMixture</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 6b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Line 6c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselInclMixtureAmt"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselInclMixtureAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Qualified agri-biodiesel production</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="width:5mm;padding-right:1mm;">7</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Line 7a-->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedAgriBioDieselProdQty"/>
								<xsl:with-param name="BackupName">IIRS8864QualifiedAgriBioDieselProd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Line 7b-->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-color:#000000;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">.10</span>
						</div>
						<div class="styLNAmountBox" style="border-bottom-color:#000000;">
							<!-- Line 7c-->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedAgriBioDieselProdAmt"/>
								<xsl:with-param name="BackupName">IRS8864QualifiedAgriBioDieselProd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8-->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">Add lines 1 through 7. Include this amount in your income for 2018 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">.......</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">						
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselPlusAgriBioDieselAmt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselPlusAgriBioDieselAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9-->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">Biodiesel and renewable diesel fuels credit from partnerships, S corporations, cooperatives, estates, and </span>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">trusts (see instructions)</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;font-weight:bold;padding-right: 2mm;">..........................</span>
						</div>						
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselRenewableFuelsAmt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselRenewableFuelsAmounts</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:10mm;">10</div>
						<div class="styLNDesc" style="width:138.75mm;height:10mm;">
							<span style="float:left">Add lines 8 and 9. Cooperatives, estates, and trusts, go to line 11. Partnerships and S corporations, stop here and report this amount on Schedule K.  All others, stop here and report this amount on</span>
							<span style="float:left;white-space:nowrap;"> Form 3800 Part III, line 1l</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right: 2mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm;">10</div>
						<div class="styLNAmountBox" style="height:10mm;padding-top:6.5mm;">							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalBiodieselAndRnwblFuelsAmt"/>
								<xsl:with-param name="BackupName">IRS8864AddLines8and9Amt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">11</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust (see instructions)
							</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right: 2mm;">..</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocatedToBeneficiariesAmt"/>
								<xsl:with-param name="BackupName">IRS8864AllocatedToBeneficiariesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">12</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left;padding-right:7mm;white-space:nowrap;">Cooperatives, estates, and trusts, subtract line 11 from line 10. Report this amount on Form 3800  </span>
							<span style="float:left;white-space:nowrap;">Part III, line 1l</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right: 2mm;">.............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">12</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstatesTrustsAndCoopCreditAmt"/>
								<xsl:with-param name="BackupName">IRS8864EstatesTrustsAndCoopsCreditAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!--Start Page Footer -->
					<div style="width:187mm;font-size:8pt;border-top-width:1px">
						<div class="stySmallText" style="font-weight:bold; float:left; padding-top:0.5mm">
						  For Paperwork Reduction Act Notice,  see separate instructions.
                        </div>
						<div style="float:right">
							<span style="margin-right:32mm; font-size:7pt">Cat. No. 25778F</span>Form <b>8864</b> (2018)
                        </div>
					</div>
					<!--<p style="page-break-before:always"/>-->
					<!-- end Page Footer -->
					<!-- start ADDITIONAL DATA SECTION-->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:1mm;font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle">
						  Additional Data        
					    </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>