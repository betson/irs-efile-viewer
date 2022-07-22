<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8880Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form8880Data" select="$RtnDoc/IRS8880"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<html lang="EN-US">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>
<xsl:call-template name="FormTitle">
<xsl:with-param name="RootElement" select="local-name($Form8880Data)"/>
</xsl:call-template>
</title>
<!--  No Browser Caching  -->
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<!-- No Proxy Caching -->
<meta http-equiv="Cache-Control" content="private"/>
<!-- Define Character Set  -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 8880"/>
<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
<xsl:call-template name="InitJS"/>
<style type="text/css">
<xsl:if test="not($Print) or $Print=''">
<xsl:call-template name="IRS8880Style"/>
<xsl:call-template name="AddOnStyle"/>
</xsl:if>
</style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS8880">
<div class="styGenericDiv" style=" width:187mm;">
<xsl:call-template name="DocumentHeader"/>
</div>

<!-- Begin Form title and Form number section -->
<div class="styBB" style="width:187mm;">
<div class="styFNBox" style="width:30mm;font-size:7pt;height:20mm;">
<div style="height:8mm;">
Form<span class="styFormNumber"> 8880</span>
<div class="styAgency" style="font-size:7.5pt;margin-top:5mm;">
Department of the Treasury</div>
<div class="styAgency" style="font-size:7.5pt;margin-top:0mm;"> Internal Revenue Service</div>
</div>
</div>

<!-- Begin Form title -->
<div class="styFTBox" style="width:123mm;height:14mm;">
<div class="styMainTitle" style="font-size: 12pt">Credit for Qualified Retirement Savings Contributions
</div>
<div class="styFBT" style="height:4mm;margin-top:5.5mm;font-size:7pt;padding-top:3.5mm;">
<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to Form 1040, Form 1040A, or Form 1040NR.
</div>
<div class="styFBT" style="height:3mm;margin-top:0mm;font-size:7pt;padding-top:2.5mm;">
<img src="{$ImagePath}/8880_Bullet_Title.gif" alt="Arrow Bullet"/> Information about Form 8880 and its instructions is at <i>www.irs.gov/form8880</i>.
</div>
</div>

<!-- Begin Form Tax Year -->
<div class="styFNBox" style="width:34mm;font-size:7pt;height:20mm;border-left-width: 1px; border-right-width: 0px; text-align:center;">
<div class="styOMB" style="height:4mm;font-size:6pt;">OMB No. 1545-0074</div>
<div class="styTaxYear">20<span class="styTYColor">16</span>
</div>
<div style="margin-left:3mm; text-align:left;font-size: 7.5pt;">
Attachment<br/>Sequence No. <span class="styBoldText">54</span>
</div>
</div>
</div>
<!--  End title of Form  -->

<!--Name Shown on return-->
<div class="styBB" style="width:187mm;font-size:7pt;">
<div class="styFNBox" style="width:140mm; height:9mm;">
Name(s) shown on return<br/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
</xsl:call-template>
<div style="line-height:100%; font-family:verdana;font-size:7pt;"/>
</div>
<b>Your social security number</b>
<br/>
<br/>
<xsl:call-template name="PopulateSSN">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
</xsl:call-template>
</div>

<!--Instructions-->
<div class="styBB" style="width:187mm;padding-top:0mm;padding-bottom:0mm;border-bottom-width:0px;font-size:8pt;font-family:Arial;">
<div class="styBB" style="width:15mm;height: 17mm;padding-top:4.3mm;padding-bottom:0mm;border-bottom-width:0px;">
<img src="{$ImagePath}/8880_Caution.gif" alt="Caution" style="height:55px;width:55px"/>
</div>
<div class="styLNDesc" style="padding-left:3mm;padding-bottom:0mm;width:150mm;">
<div style="font-size:9pt;font-family:Arial;">You<b> cannot </b> take this credit if
<b>  either</b> of the following applies.<br/>
</div>
<div class="styLNDesc" style="padding-left:0mm;padding-top:1mm;padding-bottom:0mm;width:165mm;">
<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
The amount on Form 1040, line 38; Form 1040A, line 22; or Form 1040NR, line 37 is more  than $30,750 ($46,125 if head of household; $61,500 if married filing jointly).<br/>
<br/>
<img src="{$ImagePath}/8880_Bullet_Round.gif" alt="Arrow Bullet"/> 
The person(s) who made the qualified contribution or elective deferral 
<b>(a)</b> 
was born after January 1, 1999,  
<b>(b)</b> is claimed as a<br/> 
dependent on someone else's 2016 tax return, or
<b>(c)</b> was a  <b>student</b> (see instructions).<br/>
</div>
</div>
</div>
<!-- MAIN SECTION -->
<!-- Line 0, Title You and Your Spouse-->
<div style="width:187mm;padding-top:5mm;">
<div class="styLNLeftNumBoxSD" style="width:8mm;"/>
<div class="styLNDesc" style="width:95.2mm;"/>
<div class="styLNRightNumBox" style="border-left-width:1px;border-top-width:2px;height:5mm;"/>
<div class="styLNAmountBox" style="text-align:center;font-size:8pt;border-top-width:2px;border-left-width:0px;height:5mm;">
<b>(a) You</b>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-top-width:2px;height:5mm;"/>
<div class="styLNAmountBox" style="text-align:center;font-size:8pt;border-top-width:2px;border-left-width:0px;height:5mm;">
<b> (b) Your spouse </b>
</div>
</div>

<!--Line 1-->
<div style="width:187mm;">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">1
</div>
<div class="styLNDesc" style="width:95.2mm;font-size:8pt;font-family:Arial;">
Traditional and Roth IRA (including a myRA) contributions for 2016.  <b> Do not </b>  include rollover contributions
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">...............</span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:3mm;height:8.5mm;">1
</div>
<div class="styLNAmountBox" style="border-left-width:0px;border-top-width:0px;padding-top:5mm;height:8.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryRothIRAForCurrentYrAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;height:8.5mm;border-bottom-width:0px;padding-top:3mm;"/>
<div class="styLNAmountBox" style="border-left-width:1px;border-top-width:0px;height:8.5mm;padding-top:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseRothIRAForCurrentYrAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 2-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">2
</div>
<div class="styLNDesc" style="width:95.2mm;font-size:8pt;font-family:Arial;">
Elective deferrals to a 401(k) or other qualified employer plan, voluntary employee contributions, and 501(c)(18)(D) plan contributions for 2016 (see instructions)
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">...................</span>
</div>
<div class="styLNRightNumBox" style="height:10.7mm;font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:0mm;border-bottom-width:1px;">
<br/>
<br/>2
</div>
<div class="styLNAmountBox" style="height:10.7mm;border-left-width:0px;border-top-width:0px;padding-top:4mm;border-bottom-width:1px;">
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/PrimaryContributionsAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:10.6mm;border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;border-bottom-width:0px;"/>
<div class="styLNAmountBox" style="height:10.6mm;border-left-width:1px;border-top-width:0px;padding-top:4mm;border-bottom-width:1px;">
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/SpouseContributionsAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 3-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">3
</div>
<div class="styLNDesc" style="width:95.2mm;font-size:8pt;font-family:Arial;">Add lines 1 and 2
<!--Dotted Line-->
<span class="styDotLn" style=" float:right;">.................</span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:0mm;">3
</div>
<div class="styLNAmountBox" style="border-left-width:0px;border-top-width:0px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/AddPrimRothIRAToCYContriAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;border-bottom-width:0px;"/>
<div class="styLNAmountBox" style="border-left-width:1px;border-top-width:0px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/AddSpRothIRAToCYContriAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 4-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">4
</div>
<div class="styLNDesc" style=" width:95.2mm;font-size:8pt;font-family:Arial;">
Certain distributions received <span class="styBoldText">after</span> 2013 and 
<span class="styBoldText">before</span> the due date<br/>
(including extensions) of your 2016 tax return (see instructions). If<br/>
married filing jointly, include  <span class="styBoldText">both</span> spouses' amounts in 
<span class="styBoldText">both</span> columns.<br/>
See instructions for an exception
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">............</span>
</div>
<div class="styLNRightNumBox" style="height:14mm;font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:3mm;border-bottom-width:1px;">
<br/>
<br/>4
</div>
<div class="styLNAmountBox" style="height:14mm;border-left-width:0px;border-top-width:0px;padding-top:7.5mm;border-bottom-width:1px;">
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/PrimTaxableDistributionsAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:14mm;border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;padding-top:3mm;border-bottom-width:0px;"/>
<div class="styLNAmountBox" style="height:14mm;border-left-width:1px;border-top-width:0px;padding-top:7.5mm;border-bottom-width:1px;">
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/SpsTaxableDistributionsAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 5-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">5
</div>
<div class="styLNDesc" style=" width:95.2mm;font-size:8pt;font-family:Arial;">Subtract line 4 from line 3. If zero or less, enter -0-
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">....... </span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:0mm;">5
</div>
<div class="styLNAmountBox" style="border-left-width:0px;border-top-width:0px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatePrimDistribFromTotAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;border-bottom-width:0px;"/>
<div class="styLNAmountBox" style="border-left-width:1px;border-top-width:0px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/CalculateSpsDistribFromTotAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 6-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">6
</div>
<div class="styLNDesc" style=" width:95.2mm;font-size:8pt;font-family:Arial;">In each column, enter the  
<span class="styBoldText">smaller</span>  of line 5 or $2,000
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">...... </span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:0mm;border-bottom-width:1px;">6
</div>
<div class="styLNAmountBox" style="border-left-width:0px;border-top-width:0px;border-bottom-width:1px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/PrimSmallerOfCalculationAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-right-width:0px;border-top-width:0px;background:#B8B8B8;border-bottom-width:0px;"/>
<div class="styLNAmountBox" style="border-left-width:1px;border-top-width:0px;border-bottom-width:1px;padding-top:0mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/SpsSmallerOfCalculationAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 7-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">7
</div>
<div class="styLNDesc" style="width:135.2mm;height:auto;font-size:8pt;font-family:Arial;">Add the amounts on line 6. If zero, 
<span class="styBoldText">stop</span>; you cannot take this credit
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">............</span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:.5mm;width:8.2mm;height:4.2mm;">7
</div>
<div class="styLNAmountBox" style="border-left-width:0px;border-top-width:0px;padding-top:.5mm;height:4.2mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/TotalCalculatedAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 8-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">8
</div>
<div class="styLNDesc" style=" width:93.2mm;font-size:8pt;font-family:Arial;">Enter the amount from Form 1040, line 38*; Form 1040A, line 22; or
<br/> Form 1040NR, line 37 
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">................ </span>
</div>
<!-- Container -->
<div class="styLNRightNumBoxNBB" style="height:7.5mm;padding-top:0mm;width:2mm; border-left-width:0px;">
</div>
<div class="styLNAmountBoxNB" style="height:7.5mm;width:0mm;border-left-width:0px;padding-top:0mm;clear:right;"/>
<div class="styLNRightNumBox" style="height:7.5mm;font-size:8pt;border-right-width:1px;border-top-width:0px;padding-top:4mm;">8
</div>
<div class="styLNAmountBox" style="height:7.5mm;border-left-width:0px;border-top-width:0px;padding-top:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/ TaxReturnAGIAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="border-left-width:1px;border-right-width:1px;border-top-width:0px;background:#B8B8B8;height:7.5mm;width:8.2mm;border-bottom-width:0px;"/>
</div>

<!--Line 9-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">9
</div>
<div class="styLNDesc" style="width:135.2mm;font-size:8pt;font-family:Arial;">Enter the applicable decimal amount shown below:
</div>
<!--<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width:0px;padding-top:1mm;padding-bottom:0mm;"/>
<div class="styLNAmountBoxNB" style="height:4mm;padding-top:1mm;padding-bottom:0mm;border:1px solid red;"/> -->
<div class="styLNRightNumBox" style="height:5.1mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;border-bottom-width:0px;padding-top:2px;width:8mm;"/>
<div class="styLNAmountBox" style="height:5.1mm;width:32mm;border-left-width:1px;border-bottom-width:0px;padding-top:0px;padding-bottom:0px;"/>
</div>
<div style="height:57mm;width:187mm;">

<!--Start Table Header top line-->
<div style="width:136.2mm;padding-left:8mm;float:left;clear:none;border-bottom-wi;">
<table class="styTable" id="IRS8880Table" summary="Decimal Table" cellspacing="0" cellpadding="0" style="font-size:7pt;">
<thead>
<tr>
<th class="styLimitationHeading" colspan="2" style="text-align:center;font-size:8pt;border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;border-top:1px solid black;" scope="col">
<b>If line 8 is &#8212;</b>
</th>
<th class="styLimitationHeading" scope="col" colspan="3" style="font-size:8pt;border-bottom:1px solid black;border-right:1px solid black;border-left:0;border-top:1px solid black">
<b>And your filing status is &#8212;</b>
</th>
</tr>

<!--Start Table Header second line-->
<tr valign="middle" style="height:9mm;">
<th class="styLimitationHeading" rowspan="2" scope="col" style="border-bottom:1px solid black;border-right:1px black;black;border-left:1px solid black">
Over &#8212;  
</th>
<th class="styLimitationHeading" scope="col" rowspan="2" style="border-bottom:1px solid black;border-right:1px solid black; ">
But not <br/>
over &#8212;
</th>
<th class="styFSHeading" style="border-right:1px solid black;" scope="col">									Married 
<br/> filing jointly                           
</th>
<th class="styFSHeading" scope="col">									Head of    
<br/> household                           
</th>
<th class="styFSHeading" rowspan="2" scope="col" style="border-left:1px solid black; border-right:1px solid black;border-bottom:1px solid black;">
Single, Married filing    
<br/> separately, or   <br/> Qualifying widow(er)                          
</th>
</tr>
<tr valign="middle" style="height:2mm;padding-bottom:.5mm;">
<th scope="col" colspan="2" style=" border-bottom:1px solid black; text-align:center;height:2mm; ">
<b>Enter on line 9 &#8212;</b>
</th>
</tr>
</thead>
<!--END Table Header-->

<!--Start table Data-->
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">  --- </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center;"> $18,500</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;border-right:1px solid black">.5</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$18,500 </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center"> $20,000</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;border-right:1px solid black">.2</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$20,000</td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$27,750</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;border-right:1px solid black">.1</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center"> $27,750	</td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$30,000</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.2</td>
<td style="text-align:center;border-right:1px solid black">.1</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">  $30,000 </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$30,750</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;border-right:1px solid black">.1</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$30,750 </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$37,000</td>
<td style="text-align:center;">.5</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;border-right:1px solid black">.0</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$37,000 </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$40,000</td>
<td style="text-align:center;">.2</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;border-right:1px solid black">.0</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$40,000 </td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$46,125</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;border-right:1px solid black">.0</td>
</tr>
<tr class="styDataCell">
<td style="border-right:0px solid black;border-left:1px solid black;text-align:center">$46,125	</td>
<td style="border-right:1px solid black;border-left:1px solid black;text-align:center">$61,500</td>
<td style="text-align:center;">.1</td>
<td style="text-align:center;">.0</td>
<td style="text-align:center;border-right:1px solid black">.0</td>
</tr>
<tr class="styDataCell:">
<td style="border-right:0px solid black;border-left:1px solid black;border-bottom:1px solid black;font-size:8pt;text-align:center">$61,500	</td>
<td style="border-right:1px solid black;border-left:1px solid black;border-bottom:1px solid black;font-size:8pt;text-align:center"> ---</td>
<td style="text-align:center;font-size:8pt;border-bottom:1px solid black">.0</td>
<td style="text-align:center;font-size:8pt;border-bottom:1px solid black">.0</td>
<td style="text-align:center;font-size:8pt;border-right:1px solid black;border-bottom:1px solid black;">.0</td>
</tr>
</table>
<div class="styLNDesc" style="width:95mm;padding-left:18mm;font-size:8pt;font-family:Arial;">
<b>Note: </b> <i> If line 9 is zero, <b> stop</b>; you cannot take this credit. </i>
</div>
</div>
<!-- End of table -->

<!-- gray shading cell and line 9 amount line -->
<div style="height:57.5mm;width:7mm;float:left;"/>
<div style="height:57.5mm;width:41mm;float:left;">
<div class="styLNRightNumBox" style="height:25.5mm;width:8.2mm;border-right-width:1px;border-left-width:1px;background:#B8B8B8;border-bottom-width:0px;"/>
<div class="styLNRightNumBox" style="width:8.2mm;border-right-width:1px;padding-top:0mm;float:left;clear:left;font-size:8pt;border-bottom-width:1px;">9
</div>
<div class="styLNAmountBox" style="border-left-width:0px;padding-top:0mm;font-size:8pt;">
<span class="styBoldText" style="font-size:8pt;">X.</span>
<span style="width:1mm"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/QlfyRetirementSavDecimalAmt"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:32mm;border-right-width:0px;border-left-width:1px;border-bottom-width:0px;background:#B8B8B8;"/>
<div class="styLNAmountBox" style="height:32mm;border-left-width:1px;border-bottom-width:0px;"/>
</div>
</div>

<!--Note at bottom of table-->
<!--<div style="width:187mm;height:5mm;">
<div class="styLNLeftNumBox" style="height:2mm;font-size:8pt;border-color:red"/> 
<div class="styLNDesc" style="width:101mm;height:2mm;font-size:7pt;padding-top:0mm;padding-left:2mm;border-color:red">-->
<!--<span style="width:5mm;"/>
<b>Note:</b>
<i> If line 9 is zero, <b>stop</b>; you cannot take this credit. </i> -->
<!--</div> -->
<!--<div class="styLNRightNumBoxNBB" style="height:8mm;border-left-width:0px;padding-top:0mm;width:7mm;border-color:red"/>
<div class="styLNAmountBoxNB" style="height:8mm; width:20mm;padding-top:0mm;border-color:red"/> -->
<!--!<div class="styLNRightNumBoxNBB" style="border-color:red;height:8mm;border-right-width:0px;border-left-width:1px;background:#B8B8B8;padding-top:0mm;width:7mm;"/>
<div class="styLNAmountBox" style="height:8mm;width:20mm;border-left-width:1px;border-bottom-width:0px;"/> -->
<!--</div> -->

<!--line 10-->
<div style="width:187mm;clear:all;height:9mm;padding-top:3mm">
<div class="styLNLeftNumBoxSD" style="height:9mm;padding-top:3mm;width:8mm;font-size:8pt;">10
</div>
<div class="styLNDesc" style="width:135.2mm;height:9mm;padding-top:3mm;font-size:8pt;font-family:Arial;">
Multiply line 7 by line 9
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">......................... </span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:0px;border-left-width:1px;border-top-width:0px;padding-top:3mm;width:8mm;height:6.3mm;">10
</div>
<div class="styLNAmountBox" style="width:34mm;height:6.3mm;border-left-width:1px;padding-top:3mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedAmtByDecimalAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 11-->
<div style="width:187mm;clear:all;">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">11
</div>
<div class="styLNDesc" style="width:135.2mm;height:0mm;font-size:8pt;font-family:Arial;">
Limitation based on tax liability. Enter the amount from the Credit Limit Worksheet in the<br/> instructions.
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">.............................</span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:0px;border-left-width:1px;border-top-width:0px;padding-top:3.5mm;width:8mm;height:7mm;">11
</div>
<div class="styLNAmountBox" style="width:34mm;height:7mm;border-left-width:1px;padding-top:3.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/CalculatedCreditsFromTaxAmt"/>
</xsl:call-template>
</div>
</div>

<!--Line 12-->
<div style="width:187mm;clear:all">
<div class="styLNLeftNumBoxSD" style="width:8mm;font-size:8pt;">12
</div>
<div class="styLNDesc" style="width:135.2mm;height:0mm;font-size:8pt;font-family:Arial;">
<span class="styBoldText">Credit for qualified retirement savings contributions.  </span> Enter the 
<span class="styBoldText">smaller </span> of line 10 or line 11<br/> here and on Form 1040, line 51; Form 1040A, line 34; or Form 1040NR, line 48.
<!--Dotted Line-->
<span class="styDotLn" style="float:right;">........</span>
</div>
<div class="styLNRightNumBox" style="font-size:8pt;border-right-width:0px;border-left-width:1px;border-top-width:0px;padding-top:3.5mm;width:8mm;height:7mm;">12
</div>
<div class="styLNAmountBox" style="width:34mm;height:7mm;border-left-width:1px;padding-top:3.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form8880Data/CrQualifiedRetirementSavAmt"/>
</xsl:call-template>
</div>
</div>
<br/>
<br/>

<!--Instructions See pub-->
<div style="width:187mm;padding-top:0mm;height:7mm;">
<div class="styLNLeftNumBox" style="height:7mm;padding-top:0mm;">
</div>
<div class="styLNDesc" style="width:176mm;height:auto;padding-bottom:0mm;font-size:7.5pt;font-family:Arial;">
<br/>      
* See Pub. 590-A for the amount to enter if you are filing Form 2555, 2555-EZ, or 
4563 or you are excluding income from Puerto Rico.
</div>
</div>

<!--Page Footer-->
<div class="pageEnd" style="width:187mm;border-top:1px solid black;font-size:7.5pt;">
<div style="float:left;">
<b>For Paperwork Reduction Act Notice, see your tax return instructions. </b>
<span style="width:20mm;"/>
<span style="font-size:6pt;">     
Cat. No. 33394D</span>
<span style="width:19mm;"/>
<span style="font-size:6pt;">
Form </span>
<span class="styBoldText">8880</span>
<span style="font-size:6pt;">(2016)</span>
</div>
</div>
<!--<br class="pageEnd"/>-->
<!--END Page Footer-->

<!-- Additonal Data Title Bar and Button -->
<div class="styLeftOverTitleLine" id="LeftoverData">
<div class="styLeftOverTitle">
Additional Data        
</div>
<div class="styLeftOverButtonContainer">
<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
</div>
</div>

<!-- Additional Data Table -->
<table class="styLeftOverTbl">
<xsl:call-template name="PopulateCommonLeftover">
<xsl:with-param name="TargetNode" select="$Form8880Data"/>
<xsl:with-param name="DescWidth" select="130"/>
</xsl:call-template>
</table>
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
