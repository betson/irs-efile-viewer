<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS2439Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form2439Data" select="$RtnDoc/IRS2439" />
<xsl:template match="/">
<html lang="EN-US">
<head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form2439Data)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 2439" />
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>
  <style type="text/css">  
    <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS2439Style"></xsl:call-template>        
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>  
<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" >
  <form name="Form2439">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"></xsl:call-template>
    <!-- Begin Void and Corrected Check Boxes -->
    <div class="styBB" style="width:187mm;">
      <span style="width:45mm;font-size: 10pt;"></span>
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form2439Data/VoidBoxIndicator" />
          <xsl:with-param name="BackupName">IRS2439VoidBoxIndicator</xsl:with-param>
        </xsl:call-template>
      </input> 
      <span style="width:4px;"></span>
      <span style="width:25mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form2439Data/VoidBoxIndicator" />
          <xsl:with-param name="BackupName">IRS2439VoidBoxIndicator</xsl:with-param>
          </xsl:call-template> VOID
        </label>
     </span>
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form2439Data/CorrectedBoxIndicator" />
          <xsl:with-param name="BackupName">IRS2439CorrectedBoxIndicator</xsl:with-param>
        </xsl:call-template>
      </input> 
            <span style="width:4px;"></span>
      <span style="width:36mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form2439Data/CorrectedBoxIndicator" />
            <xsl:with-param name="BackupName">IRS2439CorrectedBoxIndicator</xsl:with-param>
          </xsl:call-template>CORRECTED
        </label>
      </span>
      <!--<span style="font-size: 6pt;">(99)</span>-->
    </div>
    <!-- End Void and Corrected Check Boxes -->
    <!-- top half of form -->
    <div class="styBB" style="width:187mm;height:30mm;">
      <!-- Name and address box -->
      <div class="styIRS2439leftBox" style="width:87mm;height:30mm;">
        <span style="width:4px;"></span>
        <span style="font-size: 6pt">Name, address, and ZIP code of RIC or REIT</span>
        <br/><span style="width:4px;"></span>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine1" />
        </xsl:call-template>
        <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine2 != ''">
          <br/><span style="width:4px;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrustName/BusinessNameLine2" />
          </xsl:call-template>
        </xsl:if>
                  <xsl:choose>
        <!-- US Address -->
          <xsl:when test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress">
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/AddressLine1!='' ">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/AddressLine1" />
                </xsl:call-template>            
       <span class="styTableCellPad" ></span>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/AddressLine2!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/AddressLine2" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/City!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/City" />
                </xsl:call-template>,              
                <span class="styTableCellPad"></span>
            </xsl:if>    
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/State!=''">
              <span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/State" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if><span style="width:4px;"></span>
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/ZIPCode!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrUSAddress/ZIPCode" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>            
          </xsl:when>
            <!-- Foreign Address -->             
          <xsl:otherwise>
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/AddressLine1!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/AddressLine1" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if>  
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/AddressLine2!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/AddressLine2" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if>              
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/City!=''">
            <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/City" />
                </xsl:call-template>,              
                <span class="styTableCellPad"></span>
            </xsl:if>
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/ProvinceOrState!=''">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/ProvinceOrState" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>
          <!-- foreign postal code -->                    
            <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/PostalCode!=''">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/PostalCode" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>
        <!-- foreign country -->    
               <xsl:if test="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/Country!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrFrgnAdr/Country" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if> 
         </xsl:otherwise>
        </xsl:choose> 
      </div>
      <!-- Middle top Year and Form Box -->
      <div class="styIRS2439leftBox" style="width:25mm;height:30mm;text-align:center;">
        <span style="font-size: 6pt">OMB No. 1545-0145</span><br/>
        <span style="padding-top:4mm;height:11mm;">
          <div class="styTY" style="padding-top:1mm;font-size:26;">20<span class="styTYColor">08</span></div><br/>
        </span>
        <span style="padding-top:2mm;height:8mm;">
          Form<span style="width:4px;"></span><span class="styFN"  style="font-size:13pt;font-weight:bold;"  >2439</span>
        </span>
      </div>
      <!--Right top  Form Title and Info box -->
      <div class="styIRS2439rightBox" style="width:75mm;height:30mm;text-align:center;">
        <span style="width:4px;"></span><span style="font-size: 9pt;padding-top:1mm;height:9.5mm;font-weight:bold;">Notice to Shareholder of Undistributed Long-Term Capital Gains</span><br/>
        For calendar year 2008, or other tax year of the <br/>regulated investment company (RIC) or the<br/> 
        real estate investment trust (REIT)<br/>
        <span style="padding-top:0.5mm;height:3mm;">beginning 
          <span style="width:18mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <!-- begin date -->
             <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPeriodBeginDate" />
            </xsl:call-template>
          </span>
          <!-- end date -->
           and 
        </span><br/>
        <span style="padding-top:0.25mm;height:3mm;">ending 
          <span style="width:27mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPeriodEndDate" />
            </xsl:call-template>
          </span>
        </span>
      </div>
    </div>
    <!-- second half of form -->
    <div style="width:187mm;height:40mm;">
      <!-- Left boxes (Identification Number, Shareholder's ID) -->
      <div style="width:87mm;height:40mm;float:left;">
        <span class="styIRS2439leftBoxWithBottom" style="height:7mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt;" >Identification number of RIC or REIT</span>
          <br />
        <xsl:choose>
	 <xsl:when test="$Form2439Data/RegInvstCoOrReInvstTrustEIN" >
          <div style="text-align:center">
                <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form2439Data/RegInvstCoOrReInvstTrustEIN" />
                </xsl:call-template>
          </div>
        </xsl:when>
        <xsl:otherwise>
        <span style="padding-left:1mm;vertical-align:bottom" valign="bottom"></span>
                  <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form2439Data/MissingEINReason" />
                    </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
              </span>
        <span class="styIRS2439leftBoxWithBottom" style="height:7mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">Shareholder's identifying number</span>
          <br/>
      <xsl:choose>
          <xsl:when test="$Form2439Data/ShareholderEIN" >
          <div style="text-align:center;">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderEIN" />
          </xsl:call-template>
          </div>
              </xsl:when>
           <xsl:otherwise>
        <span style="padding-left:1mm;vertical-align:bottom" valign="bottom"></span>
         <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholdersMissingEINReason" />
                    </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
         </span>
         <!-- Shareholder name, address, and ZIP -->
        <span class="styIRS2439leftBoxWithBottom" style="height:26.5mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">Shareholder's name, address, and ZIP code</span>
          <br/> <span style="width:4px;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderName/BusinessNameLine1" />
          </xsl:call-template>
          <xsl:if test="$Form2439Data/ShareholderName/BusinessNameLine2 != ''">
            <br/> <span style="width:4px;"></span>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderName/BusinessNameLine2" />
            </xsl:call-template>
          </xsl:if>
       <xsl:choose>
        <!-- US Address -->
          <xsl:when test="$Form2439Data/ShareholderUSAddress">
            <xsl:if test="$Form2439Data/ShareholderUSAddress/AddressLine1!='' ">
              <br/><span style="width:4px;vertical-align:bottom;" valign="bottom"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/ShareholderUSAddress/AddressLine1" />
                </xsl:call-template>            
              <span class="styTableCellPad" ></span>
            </xsl:if>              
            <xsl:if test="$Form2439Data/ShareholderUSAddress/AddressLine2!='' ">
              <br/><span style="width:4px;vertical-align:bottom;" valign="bottom"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/ShareholderUSAddress/AddressLine2" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if>   
            <xsl:if test="$Form2439Data/ShareholderUSAddress/City!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/ShareholderUSAddress/City" />
                </xsl:call-template>,              
                <span class="styTableCellPad"></span>
            </xsl:if>
            <xsl:if test="$Form2439Data/ShareholderUSAddress/State!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderUSAddress/State" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>    
            <xsl:if test="$Form2439Data/ShareholderUSAddress/ZIPCode!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" 
                  select="$Form2439Data/ShareholderUSAddress/ZIPCode" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>            
          </xsl:when>          
          <xsl:otherwise>
            <!-- Shareholder's Foreign Address -->
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/AddressLine1!=''">
              <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/AddressLine1" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if>              
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/AddressLine2!=''">
            <br /><span style="width:4px;vertical-align:bottom;" valign="bottom"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/AddressLine2" />
                </xsl:call-template>            
              <span class="styTableCellPad"></span>
            </xsl:if> 
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/City!=''">
            <br/><span style="width:4px;"></span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/City" />
                </xsl:call-template>,              
                <span class="styTableCellPad"></span>
            </xsl:if>
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/ProvinceOrState!=''">
                <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode"  select="$Form2439Data/ShareholderForeignAddress/ProvinceOrState" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>
             <xsl:if test="$Form2439Data/ShareholderForeignAddress/PostalCode!=''">
              <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/PostalCode" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if>    
            <xsl:if test="$Form2439Data/ShareholderForeignAddress/Country!=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form2439Data/ShareholderForeignAddress/Country" />
                </xsl:call-template>
                <span class="styTableCellPad"></span>
            </xsl:if> 
           </xsl:otherwise>
        </xsl:choose> 
    </span>
      </div>
      <!-- Middle Boxes (1a, 1b, 1c,...) -->
      <div style="width:72mm;height:40mm;float:left;">
        <!--L1a -->
        <div style="width:72mm;;">
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:72mm;border-right-width:0px;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">1a</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Total undistributed long-term capital gains
              <!-- Push pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2439Data/TotUndistrLongTermCapitalGains"/>
              </xsl:call-template>
            </span>
            <br/>
               <span style="width:71mm;text-align:right;padding-top:1.5mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/TotUndistrLongTermCapitalGains" />
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!-- L1b -->
        <div style="width:72mm;float:left;">
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:72mm;float:left;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">1b</span>
            <span style="width:2px;"></span><span style="font-size: 6pt;">Unrecaptured section 1250 gain</span>
            <br/>
            <span style="width:145px;"></span>
            <span style="width:32.5mm;text-align:right;padding-top:1.5mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/UnrecapturedSection1250Gain" />
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!-- L1c -->
        <div style="width:72mm;float:left;">
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:35.5mm;float:left;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">1c</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Section 1202 gain</span>
            <span style="width:34.5mm;text-align:right;padding-top:1.5mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/Section1202Gain" />
              </xsl:call-template>
            </span>
          </span>
          <!-- L1d -->
          <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:36.5mm;float:left;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">1d</span>
            <span style="width:3px;"></span>
            <span style="font-size: 6pt;">Collectibles (28%) gain</span>
            <span style="width:35mm;text-align:right;padding-top:1.5mm;vertical-align:bottom" valign="bottom">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2439Data/Collectibles28PercentGain" />
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!--L2 -->
        <span class="styIRS2439leftBoxWithBottom" style="height:10mm;width:72mm;float:left;">
          <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">2</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Tax paid by the RIC or REIT on the box 1a gains</span>
            <br/>
            <span style="width:265px;text-align:right;padding-top:2mm;vertical-align:bottom" valign="bottom">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2439Data/TaxPaidByRegInvstCoOrReInvstTr" />
            </xsl:call-template>
            </span>
        </span>
      </div>
      <!-- far right Stylesheet will always show only Copy B box as per customer request -->
      <div style="width:28mm;height:40mm;float:left;text-align:center;">
        <span class="styIRS2439rightBoxWithBottom" style="height:20mm;width:28mm;float:left;padding-bottom:.5mm;">
          <div style="font-size: 9pt;font-weight:bold;height:8mm;padding-top:2mm;">Copy A</div>
          <div style="padding-top:.5mm;padding-bottom:.5mm;">Attach to <br />Form 1120-RIC <br />
            or Form 1120-REIT
          </div>
        </span>
        <span class="styIRS2439rightBoxWithBottom" style="height:20mm;width:28mm;float:left;font-weight:bold;padding-top:1mm;">
          For Instructions <br />
          and Paperwork
          Reduction Act
          Notice, see back of
          Copies A and D.        
        </span>
      </div>
    </div>
    <div style="width:187mm;">
      <span style="width:2px;"></span>
      <span style="font-size: 6pt;">Form</span>
      <span style="width:2px;"></span>
      <span style="font-weight:bold;width:82mm">2439</span>
      <span style="width:38mm;font-size: 7pt;">Cat. No. 11858E</span>
      <span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
    </div>
  <br/>
  <!-- BEGIN Left Over Table -->  
  <!-- Additonal Data Title Bar and Button -->
  <div class="pageEnd" style="width:187mm;" />  
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
      <xsl:with-param name="TargetNode" select="$Form2439Data" />
      <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>          
  </table>
  <!-- END Left Over Table -->    
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>

  
