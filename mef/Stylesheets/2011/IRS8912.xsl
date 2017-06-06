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
        See separate instructions.    
      </div>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/8912_Bullet.gif" alt="Bullet Image"/>
        Attach to your tax return.    
      </div>
						</div>
						<div class="styTYBox" style="width:32mm;border-left:none;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-2025</div>
							<div class="styTaxYear">
          20<span class="styTYColor">11</span>
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
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
<!-- BEGIN Part I Title -->
<!--Begin BondInformation Table Blank Form-->
<div class="styBB" style="width:187mm;">
							<div class="styPartName">Part I</div>
							<div class="styPartDesc" style="height:4mm;width:120mm;text-align:left">Current Year Credit</div>
						</div>
<!--Line 1-->

		<div class="styGenericDiv" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
							1</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                           Bond credit(s). Enter the amount from line 14. (see instructions.) 
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">............</span>
</div>
		<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
							1</div>
		<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondCredit"/>
								</xsl:call-template>
			</div>
			</div>
							
<!--Line 2-->
	<div class="styGenericDiv" style="width:187mm;">
			<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
							<!--<span
							style="width:1.5mm"></span>-->2</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                    Bond credit(s) from partnerships, S corporations, regulated investment companies, real estate investment trusts, estates, and trusts not reported to you on Form(s) 1097-BTC (see instructions.)
                           <!--Dotted Line-->
                           <span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
					
				</div>
			<div class="styLNRightNumBox" style="width:8mm;height:10.5mm;padding-top:6mm;border-bottom-width: 1px;">
							2</div>
			<div class="styLNAmountBox" style="height:10.5mm;width:32mm;font-size:7pt;padding-top:6.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/BondCrNotRptOnForm1097BTCAmt"/>
								</xsl:call-template>
							</div>
							</div>
<!--Line 3-->
	<div class="styBB" style="width:187mm; border-bottom-width: 0px; ">
		<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
								3</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                         Carryforward of credits for qualified tax credit bonds and build America bonds to 2011 (see instructions.)    
                          <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">..........................</span>
						
								</div>
		<div class="styLNRightNumBox" style="width:8mm;height:7.5mm;padding-top:3mm;border-bottom-width: 1px;">
							3</div>
			<div class="styLNAmountBox" style="height:7.5mm;width:32mm;font-size:7pt;padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/CreditCarryForwardFromPYAmt"/>
									</xsl:call-template>
				</div>
				</div>
<!--Line 4-->
<div class="styBB" style="width:187mm;border-bottom-width: 0px;  ">
	<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
								<!--<span
							style="width:1.5mm"></span>-->4</div>
		<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                       <b>Total credit. </b>Add lines 1 through 3. Estates and trusts figuring the credit for a clean renewable energy bond or Midwestern tax credit bond, go to line 5; Partnerships and S corporations, report this amount on Schedule K; all others, go to Part II  
                          <!--Dotted Line-->
					<span style="letter-spacing:3.8mm;font-weight:bold;">.................</span>
						
		</div>
		<div class="styLNRightNumBox" style="width:8mm;height:10.5mm;padding-top:6mm;border-bottom-width: 1px;">
							4</div>
			<div class="styLNAmountBox" style="height:10.5mm;width:32mm;font-size:7pt;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/TotalCredit"/>
									</xsl:call-template>
				</div>
				</div>
<!--Line 5-->
	<div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
			<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
									5</div>
			<div class="styLNDesc" style="width:138mm;height:4.5mm;">
                         Amount allocated to the beneficiaries of the estate or trust (see instructions.)     
                            <!--Dotted Line-->
									<span style="letter-spacing:3.8mm;font-weight:bold;">........</span>
									
				</div>
		<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
							5</div>
			<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/AmtAllocatedBeneficiariesEstTr"/>
									</xsl:call-template>
					</div>
				</div>
<!--Line 6-->
		<div style="width:187mm; ">
		<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">
								6</div>
		<div class="styLNDesc" style="width:138mm;height:4mm;float:left;padding-top:1mm;">
		<b>Estates and trusts. </b>Subtract line 5 from line 4. Use this amount to complete Part II
						 <span style="letter-spacing:3.8mm;font-weight:bold;">......</span>
			</div>
			<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
							6</div>
			<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/EstTrCYBondCrAmt"/>
								</xsl:call-template>
				</div>
				</div>
<!-- END Part I Title -->
<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Allowable Credit</div>
					</div>
<!-- END Part II Title -->
<!-- Part II, Line 7 -->
	<div class="styBB" style="width:187mm;border-bottom-width:0px;">
				<div style="width:187mm;">
				<div class="styLNLeftNumBox ">7</div>
							<div style="float:left;">
         <b>Regular tax before credits:</b>
          </div>
			<div style="float:right">
	<div class="styIRS8912LNRightNumBox" style="border-bottom:0;height:4.5mm;background-color:lightgrey;"/>
<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
<div style="width:187mm">
<div class="styLNLeftNumBox"/>
<div style="float:left">
    <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/> Individuals. Enter the amount from Form 1040, line 44 or Form   1040NR, line 42</div>
<div style="float:right">
								<span class="styDotLn">.......<span style="width:7px;"/>
								</span>
	

<div class="styIRS8912LNRightNumBox" style="height:5mm;border-bottom:0;background-color:lightgrey;"/>
<div class="styIRS8912LNAmountBox" style="height:5mm;border-bottom:0;"/>
							</div>
						</div>
	<div style="width:187mm">
		<div class="styLNLeftNumBox"/>
			<div style="float:left">
			<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
      Corporations. Enter the amount from Form 1120, Schedule J, line 2, or the applicable </div>	
<div style="float:right">
<span class="styDotLn"><span style="width:7px;"/>
								</span>

		<div class="styIRS8912LNRightNumBox" style="height:5mm;border-bottom:0;background-color:lightgrey;"/>
<div class="styIRS8912LNAmountBox" style="height:5mm;border-bottom:0;"/>
							</div>
	
				</div>
				<div style="width:187mm">
		<div class="styLNLeftNumBox"/>
			<div style="float:left">
			
      line of your return</div>	
<div style="float:right">
<span class="styDotLn">
<span style="width:7px;"/>..........................
								</span>

		<div class="styIRS8912LNRightNumBox" style="height:5mm;border-bottom:0;background-color:lightgrey;"/>
<div class="styIRS8912LNAmountBox" style="height:5mm;border-bottom:0;"/>
							</div>
	
				</div>
						
		
				</div>
		<div style="width:187mm">
		<div class="styLNLeftNumBox"/>
		<div style="float:left">
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>  Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G, lines 
       </div>
		<div style="float:right">
								<span class="styDotLn"><span style="width:7px;"/>
                                </span>
		
		<div class="styIRS8912LNRightNumBox" style="height:4.5mm;border-bottom:0;background-color:lightgrey;"/>
<div class="styIRS8912LNAmountBox" style="height:4.5mm;border-bottom:0;"/>
							</div>
						
		
				</div>
						<div style="width:187mm">
		<div class="styLNLeftNumBox"/>
			<div style="float:left">
			
      1a and 1b, or the amount from the applicable line of your return</div>	
<div style="float:right">
<span class="styDotLn">
<span style="width:7px;"/>.............
								</span>

		<div class="styIRS8912LNRightNumBox" style="height:4.5mm;padding-top:0mm;">7</div>
			<div class="styIRS8912LNAmountBox" style="font-size:7pt;height:4.5mm;padding-top:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/RegularTaxBeforeCredit"/>
									</xsl:call-template>
				</div>	</div>
									</div>
								<!-- Part II, Line 8 -->
	<div style="width:187mm">
							<div class="styLNLeftNumBox ">8</div>
							<div class="styLNDesc" style="width:138mm;height:4mm;">
								<div style="float:left;">
         <b>Alternative minimum tax:</b>
          </div>						    
  </div>
	<div style="float:right">
								<div class="styIRS8912LNRightNumBox" style="border-bottom:0;height:4.5mm;background-color:lightgrey;"/>
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
            
            </span> 
          </div> 
								<div class="styIRS8912LNLeftNumBox" style="position:relative;width:2mm;">
									<span style="z-index:1;position:absolute;top:8px;right:2mm;">
																			</span>
								</div>
								<div class="styIRS8912LNRightNumBox" style="border-bottom:0;height:4.5mm;background-color:lightgrey;"/>
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
								<div class="styIRS8912LNRightNumBox" style="height:4.5mm;padding-top:0.70mm;">8
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
								<img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>  Estates and trusts. Enter the amount from Schedule l (Form 1041), line 56
       </div>
							<div style="float:right">
								<span class="styDotLn">........<span style="width:9px;"/>
								</span>
								<div class="styIRS8912LNRightNumBox" style="border-bottom:0;height:4.5mm;background-color:lightgrey;"/>
								<div class="styIRS8912LNAmountBox" style="border-bottom:0;height:4.5mm;"/>
							</div>
						</div>
						

					<!-- Part II, Line 9 -->
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox ">9</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
        Add line 7 and line 8   
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> .........................</span>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">                           9</div>
						<div class="styLNAmountBox" style="height:5mm;32mm;font-size:7pt;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/SumRegularTaxAndAMT"/>
							</xsl:call-template>
						</div>
					</div>
					
<!-- Part II, Line 10a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
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
							<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px;border-bottom-width:0px;">10a</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px;font-size:7pt;">
								<span style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/ForeignTaxCredit"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.7mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 10b -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;"><span style="width:1.4mm;"/>b</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
          Personal credits from Form 1040 or 1040NR (see <br/>instructions.)  
             <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.      

      </span>
          </div>	
			</div>
								
								<div class="styLNRightNumBox" style="height:7.5mm;border-top-width:1px;padding-top:2mm;border-bottom-width:0px;">10b</div>
							<div class="styLNAmountBox" style="height:7.5mm;font-size:7pt;padding-top:2mm;border-bottom-width:0px;">
								<span style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8912Data/CreditsFromOtherForms"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:7.5mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 10c -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;"><span style="width:1.4mm;"/>c</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
            General business credit (see instructions.)
            </div>
								<div style="float:right;">
									<!--Dotted Line-->
									<span style="letter-spacing:3.5mm;font-weight:bold;"></span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px;">10c</div>
									<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px;ont-size:7pt;">
									
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8912Data/GeneralBusinessCredit"/>
										</xsl:call-template>
									</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:4.7mm;border-right-width:1px;"/>
						</div>
						<!-- Part II Line 10d -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;"><span style="width:1.4mm;"/>d</div>
							<div class="styLNDesc" style="width:98.25mm;height:4.5mm;">
								<div style="float:left;">
        Credit for prior year minimum tax (Form 8801, line <br>25</br>; or Form 8827, line 8b)
        <span class="styBoldText">
        <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.
         <span class="styNBSP"></span>.
        <span class="styNBSP"></span>.

      </span>
            </div>
								
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">10d</div>
							<div class="styLNAmountBox" style="height:8mm;font-size:7pt;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/CreditForPriorYearMinimumTax"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:8mm;border-right-width:1px;"/>
						</div>
						<!-- Part II, Line 10e -->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;"><span style="width:1.4mm;"/>e</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
								<div style="float:left;">
         Add lines 10a through 10d
          </div>
								<div style="float:right;">
									<!-- Dotted Line -->
									<span style="letter-spacing:3.5mm;font-weight:bold;">........................</span>
									<span style="width:5px;"/>
								</div>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">10e</div>
							<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8912Data/TotalOfCredits"/>
								</xsl:call-template>
							</div>
							
						</div>
					
					<!-- Part II, Line 11 -->
					<div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
						11</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;">
							<b>Net income tax.</b> Subtract line 10e from line 9
						
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> .................</span>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
							11	</div>
						<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/NetIncomeTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II, Line 12 -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
						12</div>
						<div class="styLNDesc" style="width:138mm;height:4.5mm;"><b>Credit to holders of tax credit bonds allowed for the current year.</b> Enter the <b>smallest</b> of line 4, line 11, or the amount as limited by the formula in the instructions for line 12 (if line 12 is smaller than line 4, see instructions.) <b>Estates and trusts</b>, enter the <b>smallest</b> of line 6, line 11, or the amount as limited by the formula in the instructions for line 12 (if line 12 is smaller than line 6, see instructions.) Report this amount on Form 1040, line 53 or Form 1040NR, line 50; Form 1120, Schedule J, line 5e; Form 1041, Schedule G, line 2d; or the applicable line of your return 
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> ..............</span>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:20mm;padding-top:15mm;border-bottom-width: 0px;">12</div>
						<div class="styLNAmountBox" style="height:20mm;width:32mm;font-size:7pt;padding-top:15mm;border-bottom-width: 0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/CYAllowableCr"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- End Part II -->
					<!--Page end-->
					<div class ="styBB" style="width:187mm;border-bottom-width:0px;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="width:90px;"/>                      
      Cat. No. 37722B
      <span style="width:113px;"/>  
      Form <span class="styBoldText">8912</span>(2011)
    </div>
					<br class="pageend"/>
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8912 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;border-top:2px solid black">
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
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Bond credit(s) reported to you on Form(s) 1097-BTC</div>
						<span style="width:17mm;"/>If you are claiming bond credit for which you did not receive a Form 1097-BTC, see the instructions.
					</div>
<!-- END Part III Title -->			

					<!-- Start table -->
					
					<div class="styTableContainer" id="CREYCtable1" style="border-bottom-width:0px;height:0mm;width:187mm;">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="font-size:7pt;border-color:black;height:76.4mm;" cellspacing="0" summary="Table displaying Bond information" name="CREYCtable1" id="CREYCtable1">
								<thead class="styTableThead">
									<tr>
<th scope="col" class="styTableCell" style="width:114mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;" colspan="2">
											
<div class="styBB" style="height:7mm;width:114mm;border-bottom-width: 0px;text-align:center;padding-top:3mm;" >
<b>(a)</b> Name of issuer of Form(s) 1097-BTC
</div>
</th>
<th scope="col" class="styTableCell" style="height:7mm;width:36mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
											
				<b>(b)</b> Identifying number<br/> of issuer of Form(s)<br/> 1097-BTC</th>
										<th scope="col" class="styTableCell" style="height:7mm;width:40mm;font-size:7pt;text-align:center;font-weight:normal;border-right-width:0px;">
											
											<b>(c)</b> Amount reported to<br/>you on Form(s) 1097-BTC<br/> (see instructions)</th>
										
									</tr>
								</thead>
								<tfoot/>
								<tbody>
								<xsl:choose>
								<xsl:when test="($Print = $Separated) and (count($Form8912Data/BondInformation) &gt;= 1)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;padding-top:3.5mm;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:value-of select="13"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
												
											</td>
											
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;padding-top:3mm;">"See Additional Data Table"
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										</tr>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="($Print != $Separated) and (count($Form8912Data/BondInformation) &gt;= 1)">
										<xsl:for-each select="$Form8912Data/BondInformation">
											<tr>
												<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;vertical-align:top;padding-top:3.5mm;">
													<xsl:choose>
														<xsl:when test="position() = 1">
															<xsl:value-of select="13"/>
														</xsl:when>
														<xsl:otherwise>
															<span style="width:1px;"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCell" style="width:114mm;text-align:left;">
												
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine1"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine2"/>
												</xsl:call-template>
													
													
												</td>
												
												
												
												<td class="styTableCell" style="width:36mm;text-align:center;padding-top:3mm">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:38mm;text-align:right;border-right-width:0px;padding-top:3mm">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalForm1097BTCAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
										</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
									

									
									<!--Blank lines-->
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 1">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;padding-top:3.5mm;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<xsl:value-of select="13"/>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
												
											</td>
											
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 2 or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 3  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 4  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 5  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 6  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 7  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										
										</tr>
									</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 8  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 9 or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 10  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 11 or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 12  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 13  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 14  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
											
											
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 15 or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 16 or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 17  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 18  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 19  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 20  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 21  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
									<xsl:if test="count($Form8912Data/BondInformation)&lt; 22  or ($Print = $Separated)">
										<tr>
											<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:114mm;text-align:left;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="height:7mm;width:38mm;text-align:right;border-right-width:0px;">
												<span style="width:1px;"/>
											</td>
										
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
<!-- Part III, Line 14 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;width:6mm;padding-top:3.5mm;">
						14</div>
						<div class="styLNDesc" style="width:137mm;height:7mm;padding-top:3.5mm;">
							<b>Total.</b> Combine the amounts in column (c). Enter here and on line 1
						
         <!--Dotted Line-->
							<span style="letter-spacing:3.8mm;font-weight:bold;"> ...........</span>
						</div>
						<div class="styLNRightNumBox" style="width:8mm;height:7mm;padding-top:3.5mm;border-bottom-width:0px;">
							14	</div>
						<div class="styLNAmountBox" style="height:7mm;width:34mm;font-size:7pt;padding-top:3.5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8912Data/TotalAllForm1097BTCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<span class="styBoldText"/>
						<span style="width:190px;"/>
						<span style="width:426px;"/>  
      Form <span class="styBoldText">8912</span>(2011)
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
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form8912Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        </table>
					
					<!-- Additional Data Table -->
					
							<!-- Table expand/collapse toggle button -->
							<div class="styGenericDiv" style="float:right;height:1mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="BondCreditType"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CREYCctn' "/>
								</xsl:call-template>
							</div>
		<xsl:if test="($Print = $Separated) and (count($Form8912Data/BondInformation) &gt;= 1)">						
							
				<!-- Start of Separate Table -->
							<span class="styRepeatingDataTitle">Form 8912 - Part III Bond Credit	<br/></span>
						
							
<table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CREYCtable" id="CREYCtable">
			<thead class="styTableThead">
				<tr class="styDepTblHdr" style="width:187mm;">
		<th scope="col" class="styDepTblCell" style="width:114mm;font-size:7pt;text-align:center;font-weight:bold;padding-top:4mm;" colspan="2">(a) Name of issuer of Form(s) 1097-BTC </th>
										<th scope="col" class="styDepTblCell" style="width:36mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b) Identifying number<br/>of issuer of Form(s)<br/>1097-BTC</th>
										<th scope="col" class="styDepTblCell" style="width:38mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(c) Amount reported to<br/>you on Form(s) 1097-BTC<br/>(see instructions)</th>
								
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:for-each select="$Form8912Data/BondInformation">
										<tr style="width:187mm;">
											<!-- Define background colors to the rows -->
											<xsl:attribute name="class">
<xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styDepTblCell" style="width:5mm;font-size:7pt;border-right:none;font-weight:bold;padding-top:4mm;">
												<xsl:choose>
													<xsl:when test="position() = 1">
														<!--<xsl:value-of select="position()"/> --> 13
		              </xsl:when>
													<xsl:otherwise>
														<span style="width:1px;"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styDepTblCell" style="border-left:none;width:114mm;text-align:left;">
												
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine1"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NameOfBondIssuer/BusinessNameLine2"/>
												</xsl:call-template>
													
											</td>
											
											<td class="styDepTblCell" style="width:36mm;text-align:center;padding-top:4mm;">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="width:38mm;text-align:right;padding-top:4mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalForm1097BTCAmt"/>
												</xsl:call-template>
											</td>
											
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							
						
					</xsl:if>
					<!-- /Separated Data for Part III-->
	
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
