<?xml version="1.0" encoding="UTF-8"?>
<!--  edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
		<html lang="EN-US">
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
				<meta name="Description" content="TY 2005 IRS Form 8864"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
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
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;">
          Form <span class="styFormNumber">8864</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div style="padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:13mm;">
							<div class="styMainTitle" style="padding-top:1.5mm;">
          	  Biodiesel and Renewable Diesel Fuels Credit          
              </div>
							<br/>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:5mm;">
								<img src="{$ImagePath}/8864_Bullet_Line.gif" width="4" height="7" alt="Bullet Image"/>
              Attach to your tax return.
          </div>
						</div>
						<!-- This can be taken out later -->
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-1924</div>
							<div class="styTY" style="height:7.5mm;font-size:24pt;">
               20<span class="styTYColor">10</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:7.5pt;">141</b>
							</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<!-- Start Name and EIN Line -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:132mm; height:8mm; font-size:7pt;">Name(s) shown on return
            <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;"> Identifying number 
            <br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- end Name and Ein Line -->
					<!-- Start Caution Line -->
					<div class="styBB" style="width: 187mm; font-size: 7pt;padding-top:1mm;">
						<div style="width:187mm;height:6mm;padding-bottom:1mm;">
							<span class="styBoldText" style="vertical-align: top;">Caution.</span>
							<span class="styNormalText" style="width: 165mm; padding-left: 2mm;">
                You cannot claim any amounts on Form 8864 that you claimed (or will claim) on Form 720 (Schedule C), Form 8849, or Form 4136.
              </span>
							<span class="styNormalText" style="width: 187mm;">
                Claimant has a certificate from the producer or importer of biodiesel or renewable diesel reported on lines 1 through 6 below and, if
            applicable, claimant also has a statement from the reseller. Claimant has no reason to believe that the information in the certificate or
            statement is false. Claimant may need to attach a copy of the certificate and statement. See <i>Certification</i> below.
              </span>
						</div>
					</div>
					<!-- end Caution Line -->
					<!--Table header Begin -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" align="center" style="width:110.75mm;height:11mm;font-size:7pt;text-align:center;padding-top:4mm;">
          Type of Fuel
            </div>
						<div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;text-align: center;padding-top:.5mm;">
							<span class="styBoldText">(a)</span>
							<br/>Number of Gallons <br/>Sold or Used
            </div>
						<div class="styNameBox" align="center" style="width:12mm;height:11mm;font-size:7pt;text-align: center;padding-top:2mm;">
							<span class="styBoldText">(b)</span>
							<br/>Rate      
            </div>
						<div class="styNameBox" align="center" style="width:32mm;height:11mm;font-size:7pt;border-right-width:0px;text-align: center;padding-top:2mm;">
							<span class="styBoldText">(c)</span>
							<br/>Column (a) x Column (b)</div>
					</div>
					<!--Table header end -->
					
					
					<!--  Start line 1 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
                
            </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<!-- End line 1 -->
					<!-- start line 1 extention -->
					<div style="width:187mm">
					  <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
						
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left;">Biodiesel (other than agri-biodiesel)</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>. 
            <span style="width:16px;"/>.
            <span style="width:16px;"/>. 
            <span style="width:16px;"/>. 
          </span>
						</div>
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">1</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselAfter2008Gallons"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselAfter2008Gallons</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselAfter2008Amount"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselAfter2008Amount</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					<!-- End line 1 extention -->
					<!--  Start line 2 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left"> Agri-biodiesel </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
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
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">2</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselGallons"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselGallons</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselAmount"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselAmount</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					<!-- End line 2 -->
					<!--  Start line 3 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left"> Renewable diesel </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
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
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">3</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDiesel"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDiesel</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselAmount"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselAmount</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					<!-- End line 3 -->
					<!--  Start line 4 -->

					<!-- End line 5 extention -->
					<!--  Start line 4 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
                 Biodiesel (other than agri-biodiesel) included in a biodiesel 
            </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<!-- End line 4 -->
					<!-- start line 4 extention -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left"> mixture</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
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
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">4</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselMixAfter2008Gallons"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselMixAfter2008Gallons</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselMixAfter2008Amt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselMixAfter2008Amt</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					<!-- End line 4 extention -->
					<!--  Start line 5 -->
		<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
                 
            </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<!-- End line 4 -->
					<!-- start line 4 extention -->
					<div style="width:187mm">
						 <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Agri-biodiesel included in a biodiesel mixture</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
                                     <span style="width:16px;"/>.
                                     <span style="width:16px;"/>.
                                     <span style="width:16px;"/>.
                                     <span style="width:16px;"/>. 
                                     <span style="width:16px;"/>. 
                                </span>
						</div>
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">5</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselIncldGals"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselIncldGals</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AgriBiodieselIncldAmt"/>
								<xsl:with-param name="BackupName">IRS8864AgriBiodieselIncldAmt</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>


					<!-- End line 5 -->
					<!--  Start line 6 -->
						<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
                 
            </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<!-- End line 6 -->
					<!-- start line 6 extention -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Renewable diesel included in a renewable diesel mixture</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
                                    <span style="width:16px;"/>.
                                     <span style="width:16px;"/>.
                                     <span style="width:16px;"/>.
                  
                                   
                                </span>
						</div>
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">6</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselIncludedMixture"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselIncludedMixture</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RenewableDieselInclMixtureAmt"/>
								<xsl:with-param name="BackupName">IRS8864RenewableDieselInclMixtureAmt</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>

	
					<!-- End line 6 -->
					<!--  Start line 7 -->
					
	

						<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;"></div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
                 
            </div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:5mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;"/>
					</div>
					<!-- End line 6 -->
					<!-- start line 6 extention -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
						<div class="styLNDesc" style="width:97.7mm;height:4mm;">
							<span style="float:left">Qualified agri-biodiesel production</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
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
						<div class="styLNAmountBox" style="width:5mm;padding-right:1mm;">7</div>
						<div class="styLNAmountBox" style="width:32mm;padding-right:1mm;">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedAgriBioDieselProd"/>
								<xsl:with-param name="BackupName">IIRS8864QualifiedAgriBioDieselProd</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
						<div class="styLNAmountBox" style="width:12mm;text-align:center;">
							<span style="padding-left:1mm;">$</span>
							<span style="padding-left:1mm;">1.00</span>
						</div>
						<div class="styLNAmountBox">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedAgriBioDieselProdAmt"/>
								<xsl:with-param name="BackupName">IRS8864QualifiedAgriBioDieselProd</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					
					
				<!-- End line 9 -->
					<!-- start line 10 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left">Add lines 1 through 7. Include this amount in your income for 2010 (see instructions)</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselPlusAgriBioDieselAmt"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselPlusAgriBioDieselAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Text is aligned center as it is in center aligned in the PDF -->
					<!-- End line 10 -->
					<!-- start line 11 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left">Biodiesel and renewable diesel fuels credit from partnerships, S corporations, cooperatives, estates, and </span>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
					</div>
					<!-- End line 11 -->
					<!-- start line 11 extention -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">trusts (see instructions)</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm;">
								<span style="width:7px;"/>.
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
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BiodieselRenewableFuelsAmounts"/>
								<xsl:with-param name="BackupName">IRS8864BiodieselRenewableFuelsAmounts</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- end line 11 extension -->
					<!-- start line 12 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">10</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left">Add lines 8 and 9. Cooperatives, estates, and trusts, go to line 11; partnerships and S corporations, </span>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
					</div>
					<!-- End line 12 -->
					<!-- start line 12 extention -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">report this amount on Schedule K; all others, report this amount on Form 3800, line 1l  </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm;">
								<span style="width:7px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AddLines8and9Amt"/>
								<xsl:with-param name="BackupName">IRS8864AddLines8and9Amt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- end line 12 extension -->
					<!-- start line 13 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">11</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left">Amount allocated to patrons of the cooperative or beneficiaries of the estate or trust  (see instructions)</span>
							<!--Dotted Line-->
					<!--		<span class="styBoldText" style="float:right;padding-right:1mm">
								<span style="width:7px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>       -->
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocatedToBeneficiariesAmt"/>
								<xsl:with-param name="BackupName">IRS8864AllocatedToBeneficiariesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- Text is aligned center as it is in center aligned in the PDF -->
					<!-- End line 13 -->
					<!-- start line 14 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">12</div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;font-size:2.5mm;">
							<span style="float:left">Cooperatives, estates, and trusts. Subtract line 11 from line 10. Report this amount on Form 3800, </span>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px;width:8mm;padding-right:2mm;"/>
						<div class="styLNAmountBox" style="width:30mm;border-bottom-width:0px;"/>
						<!-- Text is aligned center as it is in center aligned in the PDF -->
					</div>
					<!-- End line 14 -->
					<!-- start line 14 extention -->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:.5mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left">line 1l  </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm;">
								<span style="width:7px;"/>.
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
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
              </span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
						<div class="styLNAmountBoxNBB">
							<!-- Generated code start -->
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstatesTrustsAndCoopsCreditAmt"/>
								<xsl:with-param name="BackupName">IRS8864EstatesTrustsAndCoopsCreditAmt</xsl:with-param>
							</xsl:call-template>
							<!-- Generated code end -->
						</div>
					</div>
					<!-- end line 14 extension -->
					<!--Start Page Footer -->
					<div style="width:187mm;font-size:8pt;border-top-width:1px">
						<div class="stySmallText" style="font-weight:bold; float:left; padding-top:0.5mm">
          For Paperwork Reduction Act Notice,  see instructions.
          </div>
						<div style="float:right">
							<span style="margin-right:32mm; font-size:7pt">Cat. No. 25778F</span>          
            Form <b>8864</b> (2010)
          </div>
					</div>
					<p style="page-break-before:always"/>
					<!-- end Page Footer -->
					<!-- start ADDITIONAL DATA SECTION-->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
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
