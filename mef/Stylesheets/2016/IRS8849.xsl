<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/24/2015 - Changes made for UWR 154016 - Jeremy Nichols -->
<!-- 01/13/2016 - Changes made for KISAM IM02428035 - Jeremy Nichols -->
<!-- 03/04/2016 - Changes made for defect 42849 - Jeremy Nichols -->
<!-- 03/10/2016 - Changes made for defect 59728 - Jeremy Nichols -->
<!-- 03/25/2016 - Changes made for defect 45737 - Jeremy Nichols -->
<!-- 05/11/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8849"/>
  <xsl:template match="/">
    
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)">
        </xsl:with-param>
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
        <meta name="Description" content="IRS Form 8849"/>
        <META name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8849Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8849">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;border-bottom-width:1px;">
            <div class="styFNBox" style="width:34mm;height:16mm;">
          Form
            <span style="font-size:16pt;font-family:'Arial'; font-weight:bold;">8849</span>
              <br/>
              <span style="font-size:6.5pt;font-family:'Arial';">(Rev. August 2014)</span>
              <!-- General Dependency (Push Pin)-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
              
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency" style="height:2mm;">Department of the Treasury</span>
              <span class="styAgency" style="padding-bottom:0px;height:2mm;">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:115mm;height:16mm;text-align:center;">
              <br/>
              <span class="styMainTitle">Claim for Refund of Excise Taxes</span>
              <div class="styFST" style="height:4mm;font-size:6pt;margin-left:2mm;text-align:center;padding-top:1mm;">
                  <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/> 
                  Information about Form 8849 and its instructions is at www.irs.gov/form8849. 
              </div>
            </div>
            <div class="styTYBox" style="width:37mm;height:16mm;">
              <div style="padding-top:5mm;padding-bottom:8.5mm;">OMB No. 1545-1420</div>
            </div>
          </div>
          
          <table style="height:auto;width:187mm;">
			<tbody>
				<tr>
					<td style="height:4mm; width:141mm;">
						Print clearly. Leave a blank box between words.
					</td>
					<td style="height:4mm; width:46mm;">
						<span style="width:45mm"/>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
						Name of claimant
					</td>
					<td style="height:4mm; width:46mm;font-weight:bold;">
						Employer identification number (EIN)
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
					  <div style="border-right:1px solid black;">
                        <xsl:choose>
						  <!-- Business Name data from 1120 Return Header-->
                          <xsl:when test="$RtnHdrData/Filer/BusinessName">
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
						  </xsl:when>
                          <!-- Individual Name data from 1040 and 1040NR Return Header-->
						  <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
						  </xsl:when>
                          <!-- Business Name data choice from 1041 Return Header-->
						  <xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
							<xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
						  </xsl:when>
                          <!-- National Mortgage Assoc Code data choice from 1041 Return Header-->
						  <xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
							<xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
						  </xsl:when>
						  <xsl:otherwise>                                               
						  </xsl:otherwise>                                                                                              
						</xsl:choose>
					  </div>
					</td>
					<td style="height:4mm; width:46mm;">
					  <div style="border-right:1px solid black;">
					  <xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/EIN">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:when test="$RtnHdrData/Filer/SSN">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:when test="$RtnHdrData/Filer/MissingEINReasonCd">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						</xsl:when>
					  </xsl:choose>
					  </div>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
						Address (number, street, room or suite no.)
					</td>
					<td style="height:4mm; width:46mm;font-weight:bold;">
						Social security number (SSN)
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
					  <div style="border-right:1px solid black;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/USAddress">
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="1"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="2"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="3"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="4"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="5"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="6"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="7"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="8"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="9"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="10"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="11"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="12"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="13"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="14"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="15"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="16"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="17"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="18"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="19"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="20"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="21"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="22"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="23"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="24"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="25"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="26"/>
							  </xsl:call-template>
							  <xsl:call-template name="PopulateIndividualLetterBox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
								<xsl:with-param name="BoxNum" select="27"/>
							  </xsl:call-template>
							</xsl:otherwise>
						  </xsl:choose>
						  </div>
					</td>
					<td style="height:4mm; width:46mm;">
					  <div style="border-right:1px solid black;">
						<xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						  </div>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
						City or town, and state or province.  If you have a foreign address, see page 2.
					</td>
					<td style="height:4mm; width:46mm;">
						ZIP or foreign postal code
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
					  <xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress != '' ">
					  <div style="border-right:1px solid black;">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="10"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="11"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="12"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="13"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="14"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="15"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="16"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="17"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="18"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="19"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="20"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="21"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="22"/>
						  </xsl:call-template>
						  </div>
					  <div style="padding-left:5mm;border-right:1px solid black;">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  </div>
						</xsl:when>
						<xsl:otherwise>
					  <div style="border-right:1px solid black;">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="10"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="11"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="12"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="13"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="14"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="15"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="16"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="17"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="18"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="19"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="20"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="21"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
							<xsl:with-param name="BoxNum" select="22"/>
						  </xsl:call-template>
						  </div>
					  <div style="padding-left:5mm;border-right:1px solid black;">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  </div>
						</xsl:otherwise>
					  </xsl:choose>
					</td>
					<td style="height:4mm; width:46mm;">
					  <div style="border-right:1px solid black;">
					  <xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/USAddress != '' ">
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
					  </xsl:otherwise>
				  </xsl:choose>
				  </div>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
						Foreign country, if applicable. Do not abbreviate.
					</td>
					<td style="height:4mm; width:46mm;">
						Month claimant’s income tax year ends
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
					  <div style="border-right:1px solid black;">
						<xsl:variable name="countryname" select="document('CountriesList.xml')/countries"/>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="1"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="2"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="3"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="4"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="5"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="6"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="7"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="8"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="9"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="10"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="11"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="12"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="13"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="14"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="15"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="16"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="17"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="18"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="19"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="20"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="21"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="22"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="23"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="24"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="25"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="26"/>
						  </xsl:call-template>
						  <xsl:call-template name="PopulateIndividualLetterBox">
							<xsl:with-param name="TargetNode" select="$countryname/country[@id=   $RtnHdrData/Filer/ForeignAddress/CountryCd]"/>
							<xsl:with-param name="BoxNum" select="27"/>
						  </xsl:call-template>
						  </div>
					</td>
					<td style="height:4mm; width:46mm;text-align:center;">
					  <div style="border-right:1px solid black;">
						<xsl:call-template name="PopulateIndividualLetterBox">
						  <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxYearEndMonthNum"/>
						  <xsl:with-param name="BoxNum" select="3"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateIndividualLetterBox">
						  <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxYearEndMonthNum"/>
						  <xsl:with-param name="BoxNum" select="4"/>
						</xsl:call-template>
						</div>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
						Daytime telephone number (optional) 
					</td>
					<td style="height:4mm; width:46mm;">
						<span style="width:46mm;"/>
					</td>
				</tr>
				<tr>
					<td style="height:4mm; width:141mm;">
					  <div style="border-right:1px solid black;">
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="1"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="2"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="3"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="4"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="5"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="6"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="7"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="8"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="9"/>
					  </xsl:call-template>
					  <xsl:call-template name="PopulateIndividualLetterBox">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
						<xsl:with-param name="BoxNum" select="10"/>
					  </xsl:call-template>
					  </div>
					</td>
					<td style="height:4mm; width:46mm;">
						<span style="width:46mm;"/>
					</td>
				</tr>
			</tbody>
		  </table>
          <!--Caution Line-->
          <div class="styBB" style="font-size:7.5pt;width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;border-top-width:1px;">
            <b>Caution.</b>
            <i>
              <b> Do not</b> use Form 8849 to make adjustments to liability reported on Forms 720 for prior quarters or to claim any amounts that were or will be claimed on 
			Form 720 Schedule C, Form 4136, Credit for Federal Tax Paid on Fuels, 
			Form 2290, Heavy Highway Vehicle Use Tax Return, or Form 730, 
			Monthly Tax Return for Wagers.</i>
          </div>
          <div class="styBB" style="font-family:'Arial';font-size:9pt;font-weight:bold;width:187mm;text-align:center;padding-top:2mm;padding-bottom:2mm;">
        Schedules Attached
      </div>
          <div class="styTBB" style="width:187mm; border-bottom: 1px solid black">
        Check (&#x2713;) the appropriate box(es) for the schedule(s) you attach to 
        Form 8849. Only attach the schedules on which you are claiming a refund. 
        Schedules 2, 3, 5, and 8 cannot be filed with any other schedules on Form 
        8849. File each of these schedules with a separate <br/>Form 8849.
      </div>
          <table class="styTBB" style="width:187mm;font-size:7pt;border-bottom-width:1px;" cellpadding="0" cellspacing="0">
            <tr>
              <td style="width:25mm;padding-top:4mm;font-size:8pt;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 1
              </td>
              <td style="width:157mm;padding-top:4mm;padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule1AttachedInd"/>
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
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule1AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule1Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td style="width:25mm;padding-top:4mm;font-size:8pt;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 2
          </td>
              <td style="width:157mm;padding-top:4mm;padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule2AttachedInd"/>
                      <xsl:with-param name="BackupName">IRS8849Schedule2Attached</xsl:with-param>
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
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule2AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule2Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td style="width:25mm;padding-top:4mm;font-size:8pt;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 3
          </td>
              <td style="width:157mm;padding-top:4mm;padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule3AttachedInd"/>
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
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule3AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule3Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td style="width:25mm;padding-top:4mm;font-size:8pt;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 5
          </td>
              <td style="width:157mm;padding-top:4mm;padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule5AttachedInd"/>
                      <xsl:with-param name="BackupName">IRS8849Schedule5Attached</xsl:with-param>
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
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule5AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule5Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td style="width:25mm;padding-top:4mm;font-size:8pt;text-align:center;border:1px black solid;border-top:0px;border-left:0;border-bottom:0px;">
            Schedule 6
          </td>
              <td style="width:157mm;padding-top:4mm;padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule6AttachedInd"/>
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
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule6AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule6Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td style="border:1px black solid;border-top-width:0px;border-left-width:0px;border-bottom-width:1px;width:25mm;padding-top:4mm;padding-bottom:3mm;font-size:8pt;text-align:center;">
            Schedule 8<br/>
              </td>
              <td class="styTBB" style="width:157mm;padding-top:5mm;padding-bottom:4.5mm; border-bottom-width:1px; padding-left:2mm;">
                <div style="float:left">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$FormData/Schedule8AttachedInd"/>
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
              <td style="width:5mm;padding-top:4mm;padding-bottom:3mm;border-bottom-width:1px;border-top-width:0px;border-left-width:0px;border-right-width:0px;border-color:black;border-style:solid;">
                <input type="checkbox" class="styCkbox" style="width:6mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/Schedule8AttachedInd"/>
                    <xsl:with-param name="BackupName">IRS8849Schedule8Attached</xsl:with-param>
                  </xsl:call-template>
                </input>
              </td>
            </tr>
            <tr>
              <td rowspan="5" style="width:25mm;font-size:11pt;font-weight:bold;border:1px black solid;border-top:0px;border-left-width:0px;border-bottom-width:0px;">
            Sign<br/>
            Here
          </td>
              <td colspan="2" style="width:162mm;">
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
              <td colspan="2" style="width:162mm;border-bottom:1px solid black;">
                <div class="styGenericDiv" style="width:130mm;padding-left:2mm;"></div>
                <div class="styGenericDiv" style="width:40mm;border-left:1px solid black;float:right;">
					<xsl:call-template name="PopulateReturnHeaderOfficer">
						<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
					</xsl:call-template>
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
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
              </td>
            </tr>
            <tr>
              <td colspan="2" style="padding-left:2mm;padding-bottom:1mm;border-bottom-width:0px;">
            Type or print your name below signature.
          </td>
            </tr>
          </table>
          <!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:0px solid black;">
            <tr>
							<!--row 1-->
							<td rowspan="3" style="width:15.5mm;font-size:9pt;font-weight:bold;font-family:'arial narrow';border-right:1px solid black;border-bottom:1px solid black;text-align:left;">Paid<br/> Preparer<br/> Use Only</td>
							<td style="width:45.5mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Print/Type preparer's name
								<br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Preparer/Name">
										<span style="text-align:left;">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
											  <xsl:with-param name="TargetNode">Name</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="text-align:left;">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
											  <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td style="width:57mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Preparer's signature
								<br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">
								Date <br/>
								<span style="text-align:center; padding-left:7mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="width:19mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
                <nobr>
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
                      <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>Check  
          </label>
                </nobr>
                <input class="styCkbox" type="checkbox" style="width:4mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
                    <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                  </xsl:call-template>
                </input>
                if <br/> self-employed
              </td>
			  <td style="width:35mm;border-bottom:1px solid black;padding-left:1mm;">PTIN
                <br/>
                <xsl:choose>
					<xsl:when test="$RtnHdrData/Preparer/SSN">
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:otherwise>
				</xsl:choose>
              </td>
            </tr>
            <tr>
							<!--row 2-->
							<td rowspan="1" colspan="2" style="border-bottom:1px solid black;border-right:0px solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:16mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td colspan="3" style="border-bottom:1px solid black;padding-left:15mm;">
								<div style="height:5mm;padding-left:1mm;padding-top:2mm;border-left:1px solid black;">
									Firm's EIN
									<img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
									</xsl:call-template>
								</div>
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="2" style="border-bottom:1px solid black;border-right:0px solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td colspan="3" style="border-bottom:1px solid black;padding-left:15mm;">
								<div style="height:9.8mm;padding-left:1mm;padding-top:7mm;border-left:1px solid black;">
									Phone no. 
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">Phone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
              </td>
            </tr>
          </table>
          <!-- END PREPARER SIGNATURE SECTION -->
          <!-- Page 1 Footer -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
              <span style="width:17mm;"/>                        
        Cat. No. 20027J
      </div>
            <div style="float:right;">
              <span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">8849</span> (Rev. 8-2014)
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
              <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!--Special Condition Description -->
          <span class="styRepeatingDataTitle">Form 8849, Special Condition Description: </span>
          <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
Special Condition Description</th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <xsl:for-each select="$FormData/SpecialConditionDesc">
                <tr style="border-color:black;height:6mm;">
                  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                  <td class="styTableCellText" style="width:179mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="."/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>