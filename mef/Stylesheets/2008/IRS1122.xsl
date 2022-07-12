<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1122Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="Form1122Data" select="$RtnDoc/IRS1122" />


<xsl:template match="/">

<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form1122Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 1122" />
      
      
      
        <xsl:call-template name="InitJS"></xsl:call-template>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS1122Style"></xsl:call-template>  
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>  
  
  <xsl:call-template name="GlobalStylesForm"/>
</head>

  <body class="styBodyClass">

    <form name="Form1122">
    
        <xsl:call-template name="DocumentHeader"  />  
      <!-- Begin Form Number and Name -->
      <div class="styBB" style="width:187mm;height:20mm;">
        <div class="styFNBox" style="width:35mm;height:20mm;">
          <div style="height:13mm;">
            Form<span class="styFormNumber">  1122</span><br/>
            (Rev. December 2003)
          </div>
          <div  style="height:7mm;font-size:7pt;font-family:arial;" >
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
        <div style="height:8mm;padding-top:6mm;">
            For the calendar year<span style="width:8px;"></span> 
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1122Data/CalendarYear" />
            </xsl:call-template>
            <span style="width:16px;"></span>
            or other tax year beginning 
            <xsl:choose>
              <xsl:when test="$Form1122Data/TaxYearBeginning">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1122Data/TaxYearBeginning" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:16px;"></span>
              </xsl:otherwise>
            </xsl:choose>          
            and ending 
            <xsl:choose>
              <xsl:when test="$Form1122Data/TaxYearEnding">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1122Data/TaxYearEnding" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:24px;"></span>
                <span style="width:16px;"></span>
                <span style="width:8px;"></span>
              </xsl:otherwise>
            </xsl:choose>
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;">
          Name<br />
          <span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationName/BusinessNameLine1" />
            </xsl:call-template>
            <xsl:if test="$Form1122Data/SubsidiaryCorporationName/BusinessNameLine2 !=''">
              <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationName/BusinessNameLine2" />
              </xsl:call-template>
            </xsl:if>
          </span>
        </div>
        <div class="styEINBox" style="width:51mm;height:8mm;padding-left:3mm;font-size:7pt;font-weight:bold;">
          Employer identification number 
          <span style="width:40mm;text-align:left;font-weight:normal;padding-top:2mm;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationEIN" />
            </xsl:call-template>
            <xsl:if test="$Form1122Data/MissingEINReason !=' '">            
      		<span style="font-weight:normal;">  
          		<xsl:call-template name="PopulateText">
               		<xsl:with-param name="TargetNode" select="$Form1122Data/MissingEINReason"/>
               	</xsl:call-template>
          	</span> 
      	</xsl:if>
          </span>
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styumberBox" style="height:8mm;font-size:7pt;">
          Number,
          <span style="width:4px;"></span>
          street,
          <span style="width:4px;"></span>
          and
          <span style="width:4px;"></span>
          room
          <span style="width:4px;"></span>
          or
          <span style="width:4px;"></span>
          suite
          <span style="width:4px;"></span>
          no.<br/>
          <xsl:if test="$Form1122Data/SubsidiaryCorporationUSAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationUSAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form1122Data/SubsidiaryCorporationUSAddress/AddressLine2)!=''">    
                    <br />
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationUSAddress/AddressLine2"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
                <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/AddressLine1"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form1122Data/SubsidiaryCorpForeignAddress/AddressLine2)!=''">    
                    <br />
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/AddressLine2"/>
                    </xsl:call-template>          
                  </xsl:if>
                </xsl:if>
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNumberBox" style="height:8mm;font-size:7pt;">
          City or town,
          <span style="width:4px;"></span>
          state,
          <span style="width:4px;"></span>
          and
          <span style="width:4px;"></span>
          ZIP code<br/><br/>
            <xsl:if test="$Form1122Data/SubsidiaryCorporationUSAddress">
            <xsl:if test="$Form1122Data/SubsidiaryCorporationUSAddress/City!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationUSAddress/City"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorporationUSAddress/State!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationUSAddress/State"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorporationUSAddress/ZIPCode!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorporationUSAddress/ZIPCode"/>
              </xsl:call-template>
            </xsl:if>
             </xsl:if>
              <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress">
              <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/City!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/City"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/ProvinceOrState!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/ProvinceOrState"/>
              </xsl:call-template>
            </xsl:if>,
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/PostalCode!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/PostalCode"/>
              </xsl:call-template>
            </xsl:if>,
            <xsl:if test="$Form1122Data/SubsidiaryCorpForeignAddress/Country!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1122Data/SubsidiaryCorpForeignAddress/Country"/>
              </xsl:call-template>
            </xsl:if>
           </xsl:if>  
        </div>
      </div>
      <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-size:7pt;font-weight:normal;">
          Name of parent corporation <br/>
          <span>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
          </span>
        </div>
        <div class="styEINBox" style="width:51mm;height:8mm;padding-left:3mm;font-size:7pt;font-weight:bold;">
          Employer identification number <br/><br />
          <span style="width:40mm;text-align:left;font-weight:normal;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>      
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
            official to do so. <br />
            <span style="width:12px;"></span>The subsidiary consents to be bound by the provisions of
            the consolidated return regulations.
          </div>
        </div>
      <!-- End instruction section -->
        
        <!-- Begin Signature Box -->    
        <div class="styBB" style="width:187mm;height:19mm;">
        <div class="styIRS1122LeftBox" style="height:21mm;width:10mm;padding-top:5mm;">
          <span class="styBoldText" style="font-size: 11pt;">Sign<br/>Here</span>
        </div>
        <div class="styIRS1122SignatureText" style="width:176mm;padding-left:2mm;">
          <!--span style="width:8px;"></span-->
Under penalties of perjury, I declare that the subsidiary named above has authorized me to sign this form on its behalf, that I have examined this
form and the information contained herein, and to the best of my knowledge and belief, it is true, correct, and complete.          
          <div class="styGenericDiv" style="width:165mm;">
            <div class="styGenericDiv" style="width:164mm;height:3mm;">
            <span style="width:4px;"></span>
            </div>
            <div class="styGenericDiv" style="width:164mm;height:8mm;">
              <div class="styGenericDiv" style="width:6mm;height:8mm;">
                <span style="padding-left:2mm;">
                  <img src="{$ImagePath}/1122_Bullet_Lg.gif" style="width:2mm;height:8mm;" alt="bullet image"/>
                </span>
              </div>
              <div class="styGenericDiv" style="width:95mm;height:8mm;">
                <div class="styIRS1122SignatureBox" style="width:67mm;height:4mm;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureBox" style="width:25mm;height:4mm;border-right-width: 0px;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureText" style="width:74mm;height:3mm;">
                  Signature of subsidiary officer
                  <span style="width:104px;"></span>
                  Date
                </div>
              </div>
              <div class="styGenericDiv" style="width:6mm;height:8mm;padding-left:2mm;">
                <img src="{$ImagePath}/1122_Bullet_Lg.gif" style="width:2mm;height:8mm;" alt="bullet image"/>
              </div>
              <div class="styGenericDiv" style="width:51mm;height:8mm;">
                <div class="styIRS1122SignatureBox" style="width:55mm;height:4mm;border-right-width: 0px;">
                  <xsl:call-template name="PopulateReturnHeaderOfficer">
                    <xsl:with-param name="TargetNode">Title</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS1122SignatureText" style="width:55mm;height:3mm;">Title</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Instruction -->
      <div class="styTBB" style="width:187mm;">
	     <div class="styIRS1122InsBox" style="width:102mm;padding-top:2mm;padding-bottom:2mm;">
     	  <span class="styBoldText">Instructions for the subsidiary corporation. </span>
     	  Complete and submit an original, signed Form 1122 to the common parent corporation of the consolidated group for the first 
     	  tax year the subsidiary consents to be included in the group’s consolidated income tax return.
				<br /><br />
				<span class="styBoldText">Instructions for the parent corporation filing the consolidated return. </span>
				The common parent corporation of a consolidated group must attach a separate Form 1122 to the
				group’s consolidated income tax return for each subsidiary
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
      <div style="width:187mm;padding-top:1mm;">
        <div style="width:90mm;float:left;clear:none;"></div>
        <div style="width:50mm;float:left;clear:none;">Cat. No. 17228S</div>
        <div style = "float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">1122</span> (Rev. 12-2003)</div>
      </div>
      
      <p class="pageend"></p>
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
        <xsl:with-param name="TargetNode" select="$Form1122Data" />
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    <br />
  
            
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>
