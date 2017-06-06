<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1122Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form1122Data" select="$RtnDoc/IRS1122"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form1122Data)"/></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="Description" content="IRS Form 1122"/>     
        <xsl:call-template name="InitJS"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS1122Style"/>  
    <xsl:call-template name="AddOnStyle"/>    
  </xsl:if>
</style>   
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass" style="width: 187mm;">
<div >
</div>
    <form name="Form1122">    
        <xsl:call-template name="DocumentHeader"/>  
      <!-- Begin Form Number and Name -->
      <div class="styBB" style="width:187mm;height:20mm;">
        <div class="styFNBox" style="width:35mm;height:20mm;">
          <div style="height:13mm;">
            Form<span class="styFormNumber">1122</span><br/>
            (Rev. December 2003)
          </div>
          <div style="height:7mm;font-size:7pt;font-family:arial;">
            <span class="styAgency">Department of the Treasury</span><br/>
            <span class="styAgency">Internal Revenue Service</span>
          </div>        
        </div>    
        <div class="styFTBox" style="width:151mm;height:20mm;">
            <div class="styMainTitle" style="padding-left:2mm;">Authorization and Consent of Subsidiary Corporation </div>
            <div class="styMainTitle" style="padding-left:2mm;">To Be Included in a Consolidated Income Tax Return </div>
            <div class="styFBT">
              <img src="{$ImagePath}/1122_Bullet_Sm.gif" alt="bullet image"/> 
              Attach to the consolidated income tax return.
            </div>
        </div>
      </div>
      <!-- End Form Number and Name section -->
      <div class="styBB" style="width:187mm;">
        <div style="height:auto;padding-top:6mm;">
            For the calendar year<span style="width:9px;"/> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1122Data/CalendarYr"/>
            </xsl:call-template>
            <span style="width:17px;"/>,
            or other tax year beginning, 
            <xsl:choose>
              <xsl:when test="$Form1122Data/TaxYearBeginDt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1122Data/TaxYearBeginDt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:16px;"/>
              </xsl:otherwise>
            </xsl:choose>          
            and ending
            <xsl:choose>
              <xsl:when test="$Form1122Data/TaxYearEndDt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1122Data/TaxYearEndDt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>
                <span style="width:24px;"/>,
                <span style="width:4px;"/>20
                <span style="width:8px;"/>
              </xsl:otherwise>
            </xsl:choose>
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:135mm;height:10mm;padding-top:1mm;font-size:7pt;">
          Name<br/>
          <span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryBusinessName/BusinessNameLine1Txt"/>
            </xsl:call-template>
            <xsl:if test="$Form1122Data/SubsidiaryBusinessName/BusinessNameLine2Txt !=''">
              <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryBusinessName/BusinessNameLine2Txt"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styEINBox" style="width:49mm;height:8mm;padding-left:1mm;padding-top:mm;font-size:7pt;font-weight:bold;float:left;">
          Employer identification number
          <span style="width:40mm;height:auto;padding-top:4.5mm;float:left;font-weight:normal;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryEIN"/>
            </xsl:call-template>
            <xsl:if test="$Form1122Data/MissingEINReasonCd !=' '">            
      		<span style="font-weight:normal;">  
          		<xsl:call-template name="PopulateText">
               		<xsl:with-param name="TargetNode" select="$Form1122Data/MissingEINReasonCd"/>
               	</xsl:call-template>
          	</span> 
      	</xsl:if>
          </span>
        </div>
      </div>
      <!-- Exception Note: Number, street and room or suite no is not display properly without data but with data it is display properly.-->
      <div class="styBB" style="width:187mm;">
        <div class="styNumberBox" style="height:12mm;font-size:7pt;">
          Number,
          <span style="width:6px;"/>
          street,
          <span style="width:6px;"/>
          and
          <span style="width:6px;"/>
          room
          <span style="width:6px;"/>
          or
          <span style="width:4px;"/>
          suite
          <span style="width:4px;"/>
          no.<br/>
          <xsl:if test="$Form1122Data/SubsidiaryCorpUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpUSAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form1122Data/SubsidiaryCorpUSAddress/AddressLine2Txt)!=''">    
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpUSAddress/AddressLine2Txt"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
                <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/AddressLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form1122Data/SubsidiaryCorpForeignAddress/AddressLine2Txt)!=''">    
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/AddressLine2Txt"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNumberBox" style="height:10mm;font-size:7pt;">
          City or town,
          <span style="width:4px;"/>
          state,
          <span style="width:4px;"/>
          and
          <span style="width:4px;"/>
          ZIP code<br/><br/>
            <xsl:if test="$Form1122Data/SubsidiaryCorpUSAddress">
            <xsl:if test="$Form1122Data/SubsidiaryCorpUSAddress/CityNm!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpUSAddress/CityNm"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorpUSAddress/StateAbbreviationCd!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpUSAddress/StateAbbreviationCd"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorpUSAddress/ZIPCd!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpUSAddress/ZIPCd"/>
              </xsl:call-template>
            </xsl:if>
             </xsl:if>
              <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress">
              <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/CityNm!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/CityNm"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/ProvinceOrStateNm!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/ProvinceOrStateNm"/>
              </xsl:call-template>
            </xsl:if>,
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/ForeignPostalCd!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/ForeignPostalCd"/>
              </xsl:call-template>
            </xsl:if>,
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/CountryCd!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/CountryCd"/>
              </xsl:call-template>
            </xsl:if>
           </xsl:if>  
        </div>
      </div>
      <div class="styBB" style="width:187mm;height:10mm;">
        <div class="styNameBox" style="width:135mm;height:10mm;padding-top:1mm;font-size:7pt;font-size:7pt;font-weight:normal;">
          Name of parent corporation <br/>
          <span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1122Data/ParentCorporationName/BusinessNameLine1Txt"/>
            </xsl:call-template>
            <xsl:if test="$Form1122Data/ParentCorporationName/BusinessNameLine2Txt !=''">
              <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/ParentCorporationName/BusinessNameLine2Txt"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styEINBox" style="width:45mm;height:10mm;padding-left:3mm;font-size:7pt;font-weight:bold;padding-left:1mm;">
          Employer identification number 
          <span style="width:40mm;float:left;font-weight:normal;padding-top:3.5mm;padding-left:0mm;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form1122Data/ParentCorporationEIN"/>
            </xsl:call-template> 
          </span>
        </div>
      </div>
      <!-- Begin instruction section -->
      <div class="styBB" style="width:187mm;">
          <div class="styIRS1122InsBox" style="width:102mm;height:28;padding-top:2mm;padding-bottom:1mm;">
            The subsidiary corporation named above authorizes its parent<br/>
            corporation to include it in a consolidated return for the tax year<br/>
            indicated and for each subsequent year the group must file a<br/>
            consolidated return under the applicable regulations. If the<br/>
            parent corporation does not file a consolidated return on
          </div>
          <div class="styIRS1122InsBox" style="width:85mm;height:28;padding-top:2mm;padding-bottom:1mm;">
            behalf of the subsidiary, the subsidiary authorizes the
            Commissioner of the Internal Revenue Service or an IRS
            official to do so. <br/>
            <span style="width:12px;"/>The subsidiary consents to be bound by the provisions of
            the consolidated return regulations.
          </div>
        </div>
      <!-- End instruction section -->        
        <!-- Begin Signature Box -->    
        <div class="styBB" style="width:187mm;">
        <div class="styIRS1122LeftBox" style="width:10mm;height:20mm;width:10mm;padding-top:4mm;padding-right:2mm;">
          <span class="styBoldText" style="font-size:9pt;height:4mm;">Sign<br/>Here</span>
        </div>
        <div class="styIRS1122SignatureText" style="width:170mm;height:6mm;text-align:left;">
Under penalties of perjury, I declare that the subsidiary named above has authorized me to sign this form on its behalf, that I have examined this
form and the information contained herein, and to the best of my knowledge and belief, it is true, correct, and complete.          
          <div class="styGenericDiv" style="width:155mm;padding-top:2mm;">
            <div class="styGenericDiv" style="width:155mm;height:2mm;"/>
            <div class="styGenericDiv" style="width:150mm;height:4mm;padding-left:2mm;">
              <div class="styGenericDiv" style="width:1mm;height:4mm;padding-bottom:0mm;">
                <span style="padding-left:0mm;">
                  <img src="{$ImagePath}/1122_Bullet_Lg.gif" style="width:2mm;" alt="bullet image"/>
                </span>
              </div>
              <div class="styGenericDiv" style="width:100mm;height:12mm;padding-left:2mm;">
                <div class="styIRS1122SignatureBox" style="width:75mm;height:4mm;padding-left:1mm;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureBox" style="width:20mm;height:4mm;border-right-width:0px;padding-left:2mm;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureText" style="width:100mm;height:4mm;">
                  Signature of subsidiary officer
                  <span style="width:38mm;"/>
                  Date
                </div>
              </div>
              <div class="styGenericDiv" style="width:3mm;height:4mm;">
                <img src="{$ImagePath}/1122_Bullet_Lg.gif" style="width:2mm;" alt="bullet image"/>
              </div>
              <div class="styGenericDiv" style="width:42mm;height:4mm;">
                <div class="styIRS1122SignatureBox" style="width:71mm;height:4mm;border-right-width: 0px;padding-right:0mm;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">Title</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureText" style="width:71mm;height:4mm;">Title</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Instruction -->
      <div class="styTBB" style="width:187mm;">
	     <div class="styIRS1122InsBox" style="width:98mm;padding-top:2mm;padding-bottom:2mm;">
     	  <span class="styBoldText">Instructions for the subsidiary corporation. </span>
     	  Complete and submit an original, signed Form 1122 to the common parent corporation of the consolidated group for the first 
     	  tax year the subsidiary consents to be included in the group’s consolidated income tax return.
			<span class="styBoldText">Instructions for the parent corporation filing the consolidated return. </span>
				The common parent corporation of a consolidated group must<br/> attach a separate Form 1122 to the
				group’s consolidated income<br/> tax return for each subsidiary
	     </div>
	     <div class="styIRS1122InsBox" style="width:85mm;padding-top:2mm;padding-bottom:2mm;">
				corporation for the first tax year each subsidiary consents to
				be included in the consolidated return. Attach to the
				consolidated return either the signed Form 1122 or an
				unsigned version containing the same information stated on
				the signed form. If the parent corporation submits an
				unsigned Form 1122, it must retain the original, signed form
				in its records.
			</div>
	   </div>
      <!-- End signature part -->
      <div style="width:187mm;clear:both;">
            <div style="width:100mm;font-weight:bold;;" class="styGenericDiv">For Paperwork Reduction Act Notice, see page 8 of the instructions.</div>
            <div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 17228S</div>
            <div style="float:right;padding-bottom:2mm;" class="styGenericDiv">Form 
            <span class="styBoldText">1122</span> (Rev. 12-2003)</div>
          </div>
      <p class="pageend"/>
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
        <xsl:with-param name="TargetNode" select="$Form1122Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    <br/>          
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>