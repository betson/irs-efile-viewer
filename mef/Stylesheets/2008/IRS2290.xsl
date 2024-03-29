<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS2290Style.xsl"/>


<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="Form2290" select="$RtnDoc/IRS2290"/>
<xsl:param name="Form2290Data" select="$RtnDoc/IRS2290"/>

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form2290)"/></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 2290"/>
  
 
  
  <xsl:call-template name="InitJS"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=&apos;&apos;">
      
      <xsl:call-template name="IRS2290Style"/>  
      <xsl:call-template name="AddOnStyle"/>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form2290">
    <xsl:call-template name="DocumentHeader"/>
    
    
<!-- Begin Form Title -->
    <div class="styBB" style="width:187mm;">
      <div class="styFNBox" style="width:31mm;height:20mm;">
        Form <span class="styFormNumber">2290</span>      
        <br/>      
        <span class="styAgency">(Rev. July 2008)
          <br/> Department of the Treasury
        </span>
        <br/>
        <span class="styAgency">Internal Revenue Service </span>
        <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$Form2290"/>
      </xsl:call-template>
      </div>
      <div class="styFTBox" style="width:125mm;height:20mm;">
        <div class="styMainTitle" style="">Heavy Highway Vehicle Use Tax Return</div>
        <div style="font-family: &apos;Arial&apos;;font-size:10pt;">
          For the period July 1, 2008, through June 30, 2009
        </div>
        <div class="styFBT">
          <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
          Attach both copies of Schedule 1 to this return
        </div>
        <div class="styFBT">
          <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
          See the separate instructions.
        </div>
      </div>
      <div class="styTYBox" style="width:30mm;height:20mm;">
        <div class="styOMB" style="height:10mm;padding-left:1mm;padding-top:1mm;text-align:left;font-family:&apos;Arial Narrow&apos;;font-size:8pt">Keep a copy of this<br/>return for your records</div>
        <div style="height:10mm;padding-left:0.5mm;padding-top:3mm;text-align:left;border-bottom-width:0">OMB No. 1545-0143</div>
      </div>
    </div>
<!-- End Form Title -->

<!-- Begin Address Change Table -->    
    
      <table border="0" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm">
        <tbody>
          <tr>
            <td rowspan="3" style="width:21mm;border:0 solid black;border-right-width:1;padding-top:2mm">
              <span class="styBoldText"><center>Type<br/>or Print</center></span>
              <br/>Check here if:
              <br/>Address change
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/AddressChange"/>
                  <xsl:with-param name="BackupName">IRS2290AddressChange</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/AddressChange"/>
                  <xsl:with-param name="BackupName">IRS2290AddressChange</xsl:with-param>
                </xsl:call-template>
              </label>
              <br/>Final return
              <span style="width:4.5mm"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/FinalReturn"/>
                  <xsl:with-param name="BackupName">IRS2290FinalReturn</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/FinalReturn"/>
                  <xsl:with-param name="BackupName">IRS2290FinalReturn</xsl:with-param>
                </xsl:call-template>
              </label>
              <br/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Amended Return</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Amended Month</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form2290/AmendedMonth"/>
              </xsl:call-template>
            </td>
            <td style="width:88mm;border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm">Name
              <br/><br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template>
            </td>
            <td style="width:43mm;border:0 solid black;border-right-width:1;border-bottom-width:1;padding-bottom:0.25mm;padding-left:1mm">
            <b>Employer identification number</b><br/>
              <div style="padding-top:1.25mm">
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="1"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="2"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="float:left;clear:none"> - </span>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="3"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="4"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="5"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="6"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="7"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="8"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
                <span style="width:0.5mm;float:left;clear:none"/>
                <xsl:call-template name="PopulateIndividualSizableLetterBox">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                  <xsl:with-param name="BoxNum" select="9"/>
                  <xsl:with-param name="BoxWidth" select="&apos;4mm&apos;"/>
                  <xsl:with-param name="BoxHeight" select="&apos;3.5mm&apos;"/>
                  <xsl:with-param name="BoxTopPadding" select="&apos;0mm&apos;"/>
                </xsl:call-template>
              </div>
            </td>
            <td style="border:1 solid black;border-right-width:0;text-align:center;font-weight:bold">FOR IRS<br/>USE ONLY</td>
          </tr>
          <tr>
            <td colspan="2" style="border:0 solid black;border-right-width:1;border-bottom-width:1;padding-left:2mm">Address (number, street, and room or suite no.)
              <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template>
              <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>
            </td>
            <td rowspan="2" style="border:1 solid black;border-right-width:0;"><b>T<br/>FF<br/>FP<br/>I<br/>T</b><br/></td>
          </tr>
          <tr>
            <td colspan="2" style="border:0 solid black;border-right-width:1;padding-left:2mm">City, state, and ZIP code (for Canadian or Mexican address, see page 5 of the instructions.)
              <br/><xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
              <br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param><xsl:with-param name="MainForm">true</xsl:with-param>   </xsl:call-template>
            </td>
          </tr>
        </tbody>
      </table>
<!-- End Address Change Table -->


<!--  BEGIN  PART I  -->

 <div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1;">
  <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part I</div>
  <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Figuring the Tax</div>
</div>
<!-- Line 1 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:7mm;">1</div>
  <div class="styLNDesc" style="width:135mm;height:7mm;padding-top:2mm;">Was the vehicle(s) reported on this return used on public highways during <span class="styBoldText">July 2008</span>? If YES,</div>
  <div style="float:right">
    <div class="styLNRightNumBox" style="height:7mm;padding-left:.25mm;width:8.25mm;border-bottom-width:0;border-right-width:1px;"/>
     <div class="styLNAmountBox" style="padding-left:.25mm;height:5mm;width:33mm;border-bottom-width:1;border-left-width:0px;">
            <span style="float:left;clear:none;width:5mm;padding-left:.5mm;padding-right:0mm;padding-top:.5mm;text-align:center;font-size:6.5pt;">Y</span>
                <span style="width:5.5mm;float:left;clear:none;text-align:center;padding-right:0mm;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="float:left;clear:none;padding-left:.5mm;width:5.5mm;text-align:center;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5.75mm;float:left;clear:none;text-align:center;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5.75mm;float:left;clear:none;text-align:center;padding-left:.25mm;padding-top:.5mm;font-size:6.5pt;">M</span>
                <span style="width:5.75mm;float:right;clear:all;text-align:center;padding-top:.5mm;font-size:6.5pt;">M</span>
    </div>
  </div>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;"/>
  <div class="styLNDesc" style="width:117mm;height:5mm">enter <span class="styBoldText">200807</span> in the boxes to the right. If NO, see the table on page 3 of the instructions</div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">      
    <xsl:call-template name="PopulateYear">
      <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateMonth">
      <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDate"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">1</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">...</div>
</div>
<!-- Line 2 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;">2</div>
  <div class="styLNDesc" style="width:77mm;height:5mm"><span class="styBoldText">Tax.</span> Enter the <span class="styBoldText">Total</span> from Form 2290, page 2, column (4)</div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290/TaxFromTaxComputation"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">2</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <span class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.............</span>
</div>
<!-- Line 3 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;">3</div>
  <div class="styLNDesc" style="width:117mm;height:5mm;">Additional tax from increase in taxable gross weight. See page 5 of the instructions   
    <xsl:call-template name="SetFormLinkInline">
      <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTax"/>
    </xsl:call-template>    
  </div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTax"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">3</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">...</div>
</div>
<!-- Line 4 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;">4</div>
  <div class="styLNDesc" style="width:40mm;height:5mm"><span class="styBoldText">Total tax.</span> Add lines 2 and 3</div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;float:right">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290/TotalTax"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">4</div>     
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">......................</div>
</div>
<!-- Line 5 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;">5</div>
  <div class="styLNDesc" style="width:55mm;height:5mm;"><span class="styBoldText">Credits.</span> See page 5 of the instructions
    <xsl:call-template name="SetFormLinkInline">
      <xsl:with-param name="TargetNode" select="$Form2290/CreditsAmount"/>
    </xsl:call-template>   
  </div>
  <div class="styLNAmountBox" style="width:34mm;height:5mm;float:right">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290/CreditsAmount"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right">5</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">...................</div>
</div>
<!-- Line 6 -->
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;">6</div>
  <div class="styLNDesc" style="width:135mm;height:5mm;"><span class="styBoldText">Balance due.</span> Subtract line 5 from line 4. This is the amount you owe. If payment through</div>
  <div class="styLNAmountBox" style="height:5mm;width:34mm;border-bottom-width:0;float:right"/>
  <div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0;float:right"/>
</div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style="height:5mm;"/>
  <div class="styLNDesc" style="width:30mm;height:5mm">EFTPS, check here <span style="width2mm"/>
    <input type="checkbox" class="styCkbox">
      <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPayment"/>
        <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
      </xsl:call-template>
    </input>
    <label>
      <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPayment"/>
        <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
      </xsl:call-template>
    </label>
  </div>
  <div class="styLNAmountBox" style="width:34mm;height:5mm;float:right;border-bottom-width:0px">      
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$Form2290/BalanceDue"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:5mm;float:right;border-bottom-width:0px">6</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.........................</div>
</div>


<!-- Begin Part II -->

<div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1">
        <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part II</div>
        <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Statement in Support of Suspension <span style="font-size:7pt;font-weight:normal">(Complete the statements that apply. Attach additional sheets if needed.)</span></div>
        </div>
        <!--  LINE 7 -->
<div style="width:187mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="height:6mm;">7</div>
      <div class="styLNDesc" style="width:178mm;height:6mm;padding-top:.5mm;">        <!--Dotted Line-->
             I declare that the vehicles listed in Part II of Schedule 1 are expected to be used on public highways (check the boxes that
apply):<br/>
  <span style="padding-left:36mm;padding-top:.5mm;">
        <input type="checkbox" class="styCkbox">

          <xsl:call-template name="PopulateCheckbox">
           <xsl:with-param name="TargetNode" select="$Form2290/Checkbox5000Miles"/>
           <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
         </xsl:call-template>
       </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form2290/Checkbox5000Miles"/>
          <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
        </xsl:call-template>
        5,000 miles or less </label>

<span style="width:10mm"/>
 <input type="checkbox" class="styCkbox">

          <xsl:call-template name="PopulateCheckbox">
           <xsl:with-param name="TargetNode" select="$Form2290/Checkbox7500Miles"/>
           <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
         </xsl:call-template>
       </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form2290/Checkbox7500Miles"/>
          <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
        </xsl:call-template>
        7,500 miles or less for agricultural vehicles</label>

</span><br/>
during the period July 1, 2008, through June 30, 2009, and are suspended from the tax. Complete and attach Schedule 1.
       </div>
    </div>


<!-- Line 8a -->

<div style="width:187mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="height:5mm;">8a</div>
      <div class="styLNDesc" style="width:178mm;height:5mm;">        
            I declare that the vehicles listed as suspended on the Form 2290 filed for the period July 1, 2007, through June 30, 2008, were not
subject to the tax for that period except for any vehicles listed on line 8b. <span class="styBoldText">Check this box if applicable.</span><span style="width:3mm"/>    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>    <span style="width:3mm"/>
<input type="checkbox" class="styCkbox">

          <xsl:call-template name="PopulateCheckbox">
           <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTax "/>
           <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
         </xsl:call-template>
       </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTax "/>
          <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
        </xsl:call-template>
        </label>
     </div>
   </div>

<!--  LINE 8b  -->
<div style="width:187mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;">b</div>
      <div class="styLNDesc" style="width:178mm;height:5mm;">        
            Vehicle identification numbers
                
          <span style="width:130mm;border-bottom:1 black solid"><xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$Form2290/SuspendedVIN"/></xsl:call-template></span>
            </div>
        </div>

<!--  LINE 9 -->
<div style="width:187mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="height:5mm;">9</div>
      <div class="styLNDesc" style="width:178mm;height:5mm;">        
           
           I declare that vehicle identification numbers 
            <span style="width:110mm;border-bottom:1 black solid"><xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$Form2290/TransferredSuspendedVIN"/></xsl:call-template></span>
           <br/>
were listed as suspended on the Form 2290 filed for the period July 1, 2007, through June 30, 2008. These vehicles were sold or
transferred to
<span style="width:60mm;border-bottom:1 black solid"/>

 on <span style="width:30mm;border-bottom:1 black solid"/>,<span style="width:30mm;border-bottom:1 black solid"/>.
 <div class="styLNLeftNumBox" style="height:3mm;"/>
      <div class="styLNDesc" style="width:178mm;height:3mm;">
At the time of the transfer, the vehicles were still eligible for the suspension of the tax. Attach a separate list if needed.
           </div>
       </div> </div>


<!-- Begin Third Party Designee Signature block -->

<table border="0" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
  <tbody>
    <tr>
      <td style="font-size:8pt;border:1 solid black;border-left-width:0;font-weight:bold">Third<br/> Party<br/> Designee</td>
      <td style="padding-left:2mm;border:1 solid black;border-left-width:0;border-right-width:0">Do you want to allow another person to discuss this return with the IRS (see instructions)?
        <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
          <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes"/>
          <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
        </xsl:call-template>
        </label>
        <b> Yes.</b> Complete the following. 
        <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
          <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo"/>
          <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
        </xsl:call-template>
        </label>
        <b>No</b> 
        <br/>
        <br/>
        <div style="float:left">
          Designee&apos;s<br/>name<span style="width:5mm"/><img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/><span style="width:1mm"/>   
          <span style="width:40mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneeName"/>
            </xsl:call-template>
          </span>
        </div>
        <div style="float:left">
          Phone<br/>no.<span style="width:5mm"/><img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/><span style="width:1mm"/> 
          <span style="width:30mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePhone"/>
            </xsl:call-template>
          </span>
        </div>
        <div style="float:left">
          Personal identification<br/>number (PIN)<span style="width:13mm"/><img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/><span style="width:1mm"/> 
          <span style="width:30mm">
            <xsl:call-template name="PopulatePin">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DesigneePIN"/>
            </xsl:call-template>
          </span> 
        </div>
      </td>
    </tr>
    <!-- END Third Party Designee block -->
    
    <!--  BEGIN Sign Here block -->
    <tr>
      <td style="font-size:8pt;border:0 solid black; border-right-width:1;border-bottom-width:1;font-weight:bold">Sign Here</td>
      <td style="padding-left:2mm;border: 0 solid black;border-bottom-width:1">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and, to the best of my
knowledge and belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/><br/>

<img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
<span style="width:90mm;border-top:1 solid black">Signature</span><span style="width:10mm"/>
<img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
<span style="width:63mm;border-top:1 solid black">Date</span>
<br/>
<div style="width:105mm;float:left;clear:none">
<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template><br/>
<span>Type or print name below signature.</span>
</div>
<div style="width:60mm;float:left;clear:none">
<br/><br/>
Telephone number 
<span style="padding-left:2mm">
<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNumber"/></xsl:call-template>
</span>
</div>
</td>
    </tr>
  </tbody>
</table>

<!-- END  Sign Here Signature block -->

<!-- The Paid Preparer&apos;s Signature block was added per PDF dated 02/14/2008 and schema version 2007v6.2 
      and RIS  ETA081635OTH   Also changed revision dates to 2008 -->

<!-- BEGIN Paid Preparer&apos;s Use Only block -->

				<!-- BEGIN PREPARER SIGNATURE SECTION -->
				<!-- Implementing Preparer section in table -->
				<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;clear:both;">
					<tr>
						<td rowspan="3" style="width:17.75mm;font-size:8pt;font-weight:bold;border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;padding-right:1mm;">Paid Preparer&apos;s Use Only
</td>
						<td style="width:32mm;border-bottom:1 solid black;">
							<span style="width:13mm;padding-left:1mm;" class="styGenericDiv">Preparer&apos;s <br/>signature</span>
							<span class="styGenericDiv" style="border:0 solid red;">
								<img src="{$ImagePath}/2290_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
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
						<td style="width:35mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
							<nobr>
								<label for="dummyid1">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>Check if <br/> self-employed
          </label>
							</nobr>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/2290_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>
							<span style="width:5px;"/>
							<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
								</xsl:call-template>
							</input>
						</td>
						<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">Preparer&apos;s SSN or PTIN
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
							<span class="styGenericDiv" style="padding-right:.5mm;">Firm&apos;s name (or <br/>yours if self-employed),<br/> address, and ZIP code</span>
							<span class="styGenericDiv" style="">
								<img src="{$ImagePath}/2290_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
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
      <img src="{$ImagePath}/2290_Bullet_Sm.gif" width="4" height="7" alt="right pointing bullet image" border="0"/>
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

<div class="pageEnd" style="width:187mm;padding-top:1mm;">  
    
   <span><span class="styBoldText" style="padding-right:5mm">For Privacy Act and Paperwork Reduction Act Notice, see page 9 of the instructions.</span><span style="padding-right:5mm;">Cat. No. 11250O</span> <span>Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2008)</span></span>
 </div>
 <!--  PAGE 1  END -->

<!-- PAGE 2  BEGIN -->
<div class="styBB" style="width:187mm;text-align:right">
 <span style="float:left">Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2008)</span>Page <span class="styBoldtext" style="font-size:8pt">2</span>
</div>

<!--******************************************************************************************************************************************-->
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

		

<!--&lt;div class=&quot;pageEnd&quot; style=&quot;width:187mm;padding-top:1mm;&quot;&gt;  
    
   &lt;span&gt;&lt;span class=&quot;styBoldText&quot; style=&quot;padding-right:5mm&quot;&gt;For Privacy Act and Paperwork Reduction Act Notice, see page 9 of the instructions.&lt;/span&gt;&lt;span style=&quot;padding-right:5mm;&quot;&gt;Cat. No. 11250O&lt;/span&gt; &lt;span&gt;Form &lt;span class=&quot;styBoldText&quot; style=&quot;font-size:8pt&quot;&gt;2290&lt;/span&gt; (Rev. 7-2008)&lt;/span&gt;&lt;/span&gt;
 &lt;/div&gt; -->





<!--&lt;div class=&quot;styBB&quot; style=&quot;width:187mm;text-align:right&quot;&gt;
 &lt;span style=&quot;float:left&quot;&gt;Form &lt;span class=&quot;styBoldText&quot; style=&quot;font-size:8pt&quot;&gt;2290&lt;/span&gt; (Rev. 7-2007)&lt;/span&gt;page &lt;span class=&quot;styBoldtext&quot; style=&quot;font-size:8pt&quot;&gt;2&lt;/span&gt;
&lt;/div&gt; -->





<!--  TAX  COMPUTATION  TABLE -->

<div class="styBB" style="width:187mm;text-align:center;font-weight:bold;font-size:9pt;padding:2mm;">
Tax Computation
 </div>

<div style="width:187mm">
<table cellspacing="0" style="font-size:7pt;border-color:black;text-align:center">
	<tbody>
		<tr style="height:17mm">
			<th class="styTableCellHeader" style="width:8mm;height:32mm" rowspan="2"><img src="{$ImagePath}/2290_Category.gif" alt="Category"/></th>
			<th class="styTableCellHeader" style="width:16mm;background-color:lightgrey"><span style="width:1px"/></th>
			<th class="styTableCellHeader" style="width:30mm;vertical-align:top" colspan="2">(1)<br/>Annual tax<br/><span style="font-weight:normal">(vehicles used<br/>during July)</span></th>
			<th class="styTableCellHeader" style="width:56mm;vertical-align:top" colspan="2">(2)<br/>Partial-period tax<br/><span style="font-weight:normal">(vehicles first used after July)<br/>(See the tables on page 10 of<br/>the instructions.)</span></th>
			<th class="styTableCellHeader" style="width:44mm;vertical-align:top" colspan="2">(3)<br/>Number of<br/>vehicles</th>
			<th class="styTableCellHeader" style="width:26mm;vertical-align:top">(4)<br/>Amount of tax <br/><span style="font-weight:normal">(col. (1) or (2)<br/>times col. (3))</span></th>
			<th class="styTableCellHeader" style="width:8mm;height:32mm;border-right-width:0px" rowspan="2"><img src="{$ImagePath}/2290_Category.gif" alt="Category"/></th>
		</tr>
		<tr style="height:15mm;font-weight:bold">
			<td class="styTableCellHeader" style="width:16mm;vertical-align:center;padding-left:2mm">Taxable<br/>Gross Weight<br/>(in pounds)</td>
			<td class="styTableCellHeader" style="width:15mm;vertical-align:top">(a)<br/>Vehicles<br/>Except Logging*</td>
			<td class="styTableCellHeader" style="width:15mm;vertical-align:top">(b)<br/>Logging<br/>Vehicles*</td>
			<td class="styTableCellHeader" style="width:28mm;vertical-align:top">(a)<br/>Vehicles<br/>Except Logging*</td>
			<td class="styTableCellHeader" style="width:28mm;vertical-align:top">(b)<br/>Logging<br/>Vehicles*</td>
			<td class="styTableCellHeader" style="width:22mm;vertical-align:top">(a)<br/>Vehicles<br/>Except Logging*</td>
			<td class="styTableCellHeader" style="width:22mm;vertical-align:top">(b)<br/>Logging<br/>Vehicles*</td>
			<td class="styTableCellHeader" style="background-color:lightgrey"><span style="width:1px"/></td>
		</tr>










		
		
	<!--	&lt;xsl:choose&gt;-->
		
		
		<!-- THIS WHEN STATEMENT IS ONLY HERE FOR SCHEMA VERSIONING PLEASE TAKE OUT THIS ABOMINATION AND JUST LEAVE THE CODE THAT THE OTHERWISE
		      POINTS TO THE MOMENT 2008 ARRIVES-->
		
		
                     <!-- &lt;xsl:when test=&quot;$Version=&apos;2007v5.0&apos; or $Version=&apos;2007v4.0&apos;&quot;&gt;
                          &lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;A&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;&lt;span style=&quot;float:left;clear:none&quot;&gt;$&lt;/span&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;&lt;span style=&quot;float:left;clear:none&quot;&gt;$&lt;/span&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;&lt;span style=&quot;float:left;clear:none&quot;&gt;$&lt;/span&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;&lt;span style=&quot;float:left;clear:none&quot;&gt;$&lt;/span&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;&lt;span style=&quot;float:left;clear:none&quot;&gt;$&lt;/span&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryA/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;A&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;B&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryB/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;B&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;C&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryC/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;C&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;D&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryD/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;D&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;E&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryE/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;E&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;F&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryF/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;F&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;G&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryG/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;G&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;H&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryH/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;H&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;I&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryI/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;I&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;J&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryJ/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;J&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;K&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryK/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;K&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;L&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryL/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;L&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;M&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryM/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;M&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;N&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryN/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;N&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;O&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryO/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;O&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;P&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryP/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;P&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;Q&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryQ/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;Q&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;R&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryR/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;R&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;S&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryS/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;S&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;T&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryT/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;T&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;U&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryU/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;U&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px&quot;&gt;V&lt;/td&gt;
			&lt;td class=&quot;styTableCellCtr&quot; style=&quot;font-size:6pt;width:16mm;padding-left:1mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/TaxableGrossWeight&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/AnnualTaxNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCellText&quot; style=&quot;font-size:6pt;width:15mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateText&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/AnnualTaxLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/ComputationColumns/NonLoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:28mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/ComputationColumns/LoggingPartialTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
   					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/ComputationColumns/NumberVehicleNonLogging&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:22mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/ComputationColumns/NumberVehicleLogging&quot;&gt;&lt;/xsl:with-param&gt;
   				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styTableCell&quot; style=&quot;font-size:6pt;width:30mm;padding-right:.5mm&quot;&gt;
				&lt;xsl:call-template name=&quot;PopulateAmount&quot;&gt;
    					&lt;xsl:with-param name=&quot;TargetNode&quot; select=&quot;$Form2290/CategoryV/ComputationColumns/AmountOfTax&quot;&gt;&lt;/xsl:with-param&gt;
    				&lt;/xsl:call-template&gt;
			&lt;/td&gt;
			&lt;td class=&quot;styLNCtrNumBox&quot; style=&quot;border-left-width:0px;border-right-width:0px&quot;&gt;V&lt;/td&gt;
		&lt;/tr&gt;
                    &lt;/xsl:when&gt;-->
                      
                      
                      <!-- KILL EVERYTHING ABOVE THIS LINE IN 2008-->
                      
             <!--         &lt;xsl:otherwise&gt;-->
                      
		<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">A</xsl:with-param>
			    <xsl:with-param name="pos">1</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">B</xsl:with-param>
			    <xsl:with-param name="pos">2</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">C</xsl:with-param>
			    <xsl:with-param name="pos">3</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">D</xsl:with-param>
			    <xsl:with-param name="pos">4</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">E</xsl:with-param>
			    <xsl:with-param name="pos">5</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">F</xsl:with-param>
			    <xsl:with-param name="pos">6</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">G</xsl:with-param>
			    <xsl:with-param name="pos">7</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">H</xsl:with-param>
			    <xsl:with-param name="pos">8</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">I</xsl:with-param>
			    <xsl:with-param name="pos">9</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">J</xsl:with-param>
			    <xsl:with-param name="pos">10</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">K</xsl:with-param>
			    <xsl:with-param name="pos">11</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">L</xsl:with-param>
			    <xsl:with-param name="pos">12</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">M</xsl:with-param>
			    <xsl:with-param name="pos">13</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">N</xsl:with-param>
			    <xsl:with-param name="pos">14</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">O</xsl:with-param>
			    <xsl:with-param name="pos">15</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">P</xsl:with-param>
			    <xsl:with-param name="pos">16</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">Q</xsl:with-param>
			    <xsl:with-param name="pos">17</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">R</xsl:with-param>
			    <xsl:with-param name="pos">18</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">S</xsl:with-param>
			    <xsl:with-param name="pos">19</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">T</xsl:with-param>
			    <xsl:with-param name="pos">20</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">U</xsl:with-param>
			    <xsl:with-param name="pos">21</xsl:with-param> 
			</xsl:call-template>
			<xsl:call-template name="CategoryRow">
			   <xsl:with-param name="TargetCategory">V</xsl:with-param>
			    <xsl:with-param name="pos">22</xsl:with-param> 
			</xsl:call-template>
<!--			&lt;/xsl:otherwise&gt;
              &lt;/xsl:choose&gt;-->
		
		<tr>
			<td class="styTableCellText" style="width:105mm;height:12mm;text-align:justify" colspan="6"><b>Totals.</b> Add the number of vehicles in columns (3a) and (3b). Enter the total
				here and on Schedule 1, Part III, line a. Add the amounts in column (4). Enter
				the total here and on Form 2290, line 2 <span class="styDotLn" style="float:none;padding-left:1.5mm">.............</span>
			</td>
			<td class="styTableCell" style="width:44mm;vertical-align:bottom;paddign-right:.5mm" colspan="2">
				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/TotalNumberOfVehicles"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:30mm;vertical-align:bottom;padding-right:.5mm"><span style="float:left;clear:none">$</span>
  				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/TotalAmountOfTax"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="width:8mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px">
			<span style="width:1px"/>
			</td>
		</tr>
		<tr>
			<td class="styLNCtrNumBox" style="border-left-width:0px;height:12mm;vertical-align:middle">W</td>
			<td class="styTableCellText" style="width:22mm;font-size:6pt">
				Tax-Suspended Vehicles
				(See <i>Part II</i> on page 6 of
				the instructions.)
			</td>
			<td class="styTableCellText" style="width:76mm;background-color:lightgrey" colspan="4">
				<span style="width:1px"/>
			</td>

			<td class="styTableCell" style="font-size:6pt;width:22mm;vertical-align:bottom">
				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/NumberTaxSuspendedLoggingVeh"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:22mm;vertical-align:bottom">
  				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/NumTaxSuspendedNonLoggingVeh"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="width:30mm;background-color:lightgrey;border-right-width:0px">
				<span style="width:1px"/>
			</td>
			<td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey" colspan="2">
				<span style="width:1px"/>
			</td>
		</tr>
		<tr>
			<td class="styTableCellCtr" style="width:179mm;height:8mm;vertical-align:middle;font-weight:bold;font-size:9pt;border-bottom-width:2px" colspan="9">
				Complete both copies of Schedule 1 (Form 2290) and attach them to Form 2290.
			</td>
			<td class="styLNCtrNumBox" style="background-color:lightgrey;border-left-width:0px;border-right-width:0px;border-bottom-width:0px">
			<span style="width:1px"/>
			</td>
		</tr>
		<tr>
			<td class="styTableCellText" style="width:179mm;height:8mm;vertical-align:middle;border-bottom-width:2px" colspan="9">
				* See page 2 of the instructions for information on logging vehicles.
			</td>
			<td class="styLNCtrNumBox" style="background-color:lightgrey;border-left-width:0px;border-right-width:0px;border-bottom-width:2px">
			<span style="width:1px"/>
			</td>
		</tr>

	</tbody>
</table>
</div>

<div class="pageEnd" style="width:187mm"> 
	<span style="float:right"> Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2008)</span>
	</div>
	
	
   
   

      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
    <!-- Additional Data Table -->
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form2290"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
      <xsl:if test="$Form2290/AmendedReturn">
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
                <xsl:with-param name="BackupName">IRS2290AmendedReturn</xsl:with-param>
              </xsl:call-template>
              Amended Return:
            </label>
          </td>  
          <td class="styLeftOverTableRowAmount" style="width:87mm;">
           <input type="checkbox" class="styCkbox">
             <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturn"/>
               <xsl:with-param name="BackupName">IRS2290AmendedReturn</xsl:with-param>
             </xsl:call-template>
           </input>
          </td>                          
        </tr>
      </xsl:if>
      <xsl:if test="$Form2290/AmendedMonth">
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Amended Month</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form2290/AmendedMonth"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
    </table>  
      <!-- END Left Over Table -->  

      <!-- Optional Print Solution for repeating data table Part I, Line 2 -->
     
     
    </form>
  </body>
</html>

</xsl:template>



<xsl:template name="CategoryDetails">
  <xsl:param name="TargetCategory"/> <!-- enter this as a number 1=A -->
  
  <xsl:choose>
  <xsl:when test="$TargetCategory = 1 ">
  
                  <td class="styTableCellCtr" style="font-size:6pt;width:16mm;padding-left:1mm">
			      $55,000
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				$100.00
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				$75.00
			</td>
  </xsl:when>
  <xsl:when test="$TargetCategory &lt; 22">
                 <td class="styTableCellCtr" style="font-size:6pt;width:16mm;padding-left:1mm">
               
                    <xsl:value-of select="format-number((55001 + (1000 * ($TargetCategory - 2))),&apos;#,###&apos;)"/>-<xsl:value-of select="format-number((55000 + (1000 * ($TargetCategory - 1))),&apos;#,###&apos;)"/>
                 </td>
                 <td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				<xsl:value-of select="format-number((100+(22*($TargetCategory - 1))),&apos;#,###.00&apos;)"/>
		    </td>
		    <td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				<xsl:value-of select="format-number((75+(16.5*($TargetCategory - 1))),&apos;#,###.00&apos;)"/>
		    </td>
                 
  </xsl:when>
  <xsl:when test="$TargetCategory = 22 ">
  
                  <td class="styTableCellCtr" style="font-size:6pt;width:16mm;padding-left:1mm">
			     Over 75,000
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				550.00
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm;text-align:center">
				412.50
			</td>
  </xsl:when>
     <xsl:otherwise>
                    <td class="styTableCellCtr" style="font-size:6pt;width:16mm;padding-left:1mm">
				<span style="width:1px"/>
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm">
				<span style="width:1px"/>
			</td>
			<td class="styTableCellText" style="font-size:6pt;width:15mm">
				<span style="width:1px"/>
			</td>
  </xsl:otherwise>
  
  </xsl:choose>
  
</xsl:template>

<xsl:template name="CategoryRow">
  <xsl:param name="TargetCategory"/>
  <xsl:param name="pos"/>
  <xsl:param name="internal">1</xsl:param> 

     <xsl:choose>
      <xsl:when test="$TargetCategory=$Form2290/TaxComputation[position()=$internal]/Category">
              
              <tr>
			<td class="styLNCtrNumBox" style="border-left-width:0px">
			<xsl:call-template name="PopulateText">
			    <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/Category"/>
			</xsl:call-template></td>
			<xsl:call-template name="CategoryDetails">
			      <xsl:with-param name="TargetCategory" select="$pos"/>
			 </xsl:call-template>
			<td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>
				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NonLoggingPartialTax"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>


				<xsl:call-template name="PopulateAmount">
   					<xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/LoggingPartialTax"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:22mm;padding-right:.5mm">
				<xsl:call-template name="PopulateAmount">
   					<xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NumberVehicleNonLogging"/>
    				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:22mm;padding-right:.5mm">
				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/NumberVehicleLogging"/>
   				</xsl:call-template>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>

				<xsl:call-template name="PopulateAmount">
    					<xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/ComputationColumns/AmountOfTax"/>
    				</xsl:call-template>
			</td>
			<td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
			<xsl:call-template name="PopulateText">
			    <xsl:with-param name="TargetNode" select="$Form2290/TaxComputation[position()=$internal]/Category"/>
			</xsl:call-template></td>
		</tr>

     </xsl:when>
      <xsl:when test="$internal &gt; 22">  <!--Empty row-->
       <tr>
			<td class="styLNCtrNumBox" style="border-left-width:0px">
			<xsl:value-of select="$TargetCategory"/></td>
			<xsl:call-template name="CategoryDetails">
			      <xsl:with-param name="TargetCategory"><xsl:value-of select="$pos"/></xsl:with-param>
			 </xsl:call-template>
			<td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>
				<span style="width:1px"/>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>

				<span style="width:1px"/>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:22mm;padding-right:.5mm">
				<span style="width:1px"/>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:22mm;padding-right:.5mm">
				<span style="width:1px"/>
			</td>
			<td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm"><xsl:if test="$TargetCategory = &apos;A&apos;"><span style="float:left;clear:none">$</span></xsl:if>

				<span style="width:1px"/>
			</td>
			<td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
			      <xsl:value-of select="$TargetCategory"/>
			</td>
		</tr>
    
       </xsl:when>
    <xsl:otherwise>  
        <xsl:call-template name="CategoryRow">
              <xsl:with-param name="TargetCategory" select="$TargetCategory"/>
              <xsl:with-param name="internal"><xsl:value-of select="$internal+1"/></xsl:with-param>
              <xsl:with-param name="pos"><xsl:value-of select="$pos"/></xsl:with-param>
          </xsl:call-template>   
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template> 

</xsl:stylesheet>