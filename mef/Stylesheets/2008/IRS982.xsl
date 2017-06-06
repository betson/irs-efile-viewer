<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS982Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form982Data" select="$RtnDoc/IRS982"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form982Data)"/>
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
        <meta name="Description" content="IRS Form 982"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form982">
          <!-- WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:22mm;">
            <div class="styFNBox" style="width:31mm;height:22mm;">
              <div style="padding-top:1mm;">
            Form<span class="styFormNumber">982</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form982Data"/>
                </xsl:call-template>
                <br/>
              </div>
              <div style="padding-top:1.5mm; font-size:6pt;">(Rev. January 2009)
          </div>
              <div style="padding-top:1mm;">
                <span class="styAgency" style="font-size:6pt;">Department of the Treasury</span>
                <br/>
                <span class="styAgency" style="font-size:6pt;">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;height:20mm;">
              <!-- Changed the title font-size to reflect the size on the pdf -->
              <div class="styMainTitle" style="height:6mm">Reduction of Tax Attributes Due to Discharge of <br> Indebtedness (and Section 1082 Basis Adjustment)</br>
              </div>
              <br/>
              <div class="styFBT" style="padding-top:3mm; font-size:7.5pt;">
                <img src="{$ImagePath}/982_Bullet.gif" alt="Bullet Image"/> Attach this form to your income tax return.<br/>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm;">
              <div class="styOMB" style="height:2mm;">
                <br/>OMB No. 1545-0046<br/>
                <br/>
              </div>
              <div class="stySequence" style="height:6mm;padding-top:1mm;">
            Attachment<br/>Sequence No. <span class="styBoldText" style="font-size:8pt;">94</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styFNBox" style="width:144mm;height:8mm;">
          Name shown on return<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styGenericDiv" style="width:42mm;height:4mm;padding-left:1mm;">
              <span class="styBoldText">Identifying number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- End Name and Identifying Number Section-->
          <!-- Begin Part I Title -->
          <div class="styBB" style="width:187mm;height: 8mm;">
            <div class="styPartName" style="margin-top: 2mm; margin-bottom: 2mm">Part I</div>
            <div class="styPartDesc" style="padding-top: 2mm">General Information
          <span class="styNormalText"> (see instructions)</span>
            </div>
          </div>
          <!-- End Part I Title -->
          <!-- Begin Part I Body -->
          <div class="styBB" style="width:187mm;">
            <!-- L1 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">1</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Amount excluded is due to (check applicable box(es)): 
          </div>
            </div>
            <!-- L1a -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of indebtedness in a title 11 case
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.        
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtInATitle11Case"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtInATitle11Case</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtInATitle11Case"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtInATitle11Case</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L1b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of indebtedness to the extent insolvent (not in a title 11 case)
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtToExtentInsolvent"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToExtentInsolvent</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtToExtentInsolvent"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToExtentInsolvent</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L1c -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of qualified farm indebtedness
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.        
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQualifiedFarmIndbt"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQualifiedFarmIndbt</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQualifiedFarmIndbt"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQualifiedFarmIndbt</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L1d -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of qualified real property business indebtedness
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQlfyRealPropBusIndbt"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyRealPropBusIndbt</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQlfyRealPropBusIndbt"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyRealPropBusIndbt</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L1e -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">e</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of qualified principal residence indebtedness
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQlfyPrincipalResidence"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyPrincipalResidence</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfQlfyPrincipalResidence"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfQlfyPrincipalResidence</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L1f -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">f</div>
              <div class="styLNDesc" style="width:170mm;height:4.5mm;">
                <label>
              Discharge of certain indebtedness of a qualified individual because of Midwestern disasters
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
              </span>
                </label>
              </div>
              <!-- Check box -->
              <div class="styLNDesc" style="width:7mm;height:4.5mm;text-align:left;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtToQlfyDsstrIndv"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToQlfyDsstrIndv</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DschrgOfIndbtToQlfyDsstrIndv"/>
                    <xsl:with-param name="BackupName">IRS982DschrgOfIndbtToQlfyDsstrIndv</xsl:with-param>
                  </xsl:call-template>
                </label>
              </div>
            </div>
            <!-- L2 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">Total amount of discharged indebtedness excluded from gross income
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4mm;">2</div>
                <div class="styLNAmountBox" style="height:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TotalAmountOfDschrgIndbt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L3 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
              <div class="styLNDesc" style="width:153mm;height:4.5mm;">Do you elect to treat all real property described in section 1221(a)(1), relating to property held for sale to customers in the ordinary course of a trade or business, as if it were depreciable property?
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <!-- Yes or No check boxes -->
              <div class="styLNDesc" style="width:15mm;height:7.5mm; padding-top=3.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                      <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:8px"/>
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                    <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                  </xsl:call-template>            
                 Yes            
              </label>
              </div>
              <div class="styLNDesc" style="width:11mm;height:7.5mm; padding-top=3.5mm;text-align:right;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                  </xsl:call-template>
                  <input type="checkbox" class="styCkbox" name="Checkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                      <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
                <span style="width:5px"/>
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form982Data/TreatAllAsDeprecPropBox"/>
                    <xsl:with-param name="BackupName">IRS982TreatAllAsDeprecPropBox</xsl:with-param>
                  </xsl:call-template>            
                 No            
              </label>
              </div>
            </div>
          </div>
          <!-- End Part I Body -->
          <!-- Begin Part II Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc" style="width:170mm;">Reduction of Tax Attributes.<span class="styNormalText"> You must attach a description of any transactions resulting in the reduction in basis under section
          1017. See Regulations sections 1.1017-1 for basis reduction ordering rules, and, if applicable, required partnership
          consent statements. (For additional information, see the instructions for Part II.)</span>
            </div>
          </div>
          <!-- End Part II Title -->
          <!-- Begin Part II Body -->
          <div class="styBB" style="width:187mm;">
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:146.75mm;height:4mm;">
                <span class="styBoldText">Enter amount excluded from gross income:</span>
              </div>
              <!-- Empty number box lines on the right -->
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4mm;"/>
              </div>
            </div>
            <!-- L4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> For a discharge of qualified real property business indebtedness, applied to reduce the basis of depreciable real property
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">4</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldForDschrgQlfyRealProp"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> That you elect under section 108(b)(5) to apply first to reduce the basis (under section 1017) of depreciable property
            <!-- Form to Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldUnderSection108b5"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.8mm; padding-top=3.5mm">5</div>
                <div class="styLNAmountBox" style="height:7.8mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldUnderSection108b5"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L6 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> Applied to reduce any net operating loss that occurred in the tax year of the discharge or carried over to the tax year of the discharge      
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">6</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToRdcNetOperatingLoss"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:7.5mm; padding-top=3.5mm">7</div>
              <div class="styLNDesc" style="width:139mm; height:7.5mm; padding-top=3.5mm">Applied to reduce any general business credit carryover to or from the tax year of the discharge
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the empty number box lines to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">7</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToRdcGeneralBusCredit"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L8 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> Applied to reduce any minimum tax credit as of the beginning of the tax year immediately after the tax year of the discharge
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">8</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToReduceMinTaxCredit"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L9 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">9</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> Applied to reduce any net capital loss for the tax year of the discharge including any capital loss carryovers to the tax year of the discharge      <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">9</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToReduceNetCapitalLoss"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L10a -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">10a</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;"> Applied to reduce the basis of nondepreciable and depreciable property if not reduced on line 5. <span class="styItalicText">DO NOT use  in the case of discharge of qualified farm indebtedness</span>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">10a</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToRdcBasisOfProperty"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L10b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top=3.5mm;padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:139mm;height:7.5mm; padding-top=3.5mm;;">Applied to reduce the basis of your principal residence. <span class="styItalicText">Enter amount here ONLY if line 1e is checked</span>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">10b</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldToRdcPrncResidence"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;">11</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">For a discharge of qualified farm indebtedness, applied to reduce the basis of:</div>
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4mm;"/>
              </div>
            </div>
            <!-- L11a -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">Depreciable property used or held for use in a trade or business, or for the production of income, if not reduced on line 5
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">11a</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/DepreciablePropertyUsedOrHeld"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11b -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top=3.5mm; padding-left:4mm;">b</div>
              <div class="styLNDesc" style="height:7.5mm; padding-top=3.5mm; width:139mm">Land used or held for use in a trade or business of farming
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">11b</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/LandUsedOrHeld"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L11c -->
            <div style="width:187mm;">
              <div class="styLNLeftLtrBox" style="height:7.5mm; padding-top=3.5mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="height:7.5mm; padding-top=3.5mm;width:139mm">Other property used or held for use in a trade or business, or for the production of income
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">11c</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/OtherPropertyUsedOrHeld"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L12 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:7.5mm; padding-top=3.5mm">12</div>
              <div class="styLNDesc" style="height:7.5mm; padding-top=3.5mm;width:139mm"> Applied to reduce any passive activity loss and credit carryovers from the tax year of the discharge
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
            </span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:7.5mm; padding-top=3.5mm">12</div>
                <div class="styLNAmountBox" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/PassiveActyLossAndCrCarryover"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- L13 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:7.5mm; padding-top=3.5mm">13</div>
              <div class="styLNDesc" style="height:7.5mm; padding-top=3.5mm;width:139mm"> Applied to reduce any foreign tax credit carryover to or from the tax year of the discharge
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:7.5mm; padding-top=3.5mm">13</div>
                <div class="styLNAmountBoxNBB" style="height:7.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form982Data/ForeignCreditCarryover"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- End Part II Body -->
          <!-- Begin Part III Title -->
          <div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
            <div class="styPartName" style="height:4mm;">Part III</div>
            <div class="styPartDesc">Consent of Corporation to Adjustment of Basis of its Property Under Section 1082(a)(2)</div>
          </div>
          <!-- End Part III Title -->
          <!-- Begin Part III Body -->
          <div style="width:187mm;">
            <div class="styNormalText" style="padding-top:1.5mm;">  
          Under section 1081(b), the corporation named above has excluded $ 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form982Data/AmtExcldUnderSectionPtIII1081B"/>
                </xsl:call-template>
              </span>
           from its gross income for the tax year beginning 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/TaxYearBeginning"/>
                </xsl:call-template>
              </span>
             , and ending 
          <span style="width:60mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/TaxYearEnding"/>
                </xsl:call-template>
              </span>
               . Under that section, the corporation consents to have the basis of its property adjusted in accordance with the regulations prescribed under section 1082(a)(2) in effect at the time of filing its income tax return for that year.  The corporation is organized under the laws of 
          <span style="width:70mm; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form982Data/StateOfIncorporation"/>
                </xsl:call-template>
              </span>
          .</div>
          </div>
          <div class="styBB" style="width:187mm;">
            <span style="width:20mm"/>
            <span style="font-size:6pt;">(State of incorporation)</span>
          </div>
          <!-- End Part III Body -->
          <!-- Note at the bottom of the page -->
          <div class="styBB" style="width:187mm;padding-top:1.5mm;padding-bottom:1.5mm;">
            <div style="font-size:9pt;">
              <span class="styBoldText">Note. </span>
              <span class="styItalicText">You must attach a description of the transactions resulting in the nonrecognition of gain under section 1081.</span>
            </div>
          </div>
          <!-- End note at the bottom of the page -->
          <!-- Begin Footer -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see page 4 of this form. </span>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>    
        Cat. No. 17066E 
        <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
            <span style="width:16px;"/>
        Form 
        <span class="styBoldText">982</span> (Rev. 1-2009)
      </div>
          <!-- End Footer -->
          <br/>
          <br class="pageEnd"/>
          <!-- Begin Left Over Table -->
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
              <xsl:with-param name="TargetNode" select="$Form982Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- End Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
