<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120PCStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120PCData" select="$RtnDoc/IRS1120PC"/>
  <xsl:param name="Form1120PCScheduleA" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleA"/>
  <xsl:param name="Form1120PCScheduleB" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleB"/>
  <xsl:param name="Form1120PCScheduleC" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleC"/>
  <xsl:param name="Form1120PCScheduleE" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleE"/>
  <xsl:param name="Form1120PCScheduleF" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleF"/>
  <xsl:param name="Form1120PCScheduleG" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleG"/>
  <xsl:param name="Form1120PCScheduleH" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleH"/>
  <xsl:param name="Form1120PCScheduleI" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleI"/>
  <xsl:param name="Form1120PCScheduleL" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleL"/>
  <xsl:param name="Form1120PCScheduleM1" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleM1"/>
  <xsl:param name="Form1120PCScheduleM2" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleM2"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120PCData)"/>
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
        <meta name="Description" content="IRS Form 1120PC"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--EXCEPTION: the value of this pen and ink image will not be display at the Additional data section becz the text is being display on the line inside the form -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120PCStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <!-- Form Header -->
        <form name="Form1120-PC">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;">
            <!--Form box begin -->
            <div class="styFNBox" style="width:33.3mm;height:18mm;">
                    Form <span class="styFormNumber" style="font-size:18pt">1120-PC</span>
              <!-- Form to Form Link (Push Pin plus pen and ink) -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCData"/>
              </xsl:call-template>
              <span style="width:3px;"/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Top Left Header - Suport Statement Consolidated Return Indicator</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1120PCData/@SuprtStmtConsolidatedReturnInd"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <!--Form box end -->
            <div class="styFTBox" style="width:120mm;height:18mm;">
              <div class="styMainTitle" style="height:8mm;">U.S. Property and Casualty Insurance Company Income Tax Return</div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                    For calendar year 2008 or tax year beginning
                    <span style="width: 18mm;border-bottom:1 solid black;">
                  <!-- No need to send the parameters -->
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxYearBeginning"/>
                  </xsl:call-template>
                </span>,
                      ending 
                      <span style="width: 18mm;border-bottom:1 solid black;">
                  <!-- No need to send the parameters -->
                  <xsl:call-template name="PopulateMonthDayYear">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxYearEnding"/>
                  </xsl:call-template>
                </span>
                <br/>
                <span style="text-align:center;">
                  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
                        See separate instructions.
                      </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:18mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-1027</div>
              <div class="styTY" style="height:11mm;">20<span class="styTYColor">08</span>
              </div>
            </div>
          </div>
          <!--Return Header End -->
          <!-- Header Line A 1 -->
          <div style="width:187mm;float:left;clear:left;">
            <div style="width:31mm;height:29mm;float:left;clear:left;">
              <div class="styComType" style="width:33mm;border-bottom-width: 0px;">
                <div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
                <div class="styGenericDiv" style="height:3mm;width:26mm;">Check if:</div>
              </div>
              <div class="styComType" style="width:33mm;border-bottom:0px;">
                <div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">1</div>
                <div class="styGenericDiv" style="height:5mm;width:26mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/IsConsolidatedReturn"/>
                      <xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
                    </xsl:call-template>
                          Consolidated return (attach Form 851)
                        <!-- Form to Form Link -->
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/IsConsolidatedReturn"/>
                    </xsl:call-template>
                  </label>
                </div>
                <div class="styGenericDiv">
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/IsConsolidatedReturn"/>
                      <xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <br/>
              <br/>
              <!-- Header Line A 2 -->
              <div class="styComType" style="width:33mm;border-bottom:0px;">
                <div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">2</div>
                <div class="styGenericDiv" style="height:5mm;width:26mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/LifeNonlifeConsolidatedReturn"/>
                      <xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
                    </xsl:call-template>
                          Life-nonlife consolidated return
                        </label>
                </div>
                <div class="styGenericDiv">
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/LifeNonlifeConsolidatedReturn"/>
                      <xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <br/>
              <br/>
              <!-- Header Line A 3 -->
              <div class="styComType" style="width:33mm;border-bottom:1 solid black;">
                <div class="styBoldText" style="height:8.7mm;width:4mm;float:left;clear:none;">3</div>
                <div class="styGenericDiv" style="height:8.7mm;width:26mm;">
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/ScheduleM3"/>
                      <xsl:with-param name="BackupName">IRS1120ScheduleM3Required</xsl:with-param>
                    </xsl:call-template>
                          Schedule M-3 (Form 1120PC) attached
                              <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/ScheduleM3"/>
                    </xsl:call-template>
                  </label>
                </div>
                <div class="styGenericDiv">
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/ScheduleM3"/>
                      <xsl:with-param name="BackupName">IRS1120ScheduleM3Required</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
            </div>
            <!--Close Line A1 Second Line -->
            <!-- return header Name box -->
            <div class="styLblNameAddr" style="width:106mm;height:28mm; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;">
              <div class="styUseLbl" style="width:12mm;height:29.5mm;border-right-width:0px;padding-top:5mm;">
                  Please<br/> print<br/> or<br/> type</div>
              <div class="styNameAddr" style="width:93.5mm;height:8.5mm;border-left-width:1px;padding-left:3mm;">
                 Name<br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/Name/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/Name/BusinessNameLine2"/>
                </xsl:call-template>
              </div>
              <!-- return header Adress box -->
              <div class="styNameAddr" style="width:93.5mm;height:9.5mm;border-left-width:1px;padding-left:3mm">
                Number, street, and room or suite no. If a P.O. box, see instructions.
                    <!-- Address -->
                <!-- USA Address -->
                <br/>
                <xsl:if test="$Form1120PCData/USAddress/AddressLine1!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/USAddress/AddressLine1"/>
                  </xsl:call-template>
                  <br/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/USAddress/AddressLine1!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/USAddress/AddressLine2"/>
                  </xsl:call-template>
                  <br/>
                </xsl:if>
                <!-- Foreign Address -->
                <xsl:if test="$Form1120PCData/ForeignAddress/AddressLine1!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/AddressLine1"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/ForeignAddress/AddressLine2!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/AddressLine2"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
              </div>
              <div class="styNameAddr" style="border-bottom-width:0px;width:91mm;height:11mm;border-left-width:1px;padding-left:3mm">
                City or town, state, and ZIP code
                <!-- USA Address -->
                <xsl:if test="$Form1120PCData/USAddress/City!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/USAddress/City"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/USAddress/State!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/USAddress/State"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/USAddress/ZIPCode!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/USAddress/ZIPCode"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <!-- Foreign Address -->
                <xsl:if test="$Form1120PCData/ForeignAddress/City!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/City"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/ForeignAddress/ProvinceOrState!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/ProvinceOrState"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/ForeignAddress/PostalCode!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/PostalCode"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/ForeignAddress/Country!=''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignAddress/Country"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </xsl:if>
              </div>
            </div>
            <!-- EIN B Line -->
            <!-- Since this is a main form, we must check for and display an updated EIN.  
          To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
            <div class="styEINDateAssets" style="width:48mm;height:8.5mm;">
              <span class="styBoldText">B Employer identification number</span>
              <br/>
              <br/>
              <span style="padding-left:15mm">
                <xsl:if test="$Form1120PCData/EIN !=' '">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/EIN"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:if>
                <xsl:if test="$Form1120PCData/MissingEINReason!=' '">
                  <span style="font-weight:normal;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/MissingEINReason"/>
                    </xsl:call-template>
                  </span>
                </xsl:if>
              </span>
            </div>
            <!-- Header C Date incorparated -->
            <div class="styEINDateAssets" style="width:48mm;height:9.5mm;">
              <span class="styBoldText">C </span>Date incorporated<br/>
              <br/>
              <span class="styEINFld" style="padding-left:15mm;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/DateIncorporated"/>
                </xsl:call-template>
              </span>
            </div>
            <!-- Header D Date incorparated -->
            <div class="styEINDateAssets" style="width:48mm;height:8.75mm;border-bottom-width:0px;">
              <span class="styBoldText">D </span>Check applicable box if an election <br/>
              <span style="padding-left:2.5mm">  has been made under section(s):</span>
              <br/>
            </div>
          </div>
          <!--close what area?-->
          <!-- Header E -->
          <div class="styBB" style="width:187mm;border-right-width:0px">
            <div class="styBB" style="border-right-width:1px;border-bottom-width:0px;">
              <!-- E 1 -->
              <div class="styGenericDiv" style="width:139mm;">
                <div class="styBoldText" style="float:left;clear:none">E</div>
                Check if: <span style="width:3mm;"/>
                <span class="styBoldText">(1)</span>
                <span style="width:3px;"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/InitialReturn"/>
                    <xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/InitialReturn"/>
                    <xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
                  </xsl:call-template>
                  Final return
                </label>
                <!-- E 2 -->
                <span style="width:8px"/>
                <span class="styBoldText">(2)</span>
                <span style="width:3px;"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/FinalReturn"/>
                    <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/FinalReturn"/>
                    <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
                  </xsl:call-template>
                Name change
                </label>
                <!-- E 3 -->
                <span style="width:8px"/>
                <span class="styBoldText">(3)</span>
                <span style="width:3px;"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AddressChange"/>
                    <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AddressChange"/>
                    <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
                  </xsl:call-template>
                  Address change
          </label>
                <!--E 4 -->
                <span style="width:8px"/>
                <span class="styBoldText">(4)</span>
                <span style="width:3px;"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AmendedReturn"/>
                    <xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AmendedReturn"/>
                    <xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
                  </xsl:call-template>
                Amended return  <span style="width:2px;hight:1mm"/>
                </label>
              </div>
            </div>
            <!--Check box for Box D -->
            <span style="padding-left:3px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953C3C"/>
                <xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953C3C"/>
                <xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
              </xsl:call-template>
              953(c)(3)(C)
          </label>
            <span style="padding-left:3px;"/>
            <input type="checkbox" class="styCkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D"/>
                <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D"/>
                <xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
              </xsl:call-template>
                953(d)
          </label>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D"/>
            </xsl:call-template>
            <!--Pen and Ink 953D indicator-->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line D - Section 953D Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D/@Section953DIndicator"/>
            </xsl:call-template>
            <!--Pen and Ink 953D Amount -->
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line D - Section 953D Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D/@Section953DAmount"/>
            </xsl:call-template>
          </div>
          <!--close what line ? -->
          <!--BEGIN Main Form Tax Computation and Payments Section-->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div class="styIRS1120PCVTImageBox" style="height:150.5mm;padding-top:14mm;">
              <div style="width:2mm;height:35mm;"/>
              <img src="{$ImagePath}/1120PC_TaxComputation.gif" alt="VerticalIncome"/>
            </div>
            <div style="width:000mm;float:right;clear:none;"/>
            <!--line 1 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">1</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                                                        Taxable income (Schedule A, line 37)
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
                                                      </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">1</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxableIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 2 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                                                        Taxable investment income for electing small companies (Schedule B, line 21)
                                                    <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:left;clear:none">
                <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxableInvestmentIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line3 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">3</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Check if a member of a controlled group (attach Schedule O (Form 1120))
            <!--Need to add a pushpin here for Schedule O -->
                  <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/MemberOfControlledGroup"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <span style="width:3.5mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/MemberOfControlledGroup"/>
                      <xsl:with-param name="BackupName">IRS1120PCMemberOfControlledGroup</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 4 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Income tax
      <!-- Form to Form Link (Push Pin plus pen and inks) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax"/>
                  </xsl:call-template>
                  <span style="width:1mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - Section 1291 Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section1291Indicator"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - Section 197 Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section197Indicator"/>
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
                  </span>
                </div>
              </div>
              <div style="width:40mm;float:left;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 5 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
            Enter amount of tax that a reciprocal must include
            <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AmountTaxReciprocalMustInclude"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:left;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AmountTaxReciprocalMustInclude"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 6 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Alternative minimum tax (attach Form 4626)
            <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AlternativeMinimumTax"/>
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
            </span>
                  <span style="width:2px;"/>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/AlternativeMinimumTax"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 7 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">7</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Add lines 4 through 6
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
              </div>
              <div style="width:40mm;float:right;clear;none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxesPlusAltMinimumTax"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 8a -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 2.25mm;">8a</div>
                <div class="styLNDesc" style="width:92mm;height:4mm;">
            Foreign tax credit (attach Form 1118)
          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignTaxCredit"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
                <div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignTaxCredit"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="width:40mm;float:left;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 8b -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;"> b</div>
                <div class="styLNDesc" style="width:92mm;height:4mm;">
                                                        Credits from Forms 8834
                                                          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8834"/>
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
                                                      </span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;">8b</div>
                <div class="styLNAmountBox" style="height:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8834"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.50mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.50mm;"/>
              </div>
            </div>
            <!-- line 8c -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;"> c</div>
                <div class="styLNDesc" style="width:92mm;height:4mm;">
                                                        General business credit (attach Form 3800)
                                                        <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/GeneralBusinessCredit"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                                                        <span style="width:16px"/>.
                                                        <span style="width:16px"/>.
                                                        <span style="width:16px"/>.
                                                   <span style="width:16px"/>.
                                                      </span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;">8c</div>
                <div class="styLNAmountBox" style="height:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/GeneralBusinessCredit"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.50mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.50mm;"/>
              </div>
            </div>
            <!-- line 8d -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">d</div>
                <div class="styLNDesc" style="width:92mm;height:4mm;">
            Credit for prior year minimum tax (attach Form 8827)
          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearMinimumTaxCredit"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
                <div class="styLNRightNumBox" style="height:4.5mm;">8d</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearMinimumTaxCredit"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
              <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
            </div>
            <!-- line 8e -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">e</div>
                <div class="styLNDesc" style="width:92mm;height:4mm;">
                                                      Bond credits from Form 8912
                                                      <!--<span style="width:2mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8860"/>
                      <xsl:with-param name="BackupName">IRS1120PCCreditFromForm8860</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8860"/>
                      <xsl:with-param name="BackupName">IRS1120PCCreditFromForm8860</xsl:with-param>
                    </xsl:call-template>
             Form 8860
          </label>
                   Form to Form Link (Push Pin) 
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8860"/>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8912"/>
                      <xsl:with-param name="BackupName">IRS1120PCCreditFromForm8912</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/CreditFromForm8912"/>
                      <xsl:with-param name="BackupName">IRS1120PCCreditFromForm8912</xsl:with-param>
                    </xsl:call-template>
             Form 8912
          </label>-->
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/BondCreditsFromForm8912"/>
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
            </span>
                </div>
                <div class="styLNRightNumBox" style="height:4.5mm;">8e</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/BondCreditsFromForm8912"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="width:40mm;float:left;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 8f -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">f</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
                  <b>Total credits.</b> Add lines 8a through 8e
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">8f</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TotalCredits"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 9 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">9</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
          Subtract line 8f from line 7
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxLessTotalCredits"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 10 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">10</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Foreign corporations&#151;Tax on income not connected with U.S. business
            <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignCorpTaxOnIncomeNotUS"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">10</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignCorpTaxOnIncomeNotUS"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 11 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">11</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Personal holding company tax (attach Schedule PH (Form 1120))
            <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PersonalHoldingCompanyTax"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none">
                <div class="styLNRightNumBox" style="height:4.5mm;">11</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PersonalHoldingCompanyTax"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 12 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">12</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
            Other taxes. Check if from:
        <span style="width:2mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm4255"/>
                      <xsl:with-param name="BackupName">IRS1120PCTaxFromForm4255</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm4255"/>
                      <xsl:with-param name="BackupName">IRS1120PCTaxFromForm4255</xsl:with-param>
                    </xsl:call-template>
             Form 4255
          </label>
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm4255"/>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm8611"/>
                      <xsl:with-param name="BackupName">IRS1120PCTaxFromForm8611</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm8611"/>
                      <xsl:with-param name="BackupName">IRS1120PCTaxFromForm8611</xsl:with-param>
                    </xsl:call-template>
             Form 8611
          </label>
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxFromForm8611"/>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherTaxes"/>
                      <xsl:with-param name="BackupName">IRS1120PCOtherTaxes</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherTaxes"/>
                      <xsl:with-param name="BackupName">IRS1120PCOtherTaxes</xsl:with-param>
                    </xsl:call-template>
             Other (attach schedule)
          </label>
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherTaxes"/>
                  </xsl:call-template>
                  <!--Dotted Line
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>-->
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none">
                <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TotalOtherTaxes"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 13 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">13</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
                  <b>Total tax.</b> Add lines 9 through 12
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TotalTax"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TotalTax"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 14a -->
            <div style="width:181mm;">
              <div style="float:left;clear:none">
                <div class="styLNLeftNumBox" style="height:4mm;">14a</div>
                <div class="styLNDesc" style="width:53mm;height:4mm;">
                                                  2007 overpayment credited to 2008
                                                  </div>
                <div class="styLNRightNumBox" style="height:4mm;">14a</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearOverpaymentCredit"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styShadingCell" style="width:40mm;height:4.5mm;border-left-width:0px;"/>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
              </div>
            </div>
            <!-- line 14b -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:8.5mm;padding-left: 4.25mm;">b</div>
                <div class="styLNDesc" style="width:53mm;height:8.5mm;font-size:7pt;">
                                                  Prior year(s) special estimated tax payments to be applied
                                                  <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearEstimatedTaxPayments"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                                                          <span style="width:16px"/>.
                                                          <span style="width:16px"/>.
                                                    </span>
                </div>
                <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">14b</div>
                <div class="styLNAmountBox" style="height:8.5mm;border-right-width:1px;padding-top:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearEstimatedTaxPayments"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styShadingCell" style="width:40mm;height:8.5mm;border-left-width:0px;"/>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;"/>
              </div>
            </div>
            <!-- line 14c -->
            <div style="width:181mm;">
              <div style="float:left; clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">c</div>
                <div class="styLNDesc" style="width:53mm;height:4mm;font-size:6pt;">
                                                  2008 estimated tax payments (see instructions)
                                                      </div>
                <div class="styLNRightNumBox" style="height:4mm;">14c</div>
                <div class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/EstimatedTaxPayments"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;border-left-width: 0px;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;border-left-width: 0px;"/>
                <!--<div class="styShadingCell" style="width:40mm;height:4.5mm;border-left-width:0px;"></div>-->
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14d -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">d</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
                                                    2008 special estimated tax payments (Do not include on line 14f)
                                                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14d</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/SpecialEstimatedTaxPayments"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14e -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">e</div>
                <div class="styLNDesc" style="width:53mm;height:4mm;font-size:6pt;">
                                                  2008 refund applied for on Form 4466
                                                <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/RefundAppliedFor"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                </div>
                <div class="styLNRightNumBox" style="height:4mm;">14e</div>
                <div class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateNegativeNumber">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/RefundAppliedFor"/>
                  </xsl:call-template>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styShadingCell" style="width:40mm;height:4.5mm;border-left-width:0px;"/>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14f -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">f</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
                                                    Enter the total of lines 14a through 14c less line 14e
                                                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                                                          <span style="width:16px"/>.
                                                          <span style="width:16px"/>.
                                                    </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14f</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/SubTotalCredits"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14g -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">g</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
                                                    Tax deposited with Form 7004
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
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14g</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TaxDepositedWithForm7004"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14h -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">h</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;font-size:6pt;">
                                                    Credit by reciprocal for tax paid by attorney-in-fact under section 835(d)
                                                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14h</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/ReciprocalTaxPaidSection835d"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14i  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">i</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
                  Other credits and payments
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPayments"/>
                  </xsl:call-template>
                  <span style="width:1mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 14i - Backup Withholding Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPayments/@backupWithholdingIndicator"/>
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
                  </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;width:8mm;">14i</div>
                <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPayments"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
              </div>
            </div>
            <!-- line 14j  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">j</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
                                                    Refundable credits from Form 3800, line 19c, and Form 8827, line 8c
                                                    <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/RefundableCredits"/>
                  </xsl:call-template>
                  <span style="width:1mm;"/>
                  <!--<xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 14i - Backup Withholding Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/RefundableCredits/@backupWithholdingIndicator"/>
                  </xsl:call-template>-->
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
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:7.5mm;width:8mm;padding-top:3.5mm;">14j</div>
                <div class="styLNAmountBox" style="height:7.5mm;width:32mm;padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/RefundableCredits"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;;">14k</div>
                <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/TotalPayments"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line15 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">15</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
                                                        Estimated tax penalty (see instructions). Check if Form 2220 is attached
                                                        <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220Attached"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                                                            <span style="width:16px"/>.
                                                <span style="width:16px"/>.
                                                            <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <span style="width:3.5mm;"/>
                  <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220Attached"/>
                      <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/EstimatedTaxPenalty"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line16 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">16</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
                  <b>Amount owed.</b> If line 14k is smaller than the total of lines 13 and 15, enter amount owed
                <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
          </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">16</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/BalanceDue"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line17 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">17</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
                  <b>Overpayment.</b> If line 14k is larger than the total of lines 13 and 15, enter amount overpaid 
                <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
          </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">17</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/OverpaymentAmount"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- line 18 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none">
                <div class="styLNLeftNumBox" style="height:4mm;">18</div>
                <div class="styLNDesc" style="width:86mm;height:4mm;">
                  <span style="font-size:6pt;">
                                                    Enter amount from line 17: 
                    <!-- Form to Form Link -->
                  </span>
                  <span class="styBoldText">Credited to 2009 estimated tax</span>
                  <span style="width:2px"/>
                  <!--/span-->
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styGenericDiv" style="width:28mm;height:4mm;font-size:6pt; padding-top:1mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/CreditElect"/>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="width:18mm;height:4mm;font-size:6pt;">
                  <span class="styBoldText">Refunded</span>
                  <!-- Form to Form Link Push Pin-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/Refund"/>
                  </xsl:call-template>
                  <span style="width:4px"/>
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:4.5mm;">18</div>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/Refund"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!--END of Tax Computation and Payments Section-->
          <br class="pageEnd"/>
          <!-- BEGIN Signature Section -->
          <!-- Implementing the signature section as a table -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
            <tr>
              <td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
              <td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
            </tr>
            <tr>
              <td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
                <img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
              </td>
              <td style="width:52mm;border-right:1 solid black;border-bottom:1 solid black;vertical-align:bottom;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
                </xsl:call-template>
                <span style="width:1px;"/>
              </td>
              <td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:.5mm;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                </xsl:call-template>
              </td>
              <td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
                <img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
              </td>
              <td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">Title</xsl:with-param>
                </xsl:call-template>
              </td>
              <td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
                <div class="styGenericDiv" style="width:2px;"/>
                <div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;border-top:3 solid black;float:right;" class="styGenericDiv">    
            May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
              <input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
                    <xsl:call-template name="PopulateReturnHeaderOfficer">
                      <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
                      <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span class="styBoldText">
                    <label for="dummyidyes">
                      <xsl:call-template name="PopulateReturnHeaderOfficer">
                        <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
                        <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                      </xsl:call-template>
                      Yes
                  </label>
                  </span>
                  <input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderOfficer">
                      <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
                      <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span class="styBoldText">
                    <label for="dummyidno">
                      <xsl:call-template name="PopulateReturnHeaderOfficer">
                        <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
                        <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
                      </xsl:call-template>
                    No
                  </label>
                  </span>
                </div>
              </td>
            </tr>
            <tr>
              <td style="border-bottom:1 solid black;vertical-align:top;">Signature of officer      </td>
              <td style="border-bottom:1 solid black;vertical-align:top;">Date</td>
              <td style="border-bottom:1 solid black;vertical-align:top;">Title</td>
            </tr>
          </table>
          <!-- END Signature Section -->
          <!-- BEGIN PREPARER SIGNATURE SECTION -->
          <!-- Implementing the Preparer section in table -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;">
            <tr>
              <td rowspan="3" style="width:18mm;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;">Paid Preparer's Use Only</td>
              <td style="width:32mm;border-bottom:1 solid black;">
                <span style="width:13mm;padding-left:1mm;" class="styGenericDiv">Preparer's <br/>signature</span>
                <span class="styGenericDiv" style="border:0 solid red;">
                  <img src="{$ImagePath}/1120_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
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
              <td style="width:35mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
                <nobr>
                  <label for="dummyid1">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
                      <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                    </xsl:call-template>
                  Check if <br/> self-employed
              </label>
                </nobr>
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
              <td rowspan="2" colspan="1" style="border-bottom:2px solid black;padding-left:.5mm;">
                <span class="styGenericDiv" style="padding-right:.5mm;">Firm's name (or <br/>yours if self-employed),<br/> address, and ZIP code</span>
                <span class="styGenericDiv" style="">
                  <img src="{$ImagePath}/1120_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
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
              <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
            <tr>
              <td colspan="3" style="border-bottom:2px solid black;border-right:1 solid black;padding-left:.5mm;">
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
              <td style="border-bottom:2px solid black;padding-left:1mm;"> Phone no. 
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
          <!-- Page 1 Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
              <span style="width:13mm;"/>                        
       Cat. No. 64270Q 
    </div>
            <div style="float:right;">
              <span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
    </div>
          </div>
          <!-- END Page 1 Break and Footer-->
          <!--Begin Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page 2 Header -->
          <!-- BEGIN Schedule A Title -->
          <div class="styBB" style="width:187mm;border-top:1px solid black;">
            <div class="styPartName" style="width:23mm;">Schedule A</div>
            <div class="styPartDesc" style="width:164mm;">Taxable Income&#151;Section 832  
      <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Schedule A Title -->
          <!--BEGIN Main Form Income Section-->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1120PCVTImageBox" style="height:97mm;text-align:center;padding-top:24mm;">
              <div style="width:2mm;height:16mm;"/>
              <img src="{$ImagePath}/1120PC_Income.gif" alt="VerticalIncome"/>
            </div>
            <div style="width:000mm;float:right;clear:none;"/>
            <!--Sch A line 1 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">1</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Premiums earned (Schedule E, line 7)
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">1</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/PremiumsEarnedTaxableIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 2 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Dividends (Schedule C, line 14)
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
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:5mm;">2</div>
                <div class="styLNAmountBox" style="height:5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Dividends"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line a and b  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="width:68mm;height:8mm;"/>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;border-top:1px solid black;text-align:center;padding-top:2mm;">
                  <b>(a)</b> Interest received </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;border-top:1px solid black;text-align:center;">
                  <b>(b)</b> Amortization of premium </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch A line 3a  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm;padding-top:4mm;">3a</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Gross interest
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
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossInterestReceived"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossInterestAmortzOfPremium"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;width:8mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;width:32mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch A line 3b  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">b</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Interest exempt under section 103
          <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestExemptUnderSection103"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestExemptAmortzOfPremium"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch A line 3c  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">c</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Subtract line 3b from line 3a
        <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossIntRcvdLessIntExemptRcvd"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossIntAmortzLessIntExempt"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBox" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch A line 3d -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">d</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Taxable interest. Subtract line 3c, column (b) from line 3c, column (a)
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">3d</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxableInterest"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 4 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gross rents
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
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossRents"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 5 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gross royalties
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
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossRoyalties"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 6 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Capital gain net income (attach Schedule D (Form 1120))
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CapitalGainNetIncome"/>
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
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CapitalGainNetIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 7 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetGainLoss"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetGainLoss"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 8 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">8</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Certain mutual fire or flood insurance company premiums (section 832(b)(1)(D))
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">8</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/FireOrFloodInsurancePremiums"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 9 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">9</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Income on account of special income and deduction accounts
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialIncAndDeductionAccounts"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 10 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">10</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Income from protection against loss account (see instructions)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IncomeFromPALAccount"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">10</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IncomeFromPALAccount"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 11 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">11</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Mutual interinsurers or reciprocal underwriters&#151;decrease in subscriber accounts
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">11</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/MutualIntInsRcprclUndwrtDecr"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 12 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">12</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Income from a special loss discount account (attach Form 8816)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IncmFromSpecialLossDscntAcct"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IncmFromSpecialLossDscntAcct"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 13 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">13</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Other income (attach schedule)
         <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncome"/>
                  </xsl:call-template>
                  <span style="width:1mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Schedule A Line 13 - Other Income Item</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncome/@otherIncomeItem"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 14 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">14</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Gross income. Add lines 1 through 13
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:4mm;">14</div>
                <div class="styLNAmountBoxNBB" style="height:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!--END Schedule A Income Section-->
          <!--BEGIN Schedule A Deduction Section-->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1120PCVTImageBox" style="height:129.5mm;padding-top:13mm;">
              <div style="width:2mm;"/>
              <img src="{$ImagePath}/1120PC_Deductions_limitations.gif" alt="VertDeductions"/>
            </div>
            <!--Sch A line 15 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">15</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Compensation of officers (attach schedule) (see instructions)
         <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CompensationOfOfficers"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CompensationOfOfficers"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 16 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">16</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Salaries and wages (less employment credits)
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">16</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SalariesAndWages"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 17 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">17</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Agency balances and bills receivable that became worthless during the tax year
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">17</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/AgencyBalancesAndBills"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 18 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">18</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Rents
         <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Rents"/>
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
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">18</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Rents"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 19 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">19</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Taxes and licenses
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">19</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxesAndLicenses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Schedule A line 20  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">20a</div>
                <div class="styLNDesc" style="width:20mm;height:4mm;">Interest
        <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestDeductions"/>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
                <div class="styLNAmountBox" style="width:24mm;height:4.5mm;border-top-width:0px; border-bottom-width:1px;border-left-width:0px; border-right-width: 0px;font-size:6pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestDeductions"/>
                  </xsl:call-template>
                </div>
                <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;width:4mm">b</div>
                <div class="styLNDesc" style="width:44mm;height:4mm;padding-left:2.5mm;"> Less tax-exempt interest exp.</div>
                <div class="styLNAmountBox" style="width:26mm;height:4.5mm;border-top-width:0px; border-bottom-width:1px;border-left-width:0px; border-right-width: 0px;font-size:6pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/LessTaxExemptInterest"/>
                  </xsl:call-template>
                </div>
                <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;width:14.2mm;font-weight:bold;">c 
            <span style="font-weight=normal">Bal.</span>
                  <span style="padding-left:1mm"/>
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">20c</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Balance"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 21 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">21</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Charitable contributions
         <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CharitableContributions"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">21</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CharitableContributions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 22 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">22</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Depreciation (attach Form 4562)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Depreciation"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">22</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Depreciation"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 23 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">23</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Depletion
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Depletion"/>
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
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">23</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/Depletion"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 24 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">24</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Pension, profit-sharing, etc., plans
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">24</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/PensionProfitSharingPlans"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 25 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">25</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Employee benefit programs
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">25</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/EmployeeBenefitPrograms"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 26 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">26</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Losses incurred (Schedule F, line 14)
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">26</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/LossesIncurred"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 27 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">27</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Additional deduction (attach Form 8816)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/AdditionalDeduction"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">27</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/AdditionalDeduction"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 28 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">28</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Other capital losses (Schedule G, line 12, column (g))
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">28</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherCapitalLosses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 29 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">29</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Dividends to policyholders
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">29</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DividendsToPolicyHolders"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 30 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">30</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Mutual interinsurers or reciprocal underwriters—increase in subscriber accounts
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">30</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/MutualIntInsUndwrtIncrease"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 31 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">31</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Other deductions (see instructions) (attach schedule)
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherDeductions"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">31</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherDeductions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 32 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">32</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Total deductions. Add lines 15 through 31
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDeductions"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">32</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDeductions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 33 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">33</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                  <b>Subtotal.</b> Subtract line 32 from line 14
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">33</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DeductionsSubtotal"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 34a line 1 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">34a</div>
                <div class="styLNDesc" style="height:4mm;width:133mm;">
          Special deduction for section 833 organizations (Schedule H, 
        </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
              </div>
            </div>
            <!-- Schedule A line 34a line2 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;"/>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
          line 6)
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
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">34a</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialDeductionSection833Org"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
              </div>
            </div>
            <!-- Schedule A line 34b -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">b</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
          Deduction on account of special income and deduction accounts
          <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">34b</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DedOnSpecialIncomeAndDedAcct"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBox" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
              </div>
            </div>
            <!--Sch A line 34c -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">c</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Total. Add lines 34a and 34b
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">34c</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalSpecialDeductions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 35 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">35</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                  <b>Subtotal.</b> Subtract line 34c from line 33
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">35</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SubtotalSpecialDeductions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- Schedule A line 36a -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">36a</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
          Dividends-received deduction (Schedule C, line 25)
          <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">36a</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DividensReceivedDeductionSchA"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBoxNBB" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
              </div>
            </div>
            <!-- Schedule A line 36b -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">b</div>
                <div class="styLNDesc" style="width:93mm;height:4mm;">
          Net operating loss deduction
          <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetOperatingLossDeduction"/>
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
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">36b</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetOperatingLossDeduction"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;"/>
                <div class="styLNAmountBox" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
              </div>
            </div>
            <!--Sch A line 36c -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">c</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Total. Add lines 36a and 36b
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">36c</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDividendsAndNOLDeduction"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch A line 37 -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">37</div>
                <div class="styLNDesc" style="width:133mm;height:8mm;padding-top:4mm;">
                  <b>Taxable income</b> (subtract line 36c from line 35). Enter here and on page 1, line 1
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">37</div>
                <div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxableIncomeSchA"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!--END Main Form Deductions Section-->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
     </div>
          </div>
          <!-- END Page Break and Footer-->
          <!--Begin Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- BEGIN Schedule B Title -->
          <div class="styBB" style="width:187mm;border-top:1px solid black;">
            <div class="styPartName" style="width:23mm;">Schedule B</div>
            <div class="styPartDesc" style="width:164mm;">Part I&#151;Taxable Investment Income of Electing Small Companies&#151;Section 834
      <span class="styNormalText" style="font-size:6.5pt;">(see instructions)</span>
            </div>
          </div>
          <!-- END Schedule B Title -->
          <!--BEGIN Main Schedule B Income Section-->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1120PCVTImageBox" style="height:70.5mm;padding-top:14mm;">
              <div style="width:2mm;height:14mm;"/>
              <img src="{$ImagePath}/1120PC_Income.gif" alt="VerticalIncome"/>
            </div>
            <div style="width:000mm;float:right;clear:none;"/>
            <!--Sch B line a and b  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="width:68mm;height:8mm;"/>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:center;padding-top:2mm;">
                  <b>(a)</b> Interest received </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:center;">
                  <b>(b)</b> Amortization of premium </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch B line 1a  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm;padding-top:4mm;">1a</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Gross interest
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
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentGrossInterestRcvd"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentGrossInterestAmortz"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch B line 1b  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">b</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Interest exempt under section 103
          <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentInterestExemptRcvd"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentInterestExemptAmortz"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch B line 1c  -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">c</div>
                <div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
        Subtract line 1b from line 1a
        <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvstGrossIntRcvdLessIntExempt"/>
                  </xsl:call-template>
                </div>
                <div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvstGrossIntAmortzLessInt"/>
                  </xsl:call-template>
                </div>
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
              </div>
            </div>
            <!--Sch B line 1d -->
            <div style="width:181mm;">
              <div style="float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">d</div>
                <div class="styLNDesc" style="width:132mm;height:4mm;">
          Taxable interest. Subtract line 1c, column (b) from line 1c, column (a)
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            <!--  <span style="width:16px"></span>. -->
                  </span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">1d</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentTaxableInterest"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 2 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Dividends (Schedule C, line 14)
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
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentDividends"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 3 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gross rents
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentGrossRents"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 4 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gross royalties
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentGrossRoyalties"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 5 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gross income from a trade or business, other than an insurance business, and from Form 4797
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossIncomeFromTradeOrBusiness"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 6 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Income from leases described in sections 834(b)(1)(B) and 834(b)(1)(C)
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/IncomeFromLeases"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 7 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">7</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Gain from Schedule D (Form 1120), line 14
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GainFromScheduleD"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 8 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">8</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                  Gross investment income. Add lines 1d through 7
                  <!-- Form to Form Link (Push Pin plus pen and ink) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncome"/>
                  </xsl:call-template>
                  <span style="width:1mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Form 1120PC - Schedule B Line 8 - PAL Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncome/@PALIndicator"/>
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
                  </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:1mm;">8</div>
                <div class="styLNAmountBoxNBB" style="height:5mm;padding-top:1mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!--END Schedule B Income Section-->
          <!--BEGIN Schedule B Deduction Section-->
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1120PCVTImageBox" style="height:62.5mm;padding-top:5mm;">
              <div style="width:2mm;height:17mm;"/>
              <img src="{$ImagePath}/1120PC_Deductions.gif" alt="VertDeductions"/>
            </div>
            <!--Sch B line 9 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Real estate taxes
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateTaxes"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 10 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">10</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Other real estate expenses
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">10</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherRealEstateExpenses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 11 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">11</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Depreciation (attach Form 4562)
          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentDepreciation"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">11</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentDepreciation"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 12 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">12</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Depletion
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
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentDepletion"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 13 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">13</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
         Trade or business deductions as provided in section 834(c)(8) (attach schedule)
         <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TradeOrBusinessDeductions"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TradeOrBusinessDeductions"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 14 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">14</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Interest
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
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">14</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InterestInvestment"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 15 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">15</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Other capital losses (Schedule G, line 12, column (g))
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherCapitalLosses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 16 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">16</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Total. Add lines 9 through 15
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">16</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestment"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 17 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">17</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Investment expenses (attach schedule)
          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentExpenses"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">17</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentExpenses"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 18 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">18</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
                  <b>Total deductions.</b> Add lines 16 and 17
          <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalDeductionsInvestment"/>
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">18</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalDeductionsInvestment"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 19 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">19</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Subtract line 18 from line 8
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
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">19</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvstIncomeLessTotalDed"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 20 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:4mm;">20</div>
                <div class="styLNDesc" style="width:133mm;height:4mm;">
          Dividends-received deduction (Schedule C, line 25)
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
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBox" style="height:4.5mm;">20</div>
                <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DividendsReceivedDeduction"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--Sch B line 21 -->
            <div style="width:181mm;">
              <div style="width:141mm;float:left;clear:none;">
                <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">21</div>
                <div class="styLNDesc" style="width:133mm;height:8mm;padding-top:4mm;">
                  <b>Taxable investment income.</b> Subtract line 20 from line 19. Enter here and on page 1, line 2
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </div>
              </div>
              <div style="width:40mm;float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:8.5mm;padding-top:4mm;">21</div>
                <div class="styLNAmountBoxNBB" style="height:8.5mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TaxableInvestmentIncome"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!--END Main Form Deductions Section-->
          <!-- BEGIN Part II -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="width:164mm;padding-left:0mm;">Part II - Invested Assets Book Values<br/>
      (Complete only if claiming a deduction for general expenses allocated to investment income.) 
      </div>
          </div>
          <!-- END Part II Title -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:99mm;height:4mm;"/>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNAmountBox" style="height:4.5mm;width:40mm;text-align:center;">
                <b>(a)</b>Beginning of tax year</div>
              <div class="styLNAmountBox" style="height:4.5mm;width:40mm;text-align:center;">
                <b>(b)</b>End of tax year</div>
            </div>
          </div>
          <!-- Part II line 22 -->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">22</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Real estate
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">22 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 23 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">23</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Mortgage loans
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">23 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MortgageLoansBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MortgageLoansEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 24 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">24</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Collateral loans
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">24 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/CollateralLoansBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/CollateralLoansEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 25 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">25</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Policy loans, including premium notes
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">25 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/PolicyLoansBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/PolicyLoansEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 26 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">26</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Bonds of domestic corporations
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">26 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BondsOfDomesticCorpsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BondsOfDomesticCorpsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 27 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">27</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Stock of domestic corporations
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">27 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/StockOfDomesticCorpsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/StockOfDomesticCorpsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 28 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">28</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Government obligations, etc.
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">28 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GovernmentObligationsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GovernmentObligationsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 29 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">29</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Bank deposits bearing interest
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">29 </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BankDepositsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BankDepositsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 30 -->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">30</div>
              <div class="styLNDesc" style="height:8mm;width:99mm;padding-top:4mm;">Other interest-bearing assets (attach schedule)
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">30</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;">
                <span style="float:left;width:31mm;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAssetsBOY"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAssetsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px; border-left-width:0px;">
                <span style="float:left;width:31mm;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAssetsEOY"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAssetsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 31 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">31</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Total. Add lines 22 through 30
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">31</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssetsBOY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
              <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssetsEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 32 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">32</div>
              <div class="styLNDesc" style="height:4mm;">Add columns (a) and (b), line 31
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">32</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssets"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 33 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">33</div>
              <div class="styLNDesc" style="height:4mm;">Mean of invested assets for the tax year. Enter one-half of line 32
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">33</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MeanOfInvestedAssets"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 34 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">34</div>
              <div class="styLNDesc" style="height:4mm;">Multiply line 33 by .0025
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">34</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/Pct0025MeanOfInvestedAssets"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 35 Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">35</div>
              <div class="styLNDesc" style="height:4mm;">Income base. Line 1b, column (a) plus line 8 less the sum of line 1b, column
          <!--Dotted Line
          <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
               <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                    <span style="width:16px"></span>.
                <span style="width:16px"></span>.
            </span>-->
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
            </div>
          </div>
          <!-- Part II line 35 Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"/>
              <div class="styLNDesc" style="height:4mm;width:99mm;">(b) and line 16
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">35</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/IncomeBase"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
            </div>
          </div>
          <!-- Part II line 36-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;width:8mm;">36</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Multiply line 33 by .0375
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">36</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/Pct0375MeanOfInvestedAssets"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
            </div>
          </div>
          <!-- Part II line 37-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;width:8mm;">37</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">Subtract line 36 from line 35. Do not enter less than zero
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">37</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/Line35LessLine36"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
            </div>
          </div>
          <!-- Part II line 38 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">38</div>
              <div class="styLNDesc" style="height:4mm;">Multiply line 37 by .25
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">38</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/Pct25Line37"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part II line 39 -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">39</div>
              <div class="styLNDesc" style="height:8mm;padding-top:4mm;">Limitation on deduction for investment expenses. Add lines 34 and 38
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:8.5mm;padding-top:4mm;">39</div>
              <div class="styLNAmountBoxNBB" style="height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/LimitationOnDeduction"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer for Page 3-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
     </div>
          </div>
          <!-- END Page Break and Footer for Page 3-->
          <!--Begin Page 4 -->
          <!-- Page 4 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
            </div>
          </div>
          <!-- END Page 4 Header -->
          <!-- BEGIN Schedule C Title Income Section -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;border-top:1px solid black;">
              <div class="styPartName" style="width:23mm;">Schedule C</div>
              <div class="styPartDesc" style="width:100mm;">Dividends and Special Deductions</div>
              <div class="styPartDesc" style="width:123mm;height:4mm;font-weight:normal;padding-left:26mm;border-bottom:1px solid black;">(see instructions)</div>
              <div class="styPartDesc" style="width:123mm;height:4mm;font-weight:bold;text-align:center;">Income</div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNAmountBox" style="heigh:4.5mm;width:64mm;text-align:center;border-top:1px solid black;">Dividends-Received</div>
              <div>
                <div class="styLNAmountBox" style="heigh:8.5mm;text-align:center;float:left;width:120px;border-right:none;border-top:none;border-bottom:none;border-left:1px solid black;">
                  <b>(a)</b> Subject to section <br/>832(b)(5)(B)</div>
                <div class="styLNAmountBox" style="heigh:8.5mm;text-align:center;float:right;width120pxborder-right:none;border-top:none;border-bottom:none;border-left:1px solid black;">
                  <b>(b)</b> Total dividends-<br/>received</div>
              </div>
            </div>
          </div>
          <!-- END Schedule C Title Income Section -->
          <!-- Schedule C Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">1</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;"> 
                Dividends from less-than-20%-owned domestic corporations (other than debt-financed stock) 
                      <!--Dotted Line -->
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
                         </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-top:1px solid black;">1</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;border-top:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomesticOwndBelow20Dividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;border-top:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalReceivedBelow20Dividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:1mm;">2</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Dividends from 20%-or-more-owned domestic corporations (other than debt-financed stock) 
                      <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">2</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomesticOwnd20OrMoreDividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalReceivedOwnd20OrMoreDiv"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Schedule C Line 2 -->
          <!-- Schedule C Line 3-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">3</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Dividends on debt-financed stock of domestic and foreign corporations
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">3</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFinancedStockDividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
                <span style="width:31mm;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDivRcvdOnDebtFncdStock"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDivRcvdOnDebtFncdStock"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 4-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">4</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Dividends on certain preferred stock of less-than-20%-owned public utilities
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">4</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtilBelow20PrefStkDiv"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDivReceived20PrefStk"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">5</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Dividends on certain preferred stock of 20%-or-more-owned public utilities
            <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">5</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtil20OrMorePrefStkDiv"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDivRcvd20OrMorePrefStk"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">6</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;">
           Dividends on stock of certain less-than-20%-owned foreign corporations and certain FSCs
          <!--Dotted Line -->
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
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">6</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ForeignOwndBelow20Dividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotForeignOwndBelow20Dividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">7</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;">
          Dividends on stock of certain 20%-or-more-owned foreign corporations and certain FSCs
          <!--Dotted Line -->
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
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">7</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ForeignOwnd20OrMoreDividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotFrgnOwnd20OrMoreDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 8-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">8</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
        Dividends from wholly owned foreign subsidiaries and certain FSCs
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">8</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnedDividends"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalWhollyOwnedDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 9-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">9</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Dividends from affiliated companies
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">9</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DivFromAffltCompanies"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDivRcvdFromAffltCompanies"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 10-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4.mm;">10</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4.mm;">
          Other dividends from foreign corporations not included on lines 3, 6, 7 or 8
            <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.mm;">10</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4.mm;background-color:lightgrey;"/>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4.mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherForeignDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 11-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;">11</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;">
          Income from controlled foreign corporations under subpart F (attach Forms 5471)
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">11</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
                <span style="width:31mm;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ControlledForeignIncome"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ControlledForeignIncome"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 12-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">12</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Foreign dividend gross-up (section 78)
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">12</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ForeignDividendGrossUp"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 13-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">13</div>
              <div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
        Other dividends (attach schedule)
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">13</div>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
                <span style="width:31mm;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherDividends"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 14-->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">14</div>
              <div class="styLNDesc" style="height:12mm;width:107mm;padding-top:4mm;">
                <b>Total dividends.</b> Add lines 1 through 13. Enter here and on Schedule A, line 2, or
        Schedule B, line 2, whichever applies
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:12.5mm;padding-top:8mm;">14</div>
              <div class="styLNAmountBoxNBB" style="height:12.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="height:12.5mm;padding-top:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- BEGIN Schedule C Title Deduction Section
<div style="width:187mm;">
  <div style="float:left;clear:none;">
        <div class="styPartDesc" style="width:123mm;"></div>
      <div class="styPartDesc" style="width:123mm;height:4mm;font-weight:normal;padding-left:26mm;"></div>
    <div class="styPartDesc" style="width:123mm;height:4mm;font-weight:bold;text-align:center;">Deduction</div>
  </div>
  <div style="float:right:clear:none;">
    <div class="styLNAmountBox" style="width:64mm;heigh:4.5mm;text-align:center;">Dividends-Received Deduction</div>
      <div class="styLNAmountBox" style="heigh:8.5mm;width:32mm;text-align:center;"><b>(a)</b>Subject to section <br/>832(b)(5)(B)  </div>
    <div class="styLNAmountBox" style="heigh:8.5mm;width:32mm;text-align:center;"><b>(b)</b>Total dividends-<br/>received deduction</div>
  </div>
</div>
END Schedule C Title Deduction Section  -->
          <!-- BEGIN Schedule C Title Deduction Section -->
          <div style="width:187mm;">
            <div style="float:left;clear:none;background-color:none;height:12mm;">
              <br/>
              <br/>
              <div class="styPartDesc" style="width:123mm;height:4mm;font-weight:bold;text-align:center;background-color:none;">Deduction</div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNAmountBox" style="heigh:4.5mm;width:64mm;text-align:center;">Dividends-Received Deduction</div>
              <div>
                <div class="styLNAmountBox" style="heigh:8.5mm;text-align:center;float:left;width:120px;border-right:none;border-top:none;border-bottom:1px solid black;border-left:1px solid black;">
                  <b>(a)</b>Subject to section <br/>832(b)(5)(B)</div>
                <div class="styLNAmountBox" style="heigh:8.5mm;text-align:center;float:right;width120pxborder-right:none;border-top:none;border-bottom:1px solid black;border-left:1px solid black;">
                  <b>(b)</b>Total dividends-<br/>received deduction</div>
              </div>
            </div>
          </div>
          <!-- END Schedule C Title Deduction Section -->
          <!-- Schedule C Line 15-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">15</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 1 by 70%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;border-top:1px solid black;">15</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine1By70SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine1By70TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 16-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">16</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 2 by 80%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4mm;">16</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine2By80SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine2By80TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 17-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-top:4mm;">17</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;padding-top:4mm;">
          Deduction for line 3 (see instructions)
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:4mm;">17</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <span style="width:31mm;float:left;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DeductionForLine3SubjectToSect"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DeductionForLine3SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:8mm;">
                <span style="width:31mm;float:left;">
                  <!-- Form to Form Link (Push Pin) -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DeductionForLine3TotDividends"/>
                  </xsl:call-template>
                </span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DeductionForLine3TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 18-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">18</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 4 by 42%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">18</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine4By42SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine4By42TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 19-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">19</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 5 by 48%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">19</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine5By48SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine5By48TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 20-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">20</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 6 by 70%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">20</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine6By70SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine6By70TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 21-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">21</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Multiply line 7 by 80%
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">21</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine7By80SubjectToSect"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/MultiplyLine7By80TotDividends"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 22-->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">22</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
          Enter the amount from line 8
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">22</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnedDividendsDed"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalWhollyOwnedDividendsDed"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 23-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">23</div>
              <div class="styLNDesc" style="height:4mm;width:107mm;">
                <b>Total.</b> Add lines 15 through 22. (See instructions for limitation.)
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4mm;">23</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDividendsSubjectToSection"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDividendsRcvdDeduction"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule C Line 24-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">24</div>
              <div class="styLNDesc" style="height:12mm;width:107mm;padding-top:4mm;">
          Total. Add line 23, column (a), and line 9, column (a). Enter here and on Schedule F, line 10
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:12.5mm;padding-top:8mm;">24</div>
              <div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:12.5mm;padding-top:7.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotWhollyOwnedAndAffltCoSubj"/>
                </xsl:call-template>
              </div>
              <div class="styLNAmountBox" style="width:32mm;height:12.5mm;background-color:lightgrey;padding-top:7.5mm;"/>
            </div>
          </div>
          <!-- Schedule C Line 25-->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:7.5mm;">25</div>
              <div class="styLNDesc" style="height:7.5mm;">
                <b>Total deductions.</b> Add line 23, column (b), and line 9, column (b). Enter here and on Schedule A, line 36a,
      or Schedule B, line 20, whichever applies
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">25</div>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDedTotDividendsRcvdDed"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
      </div>
          </div>
          <!-- END Page Break and Footer-->
          <!--Begin Page 5 -->
          <!-- Page Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- BEGIN Schedule E Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule E</div>
            <div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Premiums Earned&#151;Section 832 
    <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Schedule E Title -->
          <!-- Schedule E Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
              <div class="styLNDesc" style="height:4mm;">
          Net premiums written
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">1</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/NetPremiumsWritten"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
              <div class="styLNDesc" style="height:4mm;">
          Unearned premiums on outstanding business at the end of the preceding tax year:
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 2a line 1-->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
              <div class="styLNDesc" style="height:4mm;">
          Enter 100% of life insurance reserves included in unearned premiums (section
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 2a line2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;"/>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          832(b)(7)(A)) and all unearned premiums of section 833 organizations
          <!--Dotted Line -->
                <!--<span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>-->
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/LifeInsuranceReserves"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule E Line 2b-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;font-size:6pt;">
          Enter 90% of unearned premiums attributable to insuring certain securities
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/UnearnedPremiums90Prcnt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 2c-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Discounted unearned premiums attributable to title insurance
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/DscntUnearnedPremPrecedingTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 2d-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">d</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Enter 80% of all other unearned premiums
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2d</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/AllOtherUnrndPremPrecTY80"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 2e-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">e</div>
              <div class="styLNDesc" style="height:4mm;">
          Total. Add lines 2a through 2d
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2e</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TotalLines2aThru2dPrecedingTY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 3-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 1 and 2e
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TotalLines1And2ePrecedingTY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 4-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
              <div class="styLNDesc" style="height:4mm;">
          Unearned premiums on outstanding business at the end of the current tax year:
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 4a line 1-->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
              <div class="styLNDesc" style="height:4mm;">
          Enter 100% of life insurance reserves included in unearned premiums (section
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule E Line 4a line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;"/>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          832(b)(7)(A)) and all unearned premiums of section 833 organizations
          <!--Dotted Line -->
                <!--<span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>-->
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/LifeInsRsrvCurrentTY100Prcnt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule E Line 4b-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;font-size:6pt;">
          Enter 90% of unearned premiums attributable to insuring certain securities
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/UnearnedPremCurrentTY90Prcnt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule E Line 4c-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Discounted unearned premiums attributable to title insurance
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4c</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/DscntUnearnedPremCurrentTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule E Line 4d-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">d</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Enter 80% of all other unearned premiums
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4d</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/AllOtherUnearnedPremCurrTY80"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule E Line 4e-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">e</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 4a through 4d
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4e</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TotalLines4aThru4dCurrentTY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
              <div class="styLNDesc" style="height:4mm;">
          Subtract line 4e from line 3
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/Line3LessLine4e"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
              <div class="styLNDesc" style="height:4mm;">
          Transitional adjustments under section 832(b)(7)(D) (see instructions)
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TransitionalAdjUnderSect832b7D"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule E Line 7-->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">7</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Premiums earned.</b> Add lines 5 and 6. Enter here and on Schedule A, line 1
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;">7</div>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PremiumsEarned"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- BEGIN Schedule F Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule F</div>
            <div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Losses Incurred&#151;Section 832 
    <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Schedule F Title -->
          <!-- Schedule F Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
              <div class="styLNDesc" style="height:4mm;">
          Losses paid during the tax year (attach schedule)
          <!-- Form to Form Link (Push Pin) -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesPaid"/>
                </xsl:call-template>
                <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">1</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesPaid"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
              <div class="styLNDesc" style="height:4mm;">
          Balance outstanding at the end of the current tax year for:
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 2a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Unpaid losses on life insurance contracts
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/UnpaidLossesForCurrTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 2b-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Discounted unpaid losses
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/DiscountedUnpaidLossesCurrTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 2c-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 2a and 2b
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/UnpaidLossesCurrentYear"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 3-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
              <div class="styLNDesc" style="height:4mm;">
          Add lines 1 and 2c
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TotalLossesPaidAndUnpaidEOY"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 4-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
              <div class="styLNDesc" style="height:4mm;">
          Balance outstanding at the end of the preceding tax year for:
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 4a -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Unpaid losses on life insurance contracts
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
        <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/UnpaidLossesForPreceedingTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 4b-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Discounted unpaid losses
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/DiscountedUnpaidLossesPrecTY"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 4c-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 4a and 4b
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4c</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TotalUnpaidLossesEndOfProcYr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
              <div class="styLNDesc" style="height:4mm;">
          Subtract line 4c from line 3
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LessLine3FromLine4c"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
              <div class="styLNDesc" style="height:4mm;">
          Estimated salvage and reinsurance recoverable at the end of the preceding tax year
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/EstSalvageReInsRcvrEOYPrec"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">7</div>
              <div class="styLNDesc" style="height:4mm;">
          Estimated salvage and reinsurance recoverable at the end of the current tax year
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/EstSalvageReInsRcvrEOYCurrent"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 8-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">8</div>
              <div class="styLNDesc" style="height:4mm;">
          Losses incurred (line 5 plus line 6 less line 7)
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">8</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesIncurred"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 9-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Tax-exempt interest subject to section 832(b)(5)(B)
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TaxExmptIntSubjectToSect832b5B"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 10 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;">10</div>
              <div class="styLNDesc" style="height:8mm;width:99mm;">
          Dividends-received deduction subject to section 832(b)(5)(B) (Schedule C, line 24)
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">10</div>
              <div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/DivRcvdDedSubjectToSect832b5B"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 11-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;">11</div>
              <div class="styLNDesc" style="height:8mm;width:99mm;">
          The increase in policy cash value of section 264(f) policies as defined in section 805(a)(4)(F)
          <!--Dotted Line -->
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
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">11</div>
              <div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/IncrPolicyCashValueSect264f"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
            </div>
          </div>
          <!-- Schedule F Line 12-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">12</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 9, 10, and 11
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TotalIntDivPolicies"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 13-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">13</div>
              <div class="styLNDesc" style="height:4mm;">
          Reduction of deduction under section 832(b)(5)(B). Multiply line 12 by .15
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/ReductionOfDeductionSect823b5B"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule F Line 14-->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;">14</div>
              <div class="styLNDesc" style="height:8mm;">
                <b>Losses incurred deductible under section 832(c)(4).</b>  Subtract line 13 from line 8. Enter here and on Schedule A, line 26
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">14</div>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesIncurdDedUnderSect832c4"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer for Page 5-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
     </div>
          </div>
          <!-- END Page Break and Footer for Page 5-->
          <!--Begin Page 6 -->
          <!-- Page 6 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
            </div>
          </div>
          <!-- END Page 6 Header -->
          <!-- BEGIN Schedule G Title  -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule G</div>
            <div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Other Capital Losses 
      <span class="styNormalText">(see instructions)</span>
            </div>
            <div class="styPartDesc" style="height:4mm;font-weight:bold;padding-left:26mm;">
      (Capital assets sold or exchanged to meet abnormal insurance losses and to pay dividends and similar
    distributions to policyholders.)
    </div>
          </div>
          <!-- END Schedule G Title  -->
          <!-- Schedule G Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
              <div class="styLNDesc" style="height:4mm;">
          Dividends and similar distributions paid to policyholders
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">1</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/DividendsAndSimilarDistriPaid"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 2-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
              <div class="styLNDesc" style="height:4mm;">
          Losses paid
          <!--Dotted Line -->
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
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/LossesPaid"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 3-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
              <div class="styLNDesc" style="height:4mm;">
          Expenses paid
          <!--Dotted Line -->
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
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/ExpensesPaid"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 4-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
              <div class="styLNDesc" style="height:4mm;">
          Total. Add lines 1, 2, and 3
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalDistributionPaid"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 4 NOTE-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;"/>
              <div class="styLNDesc" style="height:4mm;">
                <b>Note. Adjust lines 5 through 8 to cash method if necessary.</b>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule G Line 5 -->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Interest received
          <!--Dotted Line -->
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
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/InterestReceived"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule G Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Dividends-received (Schedule C, line 14)
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/DividendsReceived"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule G Line 7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:12mm;padding-left:2.25mm;">7</div>
              <div class="styLNDesc" style="height:12mm;width:99mm;">
          Gross rents, gross royalties, lease income, etc., and gross income from a trade
      or business other than an insurance business including income from Form 4797
            (include gains for invested assets only)
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:12.5mm;padding-top:8mm;">7</div>
              <div class="styLNAmountBox" style="width:32mm;height:12.5mm;padding-top:8mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/GrossIncmFromTradeOrBus"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:12.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:12.5mm;"/>
            </div>
          </div>
          <!-- Schedule G Line 8-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">8</div>
              <div class="styLNDesc" style="height:4mm;width:99mm;">
          Net premiums received
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">8</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/NetPremiumsReceived"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
            </div>
          </div>
          <!-- Schedule G Line 9-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 5 through 8
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalIncomeReceived"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 10-->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">10</div>
              <div class="styLNDesc" style="height:4mm;">
          Limitation on gross receipts from sales of capital assets. Line 4 less line 9. If zero or less, enter -0-
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/LimitationOnGrossReceipts"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule G Line 11 Table Begin-->
          <div class="styBB" style="width:187mm;">
            <!--Schedule G, Other Capital Losses Table (OCLT) and Toggle Button set begin -->
            <div style="width:7mm;text-align:right;float:right;clear:none;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
                <xsl:with-param name="containerHeight" select="6"/>
                <xsl:with-param name="header-height" select="4"/>
                <xsl:with-param name="containerID" select=" 'OCLT' "/>
              </xsl:call-template>
            </div>
          </div>
          <!-- BEGIN OCLT TABLE   -->
          <!-- Begin Column table heading A, B, C, D, E, F, G -->
          <div class="styTableContainer" id="OCLT" style="width:187mm;">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="border-color: black; font-size: 7pt;">
                <tr>
                  <th class="styTableCellHeader" style="width:42mm;" rowspan="2" colspan="2">
                    (a) <span class="styNormalText">Description of capital <br/>asset</span>
                  </th>
                  <th class="styTableCellHeader" style="width:15mm;" rowspan="2">
                    (b) <span class="styNormalText">Date<br/>acquired</span>
                  </th>
                  <th class="styTableCellHeader" style="width: 26mm;">(c) <span class="styNormalText">Gross<br/>sales price</span>
                  </th>
                  <th class="styTableCellHeader" style="width: 26mm;">(d) <span class="styNormalText">Cost or <br/>other basis</span>
                  </th>
                  <th class="styTableCellHeader" style="width: 26mm; ">(e) <span class="styNormalText">Expense<br/>of sale</span>
                  </th>
                  <th class="styTableCellHeader" style="width: 26mm;">(f) <span class="styNormalText">Depreciation allowed <br/>(or allowable)</span>
                  </th>
                  <th class="styTableCellHeader" style="width: 26mm;border-right-width: 0px;">(g) <span class="styNormalText">Loss<br/>((d) plus (e) less <br/>the sum of (c) and (f))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Table repeating row begin -->
                <xsl:for-each select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail">
                  <xsl:if test="($Print != $Separated) or (count($Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail) &lt;=6)">
                    <tr style="height:4mm;">
                      <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                        <span class="styBoldText">11
                <!--<xsl:number value="position()"/>-->
                        </span>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DescriptionOfCapitalAsset/BusinessNameLine1"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
                        </xsl:call-template>
                        <xsl:if test="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason!=' '">
                          <span style="font-weight:normal;">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason"/>
                            </xsl:call-template>
                          </span>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DescriptionOfCapitalAsset"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="DateAcquired"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GrossSalesPrice"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ExpenseOfSale"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="DepreciationAllowed"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Loss"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <!-- Schedule G Table repeating blank row begin -->
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 1 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 8mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">11</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 34mm; text-align: left;">
                      <xsl:if test="((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 2 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <!--<span class="styBoldText">2</span>-->
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 3 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                      <!--<span class="styBoldText">3</span>-->
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 4 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <!--<span class="styBoldText">4</span>-->
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 5 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <!--<span class="styBoldText">5</span>-->
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 6 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <!--<span class="styBoldText">6</span>-->
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- Part II Table initiate Toggle Button Begin -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
            <xsl:with-param name="containerHeight" select="6"/>
            <xsl:with-param name="header-height" select="4"/>
            <xsl:with-param name="containerID" select=" 'OCLT' "/>
          </xsl:call-template>
          <!--   END Part II TABLE   -->
          <!-- Schedule G Line 12-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:17mm;">12</div>
              <div class="styLNDesc" style="width:50.5mm;height:17mm;">
          Totals&#151;column (c) must not be more than line 10. (Enter amount from
      column (g) in Schedule A, line 28, or Schedule B, line 15, whichever applies)
        <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
          <!--    <span style="width:16px"></span>.
              <span style="width:16px"></span>.-->
                </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNAmountBoxNBB" style="width:24.5mm;height:17mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalGrossSalePrice"/>
                </xsl:call-template>
              </div>
              <!--<div style="float:right;clear:none;">-->
              <div class="styLNAmountBoxNBB" style="width:75mm;height:17mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:29mm;height:17mm;font-size:6pt;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalLossAmount"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- BEGIN Schedule H Title  -->
          <div class="styBB" style="width:187mm;border-top:1px solid black;">
            <div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule H</div>
            <div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Special Deduction And Ending Adjusted Surplus for Section 833 Organizations 
      <div class="styNormalText">(see instructions)</div>
            </div>
          </div>
          <!-- END Schedule H Title -->
          <!-- Schedule H Line 1-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">1</div>
              <div class="styLNDesc" style="height:8mm;">
          Health care claims incurred during the tax year and liabilities incurred during the tax year under cost-plus
      contracts
          <!--Dotted Line -->
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
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">1</div>
              <div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/HealthCareClaimsAndLiabilites"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 2-->
          <div style="width:187mm;">
            <div style=" float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">2</div>
              <div class="styLNDesc" style="height:8mm;">
          Expenses incurred during the tax year in connection with the administration, adjustment, or settlement of
      health care claims or in connection with the administration of cost-plus contracts
          <!--Dotted Line -->
                <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">2</div>
              <div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/ExpensesIncurred"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 3-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Total.</b> Add lines 1 and 2
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TotalClaimsLiabilitiesExpenses"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 4-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
              <div class="styLNDesc" style="height:4mm;">
          Multiply line 3 by .25
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TotalExpenses25Prcnt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 5-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
              <div class="styLNDesc" style="height:4mm;">
          Beginning adjusted surplus
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/BeginningAdjustedSurplus"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 6-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">6</div>
              <div class="styLNDesc" style="height:8mm;">
                <b>Special deduction.</b> Subtract line 5 from line 4. If zero or less, enter -0-. Enter here and on Schedule A, line
      34a. (See instructions for limitation.)
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">6</div>
              <div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/SpecialDeduction"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 7-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">7</div>
              <div class="styLNDesc" style="height:4mm;">
          Net operating loss deduction (Schedule A, line 36b)
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/NetOperatingLossDeduction"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 8-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">8</div>
              <div class="styLNDesc" style="height:4mm;">
          Net exempt income:
        </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
            </div>
          </div>
          <!-- Schedule H Line 8a-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
              <div class="styLNDesc" style="height:4mm;">
          Adjusted tax-exempt income
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/AdjustedTaxExamptIncome"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 8b-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
              <div class="styLNDesc" style="height:4mm;">
          Adjusted dividends-received deduction
          <!--Dotted Line -->
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
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/AdjustedDividendsReceivedDed"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 9-->
          <div style="width:187mm;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
              <div class="styLNDesc" style="height:4mm;">
          Taxable income (Schedule A, line 37)
          <!--Dotted Line -->
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
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
              <div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TaxableIncomeSchH"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Schedule H Line 10-->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div style="float:left;clear:none:">
              <div class="styLNLeftNumBox" style="height:4mm;">10</div>
              <div class="styLNDesc" style="height:4mm;">
                <b>Ending adjusted surplus.</b> Add lines 5 through 9
          <!--Dotted Line -->
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
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
              <div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/EndingAdjustedSurplus"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer for Page 6-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
     </div>
          </div>
          <!-- END Page Break and Footer for Page 6-->
          <!--Begin Page 7 -->
          <!-- Page 7 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span>
            </div>
          </div>
          <!-- END Page 7 Header -->
          <!-- BEGIN Schedule I Title -->
          <div class="styBB" style="width:187mm;border-top:1px solid black;">
            <div class="styPartName" style="width:23mm;">Schedule I</div>
            <div class="styPartDesc" style="width:164mm;">
       Other Information  <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!--br style="page-break-after:always;"/-->
          <!-- BEGIN Line Items -->
          <table class="styTable" style="width:187mm;clear:both;float:none;">
            <tr>
              <!--BEGIN Schedule I Left Side-->
              <td class="styGenericDiv" style="width:93mm;">
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">Check method of accounting:</div>
                  <div class="styIRS1120PCLNYesNoBox">Yes</div>
                  <div class="styIRS1120PCLNYesNoBoxRB">No</div>
                </div>
                <!-- line 1 a, b, and c -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:42mm;height:4.5mm;">
                    <span class="styBoldText">a</span>
                    <span style="width:3px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingCash"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingCash</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingCash"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleMethodOfAccountingCash</xsl:with-param>
                      </xsl:call-template>
            Cash
          </label>
                    <span style="width:6px;"/>
                  </div>
                  <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/>
                  <div class="styGenericDiv" style="width:.4mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:42mm;height:4.5mm;">
                    <span class="styBoldText">b</span>
                    <span style="width:3px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingAccrual"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingAccrual</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingAccrual"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingAccrual</xsl:with-param>
                      </xsl:call-template>
            Accrual
          </label>
                    <span style="width:6px;"/>
                  </div>
                  <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/>
                  <div class="styGenericDiv" style="width:.4mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:270px;height:4.5mm;background-color:none;">
                    <span class="styBoldText">c</span>
                    <span style="width:3px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOther"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingOther</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOther"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingOther</xsl:with-param>
                      </xsl:call-template>
            Other (specify)
          </label>
                    <span style="width:40mm;background-color:none;">
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                      <span style="width:3px;"/>
                      <span style="width:30mm;font-size:6pt;border-bottom:1 solid black;background-color:none;">
                        <span style="width:1mm;"/>
                        <!--EXCEPTION: the value of this pen and ink image will not be display at the Additional data section becz the text is being display on the line inside the form -->
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOther/@note"/>
                        </xsl:call-template>
                      </span>
                    </span>
                  </div>
                  <!-- <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/> -->
                  <div class="styGenericDiv" style="width:.4mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">Check box for kind of company:</div>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <!-- line 2 a and b -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:42mm;height:4.5mm;">
                    <span class="styBoldText">a</span>
                    <span style="width:3px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MutualCompany"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMutualCompany</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MutualCompany"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIMutualCompany</xsl:with-param>
                      </xsl:call-template>
            Mutual
          </label>
                    <span style="width:6px;"/>
                  </div>
                  <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/>
                  <div class="styGenericDiv" style="width:.4mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:42mm;height:4.5mm;">
                    <span class="styBoldText">b</span>
                    <span style="width:3px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/StockCompany"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIStockCompany</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/StockCompany"/>
                        <xsl:with-param name="BackupName">IRS1120PCScheduleIStockCompany</xsl:with-param>
                      </xsl:call-template>
            Stock
          </label>
                    <span style="width:6px;"/>
                  </div>
                  <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/>
                  <div class="styGenericDiv" style="width:.4mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
                </div>
                <!-- Sch I line 3 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">
                    <span class="stySmallText">At the end of the tax year, did the corporation own,
directly or indirectly, 50% or more of the voting
stock of a domestic corporation? (For rules of
attribution, see section 267(c).)
          <span class="styBoldText">
                        <span style="width:16px"/>.
    </span>
                      <br/>
                      <span style="padding-left:4px;"/>If “Yes,” attach a schedule showing:
  <!--Form to Form Link -->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStock"/>
                      </xsl:call-template>
                      <br/>
                      <b>(a)</b> name and employer identification number (EIN);<br/>
                      <b>(b)</b> percentage owned; and <b>(c)</b> taxable income or
(loss) before NOL and special deductions of such
corporation for the tax year ending with or within
your tax year.
     </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:6mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:6mm;border-right-width:1px"/>
                  <div class="styIRS1120PCLNYesNoBox" style="height:3mm;">
                    <span style="font-weight:normal;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStock"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="styIRS1120PCLNYesNoBoxRB" style="height:3mm;">
                    <span style="font-weight:normal;">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStock"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:13mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:13mm;border-right-width:1px"/>
                </div>
                <!-- Line 4 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;padding-bottom:0px;padding-top:0px;">
        Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group?
          <span class="styBoldText">
                      <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
             <span style="width:16px"/>.
              <span style="width:16px"/>.
             <span style="width:16px"/>.
       </span>
                    <br/>
          If “Yes,” enter name and EIN of the parent corporation
          <span style="width:70mm;background-color:none;">
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                      <span style="width:3px;"/>
                      <span style="width:67mm;font-size:6pt;border-bottom:1 solid black;background-color:none;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationName/BusinessNameLine1"/>
                        </xsl:call-template>
                      </span>
                      <br/>
                      <span style="width:70mm;font-size:6pt;border-bottom:1 solid black;background-color:none;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationName/BusinessNameLine2"/>
                        </xsl:call-template>
                      </span>
                      <br/>
                      <span style="width:70mm;font-size:6pt;border-bottom:1 solid black;background-color:none;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationNameControl"/>
                        </xsl:call-template>
                        <span style="width: 5px"/>
                        <!--<span class="styEINFld">
            <xsl:if test="$Form1120PCData/CorporationEIN !=' '">-->
                        <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationEIN"/>
                        </xsl:call-template>
                        <span style="width: 5px"/>
                        <!--</xsl:if>-->
                        <xsl:if test="$Form1120PCData/MissingEINReason !=' '">
                          <span style="font-weight:normal;">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MissingEINReason"/>
                            </xsl:call-template>
                          </span>
                        </xsl:if>
                        <!--</span>-->
                      </span>
                      <br/>
                      <!-- <span style="width:70mm;font-size:6pt;border-bottom:1 solid black;background-color:none;"></span><br/>
                <span style="width:70mm;font-size:6pt;border-bottom:1 solid black;background-color:none;"></span>-->
                    </span>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styShadingCell" style="width:6mm;height:1mm;"/>
                    <div class="styShadingCellRB" style="width:6mm;height:1mm;"/>
                    <div class="styIRS1120PCLNYesNoBox" style="height:3mm;">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ControlledGroupMember"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styIRS1120PCLNYesNoBoxRB" style="height:3mm;">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ControlledGroupMember"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styShadingCell" style="width:6mm;height:10mm;"/>
                    <div class="styShadingCellRB" style="width:6mm;height:10mm;"/>
                  </div>
                </div>
                <!-- Line 5 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">5</div>
                  <div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
                    <span class="stySmallText">
       At the end of the tax year, did any individual,
partnership, corporation, estate, or trust own, directly
or indirectly, 50% or more of the corporation’s voting
stock? (For rules of attribution, see section 267(c).)
          <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentCorpVotingStock"/>
                      </xsl:call-template>
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
                    </span>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styShadingCell" style="width:6mm;height:8mm;"/>
                    <div class="styShadingCellRB" style="width:6mm;height:8mm;"/>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentCorpVotingStock"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styIRS1120PCLNYesNoBoxRB">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentCorpVotingStock"/>
                        </xsl:call-template>
                      </span>
                    </div>
                  </div>
                </div>
                <!-- line 5 sub -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;"/>
                  <div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
                    <span class="stySmallText">
        If “Yes,” attach a schedule showing name and 
     identifying number. (Do not include any information
        already entered in <b>4</b> above.)
      <br/>
                      <br/>
                      <span style="width:70mm;background-color:none;">
      Enter percentage owned          
      <span style="width:1mm;background-color:none;"/>
                        <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                        <span style="width:3px;background-color:none;"/>
                        <span style="width:28mm;font-size:6pt;border-bottom:1 solid black;background-color:none;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/OwnCorpVotingStockPercent"/>
                          </xsl:call-template>
                        </span>
                      </span>
                    </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:14mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:14mm;"/>
                </div>
                <!-- Line 6 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">6</div>
                  <div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
           At any time during the tax year, did one foreign
    person own, directly or indirectly, at least 25% of:
    <b>(a)</b> the total voting power of all classes of stock of
    the corporation entitled to vote, or <b>(b)</b> the total value
    of all classes of stock of the corporation? If “Yes,”
    enter:
            <span class="styBoldText">
                      <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
             <span style="width:16px"/>.
             <span style="width:16px"/>.
             <span style="width:16px"/>.
         </span>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styShadingCell" style="width:6mm;height:10.5mm;"/>
                    <div class="styShadingCellRB" style="width:6mm;height:10.5mm;"/>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ForeignOwn25PercentStock"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styIRS1120PCLNYesNoBoxRB">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ForeignOwn25PercentStock"/>
                        </xsl:call-template>
                      </span>
                    </div>
                  </div>
                </div>
                <!-- Line 6 sub 1 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">
                    <b>(a)</b> Percentage owned
          <span style="width:3px;"/>
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                    <span style="width:6px;"/>
                    <span style="width:15mm;border-bottom:1 solid black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ForeignOwnStockPercent"/>
                      </xsl:call-template>
                    </span> and <b>(b)</b> Owner's<br/>
          country
        <span style="width:3px;"/>
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                    <span style="width:6px;"/>
                    <span style="width:50mm;border-bottom:1 solid black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ForeignOwnStockCountry"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:7.5mm;border-bottom-width:1px;"/>
                  <div class="styShadingCell" style="width:6mm;height:7.5mm;border-bottom-width:1px;;border-right-width:1px;"/>
                </div>
              </td>
              <!--END Schedule M Left Side-->
              <!--BEGIN Schedule M Right Side-->
              <!--Line 6c -->
              <td class="styGenericDiv" style="width:93mm;vertical-align:top;">
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">
                    <br/>
                    <br/>
                    <b>(c)</b> The corporation may have to file <b>Form 5472,</b>
    Information Return of a 25% Foreign-Owned U.S.
    Corporation or a Foreign Corporation Engaged in
    a U.S. Trade or Business. Enter number of Forms
    5472 attached
      <!--Dotted Line-->
                    <span style="width:3px;"/>
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                    <span style="width:6px;"/>
                    <span style="width:40mm;border-bottom:1 solid black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NumberOfForm5472Attached"/>
                      </xsl:call-template>
                    </span>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NumberOfForm5472Attached"/>
                    </xsl:call-template>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styIRS1120PCLNYesNoBox">Yes</div>
                    <div class="styIRS1120PCLNYesNoBox">No</div>
                    <div class="styShadingCell" style="width:6mm;height:14mm;"/>
                    <div class="styShadingCell" style="width:6mm;height:14mm;"/>
                  </div>
                </div>
                <!-- line 7 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">7</div>
                  <div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
          Has the corporation elected to use its own payout
    pattern for discounting unpaid losses and unpaid
    loss adjustment expenses?<br/>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
                    <div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ElectedOwnPayoutPattern"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ElectedOwnPayoutPattern"/>
                        </xsl:call-template>
                      </span>
                    </div>
                  </div>
                </div>
                <!-- Line 8a -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">8a</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid losses shown on the
          corporation’s annual statement:</div>
                  <div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;height:4.5mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(1)</div>
                  <div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the current tax year: $ 
        </div>
                  <div class="styIRS1120PCBBText" style="width:36.3mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UnpaidLossesForCurrentYear"/>
                    </xsl:call-template>
                  </div>
                  <div class="styGenericDiv" style="width:1mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;height:4.5mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(2)</div>
                  <div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the previous tax year: $ 
        </div>
                  <div class="styIRS1120PCBBText" style="width:36.3mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UnpaidLossesForPreviousYear"/>
                    </xsl:call-template>
                  </div>
                  <div class="styGenericDiv" style="width:1mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
                </div>
                <!-- Line 8b -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm">  b</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid loss adjustment expenses
                          shown on the corporation’s annual statement:
         </div>
                  <div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;height:4.5mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(1)</div>
                  <div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the current tax year: $ 
        </div>
                  <div class="styIRS1120PCBBText" style="width:36.3mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalUnpaidLossForCurrentYear"/>
                    </xsl:call-template>
                  </div>
                  <div class="styGenericDiv" style="width:1mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
                </div>
                <div class="styGenericDiv" style="width:93mm;height:4.5mm;">
                  <div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(2)</div>
                  <div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the previous tax year: $ 
        </div>
                  <div class="styIRS1120PCBBText" style="width:36.3mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalUnpaidLossForPreviousYear"/>
                    </xsl:call-template>
                  </div>
                  <div class="styGenericDiv" style="width:1mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
                  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
                </div>
                <!-- line 9 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">9</div>
                  <div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
         Does the corporation discount any of the loss
    reserves shown on its annual statement?
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
                    <br/>
                  </div>
                  <div class="styGenericDiv">
                    <div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
                    <div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateYesBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/DiscountsLossReserves"/>
                        </xsl:call-template>
                      </span>
                    </div>
                    <div class="styIRS1120PCLNYesNoBox">
                      <span style="font-weight:normal;">
                        <xsl:call-template name="PopulateNoBoxText">
                          <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/DiscountsLossReserves"/>
                        </xsl:call-template>
                      </span>
                    </div>
                  </div>
                </div>
                <!-- line 10 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">
                                                               Enter the amount of tax-exempt interest received or
                                                          accrued during the tax year
                                                            <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> $
                                                            <span style="width:30mm;border-bottom:1 solid black;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TaxExemptInterest"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:7mm;border-bottom-width:0px;"/>
                  <div class="styShadingCell" style="width:6mm;height:7mm;border-bottom-width:0px;"/>
                </div>
                <!-- Line 11 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:7mm;">11</div>
                  <div class="styLNDesc" style="width:72mm;height:7mm;font-size:6pt;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarryback"/>
                        <xsl:with-param name="BackupName">IRS1120ScheduleINOLForegoCarryback</xsl:with-param>
                      </xsl:call-template>
            If the corporation has an NOL for the tax year
        and is electing to forgo the carryback period,
    check here
                  <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
       </span>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                    </label>
                    <span style="width:2px;"/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarryback"/>
                        <xsl:with-param name="BackupName">IRS1120ScheduleINOLForegoCarryback</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:8mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:8mm;"/>
                </div>
                <!-- Line 12 - sub -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                  <div class="styLNDesc" style="width:72mm;height:5mm;">
        If the corporation is filing a consolidated return,
    the statement required by Regulations section 1.1502-21(b)(3) must be attached or the election will not be valid.
    <span style="width:5px;"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarryback"/>
                    </xsl:call-template>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:10mm;"/>
                  <div class="styShadingCell" style="width:6mm;height:10mm;"/>
                </div>
                <!-- Line 12 -->
                <div class="styGenericDiv" style="width:93mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
                  <div class="styLNDesc" style="width:72mm;height:4.5mm;">
        Enter the available NOL carryover from prior tax
    years. (Do not reduce it by any deduction on
    line 36b, Schedule A.)   <br/>
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> $
        <span style="width:25mm;border-bottom:1 solid black;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLCarryoverFromPriorYear"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div class="styShadingCell" style="width:6mm;height:31.25mm;border-bottom-width:1px;"/>
                  <div class="styShadingCell" style="width:6mm;height:31.25mm;border-bottom-width:1px;"/>
                </div>
              </td>
              <!--END Schedule I Right Side-->
            </tr>
          </table>
          <!-- END Schedule I Line Items -->
          <!-- Page Break and Footer for Page 7-->
          <div class="pageEnd" style="width:187mm;border-top: 2px solid black;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
     </div>
          </div>
          <!-- END Page Break and Footer for Page 7-->
          <!--Begin Page 8 -->
          <!-- Page 8 Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 1120-PC (2008)<span style="width:146mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span>
            </div>
          </div>
          <!-- END Page 8 Header -->
          <!-- BEGIN Schedule L Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:28mm;">Schedule L</div>
            <div class="styPartDesc" style="width:158mm;height:">
      Balance Sheets per Books <span class="styNormalText">(All filers are required to complete this schedule.)</span>
            </div>
          </div>
          <!-- END Schedule L Title -->
          <!-- BEGIN Schedule L Title -->
          <div style="width:187mm;">
            <div class="styGenericDiv" style="width:58mm;border-bottom: 0px solid white;border-left-width:0px;"/>
            <div class="styLNAmountBox" style="text-align:center;border-bottom-width:1px;width:64mm;height:4mm;">Beginning of tax year</div>
            <div class="styLNAmountBox" style="text-align:center;border-bottom-width:1px;width:64mm;height:4mm;">End of tax year</div>
          </div>
          <!-- END Schedule L Title -->
          <!-- BEGIN Schedule L Line Items -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;border-top:1px solid white;border-bottom-width:0px;"/>
            <div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">Assets</div>
            <div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
            <div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
            <div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
            <div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
          </div>
          <!-- Schedule L Line 1-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Cash
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CashBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CashEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 2a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">2a</div>
            <div class="styLNDesc" style="width:50mm;height:5mm;">Trade notes and accounts receivable</div>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TradeNotesAcctReceivableBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TradeNotesAcctReceivableEOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
          </div>
          <!-- Schedule L Line 2b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Less allowance for bad debts
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BadDebtAllowanceBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetTradeNotesAcctRcvblBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BadDebtAllowanceEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetTradeNotesAcctRcvblEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 3-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Inventories
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InventoriesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InventoriesEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 4-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">U.S. government obligations
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/USGovernmentObligationsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/USGovernmentObligationsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 5-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;font-size:6pt;padding-top:1mm;">
              <span>Tax-exempt securities (see instructions)</span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TaxExemptSecuritiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TaxExemptSecuritiesEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 6-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">6</div>
            <div class="styLNDesc" style="width:50mm;height:5.5mm;padding-top:1mm;">
              <span class="stySmallText">Other current assets (attach schedule)</span>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 7-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Loans to shareholders
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansToShareholdersBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansToShareholdersEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 8-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Mortgage and real estate loans
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/MortgageRealEstateLoansBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/MortgageRealEstateLoansEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 9-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">9</div>
            <div class="styLNDesc" style="width:50mm;height:5.5mm;">Other investments
        (attach schedule)
      </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5.5mm;font-family:arial;font-size:8pt;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 10a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
              <span class="stySmallText">Buildings and other depreciable assets</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BldgOtherDepreciableAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BldgOtherDepreciableAssetsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
          </div>
          <!-- Schedule L Line 10b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated depreciation
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepreciationBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepreciableAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepreciationEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepreciableAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 11a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">11a</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Depletable assets
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/DepletableAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/DepletableAssetsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
          </div>
          <!-- Schedule L Line 11b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated depletion
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepletionBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepletableAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepletionEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepletableAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 12-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Land (net of any amortization)
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LandBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LandEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 13a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">13a</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Intangible assets (amortizable only)</div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/IntangibleAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/IntangibleAssetsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
          </div>
          <!-- Schedule L Line 13b-->
          <div style="width:187mm;">
            <div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated amortization
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedAmortizationBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetIntangibleAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedAmortizationEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetIntangibleAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 14-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">14</div>
            <div class="styLNDesc" style="width:50mm;height:5.5mm;">Other assets
        (attach schedule)
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 15-->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Total assets
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalAssetsBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalAssetsEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Liabilities and Shareholders Line-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;">
              <span class="styBoldText">Liabilities and Shareholders' Equity</span>
            </div>
            <div class="styShadingCell" style="height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;"/>
            <div class="styShadingCell" style="height:4.5mm;"/>
          </div>
          <!-- Schedule L Line 16-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Accounts payable
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccountsPayableBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccountsPayableEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 17-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;">17</div>
            <div class="styLNDesc" style="width:50mm;height:7mm;">
              <span>Mortgages, notes, bonds payable in less than 1 year</span>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/ShortTermPayableBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/ShortTermPayableEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 18-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;">18</div>
            <div class="styLNDesc" style="width:50mm;height:7mm;">
              <span>Insurance liabilities (see instructions)</span>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InsuranceLiabilitiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InsuranceLiabilitiesEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 19-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">19</div>
            <div class="styLNDesc" style="width:50mm;height:5.5mm;font-size:6pt;padding-top:1mm;">
              <span>Other current liabilities (attach schedule)</span>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 20-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">20</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Loans from shareholders
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansFromShareholdersBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansFromShareholdersEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 21-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;">21</div>
            <div class="styLNDesc" style="width:50mm;height:7mm;">
              <span>Mortgages, notes, bonds payable in 1 year or more</span>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LongTermPayableBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LongTermPayableEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 22-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">22</div>
            <div class="styLNDesc" style="width:50mm;height:5.5mm;">Other liabilities
        (attach schedule)
      </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5.5mm;"/>
            <div class="styLNFormLinkBox" style="height:5.5mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 23-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">
              <span style="width:20mm;" class="styLNDesc">Capital stock: </span>
              <span style="width:30mm;" class="styLNDesc">
                <span class="styBoldText">a</span> Preferred stock
        </span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalPreferredStockBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalPreferredStockEOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">
              <span style="width:20mm;" class="styLNDesc"/>
              <span style="width:28mm;" class="styLNDesc">
                <span class="styBoldText">b</span> Common stock
        </span>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalCommonStockBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalStockBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalCommonStockEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalStockEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 24-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Additional paid-in capital
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdditionalPaidInCapitalBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdditionalPaidInCapitalEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 25-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;">25</div>
            <div class="styLNDesc" style="width:50mm;height:7mm;">
              <span>Retained earnings&#151;Appropriated (attach schedule)</span>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 26-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">26</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">
        Retained earnings&#151;Unappropriated
      </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsUnapprBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsUnapprEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 27-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7mm;">27</div>
            <div class="styLNDesc" style="width:50mm;height:7mm;">
              <span>Adjustments to shareholders' equity (attach schedule)</span>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjToShareholdersEquityBOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjToShareholdersEquityBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:7.5mm;"/>
            <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
              <!-- Form to Form Link -->
              <span style="width:2px;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjToShareholdersEquityEOY"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjToShareholdersEquityEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 28-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
            <div class="styLNDesc" style="width:50mm;height:4.5mm;">Less cost of treasury stock
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CostOfTreasuryStockBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:5mm;"/>
            <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateNegativeNumber">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CostOfTreasuryStockEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Schedule L Line 29-->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
            <div class="styGenericDiv" style="width:50mm;height:4.5mm;padding-top:1mm;">
              <span class="stySmallText">Total liabilities and shareholders' equity</span>
            </div>
            <div class="styShadingCell" style="height:4.5mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalLiabilitiesEquityBOY"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="height:4.5mm;"/>
            <div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalLiabilitiesEquityEOY"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- END Schedule L Line Items -->
          <br style="page-break-after:always;"/>
          <!-- BEGIN Schedule M-1 Title -->
          <div class="styBB" style="width:187mm;border-top:1px solid black;">
            <div class="styPartName" style="width:28mm;">Schedule M-1</div>
            <div class="styPartDesc" style="width:158mm;">Reconciliation of Income (Loss) per Books with Income (Loss) per Return</div>
            <div class="styPartDesc" style="width:158mm;padding-left:31mm;font-size:6pt;">Note: <span class="styNormalText">Schedule M-3 required instead of Schedule M-1 if total assets are $10 million or more–See instructions.</span>
            </div>
          </div>
          <!-- END Schedule M-1 Title -->
          <!-- BEGIN Schedule M-1 Line Items -->
          <div style="width:187mm;clear:both;" class="styBB">
            <!-- BEGIN Left Side Table of Schedule M-1-->
            <table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
              <tr style="width:93mm;">
                <td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
               </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/NetIncomeLossPerBooks"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Federal income tax per books
              <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:15px"/>.
              </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/FederalIncomeTaxPerBooks"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <span class="stySmallText">Excess of capital losses over capital gains
                <span class="styBoldText"/>
                  </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/ExcessOfCapLossesOverCapGains"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Income subject to tax not recorded </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:37mm;">on books this year (itemize)
              </div>
                  <span style="width:8mm;border-bottom:solid 1px;text-align:center;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">Expenses recorded on books this year
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalExpensesNotDeducted"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">not deducted on this return (itemize)</td>
                <td class="styLNAmountBox" style=";border-right-width:1px;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>a</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:20mm;font-size:6.5pt;">Depreciation<span style="width:1mm;"/>$
              </div>
                  <span style="width:28mm;border-bottom:solid 1px;text-align:right;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/DepreciationExpenses"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">
                  <span style="width:3mm;"/>b</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:27.5mm;font-size:6pt;">Charitable contributions $<span style="width:.5mm;"/>
              </div>
                  <span style="width:22mm;border-bottom:solid 1px;text-align:right;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContributionsExpense"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="vertical-align:top;">
                  <span style="width:3mm;"/>c</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:38mm;">Travel and entertainment 
                      <span style="width:1mm;"/>$
                      </div>
                  <span style="width:11mm;border-bottom:solid 1px;text-align:right;"/>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom-width: 0px;width:31.5mm;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="vertical-align:top;">
                  <span style="width:3mm;"/>
                </td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:50mm;border-bottom:solid 1px;text-align:right">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TravelEntertainment"/>
                    </xsl:call-template>
                    <span style="width:1px;"/>
                  </div>
                </td>
                <td class="styLNAmountBox" style="border-right-width:1px;border-bottom-width: 2px;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalExpensesNotDeducted"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">6</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Add lines 1 through 5
                       <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
             </span>
                </td>
                <td class="styLNAmountBoxNBB" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/IncomeExpensesSubtotal"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            </table>
            <!-- END Left Side table of Schedule M-1-->
            <!-- BEGIN Right Side table of Schedule M-1-->
            <table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
              <tr style="width:94mm;">
                <td class="styLNLeftNumBox" style="height:4.5mm;">7</td>
                <td class="styGenericDiv" style="width:53mm;float:left;clear:none;" colspan="2">Income recorded on books this year 
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalIncomeRecordedNotIncluded"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:53mm;" colspan="2">not included in this return (itemize)</td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>a</td>
                <td class="styGenericDiv" style="width:53mm;" colspan="2">
                  <div class="styGenericDiv" style="width:31mm;">Tax-exempt interest<span style="width:1mm;"/>$
              </div>
                  <span style="width:20mm;border-bottom:solid 1px;text-align:right;"/>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>
                </td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
                  <span style="width:52mm;border-bottom:solid 1px;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TaxExemptInterest"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1px;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TaxExemptInterest"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalIncomeRecordedNotIncluded"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">8</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">Deductions in this tax return not 
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalDeductionsNotCharged"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">charged
against book income this year (itemize)</td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>a</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:20mm;">Depreciation<span style="width:1mm;"/>$
              </div>
                  <span style="width:31mm;text-align:right;border-bottom:solid 1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/DepreciationDeduction"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>b</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:27.5mm;font-size:6pt;">Charitable contributions $<span style="width:.5mm;"/>
              </div>
                  <span style="width:23mm;border-bottom:solid 1px;text-align:right;font-size:6pt;"/>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="width:31.5mm;border-bottom:0px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">
                  <span style="width:3mm;"/>
                </td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
                  <span style="width:47mm;border-bottom:solid 1px;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContributionsDed"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1px;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContributionsDed"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalDeductionsNotCharged"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">9</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">Add lines 7 and 8
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 2px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/IncomeDeductionsSubtotal"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:7mm;padding-bottom:2.5mm;">10</td>
                <td class="styGenericDiv" style="width:53mm;height:7mm;font-size:6pt;padding-top:1mm;" colspan="2">Income (Schedule A, line 35 or Schedule B, line 19, if applicable)-line 6 less line 9</td>
                <td class="styLNAmountBox" style="height:7mm;width:31.5mm;border-bottom-width: 0px; padding-top:3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/Income"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            </table>
            <!-- END Right Side Table of Schedule M-1-->
          </div>
          <!--br style="page-break-after:always;"/-->
          <!-- BEGIN Schedule M-2 Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:28mm;">Schedule M-2</div>
            <div class="styPartDesc" style="width:158mm;height:">
      Analysis of Unappropriated Retained Earnings per Books
      (Line 26, Schedule L)
    </div>
          </div>
          <!-- END Schedule M-2 Title -->
          <!-- BEGIN Schedule M-2 Line Items -->
          <div style="width:187mm;clear:both;" class="styBB">
            <!-- BEGIN Left Side Table of Schedule M-2-->
            <table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Balance at beginning of year
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/BalanceBOY"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/NetIncomeLossPerBooks"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:35mm;">Other increases (itemize)
          </div>
                  <span style="width:16mm;border-bottom:solid 1px;text-align:center;"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;border-right-width:1px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <span style="width:52mm;border-bottom:solid 1px;text-align:center;"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;border-right-width:1px;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
                  <span style="width:47mm;border-bottom:solid 1px;text-align:center;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherIncreases"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;border-bottom-width: 2px">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherIncreases"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
                <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Add lines 1, 2, and 3
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBoxNBB" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/BalanceIncomeOtherIncreases"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            </table>
            <!-- END Left Side Table of Schedule M-2-->
            <!-- BEGIN Right Side Table of Schedule M-2-->
            <table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
              <tr style="width:94mm;">
                <td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
                <td class="styGenericDiv" style="width:20mm;height:4.5mm;">
            Distributions:
          </td>
                <td class="styGenericDiv" style="width:33mm;height:4.5mm;">
                  <span class="styBoldText">a</span>
                  <span style="width:4px"/>Cash
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/CashDistribution"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
                <td class="styGenericDiv" style="width:33mm;height:4.5mm;">
                  <span class="styBoldText">b</span>
                  <span style="width:4px"/>Stock
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/StockDistribution"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
                <td class="styGenericDiv" style="width:33mm;height:4.5mm;">
                  <span class="styBoldText">c</span>
                  <span style="width:4px"/>Property
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/PropertyDistribution"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">6</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
                  <div class="styGenericDiv" style="width:36mm;">Other decreases (itemize)</div>
                  <div class="styIRS1120BBText" style="width:17mm;float:left;height:4.5mm;">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherDecreases"/>
                    </xsl:call-template>
                  </div>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherDecreases"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">7</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">Add lines 5 and 6
            <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 2px">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/DistributionsOtherDecreases"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">8</td>
                <td class="styGenericDiv" style="width:53mm;height:4.5mm;font-size:6pt;" colspan="2">Balance at end of year (line 4 less line 7)</td>
                <td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 0px">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/BalanceEOY"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
            </table>
            <!-- END Right Side Table of Schedule M-2-->
          </div>
          <!-- END Schedule M-2 Line Items -->
          <!-- Page Break and Footer for Page 8-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;"/>
            <div style="float:right;">
              <span style="width:40px;"/>  
                       Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2008)
                </div>
          </div>
          <!-- END Page Break and Footer for Page 8-->
          <!--BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">Additional Data</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1120PCData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Return Software ID</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Return Software Version</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersion"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120PC, top right Box D - Section 953D Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D/@Section953DIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120PC, top right Box D - Section 953D Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/ElectionMadeUnderSection953D/@Section953DAmount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - Section 1291 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section1291Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - Section 1291 Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section1291Amount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - Section 197 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section197Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 4 - Section 197 Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTax/@section197Amount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 14i - Backup Withholding Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPayments/@backupWithholdingIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 14i - Backup Withholding Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPayments/@backupWithholdingAmount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Schedule A Line 13 - Other Income Item</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/OtherIncome/@OtherIncomeItem"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Schedule B Line 8 - PAL Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncome/@PALIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Schedule B Line 8 - PAL Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncome/@PALAmount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Additional table and begin Left Over Table -->
          <!-- Schedule G Line 11 Table Begin-->
          <xsl:if test="($Print = $Separated) and (count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail)  &gt;=6)">
            <span class="styRepeatingDataTitle">Form 1120PC, Schedule G  Line 11:</span>
            <table class="styDepTbl" style="font-size:6pt;" cellspacing="0">
              <thead class="styTableThead" style="border-color: black; font-size: 7pt;">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:42mm;" rowspan="2" colspan="2">(a) <span class="styNormalText">Description of capital <br/>asset</span>
                  </th>
                  <th class="styDepTblCell" style="width:15mm;" rowspan="2">(b) <span class="styNormalText">Date<br/>acquired</span>
                  </th>
                  <th class="styDepTblCell" style="width: 26mm;">(c) <span class="styNormalText">Gross<br/>sales price</span>
                  </th>
                  <th class="styDepTblCell" style="width: 26mm;">(d) <span class="styNormalText">Cost or <br/>other basis</span>
                  </th>
                  <th class="styDepTblCell" style="width: 26mm; ">(e) <span class="styNormalText">Expense<br/>of sale</span>
                  </th>
                  <th class="styDepTblCell" style="width: 26mm;">(f) <span class="styNormalText">Depreciation allowed <br/>(or allowable)</span>
                  </th>
                  <th class="styDepTblCell" style="width: 26mm;border-right-width: 0px;">(g) <span class="styNormalText">Loss<br/>((d) plus (e) less <br/>the sum of (c) and (f))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!-- Begin Separated Repeating data table -->
                <xsl:for-each select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail">
                  <tr style="font-size: 6pt;border-color:black;">
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- First Row -->
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                      <span class="styBoldText">11
          <!--<xsl:number value="position()"/>-->
                      </span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DescriptionOfCapitalAsset/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
                      </xsl:call-template>
                      <xsl:if test="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason!=' '">
                        <span style="font-weight:normal;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DescriptionOfCapitalAsset"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateAcquired"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GrossSalesPrice"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExpenseOfSale"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="DepreciationAllowed"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Loss"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
