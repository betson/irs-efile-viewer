<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS56Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form56Data" select="$RtnDoc/IRS56"/>
<!-- ////////////////////////////////////////////////////////////// (Template:	blankRow) -->
<xsl:template name="blankRow">
<tr>
<td style="border-left:1px solid black;border-right:1px solid black;border-top:1px solid black;font-weight:bold;font-size:8pt">4e</td>
<td style="border-right:1px solid black;border-top:1px solid black">&nbsp;</td>
<td style="border-right:1px solid black;border-top:1px solid black;font-weight:bold;font-size:8pt">4e</td>
<td style="border-top:1px solid black;border-right:1px solid black">&nbsp;</td>
</tr>
</xsl:template>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<html lang="EN-US">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>
<xsl:call-template name="FormTitle">
<xsl:with-param name="RootElement" select="local-name($Form56Data)"/>
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
<meta name="Description" content="IRS Form 56"/>
<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
<xsl:call-template name="InitJS"/>
<style type="text/css">
<xsl:if test="not($Print) or $Print=''">
<xsl:call-template name="IRS56Style"/>
<xsl:call-template name="AddOnStyle"/>
</xsl:if>
</style>
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS56" style="font-family:arial; font-size:9pt">

<!--  Begin Header section 1 -->
<xsl:call-template name="DocumentHeader"/>
<div class="styBB" style="width:187mm;border-bottom-width:2px;">
<div class="styFNBox" style="width:31mm;height:22.8mm;border-right-width:2px;padding-top:.5mm;">
<div style="padding-top:1mm;">
Form<span class="styFormNumber">  56</span>
</div>

<!--General Dependency Push Pin-->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$Form56Data"/>
</xsl:call-template>
<span class="styAgency">(Rev. December 2019)</span>
<br/>
<div class="styAgency" style="height:2mm;padding-bottom:0;padding-top:1.5mm">Department of the Treasury</div>
<div class="styAgency" style="height:2mm;padding-top:0">Internal Revenue Service</div>
</div>
<div class="styFTBox" style="width:125mm;height:22mm;">

<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<br/>
<div class="styMainTitle" style="height:8mm;padding-top:4mm">
Notice Concerning Fiduciary Relationship 
</div>
<div class="styFST" style="height:5mm;font-size:7.5pt;margin-left:2mm;text-align:center;">
<span style="text-align:center;font-weight:bold;">
<div style="width:100%;height:5mm;padding-left:5px;">
<div style="width:120mm;height:5mm;padding-top:4mm">

<img src="{$ImagePath}/8825_Bullet_Title.gif" width="4" height="7" alt="Bullet Image"/>
								Go to <i><a href="http://www.irs.gov/form56">www.irs.gov/Form56</a></i> for instructions and latest information.
<br/>
(Internal Revenue Code sections 6036 and 6903)
</div>
</div>
</span>
</div>
</div>
<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22.8mm;border-bottom-width:0px;">
<div class="styOMB" style="width:100%;font-size:7pt;height:auto;padding-top:8mm;border-bottom-width:0px;text-align:center;">OMB No. 1545-0013</div>
</div>
</div>
<!--  End Header section 1 -->

<!-- Part I - Identification  -->
<div class="styIRS56PartHeader">
<div class="styTitleName" style="width:13mm; font-size:10pt">Part I</div>
<div class="styTitleDesc" style="font-size:10pt; width:170mm">Identification </div>
</div>

<!-- Line 1 -->
<div class="styBB" style="width:187mm;height:auto;"></div>
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56CleanDiv" style="width:100%;height:25%;">
<div class="styIRS56CleanDiv" style="width:50%;height:8mm;border-right-width:1px;">
<div class="styIRS56LNDesc" style="width:100%;auto;font-size:7pt;">
Name of person for whom you are acting (as shown on the tax return)
</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonFirstNm"/>
<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
</xsl:call-template>
<span style="width:4px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName/PersonLastNm"/>
<xsl:with-param name="BackupName">RtnHdrDataFilerName</xsl:with-param>
</xsl:call-template>
<span style="width:3px"/>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Filer Primary Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
</xsl:call-template> 
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Filer Decedent Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentNameControlTxt"/>
</xsl:call-template> 
</span>
</div>
<div class="styIRS56CleanDiv" style="width:23%;height:8mm;border-right-width:1px;padding-top:0mm;">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
Identifying number
</div>
<xsl:choose>
<xsl:when test="$Form56Data/PrimarySSN">
<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
<xsl:call-template name="PopulateSSN">
<xsl:with-param name="TargetNode" select="$Form56Data/PrimarySSN"/>
</xsl:call-template>
</span>
</xsl:when>
<xsl:otherwise>
<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
<xsl:with-param name="EINChanged">true</xsl:with-param>
</xsl:call-template>
</span>
</xsl:otherwise>
</xsl:choose>
</div>
<div class="styIRS56CleanDiv" style="width:25.9%;height:8mm;">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
<b>Decedent's social security no.</b>
</div>
<span style="width:100%;height:auto;font-size:7pt;text-align:center;">
<xsl:call-template name="PopulateSSN">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentSSN"/>
</xsl:call-template>
<!-- If the SSN has changed, show a delta image -->
<xsl:if test="$RtnHdrData/Filer/DecedentSSN and ($TaxpayerPrint = 'false' or $TaxpayerPrint = '0')">
<xsl:if test="(/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1')">
<span style="width:2px;"/>
<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Primary SSN has changed"/>
</xsl:if>
</xsl:if>
</span>
</div>
</div>
</div>

<!-- Line 2 -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
Address of person for whom you are acting (number, street, and room or suite no.)
</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>
<xsl:when test="$RtnHdrData/Filer/USAddress">

<!-- US Address -->
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if>
</xsl:when>
<xsl:otherwise>

<!-- Foreign Address -->
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</span>
</div>

<!-- Line 3 -->
<div class="styBB" style="width:187mm;height:auto;border-bottom-width:2px">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
City or town, state, and ZIP code (If a foreign address, see instructions.) 
</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress"/>
<xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/Filer/ForeignAddress"/>
</xsl:call-template>
<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
<span style="width:7px;"/>
<xsl:call-template name="PopulateReturnHeaderFiler">
<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
<xsl:with-param name="MainForm">true</xsl:with-param>
</xsl:call-template>
</xsl:if>
</span>
</div>

<!-- Line 4 -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
Fiduciary’s name
</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>

<!-- US Address -->
<xsl:when test="$Form56Data/FiduciaryPersonName">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonName/PersonFirstNm"/>
</xsl:call-template>
<xsl:if test="$Form56Data/FiduciaryPersonName/PersonLastNm">
<span style="width:4px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonName/PersonLastNm"/>
</xsl:call-template>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNm"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
<span style="width:3px"/>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Fiduciary Person Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonNameControlTxt"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Fiduciary Business Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNmControlTxt"/>
</xsl:call-template>
</span>
</div>

<!-- Line 5 -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56LNDesc" style="width:100%;height:auto;font-size:7pt;">
Address of fiduciary (number, street, and room or suite no.) 
</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>

<!-- US Address -->
<xsl:when test="$Form56Data/FiduciaryUSAddress/AddressLine1Txt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$Form56Data/FiduciaryUSAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if><br/>
<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress/AddressLine1Txt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if>
</xsl:if>
</xsl:when>
<xsl:when test="$Form56Data/FiduciaryForeignAddress/AddressLine1Txt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$Form56Data/FiduciaryForeignAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if><br/>
<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine1Txt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine1Txt"/>
</xsl:call-template>
<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine2Txt != '' ">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:if>
</xsl:if>
</xsl:when>
</xsl:choose>
</span>
</div>

<!-- Line 6 -->
<div class="styBB" style="border-bottom-width:0;width:187mm;float:none;clear:none;">
<div class="styNameBox" style="width:131mm;height:auto;font-size:7pt;">
<div>
City or town, state, and ZIP code</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>

<!-- Fiduciary US Biz Address -->
<xsl:when test="$Form56Data/FiduciaryUSAddress">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSAddress"/>
</xsl:call-template><br/>
<xsl:if test="$Form56Data/FiduciaryBusinessUSAddress">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessUSAddress"/>
</xsl:call-template>
</xsl:if>
</xsl:when>
<xsl:when test="$Form56Data/FiduciaryForeignAddress">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode"/>
<xsl:with-param name="ForeignAddressTargetNode" select="$Form56Data/FiduciaryForeignAddress"/>
</xsl:call-template>
<span style="width:6px;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignAddress/CountryCd"/>
</xsl:call-template><br/>
<xsl:if test="$Form56Data/FiduciaryBusinessFrgnAddress">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode"/>
<xsl:with-param name="ForeignAddressTargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress"/>
</xsl:call-template>
<span style="width:6px;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessFrgnAddress/CountryCd"/>
</xsl:call-template>
</xsl:if>
</xsl:when>
</xsl:choose>
</span>
</div>
<div class="styEINBox" style="width:55mm;height:auto;padding-left:2mm;font-size:7pt;font-weight:normal;">
<div>
Telephone number (optional) </div>
<span style="width:27mm;text-align:left;">
<xsl:choose>
<xsl:when test="$Form56Data/FiduciaryUSPhoneNum">
<xsl:call-template name="PopulatePhoneNumber">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryUSPhoneNum"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="PopulatePhoneNumber">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryForeignPhoneNum"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</span>
</div>
</div>
<div class="styBB" style="width:187mm;height:auto;"></div>
<!-- END Part I - Identification  -->

<!-- Section A - Authority  -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56PartHeader">
<div class="styTitleDesc" style="width:100mm; font-size:10pt">Section A. Authority</div>
</div>

<!-- Section A Line 1 -->
<div class="styBB" style="width:187mm;height:auto;"></div>
<div class="styIRS56LineItem">
<div class="styIRS56PartNum" style="padding-top:0.5mm">1</div>
<div style="float:left; padding-top:0.5mm">
Authority for fiduciary relationship. Check applicable box:
</div>      
</div>

<!-- Section A Line a -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">a</div>
<div style="float:left">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/TestateInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/TestateInd"/>
<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
<label for="Form56DataTestateInd">
Court appointment of testate estate (valid will exists)
</label>
</div>
</div>

<!-- Section A Line b -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">b</div>
<div style="float:left">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/IntestateInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/IntestateInd"/>
<xsl:with-param name="BackupName">IntestateInd</xsl:with-param>
</xsl:call-template>
</input>
</span>	
</div>
<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
<label for="IntestateInd">
Court appointment of intestate estate (no valid will exists)
</label>
</div>
</div>

<!-- Section A Line c -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">c</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/GuardianOrConservatorInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/GuardianOrConservatorInd"/>
<xsl:with-param name="BackupName">Form56DataGuardianOrConservatorInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
<label for="Form56DataGuardianOrConservatorInd">
Court appointment as guardian or conservator 
</label>
</div>      
</div>

<!-- Section A Line d -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">d</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryIntestateEstateInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryIntestateEstateInd"/>
<xsl:with-param name="BackupName">Form56DataFiduciaryIntestateEstateInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
<label for="Form56DataFiduciaryIntestateEstateInd">
Fiduciary of intestate estate 
</label>
</div>      
</div>

<!-- Section A line e -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">e</div>
<div style="float:left; ">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/ValidTrustOrAmendmentInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/ValidTrustOrAmendmentInd"/>
<xsl:with-param name="BackupName">Form56DataValidTrustOrAmendmentInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
<label for="Form56DataValidTrustOrAmendmentInd">
Valid trust instrument and amendments 
</label>
</div>      
</div>

<!-- Section A line f -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">f</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:.5mm">
<label for="Form56DataBankruptcyOrAssignmentInd">
Bankruptcy or assignment for the benefit of creditors
</label>
</div>      
</div>

<!-- Section A Line g -->
<div class="styIRS56LineItem" style="height:8mm;"> 
<div class="styIRS56Part1">g</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/BankruptcyOrAssignmentInd"/>
<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherFiduciaryAuthorityGrp/OtherAuthorityInd"/>
<xsl:with-param name="BackupName">Form56OtherFiduciaryAuthorityGrpOtherAuthorityInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:0.5mm;">
<label for="Form56OtherFiduciaryAuthorityGrpOtherAuthorityInd">
Other. Describe
</label>
<span style="width:2px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:2px"/>
</div>
<div style="float:left;border-bottom:1px dashed black;width:141mm;">					  
<span> 	
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherFiduciaryAuthorityGrp/OtherAuthorityExplanationDesc"/>
<xsl:with-param name="BackupName">Form56OtherFiduciaryAuthorityGrpOtherAuthorityExplanationDesc</xsl:with-param>
</xsl:call-template>
</span> 
</div>    
</div>      	

<!-- Section A line 2a -->
<div class="styIRS56LineItem" style="width:187mm;padding-top:0mm">
<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:1.5mm;float:left;clear:none">2a</div>
<div class="styGenericDiv" style="float:left; padding-top:0.5mm;">
If box 1a, 1b, or 1d is checked, enter the date of death
<span style="width:2px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:2px"/>
</div>
<!--	<div class="styGenericDiv" style="border-bottom:1px dashed black;width:100mm">	-->	
<span style="width:98mm;border-bottom:1px dashed black"> 
<span> 	
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$Form56Data/DecedentDeathDt"/>
<xsl:with-param name="BackupName">Form56DataDecedentDeathDate</xsl:with-param>
</xsl:call-template>
</span> 
</span>
</div>   
<!--		</div>  -->

<!-- Section A line 2b -->
<div class="styIRS56LineItem" style="width:187mm;height:8mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:3mm;float:left;clear:none">b</div>
<!--		<div class="styGenericDiv" style="float:left; padding-top:0.5mm;"> -->
<div class="styGenericDiv" style="float:left; padding-top:0.5mm;padding-bottom:0.5mm;"> 
If box 1c, 1e, 1f, or 1g is checked, enter the date of appointment, taking office, or assignment
or transfer of assets 
<span style="width:2px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:2px"/>
</div>
<!--		<div class="styGenericDiv" style="border-bottom:1px dashed black;width:22mm">		-->
<span style="width:16.5mm;border-bottom:1px dashed black">		  
<span> 	
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryAuthorityDt"/>
<xsl:with-param name="BackupName">Form56DataFiduciaryAuthorityDt</xsl:with-param>
</xsl:call-template>
</span> 
</span>
<!--	</div>   --> 
</div>
</div>	

<!-- Section B - Nature of Liability and Tax Notices  -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56PartHeader" style="width:186mm">
<div class="styTitleDesc" style="width:100mm; font-size:10pt">Section B. Nature of Liability and Tax Notices</div>
</div>
</div>

<!-- Section B Line 3 -->
<div class="styBB" style="width:187mm;height:auto;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
<div class="styIRS56LineItem" style="height:10mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;float:left;clear:none">3</div>
<div class="styGenericDiv" style="width:180mm;float:left; padding-top:0.5mm;">
Type of taxes (check all that apply):
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/IncomeInd"/>
<xsl:with-param name="BackupName">Form56DataIncomeInd </xsl:with-param>
</xsl:call-template>
<input type="Checkbox" title="income" id="income" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/IncomeInd"/>
<xsl:with-param name="BackupName">Form56DataIncomeInd </xsl:with-param>
</xsl:call-template>
</input>
</span>
<label for="income"> 
Income
</label>
<span style="width:8px"/>
<span>
<xsl:call-template name="PopulateSpan">
</xsl:call-template>
<input type="Checkbox" title="gift" id="gift" alt="Checkbox" class="styCkbox" onclick="return false">
</input>
</span>
<label for="gift">Gift </label>
<span style="width:8px"/>
<span>
<input type="Checkbox" alt="Checkbox" title="estate" id="estate" class="styCkbox" onclick="return false">
</input>
</span>
<label for="estate">Estate </label>
<span style="width:8px"/>
<span>
<input type="Checkbox" title="transfer" id="transfer" alt="Checkbox" class="styCkbox" onclick="return false">
</input>
</span>
<label for="transfer">Generation-skipping transfer </label>
<span style="width:8px"/>
<span>
<input type="Checkbox" title="employment" id="employment" alt="Checkbox" class="styCkbox" 
onclick="return false">
</input>
</span>
<label for="employment">Employment </label>
<span style="width:8px"/>
<span>
<input type="Checkbox" title="excise" id="excise" alt="Checkbox" class="styCkbox" onclick="return false">
</input>
</span>
<label for="excise">Excise </label>
<span style="width:8px"/>
<span>
<input type="Checkbox" title="otherTypeOfTaxes" id="otherTypeOfTaxes" alt="Checkbox" class="styCkbox"
onclick="return false">
</input>
</span>
<label for="otherTypeOfTaxes">Other (describe) </label>
<span style="width:8px;"/>
<span><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span><span style="width:5px"/>
<span style="width:102mm;border-bottom:1px dashed black"/>
</div>
<span style="width:30mm;text-align:center;border-bottom:0px dashed black;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/TaxTypeDescription"/>
</xsl:call-template>
</span>
</div>

<!-- Section B Line 4 -->
<div class="styIRS56LineItem" style="height:10mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;">4</div>
<div class="styGenericDiv" style="width:180mm;float:left; padding-top:0.5mm;">
Federal tax form number (check all that apply):
<span><b>a</b>
<span style="width:5px"/>
<input type="Checkbox" alt="Checkbox" title="form706" id="form706" class="styCkbox" onclick="return false">
</input>
</span>
<label for="form706">706 Series </label>
<span style="width:8px"/>
<span><b>b</b>
<span style="width:5px"/>
<input type="Checkbox" alt="Checkbox" title="form709" id="form709" class="styCkbox" onclick="return false">
</input>
</span>
<label for="form709">709 </label>
<span style="width:8px"/>
<span><b>c</b>
<span style="width:5px"/>
<input type="Checkbox" alt="Checkbox" title="form940" id="form940" class="styCkbox" onclick="return false">
</input>
</span>
<label for="form940">940 </label>
<span style="width:8px"/>
<span><b>d</b>
<span style="width:5px"/>
<input type="Checkbox" alt="Checkbox" title="form941" id="form941" class="styCkbox" onclick="return false">
</input>
</span>
<label for="form941">941, 943, 944 </label>
<span style="width:8px"/>
<span><b>e</b>
<span style="width:5px"/>
<input type="Checkbox" title="form1040" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/TaxFormNum1040Ind"/>
<xsl:with-param name="BackupName">Form56DataTaxFormNum1040Ind </xsl:with-param>
</xsl:call-template>
</input>
</span>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$Form56Data/TaxFormNum1040Ind"/>
<xsl:with-param name="BackupName">Form56DataTaxFormNum1040Ind </xsl:with-param>
</xsl:call-template>
1040 or 1040-SR 
</label>
<span style="width:8px"/>
<span><b>f</b>
<span style="width:5px"/>
<input type="Checkbox" title="form1041" id="form1041" alt="Checkbox" class="styCkbox" 
onclick="return false">
</input>
</span>
<label for="form1041">1041 </label>
<span style="width:8px"/>
<span><b>g</b>
<span style="width:5px"/>
<input type="Checkbox" alt="Checkbox" title="form1120" id="form1120" class="styCkbox" 
onclick="return false">
</input>
</span>
<label for="form1120">1120 </label>
<span style="width:8px;"/>
<span><b>h</b>
<span style="width:5px"/>
<input type="Checkbox" title="otherFormNumber" id="otherFormNumber" alt="Checkbox" class="styCkbox"
onclick="return false">
</input>
</span>
<label for="otherFormNumber">Other (list) </label>
<span style="width:5px"/>
<span><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span><span style="width:5px"/>
<span style="width:65mm;border-bottom:1px dashed black"/>
</div>
<span style="width:30mm;text-align:center;border-bottom:0px dashed black;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/TaxTypeDescription"/>
</xsl:call-template>
</span>
</div>
<div style="height:auto;width:187mm;">

<!-- Section B Line 5 -->
<div class="styIRS56LineItem" style="height:12mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;">5</div>
<div class="styIRS56LNDesc" style="width:179mm;height:70mm; ">
<div style="float:left">
<span style="float:left;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/AuthDoesNotCoverAllTaxYearInd"/>
<xsl:with-param name="BackupName">Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd </xsl:with-param>
</xsl:call-template>
If your authority as a fiduciary does not cover all years or tax periods, check here
</label>
</span>
<span style="float:right;">
<span class="styDotLn" style="padding-right:2mm;">............</span>
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<input type="Checkbox" alt="Authority does not cover all tax periods" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/AuthDoesNotCoverAllTaxYearInd"/>
<xsl:with-param name="BackupName">Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd </xsl:with-param>
</xsl:call-template>
</input>
</span>
<br/>
<div class="styIRS56LNDesc" style="width:179mm;height:auto;">
and list the specific years or periods
<!--<label for="Form56DataFidcryAuthDoesNotCoverAllYrGrpAuthDoesNotCoverAllTaxYearInd">
</label>-->
<xsl:if test="(count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &lt; 1)">
<span style="width:5px"/>
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/> 
<span style="width:119mm;border-bottom:1px dashed black">

</span>
<br/>
</xsl:if> 
<xsl:if test="(count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &gt; 1)">
<span style="width:5px"/>
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/> 
<span style="width:119mm;border-bottom:1px dashed black">
"See Additional Data Table"
</span>
<br/>
</xsl:if> 
<xsl:if test="($Print != $Separated) and (count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &lt;2) or 
($Print = $Separated) and (count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &lt;2) ">
<xsl:for-each select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp">
<xsl:if test="position()!=1">
<!--<span style="width:56.5mm"/>-->
</xsl:if> 
<div style="width:122mm;border-bottom:1px dashed black;float:right;clear:none;">
<span style="width:3mm"/>
<xsl:call-template name="PopulateYear">
<xsl:with-param name="TargetNode" select="TaxYr"/>
</xsl:call-template>
<span style="width:3mm"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodBeginDt"/>
</xsl:call-template>
<span style="width:3mm"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodEndDt"/>
</xsl:call-template>
</div>
<br/>
</xsl:for-each>
</xsl:if> 

</div>
</div>
</div>
</div>     
</div>


</div>

<!-- END Part III - Nature of Liability and Tax Notices  -->

<!-- Page Break and Footer-->
<div style="width:187mm;margin-top:4px;border-top:2px solid black;">
<div style="float:left;">
<span style="font-weight:bold;">
For Paperwork Reduction Act Notice, see separate instructions.
</span>
<span style="margin-left:16px;width:26mm;font-size:7pt;">
Cat. No. 16375I
</span>
</div>
<div style="float:right;"> 
Form 
<span class="styBoldText" style="font-size:8pt;">56</span> (Rev. 12-2019)
</div>
</div>
<!-- END Page Break and Footer-->
<p style="page-break-before: always"/>
<!-- BEGIN Page Header -->
<span style="font-size:8pt;height:8mm;width:175mm;padding-top:4mm;">
Form 56 (Rev. 12-2019)
</span>
<span style="">
Page <span style="font-weight:bold;font-size:8pt;">2</span>
</span>
<div class="styBB" style="width:187mm;height:auto;border-bottom-width:2px;"></div>
<!-- END Page Header -->

<!-- Part II - Revocation or Termination of Notice  -->
<div class="styBB" style="width:187mm;height:auto;">
<div class="styIRS56PartHeader" style="width:186mm">
<div class="styTitleName" style="width:20mm; font-size:10pt">Part II</div>
<div class="styTitleDesc" style="font-size:10pt; width:145mm;">Revocation or Termination of Notice </div>
</div>
</div>

<!-- Section A - Total Revocation or Termination  -->
<div class="styIRS56PartHeader">
<div class="styBB" style="font-size:10pt; float:left;clear:none;width:187mm;text-align:center;font-weight: none;bottom-border-width:1px;">Section A-Total Revocation or Termination </div>
</div>

<!-- Section A Line 6 -->
<div class="styIRS56LineItem" style="height:8mm;width:187mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:1.5mm;float:left;clear:none">6</div>
<div class="styGenericDiv" style="float:left;padding-top:0.5mm;width:180mm;">
Check this box if you are revoking or terminating all prior notices concerning fiduciary relationships on file with the Internal <br/>Revenue Service for the same tax matters and years or periods covered by this notice concerning fiduciary relationship
<span class="styBoldText">
<span style="width:1px"></span>
</span>
<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/TotalRevocationInd"/>
<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
</xsl:call-template>
</input>    
</div>
</div>
<br/>
<div class="styGenericDiv" style="padding-top:1mm;float:left;clear:none;padding-left:7mm;">
Reason for termination of fiduciary relationship. Check applicable box:
</div>
<br/>
<!-- Section A Line 6a -->
<div class="styIRS56LineItem" >
<div class="styIRS56Part1">a</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtOrderRevocationInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtOrderRevocationInd"/>
<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
<label for="Form56DataTestateInd">
Court order revoking fiduciary authority
</label>
</div>
</div>

<!-- Section A Line 6b -->
<div class="styIRS56LineItem">
<div class="styIRS56Part1">b</div>
<div style="float:left">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/CertDissolutionOrTermInd"/>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/CertDissolutionOrTermInd"/>
<xsl:with-param name="BackupName">IntestateInd</xsl:with-param>
</xsl:call-template>
</input>
</span>	
</div>
<div style="float:left; padding-top:0.5mm;padding-left:0.5mm">
<label for="IntestateInd">
Certificate of dissolution or termination of a business entity
</label>
</div>
</div>

<!-- Section A Line 6c -->
<div class="styIRS56LineItem" style="height:8mm;"> 
<div class="styIRS56Part1">c</div>
<div style="float:left;">
<span>
<xsl:call-template name="PopulateSpan">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherRevocationInd"/>
<xsl:with-param name="BackupName">Form56DataBankruptcyOrAssignmentInd</xsl:with-param>
</xsl:call-template>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherRevocationInd"/>
<xsl:with-param name="BackupName">Form56OtherRevocationInd</xsl:with-param>
</xsl:call-template>
</input>
</span>
</div>
<div style="float:left; padding-top:0.5mm; padding-left:0.5mm;">
<label for="Form56OtherFiduciaryAuthorityGrpOtherAuthorityInd">
Other. Describe
</label>
<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:5px"/>
</div>
<div style="float:left;border-bottom:1px dashed black;width:141mm;">					  
<span> 	
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherRevocationDesc"/>
<xsl:with-param name="BackupName">Form56OtherFiduciaryAuthorityGrpOtherAuthorityExplanationDesc</xsl:with-param>
</xsl:call-template>
</span> 
</div>    
</div>      	
<div class="styBB" style="width:187mm;height:auto;border-bottom-width:2px;"></div>

<!-- Section B - Partial Revocation  -->
<div class="styIRS56PartHeader">
<div class="styBB" style="font-size:10pt; float:left;clear:none;width:187mm;text-align:center;font-weight: none;bottom-border-width:1px;">Section B-Partial Revocation </div>
</div>

<!-- Section B Line 7a -->
<div class="styIRS56LineItem" style="height:4mm;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;padding-left:1.5mm;float:left;clear:none;">7a</div>
<div class="styGenericDiv" style="float:left; padding-top:0.5mm;width:180mm;">
Check this box if you are revoking earlier notices concerning fiduciary relationships on file with the Internal Revenue Service for<br/> the same tax matters and years or periods covered by this notice concerning fiduciary relationship
<span class="styBoldText">
<span class="styDotLn" style="padding-right:0mm;">........</span>
</span>
<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/PartialRevocationInd"/>
<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>

<!-- Section B Line 7b --> 
<div class="styIRS56LineItem" style="height:auto;width:187mm;">
<div class="styIRS56PartNum" style="padding-top:4.7mm;padding-left:3.2mm;float:left;clear:none;">b</div>
<div class="styGenericDiv" style="width:179mm;float:left; padding-top:5mm;">
Specify to whom granted, date, and address, including ZIP code.
<!--<span style="width:5px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/><span style="width:5px"/>-->
<div style="border-bottom:1px dashed black;width:174mm;">
<span style="width:0px"/><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<xsl:if test="$Form56Data = '' ">
<span style="width:25px"/>
</xsl:if>
<xsl:if test="$Form56Data/GranteeNm != '' ">
<span style="width:10px"/>
	<xsl:call-template name="PopulateText"> 
	<xsl:with-param name="TargetNode" select="$Form56Data/GranteeNm"/>
	</xsl:call-template>
	
	<span style="width:25px"/>
	<xsl:call-template name="PopulateText"> 
	<xsl:with-param name="TargetNode" select="$Form56Data/GranteeDt"/>
	</xsl:call-template>
	<br/>
	<span style="width:25px"/>
	<xsl:choose>
		<xsl:when test="$Form56Data/GranteeUSAddress">
		<!-- US Address -->
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form56Data/GranteeUSAddress/AddressLine1Txt"/>
				</xsl:call-template>
				<br/>
<span style="width:25px"/>
			<xsl:if test="$Form56Data/GranteeUSAddress/AddressLine2Txt != '' ">
	
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form56Data/GranteeUSAddress/AddressLine2Txt"/>
				</xsl:call-template>
				<br/>
				<span style="width:25px"/>
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form56Data/GranteeUSAddress/CityNm"/>
			</xsl:call-template>,
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form56Data/GranteeUSAddress/StateAbbreviationCd"/>
            </xsl:call-template>
            <span style="width:3px"/>
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form56Data/GranteeUSAddress/ZIPCd"/>
            </xsl:call-template>
            <!--<br/>-->
            <span style="width:28px"/>
			</xsl:if>
		</xsl:when>
		<xsl:otherwise>
	
<!-- Foreign Address -->
		
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/AddressLine1Txt"/>
			</xsl:call-template>
			<br/>
			<span style="width:25px"/>
			<xsl:if test="$Form56Data/GranteeForeignAddress/AddressLine2Txt != '' ">
				
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/AddressLine2Txt"/>
				</xsl:call-template>
				<br/>
				<span style="width:25px"/>
			</xsl:if>
		</xsl:otherwise>
	</xsl:choose>
<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/CityNm"/>
			</xsl:call-template>
			<span style="width:3px"/>
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/ProvinceOrStateNm"/>
            </xsl:call-template>
            <span style="width:3px"/>
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/ForeignPostalCd"/>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <span style="width:3px"/>
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form56Data/GranteeForeignAddress/CountryCd"/>
            </xsl:call-template>
            <br/>
            </xsl:if>
</div>
</div>
</div>

<!--<div class="styBB" style="width:187mm;height:31mm;border-bottom-width:2px;"></div>-->

<!-- Section C - Substitute Fiduciary  -->
<div class="styIRS56PartHeader" style="height:auto;">
<div class="styBB" style="font-size:10pt; float:left;clear:none;width:187mm;text-align:center;font-weight: none;bottom-border-width:1px;">Section C-Substitute Fiduciary </div>

<!-- Section C Line 8 -->
<div class="styIRS56LineItem" style="height:auto;">
<div class="styIRS56PartNum" style="padding-top:0.5mm;">8</div>
<div class="styIRS56LNDesc" style="width:179mm;height:auto;">
Check this box if a new fiduciary or fiduciaries have been or will be substituted for the revoking or terminating fiduciary and<br/>specify the name(s) and address(es), including ZIP code(s), of the new fiduciary(ies)
<span class="styBoldText">
<span class="styDotLn" style="padding-right:0mm;">............</span>
</span>
<span style="width:5px"/>
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<input type="Checkbox" alt="Checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$Form56Data/NewOrSubstituteFiduciaryInd"/>
<xsl:with-param name="BackupName">Form56DataTestateInd </xsl:with-param>
</xsl:call-template>
</input>
</div>
<xsl:if test="(count($Form56Data/NewOrSubstituteFiduciaryGrp) &lt; 1)">
<span style="width:5px"/>
<span style="width:20px;"/><span style="width:5px;padding-top:0mm;">
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span>
<span style="width:176mm;border-bottom:1px dashed black">
</span>
<br/>
</xsl:if> 
<xsl:if test="(count($Form56Data/NewOrSubstituteFiduciaryGrp) &gt; 1)">
<span style="width:5px"/>
<span style="width:20px;"/><span style="width:5px;padding-top:0mm;">
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span>
<span style="width:176mm;border-bottom:1px dashed black">
"See Additional Data Table"
</span>
<br/>
</xsl:if> 

<xsl:if test="($Print != $Separated) and (count($Form56Data/NewOrSubstituteFiduciaryGrp) &lt; 2) or
($Print = $Separated) and (count($Form56Data/NewOrSubstituteFiduciaryGrp) &lt; 2)">
<xsl:for-each select="$Form56Data/NewOrSubstituteFiduciaryGrp">
<!--<xsl:if test="position()=1">
<span style="width:25px;"/><span style="width:5px;padding-top:0mm;padding-right:2mm"><img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/></span>
</xsl:if> -->

<xsl:if test="position()!=1">
<!--<span style="width:56.5mm"/>-->
</xsl:if> 
<!--<span style="width:178mm;height:26mm;padding-top:0mm;border-bottom:1px dashed black;float:right;clear:none;">-->
<div style="width:178mm;height:auto;border-bottom:1px dashed black;float:right;clear:none;">
<xsl:if test="position()=1">
<!--<span style="width:25px;"/>-->
<!--<span style="width:0px"/>-->
<img src="{$ImagePath}/56_Bullet.gif" alt="MediumBullet"/>
<span style="width:11px"/>
</xsl:if> 
<xsl:choose>
		<xsl:when test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryPersonName">
<!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryPersonName != '' ">		-->	
			<!--<span style="width:17px"/>-->
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonFirstNm"/>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonLastNm"/>
            </xsl:call-template>
            <br />
            <!--</xsl:if>-->
            </xsl:when>
		<xsl:otherwise>
           <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryBusinessNm != '' ">--> 
          <span style="width:25px"/>
           <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessNm"/>
            </xsl:call-template>
                        <br />
            <!--</xsl:if>-->
           </xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryUSAddress">
		<!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryUSAddress ">-->
            <span style="width:22px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:22px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/StateAbbreviationCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/ZIPCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        <br />
        </xsl:when>
		<xsl:otherwise>
        <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryForeignAddress ">-->
             <span style="width:25px"/>
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ProvinceOrStateNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CountryCd"/>
            </xsl:call-template>
            <br />
        <!--</xsl:if>-->
        </xsl:otherwise>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryBusinessUSAddress">
		<span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/StateAbbreviationCd"/>
                </xsl:call-template>,
                <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/ZIPCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        <br />
        </xsl:when>
		<xsl:otherwise>
        <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryForeignAddress ">-->
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            <span style="width:25px"/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ProvinceOrStateNm"/>
                </xsl:call-template>,
                <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CountryCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        </xsl:otherwise>
	</xsl:choose>
            
</div>
<br/>
</xsl:for-each>
</xsl:if>
</div>
 </div>



<!-- Part III - Court and Administrative Proceedings  -->
<!--<div class="styTBB" style="width:187mm;height:60mm;vertical-align:bottom;"></div>-->
<div class="styIRS56PartHeader">

<div class="styTitleName" style="width:17mm; font-size:10pt">Part III</div>
<div class="styTitleDesc" style="font-size:10pt; width:169mm">Court and Administrative Proceedings </div>
</div>
<div class="styBB" style="width:187mm;height:auto;"></div>
<div class="styBB" style="width:187mm;float:none;clear:none;">
<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
<div>Name of court (if other than a court proceeding, identify the type of proceeding and name of agency)</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>
<xsl:when test="$Form56Data/CourtNm">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtNm"/>
</xsl:call-template>
<span style="width:4px;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtNm"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtAgencyGrp/OtherProceedingTypeDesc"/>
</xsl:call-template>
<span style="width:2px;"/><span style="width:2px;"/> 
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtAgencyGrp/AgencyNm"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</span>
</div>

<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
<div>Date proceeding initiated </div>
<span style="width:27mm;text-align:center;font-weight:normal;">
<xsl:choose>
<xsl:when test="$Form56Data/ProceedingsInitiatedDt">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$Form56Data/ProceedingsInitiatedDt"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise/>
</xsl:choose>
</span>
</div>
</div>
<div class="styBB" style="width:187mm;float:none;clear:none;">
<div class="styNameBox" style="width:131mm;height:8mm;font-size:7pt;">
<div>
Address of court</div>
<span style="width:100%;height:auto;font-size:7pt;padding-left:4px;">
<xsl:choose>

<!-- US Biz Address -->
<xsl:when test="$Form56Data/CourtAddress">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress/AddressLine1Txt"/>
</xsl:call-template>,
<span style="width:2px;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress/AddressLine2Txt"/>
</xsl:call-template>
</xsl:when>
</xsl:choose>
</span>
</div>
<div class="styEINBox" style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
<div>
Docket number of proceeding</div>
<span style="width:27mm;text-align:left;font-weight:normal;">
<xsl:choose>
<xsl:when test="$Form56Data/DocketNum">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/DocketNum"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise/>
</xsl:choose>
</span>
</div>
</div>
<div class="styGenericDiv" style="width:187mm;">
<table style="border-collapse:collapse">
<tbody>
<tr>
<th style="font-weight:normal;width:93mm;border-right:1px solid black;font-size:7pt;" align="left" scope="col">City or town, state, and ZIP code </th>
<th style="font-weight:normal;width:21mm;border-right:1px solid black;font-size:7pt;padding-left:2mm" align="left" scope="col">Date</th>
<th style="font-weight:normal;width:27mm;border-right:1px solid black;font-size:7pt;padding-left:2mm" align="left" scope="col">Time</th>
<th style="font-weight:normal;width:40mm;font-size:7pt;padding-left:2mm" align="left" scope="col">Place of other proceedings </th>
</tr>
<tr>
<td style="font-size:7pt;border-right:1px solid black" valign="top">
<xsl:call-template name="PopulateCityStateInfo">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtAddress"/>
</xsl:call-template>
</td>
<td style="font-size:7pt;border-right:1px solid black" valign="top" align="center" >
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$Form56Data/CourtDt"/>
</xsl:call-template>
</td>
<td style="font-size:7pt;border-right:1px solid black" valign="top" align="center">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/AMPMCourtTs"/>
</xsl:call-template>
</td>
<td style="font-size:7pt" valign="top">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$Form56Data/OtherProceedingPlaceNm"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
</div>
<div class="styBB" style="width:187mm;height:auto;"></div>
<!-- END Part III - Court and Administrative Proceedings  -->

<!-- Part IV - Signature   -->
<div class="styIRS56PartHeader">
<div class="styTitleName" style="width:13mm; font-size:10pt">Part IV</div>
<div class="styTitleDesc" style="font-size:10pt; width:170mm">Signature  </div>
</div>
<div class="styTBB" style="width:187mm;height:20mm;font-size:6.5pt;font-family:arial;border-bottom: 1px solid black;">
<div class="styBB" style="width:187mm;height:auto;"></div>
<div style="width:20mm;padding-top:1mm;padding-left:1mm;height:100%;float:left;clear:none;border-right: 1px solid black;">
<span class="styMainTitle" style="font-size:11pt;">
Please 
Sign <br/>
Here 
</span>
</div>
<div style="width:164mm;float:left;clear:none;">
<div class="styIRS56LNDesc" style="width:100%">
Under penalties of perjury, I declare that I have examined this document, including any accompanying statements, and to the best of my knowledge and belief, it is true, correct, and complete. </div>
<br/><br/><br/>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
<img src="{$ImagePath}/56_Bullet_Md.gif" alt="MediumBullet"/>
</div>
<div class="styIRS56LNDesc" style="width:65mm;padding:0px 0px 0px 5px;">
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 		0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;text-align:center">
<xsl:call-template name="PopulatePin">
<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciarySignaturePIN"/>
<xsl:with-param name="BackupName">$RtnHdrDataFiduciarySignature</xsl:with-param>
</xsl:call-template>
</div>
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
Fiduciary’s signature
</div>
</div>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
</div>
<div class="styIRS56LNDesc" style="width:45mm;padding:0px 0px 0px 5px;">
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciaryTitleTxt"/>
<xsl:with-param name="BackupName">$RtnHdrDataFiduciaryTitle</xsl:with-param>
</xsl:call-template>
</div>
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
Title, if applicable
</div>
</div>
<div class="styIRS56LNDesc" style="width:5mm;padding:0px 0px 0px 5px;">
</div>
<div class="styIRS56LNDesc" style="width:35mm;padding:0px 0px 0px 5px;">
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;border-bottom-width:1px;border-color:black;text-align:center">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$RtnHdrData/FiduciarySignatureDt"/>
<xsl:with-param name="BackupName">$RtnHdrDataFiduciarySignatureDate</xsl:with-param>
</xsl:call-template>
</div>
<div class="styIRS56LNDesc" style="padding:0px 0px 0px 0px;width:100%;height:4mm;font-size:6pt;">
Date
</div>
</div>
</div>
</div>
<div class="pageEnd" style="width:187mm">
<div style="float:right;">
<span style="width:50px;"/>  
Form 
<span class="styBoldText" style="font-size:8pt;">56</span> (Rev. 12-2019)
</div>
</div>
<!-- END Part IV - Signature   -->

<!-- Additonal Data Title Bar and Button -->
<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
<div class="styLeftOverTitle">
Additional Data        
</div>
<div class="styLeftOverButtonContainer">
<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
</div>
</div>

<!-- Additional Data Table -->
<xsl:variable name="TableWidth">100</xsl:variable>
<table class="styLeftOverTbl">
<xsl:call-template name="PopulateCommonLeftover">
<xsl:with-param name="TargetNode" select="$Form56Data"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Part I - Filer Primary Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Part I - Filer Decedent Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/DecedentNameControlTxt"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Part I - Fiduciary Person Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryPersonNameControlTxt"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Part I - Fiduciary Business Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form56Data/FiduciaryBusinessNmControlTxt"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Address Type Code</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form56Data/AddressTypeCd"/>
<xsl:with-param name="DescWidth" select="$TableWidth"/>
</xsl:call-template>
</table>

<xsl:if test="(count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &gt; 1)">
<span class="styRepeatingDataTitle">Form 56 Line 5 - List Specific Years or Periods</span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">

<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
List Specific Years or Periods
</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp">
<tr style="border-color:black;height:6mm;text-align:left;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="TaxYr"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodBeginDt"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodEndDt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>


<!--<xsl:if test="($Print != $Separated) and (count($Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp) &gt; 1)">
<span class="styRepeatingDataTitle">Form 56 Line 5 - List Specific Years or Periods</span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">

<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
List Specific Years or Periods
</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="$Form56Data/FidcryAuthDoesNotCoverAllYrGrp/TaxYearOrTaxPeriodGrp">
<tr style="border-color:black;height:6mm;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black;text-align:left;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="TaxYr"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodBeginDt"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodEndDt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>-->




<xsl:if test="($Print = $Separated) and (count($Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp) &gt; 10)">
<span class="styRepeatingDataTitle">Form 56 Line 6 - Tax Year or Tax Period</span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="text-align:left;width:85mm;">
If this item is checked:
</th>
<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
Enter year(s) or period(s)
</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="$Form56Data/FiduciaryRcvCopyOfCommunGrp/TaxYearOrTaxPeriodGrp">
<tr style="border-color:black;height:6mm;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<xsl:variable name="position" select="position()"/>
<td style="font-size:8pt;font-weight:bold;border-left:1px solid black;border-right:1px solid black;border-top:1px solid black">4e</td>
<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="TaxYr"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodBeginDt"/>
</xsl:call-template>
<span style="width:10px"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="TaxPeriodEndDt"/>
</xsl:call-template>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>




<xsl:if test="(count($Form56Data/NewOrSubstituteFiduciaryGrp) &gt; 1)">
<span class="styRepeatingDataTitle">Form 56 Line 8 - Section C - Substitute Fiduciary</span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
Fiduciary Name(s), Address, and Business Address
</th>
</tr>
</thead>
<tbody>                                   
<xsl:for-each select="$Form56Data/NewOrSubstituteFiduciaryGrp">
<tr style="border-color:black;height:6mm;width:187mm;text-align:left;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black;">
<xsl:choose>
		<xsl:when test="FiduciaryPersonName">
<!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryPersonName != '' ">	-->		
			
<xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonFirstNm"/>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonLastNm"/>
            </xsl:call-template>
            <br />
            <!--</xsl:if>-->
            </xsl:when>
		<xsl:otherwise>
           <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryBusinessNm != '' ">--> 
          <!-- <span style="width:25px"/>-->
           <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessNm"/>
            </xsl:call-template>
                        <br />
            <!--</xsl:if>-->
           </xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="FiduciaryUSAddress">
		<!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryUSAddress ">-->
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine1Txt"/>
            </xsl:call-template>
           <br />
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/StateAbbreviationCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryUSAddress/ZIPCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        <br />
        </xsl:when>
		<xsl:otherwise>
        <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryForeignAddress ">-->
             
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
            
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
         
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ProvinceOrStateNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CountryCd"/>
            </xsl:call-template>
            <br />
        <!--</xsl:if>-->
        </xsl:otherwise>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="FiduciaryBusinessUSAddress">
		
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
            
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/StateAbbreviationCd"/>
                </xsl:call-template>,
                <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/ZIPCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        <br />
        </xsl:when>
		<xsl:otherwise>
        <!--<xsl:if test="$Form56Data/NewOrSubstituteFiduciaryGrp/FiduciaryForeignAddress ">-->
          
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br />
           
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br />
            
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ProvinceOrStateNm"/>
                </xsl:call-template>,
                <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CountryCd"/>
            </xsl:call-template>
        <!--</xsl:if>-->
        </xsl:otherwise>
	</xsl:choose>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>



<!--<xsl:if test="($Print = $Separated) and (count($Form56Data/NewOrSubstituteFiduciaryGrp) &gt; 1)">
<span class="styRepeatingDataTitle">Form 56 Line 8 - Section C - Substitute Fiduciary</span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="width:85mm;">
Fiduciary Name(s), Address, and Business Address
</th>
</tr>
</thead>
<tbody>                                   
<xsl:for-each select="$Form56Data/NewOrSubstituteFiduciaryGrp">
<tr style="border-color:black;height:6mm;width:187mm;text-align:left;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td style="font-size:8pt;border-right:1px solid black;border-top:1px solid black">
<xsl:if test="FiduciaryPersonName">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonFirstNm"/>
</xsl:call-template>
<xsl:text> </xsl:text>
<span style="width:3px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryPersonName/PersonLastNm"/>
</xsl:call-template>
</xsl:if>
<xsl:if test="FiduciaryBusinessNm">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessNm"/>
</xsl:call-template>
</xsl:if>
<br/>
<xsl:if test="FiduciaryUSAddress">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine1Txt"/>
</xsl:call-template>
<span style="width:3px"/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryUSAddress/AddressLine2Txt"/>
</xsl:call-template>
<span style="width:3px"/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryUSAddress/CityNm"/>
</xsl:call-template>,
<xsl:text> </xsl:text>
<span style="width:3px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryUSAddress/StateAbbreviationCd"/>
</xsl:call-template>,
<xsl:text> </xsl:text>
<span style="width:3px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryUSAddress/ZIPCd"/>
</xsl:call-template>
<span style="width:3px"/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine1Txt"/>
</xsl:call-template>
<span style="width:3px"/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/AddressLine2Txt"/>
</xsl:call-template>
<span style="width:3px"/>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/CityNm"/>
</xsl:call-template>,
<xsl:text> </xsl:text>
<span style="width:3px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/StateAbbreviationCd"/>
</xsl:call-template>,
<xsl:text> </xsl:text>
<span style="width:3px"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="FiduciaryBusinessUSAddress/ZIPCd"/>
</xsl:call-template>
</xsl:if>
<xsl:if test="FiduciaryForeignAddress">
 <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ProvinceOrStateNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryForeignAddress/CountryCd"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine1Txt"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/AddressLine2Txt"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CityNm"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ProvinceOrStateNm"/>
                </xsl:call-template>,
                <xsl:text> </xsl:text>
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/ForeignPostalCd"/>
            </xsl:call-template>,
            <xsl:text> </xsl:text>
             <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FiduciaryBusinessFrgnAddress/CountryCd"/>
            </xsl:call-template>
            </xsl:if>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
</xsl:if>-->


</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
