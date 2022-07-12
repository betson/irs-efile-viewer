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
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
<!--<xsl:if test="not($Print) or $Print=''">-->
<xsl:call-template name="IRS8912Style"/>
<xsl:call-template name="AddOnStyle"/>
<!--</xsl:if>-->
</style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="Form8912">
<xsl:call-template name="DocumentHeader"/>
<!-- Begin Form Number and Name -->
<div class="styBB" style="width:187mm;">
<div class="styFNBox" style="width:33mm;height:auto;border-right:none;vertical-align:bottom;">
Form <span class="styFormNumber">8912</span>
<div class="styAgency" style="margin-top:0mm">
<br/>						
<div class="styAgency" style="padding-top:5mm">Department of the Treasury<br />Internal Revenue Service</div>
</div>
</div>
<div class="styFTBox" style="width:122.5mm;border-right:1px solid black;border-left:1px solid black;height:22.5mm;">
<div style="height:auto;" class="styMainTitle">
<br/>
Credit to Holders of Tax Credit Bonds
</div>
<div class="styFST" style="height:auto;font-size:7pt;">
</div>
<div class="styFST" style="height:auto;font-size:7pt;">
<img src="{$ImagePath}/8912_Bullet.gif" alt="Bullet Image"/>
Attach to your tax return.    
</div>
<div class="styFST" style="height:auto;font-size:7pt;">
<img src="{$ImagePath}/8912_Bullet.gif" alt="Bullet Image"/>
Information about Form 8912 and its separate instructions is at <i>www.irs.gov/form8912.</i>
</div>
</div>
<div class="styTYBox" style="width:31.5mm;border-left:none;">
<div class="styOMB" style="height:4mm;width:31.5mm;">OMB No. 1545-2025</div>
<div class="styTaxYear">
20<span class="styTYColor">15</span>
</div>
<div style="margin-left:3mm; text-align:left;">
Attachment<br/>Sequence No. <span class="styBoldText">154</span>
</div>
</div>
</div>
<!-- End Form Number and Name section -->
<!-- Begin Name and Identifying number section -->
<div class="styBB" style="width:187mm;">
<div class="styNameBox" style="width:140mm;height:auto;font-size:7pt;">
Name(s) shown on return<br/>
<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
<div class="styBB" style="width:187mm;border-top:0px solid black;">
<div class="styPartName">Part I</div>
<div class="styPartDesc">Current Year Credit</div>
</div>

<!--Line 1-->
<div class="styGenericDiv" style="width:187mm;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
1</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
Bond credit(s) from Part III. Enter the amount from line 14 (see instructions.) 
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">........</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
1</div>
<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalForm8912BondCreditGrp/TotalAllForm1097BTCAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 2-->
<div class="styGenericDiv" style="width:187mm;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
2</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
Bond credit(s) from Part IV. Enter the amount from line 20 (see instructions.) 
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">........</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
2</div>
<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalForm8912BondCreditGrp/NewCleanEnergyBondAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 3-->
<div class="styGenericDiv" style="width:187mm;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
3</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
Carryforward of credits for qualified tax credit bonds and build America bonds to 2015 (see instructions.)    
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">.</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 1px;">
3</div>
<div class="styLNAmountBox" style="height:5mm;width:32mm;font-size:7pt;padding-top:1mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/CarryforwardPYBondCreditAmt"/>
</xsl:call-template>
</div>
</div>



<!--Line 4-->
<div class="styBB" style="width:187mm;border-bottom-width: 0px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
<!--<span
style="width:1.5mm"></span>-->4</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
<b>Total credit. </b>Add lines 1 through 3. Estates and trusts figuring the credit for a clean renewable energy bond, go to line 5; Partnerships and S corporations, report this amount on Schedule K (You must also issue Form(s) 1097-BTC. See Form 1097-BTC and its instructions.); all others, go to Part II  
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">...</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:10.5mm;padding-top:6mm;border-bottom-width: 1px;">
4</div>
<div class="styLNAmountBox" style="height:10.5mm;width:32mm;font-size:7pt;padding-top:6mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalCreditAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 5-->
<div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;">
5</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
Amount allocated to the beneficiaries of the estate or trust. (You must also issue Form(s) 1097-BTC. See Form 1097-BTC and its instructions.) (see instructions.)     
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;">.....</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:7.5mm;padding-top:3mm;border-bottom-width: 1px;">
5</div>
<div class="styLNAmountBox" style="height:7.5mm;width:32mm;font-size:7pt;padding-top:3mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/EstateOrTrustAllocatedBenefAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 6-->
<div style="width:187mm; ">
<div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">
6</div>
<div class="styLNDesc" style="width:138mm;height:4mm;padding-top:1mm;">
<b>Estates and trusts. </b>Subtract line 5 from line 4. Use this amount to complete Part II
<span style="letter-spacing:3.8mm;font-weight:bold;">......</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:5mm;padding-top:1mm;border-bottom-width: 0px;">
6</div>
<div class="styLNAmountBox" style="height:5mm;width:32mm;padding-top:1mm;border-bottom-width: 0px;">
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
<div style="width:187mm; ">
<div class="styLNLeftNumBoxSD" style="height:auto;padding-top:2mm;">7</div>
<div class="styLNDesc" style="font-size:7pt;width:134.1mm;height:auto;padding-top:2mm;">
<span class="styBoldText">Regular tax before credits: </span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Individuals. Enter the sum of the amounts from Form 1040, lines 44 and 46; or the sum of the amounts from Form 1040NR, 
lines 42 and 44<span style="letter-spacing:3.8mm;font-weight:bold;"> ...................</span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Corporations. Enter the amount from Form 1120, Schedule J, Part I, line 2; or the applicable line of your return  <span style="letter-spacing:3.8mm;font-weight:bold;"> ..........................</span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G, lines 1a and<br/>1b; or the amount from the applicable line of your return<span style="letter-spacing:3.8mm;font-weight:bold;"> .............</span>
</div>
<div class="styLNDesc" style="width:4mm; height:auto;padding-top:4mm;">
<img src="{$ImagePath}/8912_Bracket_Lg.gif" height="65mm" alt="Curly Bracket Image"/>
</div>
<div class="styLNRightNumBox" style="height:7mm;padding-top:14mm;width:8.15mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;">
</div>
<div class="styLNAmountBox" style="height:auto;width:33mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width: 0px;">
</div> 
<div class="styLNRightNumBox" style="height:4mm;border-right-width: 1px;width:8.15mm">
7
</div>
<div class="styLNAmountBox" style="height:4mm;width:31.5mm;border-left-width: 0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/RegularTaxBeforeCreditAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:auto;padding-top:6.2mm;background-color:lightgrey;width:8.15mm;border-bottom-width: 0px;border-right-width: 1px;">
</div>
<div class="styLNAmountBox" style="height:auto;width:31.5mm;padding-top:6mm;border-bottom-width: 0px;border-left-width: 0px;"/>
</div>

<!-- Part II, Line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBoxSD" style="height:auto;">8</div>
<div class="styLNDesc" style="width:134.1mm;height:auto;">
<span class="styBoldText">Alternative minimum tax: </span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Individuals. Enter the amount from Form 6251, line 35 <span style="width:.5mm;"/>
<span style="letter-spacing:3.8mm;font-weight:bold;"> .............</span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Corporations. Enter the amount from Form 4626, line 14 <span style="letter-spacing:3.8mm;font-weight:bold;"> ............</span>
<br/>
<img src="{$ImagePath}/8912_Bullet_Round.gif" height="3.9mm" alt="Bullet Round Image"/>
Estates and trusts. Enter the amount from Schedule I (Form 1041), line 56 <span style="letter-spacing:3.8mm;font-weight:bold;"> ........</span>

</div>
<div class="styLNDesc" style="width:4mm; height:auto;padding-top:0mm;">
<img src="{$ImagePath}/8912_Bracket_md.gif" height="53mm" alt="Curly Bracket Image"/>
</div>
<div class="styLNRightNumBox" style="height:auto;width:8.15mm;padding-top:5mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;">
</div>
<div class="styLNAmountBox" style="height:auto;width:33mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width: 0px; "/>
<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;width:8mm;">
8
</div>
<div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/AlternativeMinimumTaxAmt"/>
</xsl:call-template>
</div>

<div class="styLNRightNumBox" style="height:auto;padding-top:6.3mm;background-color:lightgrey;border-bottom-width: 0px;">
</div>
<div class="styLNAmountBox" style="height:auto;width:31.5mm;padding-top:6.3mm;border-bottom-width: 0px;"/>
</div>
<!-- Part II, Line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBoxSD">9</div>
<div class="styLNDesc" style="width:138.1mm;height:auto;">
Add line 7 and line 8   
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> .......................</span>
</div>


<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">
9
</div>
<div class="styLNAmountBox" style="height:4mm;width:31.5mm;padding-top:1mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/SumRegularTaxAndAltMinTxAmt"/>
</xsl:call-template>
</div>
</div>



<!-- Part II, Line 10a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:auto;">10a</div>
<div class="styLNDesc" style="width:98.1mm;height:auto;">	
Foreign tax credit   
<!--Dotted Line-->
<span style="letter-spacing:3.5mm;font-weight:bold;">................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px;border-bottom-width:0px;">10a</div>
<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px;border-bottom-width:0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/ForeignTaxCreditAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="background-color:lightgrey;padding-top:4mm;height:auto;border-bottom-width:0px;border-right-width: 1px;width:8.2mm;"/>

</div>

<!-- Part II, Line 10b -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">
<span style="width:1.4mm;"/>b</div>
<div class="styLNDesc" style="width:98.1mm;height:4.5mm;">
Certain allowable credits (see instructions.)  
<span class="styBoldText">
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px;border-bottom-width:0px;">10b</div>
<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px;border-bottom-width:0px;">
<span style="">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/CertainAllowableCreditsAmt"/>
</xsl:call-template>
</span>
</div>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8mm;"/>
<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width:0px;">
</div>
</div>

<!-- Part II, Line 10c -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:5mm;">
<span style="width:1.4mm;"/>c</div>
<div class="styLNDesc" style="width:98.1mm;height:5mm;">
General business credit (see instructions.)
<!--Dotted Line-->
<span style="letter-spacing:3.5mm;font-weight:bold;">..........</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-top-width:1px;">10c</div>
<div class="styLNAmountBox" style="height:5mm;border-top-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/GeneralBusinessCreditAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;width:8mm;"/>
<div class="styLNAmountBox" style="height:5mm;width:31.5mm;border-bottom-width:0px;">
</div>
</div>

<!-- Part II Line 10d -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:8.0mm;">
<span style="width:1.4mm;"/>d</div>
<div class="styLNDesc" style="width:98.1mm;height:8.0mm;">
Credit for prior year minimum tax (Form 8801 or Form 8827)
<span class="styBoldText">
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
</div>
<div class="styLNRightNumBox" style="height:8.0mm;padding-top:3.5mm;">10d</div>
<div class="styLNAmountBox" style="height:8.0mm;padding-top:3.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/CreditPriorYearMinimumTaxAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.0mm;padding-top:3.5mm;width:8mm;"/>
<div class="styLNAmountBox" style="height:8.0mm;width:31.5mm;border-bottom-width:0px;padding-top:3.5mm;">
</div>
</div>

<!-- Part II, Line 10e -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:5mm;">
<span style="width:1.4mm;"/>e</div>
<div class="styLNDesc" style="width:138mm;height:5mm;">
Add lines 10a through 10d
<!-- Dotted Line -->
<span style="letter-spacing:3.5mm;font-weight:bold;">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width: 1px;">10e</div>
<div class="styLNAmountBox" style="height:5mm;width:31.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalCreditsAmt"/>
</xsl:call-template>
</div>
</div>

<!-- Part II, Line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">
11</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
<b>Net income tax.</b> Subtract line 10e from line 9
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> ................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width: 1px;">
11</div>
<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/NetIncomeTaxAmt"/>
</xsl:call-template>
</div>
</div>

<!-- Part II, Line 12 -->
<div class="styBB" style="width:187mm;border-top-width:0px;">
<div class="styLNLeftNumBox" style="height:4.5mm;">
12</div>
<div class="styLNDesc" style="width:138mm;height:4.5mm;">
<b>Credit to holders of tax credit bonds allowed for the current year.</b> Enter the <b>smallest</b> of line 4, line 11, or the amount as limited by the formula in the instructions for line 12. (If line 12 is smaller than line 4, see instructions.) <b>Estates and trusts</b>, enter the <b>smallest</b> of line 6, line 11, or the amount as limited by the formula in the instructions for line 12. (If line 12 is smaller than line 6, see instructions.) Report this amount on Form 1040, line 54 or Form 1040NR, line 51; Form 1120, Schedule J, line 5e; Form 1041, Schedule G, line 2d; or the applicable line of your return 
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> ..............</span>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:20mm;padding-top:17mm;border-bottom-width: 0px;">12</div>
<div class="styLNAmountBox" style="height:20mm;width:31.5mm;font-size:7pt;padding-top:17mm;border-bottom-width: 0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/CurrentYearAllowableCreditAmt"/>
</xsl:call-template>
</div>
</div>
<!-- End Part II -->

<!--Page end-->
<div class="styBB" style="width:187mm;border-bottom-width:0px;">
<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
<span style="width:90px;"/>                      
Cat. No. 37722B
<span style="width:107px;"/>  
Form <span class="styBoldText">8912</span>(2015)
</div>
<p style="page-break-before: always"/>

<!--Begin Page 2 -->
<!-- Page Header -->
<div style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 8912 (2015)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
</div>
</div>
<div class="styBB" style="width:187mm;border-top:0px solid black;"></div>
<!-- END Page Header -->
<!-- Begin Name and Identifying number section -->
<div class="styBB" style="width:187mm;">
<div class="styNameBox" style="width:140mm;height:auto;font-size:7pt;">
Name(s) shown on return<br/>
<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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


<!-- BEGIN Part III Title -->
<div class="styBB" style="width:187mm;border-top:0px solid black;">
<div class="styPartName">Part III</div>
<div class="styPartDesc">Bond credit(s) reported to you on Form(s) 1097-BTC (see instructions).</div>
<span style="width:17mm;"/>If you are claiming a bond credit for which you did not receive a Form 1097-BTC, see the instructions.
</div>
<!-- END Part III Title -->

<!-- Start table -->
<div class="styTableContainer" id="CREYCtable1" style="border-bottom-width:0px;height:auto;width:187mm;">
<xsl:call-template name="SetInitialState"/>
<table class="styTable" style="font-size:7pt;border-color:black;height:76.4mm;" cellspacing="0" summary="Table displaying Bond information" name="CREYCtable1" id="CREYCtable1">
<thead class="styTableThead">
<tr>
<th scope="col" class="styTableCell" style="width:65mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;" colspan="2">
<div class="styBB" style="height:7mm;width:65mm;border-bottom-width: 0px;text-align:center;padding-top:0mm;">
<b>(a)</b> Name of issuer of Form(s) 1097-BTC
</div>
</th>
<th scope="col" class="styTableCell" style="height:7mm;width:30mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(b1)</b> Identifying number of issuer <br/>of Form(s) 1097-BTC</th>
<th scope="col" class="styTableCell" style="height:7mm;width:59mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(b2)</b> Unique identifier <br/>(see instructions)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:44mm;font-size:7pt;text-align:center;font-weight:normal;border-right-width:0px;">
<b>(c)</b> Amount reported on<br/>Form(s) 1097-BTC<br/> (see instructions)</th>
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
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;padding-top:3mm;">
<span style="width:1px;"/>"See Additional Data Table"
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
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
<td class="styTableCell" style="width:60mm;text-align:left;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine1Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine2Txt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="width:36mm;text-align:center;padding-top:3mm">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="width:36mm;text-align:left;padding-top:3mm">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="UniqueId"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="width:40mm;text-align:right;border-right-width:0px;padding-top:3mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="Form1097BTCAmt"/>
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
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 2 or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 3  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 4  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 5  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 6  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 7  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 8  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 9 or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 10  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 11 or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 12  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 13  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 14  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 15 or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 16 or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 17  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 18  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 19  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>
</tr>
</xsl:if>
<xsl:if test="count($Form8912Data/BondInformation)&lt; 20  or ($Print = $Separated)">
<tr>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;vertical-align:top;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:60mm;text-align:left;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:36mm;text-align:right;border-right-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:7mm;width:40mm;text-align:right;border-right-width:0px;">
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
<div class="styLNDesc" style="width:141.5mm;height:7mm;padding-top:3.5mm;">
<b>Total.</b> Combine the amounts in column (c). Enter here and on line 1
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> ...........</span>
</div>
<div class="styLNRightNumBox" style="width:6mm;height:7mm;padding-top:3.5mm;border-bottom-width:0px;">
14	</div>
<div class="styLNAmountBox" style="height:7mm;width:33.5mm;font-size:7pt;padding-top:3.5mm;border-bottom-width:0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalAllForm1097BTCAmt"/>
</xsl:call-template>
</div>
</div>
<div style="width:187mm;">
<span class="styBoldText"/>
<span style="width:181px;"/>
<span style="width:426px;"/>  
Form <span class="styBoldText">8912</span> (2015)
</div>
<p style="page-break-before: always"/>
<!-- Page Header -->
<div style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 8912 (2015)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
</div>
</div>
<div class="styBB" style="width:187mm;border-top:0px solid black;"></div>
<!-- END Page Header -->
<!-- Begin Name and Identifying number section -->
<div class="styBB" style="width:187mm;">
<div class="styNameBox" style="width:140mm;height:auto;font-size:7pt;">
Name(s) shown on return<br/>
<div style="font-family:verdana;font-size:7pt;height:6.25mm;">
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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


<!-- BEGIN Part IV Title -->
<xsl:if test="($Print = $Separated) and (count($Form8912Data/BondNotOnForm1097BTCGrp) &gt;= 1)">
<div class="styBB" style="width:187mm;height:8mm;border-top:1px solid black;">
<div class="styPartName">Part IV</div>
<div class="styPartDesc">Bond credit(s) from bonds held by you and/or your nominee(s) not reported to you on Form(s) 1097-BTC (see instructions)</div>
</div>
<!-- END Part IV Title -->

<!-- Start table Separate Print-->

<!--Line 15a-->
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
15</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's name, city or town, and state</span>  
<!--Dotted Line-->	
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:70mm;font-size:7pt;border-bottom-width:0px;">
"See Additional Data Table"
<span style="width:1mm;font-weight:bold;"/>
<br/>
</div>
</div>

<!--Line 15b-->
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's employer identification number</span>  
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:70mm;font-size:7pt;border-bottom-width:0px;">
"See Additional Data Table"
</div>
</div>

<!--Line 16a-->
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
16</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond issued</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:70mm;font-size:7pt;border-bottom-width:0px;">
"See Additional Data Table"
</div>
</div>

<!--Line 16b-->
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond matures</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:70mm;font-size:7pt;border-bottom-width:0px;">
"See Additional Data Table"
</div>
</div>

<!--Line 17-->
<div class="styBB" style="width:187mm;border-bottom-width:1px; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
17</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond disposed of (if applicable)</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:70mm;font-size:7pt;border-bottom-width:0px;">
"See Additional Data Table"
</div>
</div>
<div class="styBB" style="width:187mm;border-bottom-width:1px;">
</div>
	
<!--Line 18-->
<table class="styTable" style="font-size:7pt;border-color:black;width:187mm;" cellspacing="0" summary="Table displaying Bond credit" name="CREYCtable2" id="CREYCtable2">
<thead class="styTableThead">
<tr>
<th scope="col" class="styTableCell" style="height:7mm;width:5mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">
<span style="width:1px;"/>
</th>
<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;width:50mm;height:7mm;" colspan="1">
<span style="width:4mm">
<b>(a)</b>
</span>
CUSIP number. If CUSIP number <br/>not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.)
</th>
<th scope="col" class="styTableCell" style="height:7mm;width:29mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<span style="width:4mm">
<b>(b)</b>
</span> Outstanding bond <br/>principal (or for build America bonds, interest payable)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:22mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(c)</b> Credit rate</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(d)</b> Multiply<br/>(b) x (c)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:20mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<span style="width:4mm">
<b>(e)</b>
</span> %</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">
<span style="width:4mm">
<b>(f)</b>
</span> Multiply (d) x (e)</th>
</tr>
</thead>
<tfoot/>
<tr>
<td class="styTableCell" style="width:5mm;padding-left:1mm;text-align:center;border-right-width:0px;font-weight:bold;vertical-align:top;border-bottom-width:1px;
height:5mm;">
<xsl:choose>
<xsl:when test="position() = 1">
<xsl:value-of select="18"/>
</xsl:when>
<xsl:otherwise>
<span style="width:1px;"/>
</xsl:otherwise>
</xsl:choose>
</td>
<td class="styTableCell" style="height:4mm;width:50mm;text-align:center;">
"See Additional Data Table"
</td>
<td class="styTableCell" style="height:4mm;width:29mm;text-align:right;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:4mm;width:22mm;text-align:center;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:4mm;width:32mm;text-align:right;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:4mm;width:20mm;text-align:right;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:4mm;width:32mm;text-align:right;border-right-width:0px;">
<span style="width:1px;"/>
</td>													
</tr>
</table>
</xsl:if>

<!-- Start table -->
<!--Not Separate print-->
<xsl:if test="($Print != $Separated) and (count($Form8912Data/BondNotOnForm1097BTCGrp) =0)">
<!--<xsl:for-each select="$Form8912Data/BondNotOnForm1097BTCGrp">-->
<xsl:call-template name="SetInitialState"/>
<tbody>
<!--<xsl:if test="(count($Form8912Data/BondNotOnForm1097BTCGrp)&gt;=1) or (count($Form8912Data/BondNotOnForm1097BTCGrp)&lt;=1)">-->
<tr>
<div class="styBB" style="width:187mm;border-top:1px solid black;height:7mm;">
<div class="styPartName">Part IV</div>
<div class="styPartDesc">Bond credit(s) from bonds held by you and/or your nominee(s) not reported to you on Form(s) 1097-BTC (see instructions)</div>
</div>
</tr>

<!--Line 15a-->
<tr>
<div style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:12mm;border-bottom-width:1px;">
15</div>
<div class="styLNLeftNumBoxSD" style="height:12mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:12mm;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's name, city or town, and state</span>  
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:12mm;padding-bottom:none;width:105mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine1Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine2Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CityNm"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 15b-->
<tr>
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's employer identification number</span>  
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16a-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
16</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond issued</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondIssueDt"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16b-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond matures</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
</xsl:call-template>
</div>
</div>
</tr>
<!--Line 17-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
17</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond disposed of (if applicable)</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align:left;height:0mm;padding-bottom:0mm;width:70mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondDisposedDt"/>
</xsl:call-template>
</div>
</div>
</tr>
</tbody>
<!--Line 18-->
<table class="styTable" style="font-size:7pt;border-color:black;width:187mm;" cellspacing="0" summary="Table displaying Bond credit" name="CREYCtable2" id="CREYCtable2">
<thead class="styTableThead">
<tr>
<th scope="col" class="styTableCell" style="height:7mm;width:5mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">		
<span style="width:1px;"/>
</th>
<th scope="col" class="styTableCell" style="font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;width:50mm;height:7mm;" colspan="1">
<b>(a)</b> CUSIP number. If CUSIP number <br/>not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.)
</th>
<th scope="col" class="styTableCell" style="height:7mm;width:29mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(b)</b> Outstanding bond principal (or for build America bonds, interest payable)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:22mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(c)</b> Credit rate</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(d)</b> Multiply<br/>(b) x (c)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:20mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(e)</b> %</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32mm;font-size:7pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">
<b>(f)</b> Multiply (d) x (e)</th>
</tr>
</thead>
<tfoot/>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<xsl:choose>
<xsl:when test="position() = 1">
<xsl:value-of select="18"/>
</xsl:when>
<xsl:otherwise>
<span style="width:1px;"/>
</xsl:otherwise>
</xsl:choose>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
<tr>
<td class="styTableCell" style="width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<span style="width:1px;"/>
</td>
<td class="styTableCell" style="height:8mm;width:39mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:32mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:18mm;text-align:center;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:40mm;text-align:right;"/>
<td class="styTableCell" style="height:8mm;width:31mm;text-align:right;border-right-width:0px;"/>
</tr>
</table>
</xsl:if>

<!--Not Separate print-->
<xsl:if test="($Print != $Separated) and (count($Form8912Data/BondNotOnForm1097BTCGrp) &gt;=1)">
<xsl:for-each select="$Form8912Data/BondNotOnForm1097BTCGrp">
<xsl:call-template name="SetInitialState"/>
<tbody>
<xsl:if test="(count($Form8912Data/BondNotOnForm1097BTCGrp)&gt;=1) or (count($Form8912Data/BondNotOnForm1097BTCGrp)&lt;=1)">
<tr>
<span style="width:1px;"/>
<div class="styBB" style="width:187mm;border-top:1px solid black;height:7mm">
<div class="styPartName">Part IV</div>
<div class="styPartDesc">Bond credit(s) from bonds held by you and/or your nominee(s) not reported to you on Form(s) 1097-BTC (see instructions)</div>
</div>
</tr>

<!--Line 15a-->
<tr>
<div style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:12mm;border-bottom-width:1px;">
15</div>
<div class="styLNLeftNumBoxSD" style="height:12mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:12mm;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's name, city or town, and state</span>  
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:12mm;padding-bottom:none;width:105mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine1Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine2Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CityNm"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 15b-->
<tr>
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Bond Issuer's employer identification number</span>  
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16a-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
16</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond issued</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondIssueDt"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16b-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond matures</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
</xsl:call-template>
</div>
</div>
</tr>
<!--Line 17-->
<tr>
<div  style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
17</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
</div>
<div class="styLNDesc" style="width:65mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:57mm;">Date bond disposed of (if applicable)</span>   
<!--Dotted Line-->
<span style="width:2mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align:left;height:0mm;padding-bottom:0mm;width:70mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondDisposedDt"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 18-->
<table class="styTable" style="font-size:6pt;border-color:black;width:187mm;" cellspacing="0" summary="Table displaying Bond credit" name="CREYCtable2" id="CREYCtable2">
<thead class="styTableThead">
<tr>
<th scope="col" class="styTableCell" style="height:7mm;width:5mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">		
<span style="width:1px;"/>
</th>
<th scope="col" class="styTableCell" style="font-size:6pt;text-align:center;font-weight:normal;vertical-align:top;width:50mm;height:7mm;" colspan="1">
<b>(a)</b> CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.)
</th>
<th scope="col" class="styTableCell" style="height:7mm;width:29mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(b)</b> Outstanding bond principal (or for build America bonds, interest payable)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:22mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(c)</b> Credit rate</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top;">
<b>(d)</b> Multiply<br/>(b) x (c)</th>
<th scope="col" class="styTableCell" style="height:7mm;width:20mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top">
<b>(e)</b> %</th>
<th scope="col" class="styTableCell" style="height:7mm;width:32.5mm;font-size:6pt;text-align:center;font-weight:normal;vertical-align:top;border-right-width:0px;">
<b>(f)</b> Multiply (d) x (e)</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:if test="($Print != $Separated) or (count($Form8912Data/BondNotOnForm1097BTCGrp) &lt;= 15)">
<xsl:for-each select="BondNotRptOn1097BTCDetail">
<tr>
<td class="styTableCell" style="font-size:7pt;width:5mm;text-align:center;border-right-width:0px;font-weight:bold;border-bottom-width:1px;">
<xsl:choose>
<xsl:when test="position() = 1">
<xsl:value-of select="18"/>
</xsl:when>
<xsl:otherwise>
<span style="width:1px;"/>
</xsl:otherwise>
</xsl:choose>
</td>
<td class="styTableCell" style="height:7mm;width:50mm;text-align:center;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CUSIPNum"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="PrinciplePaymentDt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="InterestPaymentDt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="height:7mm;width:29mm;text-align:right;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="InterestPayableAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="height:7mm;width:22mm;text-align:center;">
<xsl:call-template name="PopulatePercent">
<xsl:with-param name="TargetNode" select="CreditRt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="height:7mm;width:32mm;text-align:right;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TotalBeforeOthLimitationsCrAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="height:7mm;width:20mm;text-align:right;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="PercentageAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="height:7mm;width:32.5mm;text-align:right;border-right-width:0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="BeforeOtherLmtAllowableCrAmt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</xsl:if>
</tbody>
</table>
</xsl:if>
</tbody>
</xsl:for-each>
</xsl:if>
<!--Blank lines-->


<!-- Line 19 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;width:6mm;padding-top:1.5mm">
19</div>
<div class="styLNDesc" style="width:144mm;height:5mm;padding-top:.8mm">
Add the amounts on line 18, column (f)
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;padding-top:.8mm"> ....................</span>
</div>
<div class="styLNRightNumBox" style="width:6mm;height:5mm;border-bottom-width:0px;padding-top:1.5mm">
19	
</div>
<div class="styLNAmountBox" style="width:29.5mm;border-bottom-width:0px;height:5mm;padding-top:1.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/TotalOtherNotRptF1097BTCAmt"/>
</xsl:call-template>
</div>
</div>

<!-- Line 20 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:14mm;width:6mm;padding-top:1.5mm">
20</div>
<div class="styLNDesc" style="width:144mm;height:14mm;padding-top:1.5mm">
For a <b>new</b> clean renewable energy bond or a qualified energy conservation bond, multiply the amount on line 19 by 70% (.70) and enter the result here. For a clean renewable energy bond, qualified zone academy bond, qualified school construction bond, or build America bond, enter the amount from line 19 here. Enter the line 20 amount on line 2. See the instructions for how to report as interest income
<!--Dotted Line-->
<span style="letter-spacing:3.8mm;font-weight:bold;"> ......</span>
</div>
<div class="styLNRightNumBox" style="width:6mm;height:14mm;border-bottom-width:0px;padding-top:11mm">
20	</div>
<div class="styLNAmountBox" style="height:14mm;width:29.5mm;font-size:7pt;border-bottom-width:0px;padding-top:11mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8912Data/NewCleanEnergyBondAmt"/>
</xsl:call-template>
</div>
</div>
<div style="width:187mm;">
<span class="styBoldText"/>
<span style="width:181px;"/>
<span style="width:426px;"/>  
Form <span class="styBoldText">8912</span> (2015)
</div>
<p style="page-break-before: always"/>
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
							<xsl:with-param name="TargetNode" select="$Form8912Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
<!-- Page Header -->
<!-- BEGIN Left Over Table -->
<!-- Start table -->
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

<!-- Start of Part III  -->
<span class="styRepeatingDataTitle">Form 8912 - Part III Bond Credit	<br/>
</span>
<table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CREYCtable" id="CREYCtable">
<thead class="styTableThead">
<tr class="styDepTblHdr" style="width:187mm;">
<th scope="col" class="styDepTblCell" style="width:109mm;font-size:7pt;text-align:center;font-weight:bold;padding-top:4mm;" colspan="2">(a) Name of issuer of Form(s) 1097-BTC </th>
<th scope="col" class="styDepTblCell" style="width:41mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b) Identifying number<br/>of issuer of Form(s)<br/>1097-BTC</th>
<th scope="col" class="styDepTblCell" style="width:32mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b) Unique identifier (see instructions)</th>
<th scope="col" class="styDepTblCell" style="width:42mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(c) Amount reported on<br/>Form(s) 1097-BTC<br/>(see instructions)</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$Form8912Data/BondInformation">
<tr style="width:187mm;">
<!-- Define background colors to the rows -->
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine1Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine2Txt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:36mm;text-align:center;padding-top:4mm;">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:36mm;text-align:center;padding-top:4mm;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="UniqueId"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:38mm;text-align:right;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="Form1097BTCAmt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>
<!-- End of Part III-->

<!-- Start of Part IV -->

<xsl:if test="($Print = $Separated) and (count($Form8912Data/BondNotOnForm1097BTCGrp) &gt;= 1)">
<xsl:for-each select="$Form8912Data/BondNotOnForm1097BTCGrp">
<div class="styBB" style="width:187mm;border-bottom-width: 0px;padding-top:2mm;">
<!-- Start of Separate Table -->
<span class="styRepeatingDataTitle">Form 8912 - Part IV Bond Not On Form 1097 BTC <br/>
</span>
<tbody>

<!--Line 15a-->
<tr class="styDepTblHdr" style="">
<div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width: 1px;">
<div class="styLNLeftNumBox" style="height:17mm;border-bottom-width:1px;text-align:center;">
15</div>
<div class="styLNLeftNumBoxSD" style="height:17mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:70mm;height:17mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:60mm;">Bond Issuer's name, city or town, and state</span>  
<!--Dotted Line-->	
<span style="width:5mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:17mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine1Txt"/>
</xsl:call-template>
<span style="width:1mm;font-weight:bold;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BondIssuerName/BusinessNameLine2Txt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CityNm"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 15b-->
<tr class="styDepTblHdr" style="">
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:70mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:60mm;">Bond Issuer's employer identification number</span>  
<!--Dotted Line-->
<span style="width:5mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16a-->
<tr class="styDepTblHdr" style="">
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
16</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
a</div>
<div class="styLNDesc" style="width:70mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:60mm;">Date bond issued</span>   
<!--Dotted Line-->
<span style="width:5mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondIssueDt"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 16b-->
<tr class="styDepTblHdr" style="">
<div class="styBB" style="width:187mm;border-bottom-width:1px;  ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
b</div>
<div class="styLNDesc" style="width:70mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:60mm;">Date bond matures</span>   
<!--Dotted Line-->
<span style="width:5mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align: left;height:0mm;padding-bottom:none;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
</xsl:call-template>
</div>
</div>
</tr>

<!--Line 17-->

<tr class="styDepTblHdr" style="">
<div style="width:187mm;border-bottom-width:1px; ">
<div class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:1px;">
17</div>
<div class="styLNLeftNumBoxSD" style="height:4.5mm;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 0px 1px;">
</div>
<div class="styLNDesc" style="width:70mm;height:4.5mm;float:left;clear:none;border-bottom-width:1px;">
<span style="width:60mm;">Date bond disposed of (if applicable)</span>   
<!--Dotted Line-->
<span style="width:5mm;font-weight:bold;"/>
<img src="{$ImagePath}/8912_Bullet_Md.gif" alt="MediumBullet" align="bottom"/>
</div>
<div class="styIRS8912TextBox" style="text-align:left;height:0mm;padding-bottom:0mm;width:98mm;font-size:7pt;border-bottom-width:0px;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="BondDisposedDt"/>
</xsl:call-template>
</div>
</div>
</tr>
<!--Line 18-->
<table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0" summary="Table showing Bond Payment information" name="CREYCtable" id="CREYCtable">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" style="width:50mm;font-size:7pt;text-align:center;font-weight:bold;" colspan="2">(a) CUSIP number. If CUSIP number not issued, enter principal payment dates. (Clean renewable energy bonds: Include CUSIP number and principal payment dates. Build America bonds: Include CUSIP number and interest payment dates.) </th>
<th  class="styDepTblCell" style="width:29mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(b) Outstanding bond principal (or for build America bonds, interest payable)</th>
<th  class="styDepTblCell" style="width:22mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(c) Credit rate</th>
<th class="styDepTblCell" style="width:32mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(d) Multiply<br/>(b) x (c)</th>
<th  class="styDepTblCell" style="width:20mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(e) %</th>
<th  class="styDepTblCell" style="width:32mm;font-size:7pt;text-align:center;font-weight:bold;vertical-align:top">(f) Multiply<br/>(d) x (e)</th>
</tr>
</thead>
<tfoot/>
<body>
<xsl:for-each select="BondNotRptOn1097BTCDetail">  
<tr>
<xsl:choose>
<xsl:when test="BondNotRptOn1097BTCDetail">  
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
<xsl:otherwise>styDepTblRow1</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
<xsl:otherwise>styDepTblRow2</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<td class="styTableCell" style="height:7mm;width:5mm;text-align:center;border-right:none;font-weight:bold;padding-top:3.5mm;">
<xsl:choose>
<xsl:when test="position() = 1">
<xsl:value-of select="18"/>
</xsl:when>
<xsl:otherwise>
<span style="width:1px;"/>
</xsl:otherwise>
</xsl:choose>
</td>
<td class="styDepTblCell" style="width:50mm;text-align:center;border-left-width:0px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CUSIPNum"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="PrinciplePaymentDt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="InterestPaymentDt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:29mm;text-align:right;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="OutstndingBondPrinAmt"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="InterestPayableAmt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:22mm;text-align:center;padding-top:4mm;">
<xsl:call-template name="PopulatePercent">
<xsl:with-param name="TargetNode" select="CreditRt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:32mm;text-align:right;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TotalBeforeOthLimitationsCrAmt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:20mm;text-align:right;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="PercentageAmt"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" style="width:32mm;text-align:right;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="BeforeOtherLmtAllowableCrAmt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</body>
</table>
</tbody>
</div>
</xsl:for-each>

</xsl:if>

<!--End Part IV-->

</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
