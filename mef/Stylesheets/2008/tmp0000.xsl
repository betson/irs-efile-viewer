<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1065BScheduleK1Style.xsl"/>



<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form1065BSchK1Data" select="$RtnDoc/IRS1065BScheduleK1" />



<xsl:template match="/">

<html lang="EN-US">
<head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form1065BSchK1Data)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 1065-B Schedule K-1" />
      
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>

  <style type="text/css">  
    <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS1065BScheduleK1Style"></xsl:call-template>        
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>  
<xsl:call-template name="GlobalStylesForm"/>
</head>


<body class="styBodyClass" >

  <form name="Form1065BSchK1">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"></xsl:call-template>
  
    <!-- Begin Void and Corrected Check Boxes -->
    <div class="styBB" style="width:187mm;border-bottom:none;">
      <span style="width:5mm;"/>
      
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected" />
          <xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
        </xsl:call-template>
      </input> 
      <span style="width:4px;"></span>

      <span style="width:36mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Corrected" />
            <xsl:with-param name="BackupName">IRS1065BSchK1Corrected</xsl:with-param>
          </xsl:call-template>CORRECTED
        </label>
      </span>
      
      <span style="width:19mm;"/>
      
      <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership" />
          <xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
        </xsl:call-template>
      </input> 
      <span style="width:4px;"></span>
      <span style="width:61mm;font-size: 10pt;">
        <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PubliclyTradedPartnership" />
          <xsl:with-param name="BackupName">IRS1065BSchK1PubliclyTradedPartnership</xsl:with-param>
          </xsl:call-template> PUBLICLY TRADED PARTNERSHIP
        </label>
     </span>

      <!--<span style="font-size: 6pt;">(99)</span>-->
    </div>
    <!-- End Void and Corrected Check Boxes -->
    <div class="styBB" style="width:187mm;height:25mm;border-top:none;">
    
      <!-- Name and address box -->
      <div class="styIRS1065BSchK1leftBox" style="width:87mm;height:25mm;border-top:1px solid black;">
        <span style="width:4px;"></span>
        <span style="font-size: 6pt">PARTNERSHIP’S name, street address, city, state, and ZIP code.</span>
        <br/><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template><br />
         
         <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
        </xsl:call-template>

        <br/>
      </div>

      

      <!-- Form Title and Info box -->
      <div class="styIRS1065BSchK1leftBox" style="width:36mm;height:25mm;border-top:1px solid black;">
       
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:12mm;border-left:none;width:100%;">
            <span style="width:4px;"/><span style="font-size: 6pt;font-weight:bold;">1</span>
            <span style="width:4px;"/><span style="font-size: 6pt;">Taxable income (loss) from</span><br/>
           <span style="width:14.5px;"/><span style="font-size: 6pt;">passive activities</span><br/>
      <span style="vertical-align:baseline;height:50%;"/>        
            <span style="width:34.5mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossPassiveActy" />
              </xsl:call-template>
            </span>
          </span><br/>
          
         <span class="styIRS1065BSchK1leftBox" style="height:12mm;border-left:none;width:100%;">
            <span style="width:4px;"/><span style="font-size: 6pt;font-weight:bold;">2</span>
            <span style="width:4px;"/><span style="font-size: 6pt;">Taxable income (loss) from</span><br/>
           <span style="width:14.5px;"/><span style="font-size: 6pt;">other activities</span><br/>
      <span style="vertical-align:baseline;height:48%;"/>        
            <span style="width:34.5mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxableIncomeLossOtherActy" />
              </xsl:call-template>
            </span>
          </span>

      </div>


      <!-- Year and Form Box -->
       <div class="styIRS1065BSchK1rightBox" style="width:37mm;height:25mm;text-align:right;border-right:none;border-top:none;border-left:none;">
        <br/><span style="font-size: 10pt;font-weight:bold;">Partner’s Share<br/> of Income (Loss) From an Electing Large Partnership</span>
      </div>
      
      
      <div class="styIRS1065BSchK1rightBox" style="width:27mm;height:25mm;text-align:center;border-top:1px solid black;">
        <span style="font-size: 6pt">OMB No. 1545-1626</span><br/>
        <span style="padding-top:4mm;height:auto;">
          <div class="styTY" style="padding-top:3mm;font-size:26;">20<span class="styTYColor">06</span></div><br/>
        </span>
        
          <span class="styFN"  style="font-size:7pt;font-weight:bold;"  >Schedule K-1<br/>(Form 1065-B)</span>
      </div>

      

      
      
      
    </div>
    <div style="width:187mm;height:40mm;">
      <!-- Left boxes (Identification Number, Shareholder's ID, Shareholder's Name and Info) -->
      <div style="width:87mm;height:37mm;float:left;">
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:9mm;width:44mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">PARTNERSHIP’S Employer I.D. number</span>
          <br/><span style="width:4px;"></span>
          <xsl:call-template name="PopulateReturnHeaderFiler">
          <xsl:with-param name="EINChanged">true</xsl:with-param>
          <xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template>
        </span>
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:9mm;width:42.75mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">PARTNER’S identifying number</span>
          <br/><span style="width:4px;"></span>
          <xsl:if test="$Form1065BSchK1Data/PartnerSSN!=''">
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerSSN" />
          </xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form1065BSchK1Data/PartnerEIN!=''">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerEIN" />
          </xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form1065BSchK1Data/MissingSSNEINReason!=''">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/MissingSSNEINReason" />
          </xsl:call-template>
          </xsl:if>        </span>
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:15mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">PARTNER’S name</span>
          <br/><span style="width:4px;"></span>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine1" />
          </xsl:call-template><br/><span style="width:4px;"></span>

            <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerName/BusinessNameLine2" />
          </xsl:call-template>
        </span>
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:13mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">Street address (including apt. no.)</span>
          <br/><span style="width:4px;"></span>
          <xsl:if test="$Form1065BSchK1Data/PartnerUSAddress">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine1" />
            </xsl:call-template>
           
              <br/><span style="width:4px;"></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"   select="$Form1065BSchK1Data/PartnerUSAddress/AddressLine2" />
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine1" />
            </xsl:call-template>
           
              <br/><span style="width:4px;"></span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"   select="$Form1065BSchK1Data/PartnerForeignAddress/AddressLine2" />
            </xsl:call-template>
          </xsl:if>          
          
        </span>
         <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:9.5mm;width:87mm;">
          <span style="width:4px;"></span><span style="font-size: 6pt">City, state, and ZIP code</span>
          <br/><span style="width:4px;"></span>

          <xsl:call-template name="PopulateCityStateInfo">
            <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerUSAddress"/>
            <xsl:with-param name="ForeignAddressTargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress" />
          </xsl:call-template>
          <xsl:if test="$Form1065BSchK1Data/PartnerForeignAddress">
          <br /><span style="width:4px;"></span>
           <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/PartnerForeignAddress/Country" /></xsl:call-template>
         </xsl:if>
        </span>

  <span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-left:4px;height:20mm;width:87mm;">
  <span style="font-size: 6pt">Partner’s share of liabilities:</span>
          <br/>
          <br/>
          <span style="width:54mm">
          <span class="styBoldText">a</span><span style="width:4px;"></span>Nonrecourse
            <span class="styBoldText">
              <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
    
      
      
    </span>
    </span> 
    $
    
    <span style="border-bottom:solid black 1;text-align:right;width:29mm">
    <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Nonrecourse"></xsl:with-param>
            </xsl:call-template></span>
    <span style="width:54mm">
          <span class="styBoldText">b</span><span style="width:4px;"></span>Qualified nonrecourse financing
          <span class="styBoldText">
              <span style="width:16px"></span>.
      
    </span>
    </span> 
    $
    
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
    <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedNonrecourseFinancing"></xsl:with-param>
            </xsl:call-template>
    </span>
  <span style="width:54mm">
          <span class="styBoldText">c</span><span style="width:4px;"></span>Other
          <span class="styBoldText">
              <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      <span style="width:16px"></span>.
      
    </span>
    </span>
    $ 
    
    <span style="border-bottom:solid black 1;width:29mm;text-align:right">
    <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/ShareOfLiabilitiesOther"></xsl:with-param>
            </xsl:call-template>
    </span>

  </span>
  <span class="styIRS1065BSchK1leftBoxWithBottom" style="padding-left:4px;height:9.5mm;width:87mm">
    <span style="font-size: 6pt;">Tax shelter registration number</span><br/>
    <span style="padding-top:2mm;width:40mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/TaxShelterRegistration"></xsl:with-param>
            </xsl:call-template>
              </span>
  </span>

      </div>
      <!-- Middle Boxes (1a, 1b, 1c,...) -->
      <!-- Tanuja - Removed two elements PostMay5Gain, Qualified5YearGain as part of CR-80 Schema updates and also renumbered the fields accordingly-->
      
      <div style="width:72mm;height:40mm;float:left;">
        <div style="width:72mm;">
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:35.8mm;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">3</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Qualified dividends</span>
            
            <span style="padding-top:4mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/QualifiedDividends"></xsl:with-param>
            </xsl:call-template>
              </span>
            
          </span>
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;background:gray;width:137px;border-right-width:1">
           
          </span>

        </div>
        <div style="width:72mm;">
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:35.8mm;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">4a</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Net capital gain (loss) from</span>
           <span style="width:19px;"/><span style="font-size: 6pt;">passive activities</span><br/>
            <span style="padding-top:1mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossPassiveActy"></xsl:with-param>
            </xsl:call-template>
              </span>
            
              
            
          </span>
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:137px;border-right-width:1">
           <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">4b</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Net capital gain (loss)</span><br/>
           <span style="width:20px;"/><span style="font-size: 6pt;">from other activities</span><br/>
             <span style="padding-top:1mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetCapitalGainLossOtherActy"></xsl:with-param>
            </xsl:call-template>
              </span>
          </span>

        </div>
  <div style="width:72mm;">
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:35.75mm;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">5</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Net passive AMT adjustment</span>
          <span style="padding-top:4mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetPassiveAMTAdjustment"></xsl:with-param>
            </xsl:call-template>
              </span>

            
              
            
          </span>
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:137px;border-right-width:1">
           <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">6</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Net other AMT adjustment</span>
             <span style="padding-top:4mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/NetOtherAMTAdjustment"></xsl:with-param>
            </xsl:call-template>
              </span>
          </span>

        </div>
    <div style="width:72mm;">
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:35.75mm;">
            <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">7</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">General credits</span>
            <span style="padding-top:4mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/GeneralCredits"></xsl:with-param>
            </xsl:call-template>
              </span>
            
              
            
          </span>
          <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:11mm;width:137px;border-right-width:1">
           <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">8</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Low-income housing credit</span>
            <span style="padding-top:4mm;width:35mm;float:bottom;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/LowIncomeHousingCredit"></xsl:with-param>
            </xsl:call-template>
              </span>
          </span>

        </div>
        
        <span class="styIRS1065BSchK1leftBoxWithBottom" style="height:31.75mm;width:72mm;float:left;border-right-width:1">
          <span style="width:4px;"></span><span style="font-size: 6pt;font-weight:bold;">9</span>
            <span style="width:4px;"></span><span style="font-size: 6pt;">Other 
            <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data/Other"></xsl:with-param>
            </xsl:call-template></span><br/>
            
            <xsl:for-each select="$Form1065BSchK1Data/Other/Item">
            <span style="width:71mm;padding-left:1mm">
                <span style="width:35mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Code"></xsl:with-param>
                 </xsl:call-template>
                     </span>
               <span style="width:35mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="Amount"></xsl:with-param>
                 </xsl:call-template>
                     </span>

            </span>
        </xsl:for-each>
            
            
        </span>
      </div>
      <!-- Stylesheet will always show only Copy B box as per customer request -->
      <div style="width:28mm;height:76.25mm;float:left;text-align:right;">
        <span class="styIRS1065BSchK1rightBoxWithBottom" style="height:76.25mm;width:28mm;float:left;padding-bottom:1mm;border-left-width:0;border-right-width:0;">
          <div style="font-size: 9pt;font-weight:bold;height:6mm;padding-top:1mm;">Copy A</div>
          
        
        <br/>
      <span class="styBoldText">         For<br/>
        Internal Revenue
        Service Center
        </span><br/>
        <br/>
      <span class="styBoldText" style="font-size:6pt;">File with Form 1065-B.</span><br/><br/>
      <span style="font-size:6pt;">
      For Privacy Act and<br/>
      Paperwork<br/>
      Reduction Act<br/>
      Notice and<br/>
      instructions for<br/>
      completing this<br/>
      form, see the<br/>
      <span class="styBoldText">2006 Instructions<br/>
      for Form 1065-B,</span><br/>
      U.S. Return of<br/>
      Income for Electing<br/>
      Large Partnerships.
      </span>
        
        </span>

       
      </div>
    </div>
    <div style="width:187mm;">
      
      <span style="font-weight:bold;width:82mm;font-size:8pt">Schedule K-1 (Form 1065-B)</span>
      <span style="width:45mm;font-size: 6pt;">Cat. No. 25437H</span>
      <span style="font-size: 6pt;">Department of the Treasury - Internal Revenue Service</span>
      <br/>
      <span style="width:187mm;text-align:center;font-size:8pt;padding-top:1mm;" class="StyBoldText">Do NOT Cut or Separate Forms on This Page</span>
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
      <xsl:with-param name="TargetNode" select="$Form1065BSchK1Data" />
      <xsl:with-param name="DescWidth" select="100"/>
    </xsl:call-template>          
  </table>
  <!-- END Left Over Table -->    

    
    </form>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>

  
