<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8849Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8849" />
<xsl:template match="/">

<html>
  <head>
    <title>
      <xsl:call-template name="FormTitle">
        <xsl:with-param name="RootElement" select="local-name($FormData)">
        </xsl:with-param>
      </xsl:call-template>
    </title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8849" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" 
    type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8849Style"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>

  <body class="styBodyClass">
    <form name="FormData">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

      <div class="styTBB" style="width:187mm;">
        <div class="styFNBox" style="width:34mm;height:16mm;">
          Form
            <span style="font-size:16pt;font-family:'Arial'; font-weight:bold;">8849</span>
          <span style="padding-left:2mm;">
		<!-- Form to Form Link (Push Pin)-->
		<xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$FormData"/>
		</xsl:call-template>          
          </span>
          
          <br/>
           <span style="font-size:6.5pt;font-family:'Arial'; ">(Rev. March 2008)
</span>
          <br/>
           <span class="styAgency" style="height:2mm;">Department of the Treasury</span>
        <span class="styAgency" style="padding-bottom:0px;height:2mm;">Internal Revenue Service</span>
        </div>
       <div class="styFTBox" style="width:115mm;height:16mm;text-align:center;">
         <br/>
          <div class="styMainTitle">Claim for Refund of Excise Taxes</div>
        </div>
        <div class="styTYBox" style="width:37mm;height:16mm;">
          <div style="padding-top:5mm;">OMB No. 1545-1420</div>
        </div>
      </div>


      <div class="styTBB" style="width:187mm; border-bottom:1px solid black;padding-top:.5mm;">
        Print clearly. Leave a blank box between words.<br/>
        <div style="width:140mm; float:left;clear: none;padding-top:3mm">
        Name of claimant
          <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="23"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="24"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="25"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="26"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name/BusinessNameLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="27"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
        
        <div style="width:46mm; float:left;clear: none;padding-top:3mm">
        <span style="font-size:6pt">Employer identification number (EIN)</span><br/>
         <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
        
        
        
        
        
        
        
        <br /><br />
         <div style="width:140mm; float:left;clear: none;padding-top:3mm">
        Address (number, street, room or suite no.)
        <xsl:choose>
          <xsl:when test="$RtnHdrData/Filer/USAddress">
          
          
             <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="23"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="24"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="25"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="26"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="27"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
          
          </xsl:when>
          <xsl:otherwise>
          
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="23"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="24"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="25"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="26"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="27"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
          </xsl:otherwise>
        </xsl:choose>
        </div>
        
        <div style="width:46mm; float:left;clear: none;padding-top:3mm">
        Social security number (SSN)<br/>
         <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
	<br /><br />
         <div style="width:140mm; float:left;clear: none;padding-top:3mm">
       City and state or province. If you have a foreign address, see page 2.
        
         <xsl:choose>
          <xsl:when test="$RtnHdrData/Filer/USAddress != '' ">


        
        
      

          <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:5mm;border:1 solid black;border-right-width:0;clear:none;float:left"/>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/State"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/State"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
         <div style="height:7mm;width:5mm;border:1 solid black;border-right-width:0;clear:none;float:left"/>
        <div style="height:7mm;width:5mm;border:1 solid black;border-right-width:0;clear:none;float:left"/>

        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </xsl:when>
        <xsl:otherwise>
        
        
        
        
        
         <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:5mm;border:1 solid black;border-right-width:0;clear:none;float:left"/>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrState"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrState"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
           <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrState"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
          <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrState"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>

        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>

        
        
        
        
        
        
        
        
        </xsl:otherwise>
        </xsl:choose>
        </div>
        
        <div style="width:46mm;float:left; clear: none;padding-top:3mm">
       ZIP code<br/>
         <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCode"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
         
           <div style="width:140mm; float:left;clear: none;padding-top:3.2mm">
       Foreign country, if applicable. Do not abbreviate.
       
         <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
         
          <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="11"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="12"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="13"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="14"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="15"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="16"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="17"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="18"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="19"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="20"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="21"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="22"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="23"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="24"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="25"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="26"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/Country]"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="27"></xsl:with-param>
        </xsl:call-template>
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
        
        <div style="width:46mm;float:left;padding-top:1mm;padding-bottom:1mm;clear: none;text-align:center;font-size:6.5pt;">
       Month claimant’s income tax year ends<br/><div style="padding-left:18mm;">
         <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/TYEndMonth"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/TYEndMonth"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
                <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
        </div>
        
      <br /><br />
        <div style="width:140mm; float:left;clear: none;padding-bottom:3mm;padding-top:3mm">
       Daytime telephone number (optional)         
         
          <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="1"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="2"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="3"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="4"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="5"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="6"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="7"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="8"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="9"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="PopulateIndividualLetterBox">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"></xsl:with-param>
        <xsl:with-param name="BoxNum" select="10"></xsl:with-param>
        </xsl:call-template>
      
        <div style="height:7mm;width:1px;border:0 solid black;border-left-width:1;clear:none;float:left">
        </div>
        </div>
           
      </div>
         
      
      <!--Caution Line-->
      <div class="styBB" style="font-size:7.5pt;width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
      
        <b>Caution.</b> <i><b> Do not</b> use Form 8849 to make adjustments to liability reported on Forms 720 for prior quarters or to claim any amounts that were or will be claimed on 
        <b>Schedule C (Form 720),</b> Claims, <b>Form 4136,</b> Credit for Federal Tax Paid on Fuels, 
        <b>Form 2290,</b> Heavy Highway Vehicle Use Tax Return, or <b>Form 730,</b> 
        Monthly Tax Return for Wagers.</i>
      </div>
      <div class="styBB" style="font-family:'Arial';font-size:9pt;font-weight:bold;width:187mm;text-align:center;padding-top:2mm;padding-bottom:2mm;">
        Schedules Attached
      </div>
      <div class="styTBB" style="width:187mm; border-bottom: 1px solid black">
        Check (&#x221A;) the appropriate box(es) for the schedule(s) you attach to 
        Form 8849. Only attach the schedules on which you are claiming a refund. 
        Schedules 2, 3, 5, and 8 cannot be filed with any other schedules on Form 
        8849. File each of these schedules with a separate <br/>Form 8849.
      </div>

      <table class="styTBB" style="width:187mm;font-size:7pt" cellpadding="0" cellspacing="0">
        <tr>
          <td class="styBoldText" style="width:20mm;padding-top:4mm;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 1
          </td>
          <td style="width:162mm;padding-top:4mm;padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule1Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
              </xsl:call-template>
              Nontaxable Use of Fuels
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                ......................... 
              </span>
            </div>
          </td>
          <td style="width:5mm;padding-top:4mm;padding-bottom:0mm;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule1Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>

        <tr>
          <td class="styBoldText" style="width:20mm;padding-top:4mm;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 2
          </td>
          <td style="width:162mm;padding-top:4mm;padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule2Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
              </xsl:call-template>
              Sales by Registered Ultimate Vendors
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                ..................... 
              </span>
            </div>
          </td>
          <td style="width:5mm;padding-top:4mm;padding-bottom:0mm;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule2Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>

        <tr>
          <td class="styBoldText" style="width:20mm;padding-top:4mm;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 3
          </td>
          <td style="width:162mm;padding-top:4mm;padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule3Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule3Attached</xsl:with-param>
              </xsl:call-template>
              Certain Fuel Mixtures and the Alternative Fuel Credit
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                .................
              </span>
            </div>
          </td>
          <td style="width:5mm;padding-top:4mm;padding-bottom:0mm;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule3Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule3Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>

        <tr>
          <td class="styBoldText" style="width:20mm;padding-top:4mm;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 5
          </td>
          <td style="width:162mm;padding-top:4mm;padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule5Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
              </xsl:call-template>
              Section 4081(e) Claims
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                .........................
              </span>
            </div>
          </td>
          <td style="width:5mm;padding-top:4mm;padding-bottom:0mm;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule5Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule5Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>

        <tr>
          <td class="styBoldText" style="width:20mm;padding-top:4mm;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 6
          </td>
          <td style="width:162mm;padding-top:4mm;padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule6Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule6Attached</xsl:with-param>
              </xsl:call-template>
              Other Claims
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                ............................
              </span>
            </div>
          </td>
          <td style="width:5mm;padding-top:4mm;padding-bottom:0mm;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule6Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule6Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>

        <tr>
          <td style="border:1px black solid;border-top-width:0px;border-left-width:0px;border-bottom-width:1px;width:20mm;padding-top:4mm;padding-bottom:3mm;text-align:center;font-weight:bold;">
            Schedule 8<br/>
          </td>
          <td class="styTBB" style="width:162mm;padding-top:4mm;padding-bottom:3mm; border-bottom-width:1px; padding-left:2mm;">
            <div style="float:left">
            <label >
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule8Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule8Attached</xsl:with-param>
              </xsl:call-template>
              Registered Credit Card Issuers
            </label>
            </div>
            <div style="float:right">   
              <span style="letter-spacing:4mm; font-weight:bold; float:left"> 
                ....................... 
              </span>
            </div>
          </td>
          <td class="styTBB" style="width:5mm;padding-top:4mm;padding-bottom:3mm;border-bottom-width:1px;">
            <input type="checkbox" class="styCkbox" style="width:6mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Schedule8Attached" />
                <xsl:with-param name="BackupName">IRS8849Schedule8Attached</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>      
        
        <tr>
          <td rowspan="5" style="width:20mm;font-size:11pt;font-weight:bold;border:1px black solid;border-top:0px;border-left:0;border-bottom:0;">
            Sign<br/>
            Here
          </td>
          <td colspan="2">
            <div style="padding-left:2mm;padding-bottom:6mm;font-size:6.25pt;">
              Under penalties of perjury, I declare (1) that I have examined this claim, 
              including accompanying schedules and statements, and to the best
              of my knowledge and belief, it is true, correct, and complete, and (2) that 
              amounts claimed on this form have not been, and will not be, claimed
              on any other form. Declaration of preparer (other than taxpayer) is based
              on all information of which preparer has any knowledge.
            </div>
          </td>
        </tr>      

        <tr>
          <td class="styBB" colspan="2">
            <div class="styGenericDiv" style="width:130mm;padding-left:2mm;"></div>
            <div class="styGenericDiv" style="width:25mm;padding-left:2mm;border:1px black solid;border-top:0px;border-right:0;border-bottom:0;">
            </div>
          </td>
        </tr>      

        <tr>
          <td colspan="2">
            <div class="styGenericDiv" style="width:130mm;padding-left:2mm;">
              Signature and title (if applicable)
            </div>
            <div class="styGenericDiv" style="width:25mm;padding-left:2mm;">
              Date
            </div>
          </td>
        </tr>      

        <tr>
          <td colspan="2" style="padding-left:2mm;padding-top:2mm;padding-bottom:2mm;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template><br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template><br />
          </td>
        </tr>      

        <tr>
          <td colspan="2" style="padding-left:2mm;">
            Type or print your name below signature.
          </td>
        </tr>      
      </table>
      
      
      				<!-- BEGIN PREPARER SIGNATURE SECTION -->
				<!-- Implementing Preparer section in table -->
				<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;clear:both;">
					<tr>
						<td rowspan="3" style="width:17.75mm;font-family:arial;font-size:9.5pt;font-weight:bold;border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;padding-right:1mm;">Paid Preparer's
Use Only</td>
						<td style="width:32mm;border-bottom:1 solid black;">
							<span style="width:13mm;padding-left:1mm;" class="styGenericDiv">Preparer's <br/>signature</span>
							<span class="styGenericDiv" style="border:0 solid red;">
								<img src="{$ImagePath}/8849_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
							</span>
						</td>
						<td style="width:43mm;border-right:1 solid black;border-bottom:1 solid black;">
							<span style="width:2px;"/>
						</td>
						<td style="width:30mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
		    Date <br/>
							<xsl:call-template name="PopulateReturnHeaderPreparer">
								<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
							</xsl:call-template>
						</td>
						<td style="width:25mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:2mm;padding-bottom:.5mm;">
							<nobr>
								<label for="dummyid1">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>Check <br/>if  self-<br/>employed
          </label>
							</nobr>
							<span style="width:2px;"/>
							<!--<img src="{$ImagePath}/8849_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>-->
							<span style="width:5px;"/>
							<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
								</xsl:call-template>
							</input>
						</td>
						<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">Preparer's SSN or PTIN
  		  <br/>
							<xsl:call-template name="PopulateReturnHeaderPreparer">
								<xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderPreparer">
								<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td rowspan="2" colspan="1" style="border-bottom:1 solid black;padding-left:.5mm;">
							<span class="styGenericDiv" style="padding-right:.5mm;">Firm's name (or <br/>yours if self-employed),<br/> address, and ZIP code</span>
							<span class="styGenericDiv" style="">
								<img src="{$ImagePath}/8849_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
							</span>
						</td>
						<td colspan="3" style="border-right:1 solid black;border-bottom:1 solid black;padding-left:.5mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</td>
						<td style="border-bottom:1 solid black;padding-left:1mm;">EIN 
     <!-- <img src="{$ImagePath}/8849_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>-->
							<span style="width:5px;"/>
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
							</xsl:call-template>
						</td>
						<td style="border-bottom:1 solid black;padding-left:1mm;"> Phone no. 
        <xsl:call-template name="PopulateReturnHeaderPreparer">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderPreparer">
								<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</table>
				<!-- END PREPARER SIGNATURE SECTION -->

      
      
      
      

  <!-- Page 1 Footer -->

    <!-- Page Break and Footer-->
    <div class="pageEnd" style="width:187mm;padding-top:1mm;">  
      <div style="float:left;">
        <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
        <span style="width:17mm;"></span>                        
        Cat. No. 20027J
      </div>
      <div style="float:right;">
        <span style="width:40px;"></span>  
        Form <span class="styBoldText" style="font-size:8pt;">8849</span> (Rev. 3-2008)
      </div>    
    </div>
    <!-- END Page Break and Footer-->
      
    <!-- Left Over Data Table -->  
    <!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <!-- Additional Data Table -->
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$FormData" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->
     
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>

