<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleIStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!--  Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120FScheduleI"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
        <meta name="Description" content="Form IRS1120FScheduleI"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--    <xsl:if test="not($Print) or $Print=''"> -->
          <xsl:call-template name="IRS1120FScheduleIStyle"/>
          <xsl:call-template name="AddOnStyle"/>
          <!--    </xsl:if>  -->
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120FScheduleI">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!--Begin Header-->
          <div class="styTBB" style="width:187mm;">
            <table cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <!--Form Number-->
                  <th rowspan="2" class="sty1120FSchIFNBox" style="width:36mm" scope="col">
                  SCHEDULE I
                  <br/>
                  (Form 1120-F)
                  <div class="sty1120FSchIAgency" style="padding-top:1.5mm">Department of the Treasury</div>
                    <div class="sty1120FSchIAgency">Internal Revenue Service</div>
                  </th>
                  <!--Form Name-->
                  <th rowspan="2" class="sty1120FSchIFTBox" style="width:119mm" scope="col">
                    <div class="sty1120FSchIMainTitle">
                    Interest Expense Allocation Under Regulations<br/>Section 1.882-5
                  </div>
                    <div class="styFST" style="padding-top:0.5mm">
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>

                    Attach to Form 1120-F.
                    <br/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>

                    See separate instructions.
                  </div>
                  </th>
                  <!--OMB/Tax Year-->
                  <th class="sty1120FSchIOMB" style="width:32mm" scope="col">
                    OMB No. 1545-0126
                </th>
                </tr>
                <tr>
                  <td class="sty1120FSchITY">
                  20<span class="styTYColor">08</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End header-->
          <!--Begin Name/EIN-->
          <div style="width:187mm">
            <div class="styTableCell" style="width:135mm;float:left;height:10mm;text-align:left">
            Name of corporation
            <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styTableCell" style="width:52mm;border-right-width:0px;padding-left:2mm;float:left;height:10mm;text-align:left">
              <b>Employer identification number</b>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!--End Name/EIN-->
          <!--Lines A and B-->
          <div class="styTBB" style="width:187mm">
            <!--Line A-->
            <div class="sty1120FSchILineABNum">A</div>
            <div class="sty1120FSchILineABDesc">
              <div class="sty1120FSchIRightFloat">
                <span class="sty1120FSchIDotLn" style="padding-right:0.2mm">.......</span>
                <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                <span style="width:2.7mm"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                    <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationIsAForeignBank"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIForeignBankYes</xsl:with-param>
                </xsl:call-template>
              Check here if the corporation is a foreign bank as defined in Temporary Regulations section 1.882-5T(c)(4)
            </label>
            </div>
            <!--Line B-->
            <div class="sty1120FSchILineABNum" style="float:left;clear:none">B</div>
            <div class="sty1120FSchILineABDesc" style="width:181mm;float:left;clear:none;border-right-width:0">
            This Schedule I is being completed with respect to <i>(check one):</i>
            </div>
            <div class="sty1120FSchILineABNum" style="float:left;clear:none"/>
            <div class="sty1120FSchILineABDesc" style="width:181mm;float:left;clear:none;border-right-width:0">
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedUSBookedLiabMethod"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIAdjustedUSBooked</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width:1mm"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjustedUSBookedLiabMethod"/>
                  <xsl:with-param name="BackupName">IRS1120FSchIAdjustedUSBooked</xsl:with-param>
                </xsl:call-template>
              Adjusted U.S. booked liabilities method under Regs. sec. 1.882-5(d). <b>Complete lines 1 through 15 and 21 through 25.</b>
              </label>
            </div>
            <div class="sty1120FSchILineABNum" style="float:left;clear:none"/>
            <div class="sty1120FSchILineABDesc" style="width:181mm;float:left;clear:none;border-right-width:0">
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateCurrencyPoolsMethod"/>
                  <xsl:with-param name="BackupName">IRS1120FSchISeparateCurrencyPools</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateCurrencyPoolsMethod"/>
                  <xsl:with-param name="BackupName">IRS1120FSchISeparateCurrencyPools</xsl:with-param>
                </xsl:call-template>
                <span style="width:1mm"/>
              Separate currency pools method under Regs. sec. 1.882-5(e). <b>Complete lines 1 through 9 and 16a through 25.</b>
              </label>
            </div>
          </div>
          <!--Begin Step 1-->
          <!--Step 1 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName">Step 1</div>
            <div class="styPartDesc">
            Average U.S. Assets for the Tax Year: Regulations Section 1.882-5(b)
          </div>
          </div>
          <!--Step 1 Table-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 1-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:15mm;padding-bottom:10mm">1</td>
                  <!--Note: the following cell has rowspan of 2 in order to capture the look of line 1's description which is split across the table header and 1st cell-->
                  <td rowspan="2" class="sty1120FSchIStep1Desc" style="height:21mm" scope="row">
                  Specify the method used to determine the value of the corporation’s U.S. assets on lines 2 through 5 below
                  <br/>
                    <i>(check one):</i>
                    <br/>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjustedBasisMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIAdjustedBasis</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/AdjustedBasisMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIAdjustedBasis</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:0.5mm"/>
                  Adjusted basis method: Regs. sec. 1.882-5(b)(2)(i)<br/>
                    </label>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/FairMarketValueMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFairMarketValue</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/FairMarketValueMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFairMarketValue</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:1.2mm"/>
                      <span style="font-size:6pt">Fair market value method: Temp. Regs. sec. 1.882-5T(b)(2)(ii)</span>
                      <br/>
                    </label>
                  Total assets per books
                  <span class="sty1120FSchIDotLn" style="padding-left:4mm">..........</span>
                  </td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm">
                    <b>(a)</b>
                    <br/>Set(s) of Books that<br/>Give Rise to U.S.<br/>Booked Liabilities<br/>(see inst.)</td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm;padding-bottom:4.5mm">
                    <b>(b)</b>
                    <br/>Partnership<br/>Interests</td>
                  <td class="sty1120FSchIStep1Header" style="height:15mm">
                    <b>(c)</b>
                    <br/>Set(s) of Books<br/>Other than those<br/>Described in<br/>Columns <b>(a)</b> and <b>(b)</b>
                  </td>
                  <td class="sty1120FSchIStep1HeaderLastCol" style="height:15mm;padding-bottom:1.8mm">
                    <b>(d)<br/>Totals.</b> Add<br/>columns <b>(a)</b>
                    <br/>through <b>(c)</b>
                  </td>
                </tr>
                <!--Line 2-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:6mm;padding-top:2mm">2</td>
                  <!--Description cell for Line 2 is part of Line 1 code-->
                  <td class="sty1120FSchIStep1Amount" style="height:6mm;padding-top:2mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalAssetsPerBooks"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="height:6mm">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3a-->
                <tr>
                  <td class="sty1120FSchIGenericNum">3a</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total interbranch assets
                  <span class="sty1120FSchIDotLn" style="padding-left:1.8mm">..........</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterbranchAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3b-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">b</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total non-ECI assets under section 864(c)(4)(D)
                  <span class="sty1120FSchIDotLn" style="padding-left:.3mm">..</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalNonECIAssetsSection864c4D"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3c-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">c</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total other non-ECI assets
                  <span class="sty1120FSchIDotLn" style="padding-left:1.8mm">.........</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalOtherNonECIAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3d-->
                <tr>
                  <td class="sty1120FSchIGenericLetter" style="height:7mm;padding-bottom:3mm">d</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Adjustments for amounts from partnerships and certain disregarded entities included on line 2, column (a)
                  <span class="sty1120FSchIDotLn" style="padding-left:0.1mm">..</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjFromPrtshpAndDisrgrdEnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3e-->
                <tr>
                  <td class="sty1120FSchIGenericLetter" style="height:7mm;padding-bottom:3mm">e</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Adjustments for assets that give rise to direct interest expense allocations under Regs. sec. 1.882-5(a)(1)(ii)
                </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjDirIntExpenseAllocations"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 3f-->
                <tr>
                  <td class="sty1120FSchIGenericLetter" style="height:7mm;padding-bottom:3mm">f</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Other adjustments to average assets included in line 2 (e.g., mark-to-market differences)
                  <span class="sty1120FSchIDotLn" style="padding-left:1.3mm">.......</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherAdjToAverageAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 4-->
                <tr>
                  <td class="sty1120FSchIGenericNum">4</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Combine lines 3a through 3f
                  <span class="sty1120FSchIDotLn" style="padding-left:1mm">.........</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/CombinedAdjustments"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 5-->
                <tr>
                  <td class="sty1120FSchIGenericNum">5</td>
                  <td class="sty1120FSchIStep1Desc" scope="row">
                  Total value of U.S. assets for the tax year
                  <span class="sty1120FSchIDotLn" style="padding-left:3.3mm">....</span>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalAssetsPerBooks"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PartnershipInterests"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ValueOfOtherBooks"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep1AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalValueOfUSAssets"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 5 instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep1Desc">
                    <b>Column (a):</b> Subtract line 4 from line 2.<br/>
                    <b>Column (b):</b> Enter total from Schedule P, line 19.<br/>
                    <b>Column (c):</b> See instructions for amount to enter.
                </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShaded" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep1AmountShadedLastCol" style="border-bottom-width:0">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 1-->
          <!--Begin Step 2-->
          <!--Step 2 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName">Step 2</div>
            <div class="styPartDesc">
            U.S.-Connected Liabilities for the Tax Year: Regulations Section 1.882-5(c)
          </div>
          </div>
          <!--Step 2 Table-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 6-->
                <!--Line 6-1-->
                <tr>
                  <td class="sty1120FSchIGenericNum">6</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.......</span>
                    </div>
                     Specify the method used to determine the amounts in Step2 (check one):
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--End Line 6-1 -->
                <!--Line 6-2-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..</span>
                    </div>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/ActualRatioMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIActualRatio</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/ActualRatioMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIActualRatio</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:2mm"/>
                  Actual ratio under Regs. sec. 1.882-5(c)(2). <b>Complete lines 6a through 6c below.</b>
                    </label>
                  </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--   *********************************************************************************   -->
                <!--Line 6-3-->
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">....</span>
                    </div>
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/FixedRatioMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFixedRatio</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/FixedRatioMethod"/>
                        <xsl:with-param name="BackupName">IRS1120FSchIFixedRatio</xsl:with-param>
                      </xsl:call-template>
                      <span style="width:2mm"/>
                  Fixed ratio under Temp. Regs. sec. 1.882-5T(c)(4). <b>Complete line 6d below.</b>
                    </label>
                  </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0;border-right-width:1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/U"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--End Line 6-3-->
                <!--   *********************************************************************************   -->
                <!--Line 6a-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">a</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....................</span>
                    </div>
                  Average worldwide liabilities
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AverageWorldwideLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6b-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">b</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......................</span>
                    </div>
                  Average worldwide assets
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AverageWorldwideAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6c-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">c</td>
                  <td class="sty1120FSchIStep2Desc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......................</span>
                    </div>
                  Divide line 6a by line 6b
                </td>
                  <td class="sty1120FSchIStep2Amount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/LiabilitiesDividedByAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6d-->
                <tr>
                  <td class="sty1120FSchIGenericLetter" style="height:11.5mm;padding-bottom:6.4mm">d</td>
                  <td class="sty1120FSchIStep2Desc" style="text-align:justify" scope="row">
                    <div style="text-align-last:justify">Fixed ratio under Temp. Regs. sec. 1.882-5T(c)(4). If the corporation is a foreign bank as defined in Temp. Regs. sec. 1.882-5T(c)(4), enter 95% on line 6d. If the corporation is</div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.................</span>
                    </div>
                  not a foreign bank, enter 50% on line 6d
                </td>
                  <td class="sty1120FSchIStep2Amount" style="padding-top:7mm">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/FixedRatio"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep2AmountShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 6e-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">e</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......................</span>
                    </div>
                  Enter the ratio from line 6c or 6d, as applicable
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/ApplicableRatio"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 7a-->
                <tr>
                  <td class="sty1120FSchIGenericNum">7a</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..</span>
                    </div>
                  U.S.-connected liabilities before Regs. sec. 1.884-1(e)(3) election(s). Multiply line 5, column (d) by line 6e
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USConnectedLiabBfrSect18841e3"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 7b-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">b</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..........</span>
                    </div>
                  Total amount of U.S. liability reduction under Regs. sec. 1.884-1(e)(3) election(s)
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USLiabReductionUndSect18841e3"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 7c-->
                <tr>
                  <td class="sty1120FSchIGenericLetter">c</td>
                  <td class="sty1120FSchIStep2DescLong" colspan="2" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..................</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                    <b>U.S.-Connected Liabilities. </b>Subtract line 7b from line 7a
                </td>
                  <td class="sty1120FSchIStep2AmountLastCol" style="border-bottom:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End Step 2-->
          <!--Begin Step 3-->
          <!--Step 3 Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName">Step 3</div>
            <div class="styPartDesc" style="font-size:7pt">
            Interest Expense Paid or Accrued on Average U.S. Booked Liabilities: Regulations Section 1.882-5(d)
          </div>
          </div>
          <!--Step 3 Table-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Table Header-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Header">
                    <b>(a)</b>
                    <br/>Set(s) of Books that Give<br/>Rise to U.S. Booked<br/>Liabilities (see inst.)</td>
                  <td class="sty1120FSchIStep3Header" style="padding-bottom:2.3mm">
                    <b>(b)</b>
                    <br/>Partnership<br/>Interests</td>
                  <td class="sty1120FSchIStep3HeaderLastCol">
                    <b>(c)<br/>Totals.</b>
                    <br/>Add columns<br/>
                    <b>(a)</b> and <b>(b)</b>
                  </td>
                </tr>
                <!--Line 8-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:7mm;padding-bottom:3mm;padding-right:2mm">8</td>
                  <td class="sty1120FSchIStep3Desc" scope="row">
                Total average amount of U.S. booked liabilities as defined in Regs. sec. 1.882-5(d)(2) (see instructions)
              </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BksThatGiveRiseToUSBookedLiab"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PartnershipInterestsLiab"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalAvgAmountUSBookedLiab"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 8 - Column (a) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:10.5mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (a):</b> Do not include amounts that give rise to directly allocable interest under Regs. sec. 1.882-5(a)(1)(ii) or from partnerships includible in column (b).
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 8 - Column (b) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (b):</b> Enter the total from Schedule P, line 17.
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 9-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:7mm;padding-bottom:0.5mm">9</td>
                  <td class="sty1120FSchIStep3Desc" style="font-size:6pt" scope="row">
                Total interest paid or accrued during the tax year on line 8 amount
              </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseOnBooks"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3Amount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseOnPrtshpInt"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3AmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseOnLiab"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 9 - Column (a) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="height:10.5mm">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (a):</b> Do not include amounts that give rise to directly allocable interest under Regs. sec. 1.882-5(a)(1)(ii) or from partnerships includible in column (b).
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 9 - Column (b) instructions-->
                <tr>
                  <td class="sty1120FSchIGenericNum">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3Desc">
                    <b>Column (b):</b> Enter the total from Schedule P, line 14c
              </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShaded">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3AmountShadedLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--End Step 3-->
          <!--Begin Page 1 Footer-->
          <div style="width:187mm;clear:both;padding-top:0.5mm">
            <div style="width:38mm;" class="styGenericDiv">
              <span style="width:1px"/>
            </div>
            <div style="width:100mm;text-align:center;padding-left:2mm" class="styGenericDiv">Cat. No. 49680W</div>
            <div style="float:right;" class="styGenericDiv">
              <b>Schedule I (Form 1120-F) 2008</b>
            </div>
          </div>
          <br/>
          <div class="pageEnd"/>
          <!-- End Page 1 Footer-->
          <!--END PAGE 1-->
          <!--BEGIN PAGE 2-->
          <!--Page 2 Header-->
          <div class="styTBB" style="width:187mm">
            <div style="float:right;clear:none">
            Page <span style="font-size:8pt;font-weight:bold">2</span>
            </div>
            <div>Schedule I (Form 1120-F) 2008</div>
          </div>
          <!--Begin Step 3 (cont) Adjusted U.S. Booked Liabilities Method-->
          <!--Step 3 (cont) Adjusted U.S. Booked Liabilities Method header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="width:27mm">Step 3 (cont.)</div>
            <div class="styPartDesc" style="width:160mm">
            Adjusted U.S. Booked Liabilities Method: Regulations Section 1.882-5(d)
          </div>
          </div>
          <!--Step 3 (cont.) Adjusted U.S. Booked Liabilities Method instructions-->
          <div class="styBB" style="width:187mm">
            <div style="font-size:7pt;padding-top:1mm">
              <b>If line 7c is greater than line 8, column (c),</b> complete lines 10 through 13 below and skip lines 14a and 14b.<br/>
              <b>If line 7c is less than or equal to line 8, column (c),</b> skip lines 10 through 13 and complete lines 14a and 14b.
          </div>
          </div>
          <!--Step 3 (cont.) Adjusted U.S. Booked Liabilities Method Table - Watch the colspans!-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 10-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:5mm">10</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" style="padding-top:1mm;padding-bottom:1mm">
                    <div style="float:left;clear:none;text-align:justify;width:138mm">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormData/ElectionToUse30DayLIBORRate"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3ForeignBankYes</xsl:with-param>
                        </xsl:call-template>
                    If the corporation is a foreign bank which is making a current-year election to use the published
                    average 30-day LIBOR (see instructions), check the box on this line, skip lines 10a through 10c, and enter the rate on line 10d
                  </label>
                      <span class="sty1120FSchIDotLn" style="padding-left:1.8mm">............................</span>
                      <span style="width:3.0mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                    <div style="width:3mm;float:right;clear:none">
                      <br/>
                      <br/>
                      <input type="checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormData/ElectionToUse30DayLIBORRate"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3ForeignBankYes</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10a-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="height:7mm;padding-bottom:3mm">a</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
                  Total interest paid or accrued during the tax year on U.S. dollar liabilities<br/>
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">......</span>
                    </div>
                  that are <b>not</b> U.S. booked liabilities included on line 8
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10a</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestPaidOnUSDollarLiab"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10b-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="height:7mm;padding-bottom:3mm">b</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
                  Average U.S. dollar denominated liabilities that are <b>not</b> U.S. booked<br/>
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">...............</span>
                    </div>
                  liabilities included on line 8
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10b</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USDollarDenominatedLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10c-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD">c</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" scope="row">
                    <div class="sty1120FSchIRightFloat" style="padding-right:2.3mm">
                      <span class="sty1120FSchIDotLn">...............</span>
                    </div>
                  Divide line 10a by line 10b
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10c</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestDividedByLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10d-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD">d</td>
                  <td class="sty1120FSchIStep3ContAdjUSDescShort" style="font-size:6pt;text-align:justify;text-align-last:justify" scope="row">
                  Enter the 30-day LIBOR rate, if elected under Temp. Regs. sec. 1.882-5T(d)(5)(ii)(B)
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10d</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/The30DayLIBORRate"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContAdjUSShadedCell" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 10e-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD">e</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.........</span>
                    </div>
                  Enter the rate from line 10c or, if elected, the 30-day LIBOR rate on line 10d
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">10e</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/RateForUse"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 11-->
                <tr>
                  <td class="sty1120FSchIGenericNum">11</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.............</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                    <b>Excess U.S.-connected liabilities.</b> Subtract line 8 from line 7c
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">11</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ExcessUSConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 12-->
                <tr>
                  <td class="sty1120FSchIGenericNum">12</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...................</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                    <b>Excess interest.</b> Multiply line 10e by line 11
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">12</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ExcessInterest"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 13-->
                <tr>
                  <td class="sty1120FSchIGenericNum">13</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.........................</span>
                    </div>
                  Add lines 9, column (c) and 12
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">13</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpense1"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 14a-->
                <tr>
                  <td class="sty1120FSchIGenericNum">14a</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...................</span>
                    </div>
                    <b>Scaling ratio.</b> Divide line 7c by line 8, column (c)
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">14a</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/ScalingRatio"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 14b-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD">b</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.........</span>
                    </div>
                  Multiply line 9, column (c) by line 14a. See instructions for hedging amounts
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">14b</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpense2"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 15-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:3mm">15</td>
                  <td class="sty1120FSchIStep3ContAdjUSDesc" colspan="3" scope="row">
                    <b>Interest expense allocable to ECI under the adjusted U.S. booked liabilities method.</b> Enter the<br/>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">................</span>
                      <span style="width:1.8mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                  result from line 13 or line 14b here and on line 21
                </td>
                  <td class="sty1120FSchIGenericRightNumBox" style="border-bottom-width:0">15</td>
                  <td class="sty1120FSchIStep3ContAdjUSAmountLastCol" style="padding-top:3mm;border-bottom-width:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/IntExpenseAdjUSBookedLiabMthd"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 3 (cont.)  Adjusted U.S. Booked Liabilities Method-->
          <!--BEGIN Step 3 (cont.) Separate Currency Pools Method-->
          <!--Step 3 (cont.) Separate Currency Pools Method Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartName" style="width:27mm">Step 3 (cont.)</div>
            <div class="styPartDesc" style="width:160mm">
            Separate Currency Pools Method: Regulations Section 1.882-5(e)
          </div>
          </div>
          <!--Step 3 (cont.) Separate Currency Pools Method Table-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Header-->
                <tr>
                  <!--Note: the following 2 cells have rowspan of 2 in order to capture the look of line 16a's description which is split across the table header and 1st cell-->
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchIStep3ContSepCurDesc">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader" style="padding-bottom:0.5mm">
                    <b>(a)</b>
                    <br/>U.S. Dollar<br/>Denominated</td>
                  <td class="sty1120FSchIStep3ContSepCurHeader">
                    <b>(b)</b>
                    <br/>Home Country<br/>Currency. Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/Currency"/>
                      </xsl:call-template>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader">
                    <b>(c)</b>
                    <br/>Other Currency.<br/>Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/Currency"/>
                      </xsl:call-template>
                    </div>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurHeader" style="border-right:none">
                    <b>(d)</b>
                    <br/>Other Currency.<br/>Specify:<br/>
                    <br/>
                    <div style="text-align:left">
                      <span style="width:1mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Bullet Image"/>
                      <span style="width:1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/Currency"/>
                      </xsl:call-template>
                    </div>
                  </td>
                </tr>
                <!--Line 16a-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:9.5mm">16a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div style="text-align-last:justify">
                      <b>U.S. assets.</b> Enter the corporation’s U.S. assets, using the methodology in Regs. sec. 1.882-5(e)(1)(i). If more columns are needed, attach schedule (see</div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.............</span>
                    </div>
                  instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/USAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/USAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/USAssets"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/USAssets"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 16b-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:3.5mm">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div style="text-align-last:justify">
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$FormData/LessThan3PctCurrencyElection"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3LessThan3PercentYes</xsl:with-param>
                        </xsl:call-template>Check here if a less than 3% currency election was
                  </label>
                    </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.............</span>
                      <span style="width:4.7mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                      <span style="width:2mm"/>
                      <input type="checkbox" class="styCkbox">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$FormData/LessThan3PctCurrencyElection"/>
                          <xsl:with-param name="BackupName">IRS1120FSchIStep3LessThan3PercentYes</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </div>
                  made
                </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShaded" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurShadedLastCol" style="border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 17a-->
                <tr>
                  <td class="sty1120FSchIGenericNum ">17a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.......</span>
                    </div>
                  Enter the percentage from line 6e
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/RatioFromStep2"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/RatioFromStep2"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/RatioFromStep2"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/RatioFromStep2"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 17b-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:2mm">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" style="padding-top:1mm" scope="row">
                    <span style="font-size:6pt">
                      <b>U.S.-connected liabilities. </b>Multiply line 16a by line 17a, or,</span>
                    <br/>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                    </div>
                    <span style="font-size:6pt">if a liability reduction election is made, see instructions</span>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/Step3USConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/Step3USConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/Step3USConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/Step3USConnectedLiabilities"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18a-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:9.5mm">18a</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div style="text-align-last:justify">
                    Enter the total interest expense paid or accrued for the tax year with respect to the foreign corporation’s worldwide liabilities denominated in that foreign
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.....</span>
                    </div>
                  currency (enter in functional currency)
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/InterestExpenseInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/InterestExpenseInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:9mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/InterestExpenseInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18b-->
                <tr style="padding-top:1mm">
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:5.5mm">b</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc">
                    <div style="text-align-last:justify">
                    Enter the corporation’s average worldwide liabilities (whether interest bearing or not) denominated in that
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                    </div>
                  foreign currency (enter in functional currency)
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/LiabilitiesInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/LiabilitiesInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/LiabilitiesInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/LiabilitiesInFuncCurrency"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 18c-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD">c</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">...</span>
                    </div>
                    <b>Borrowing rate:</b> Divide line 18a by line 18b
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/BorrowingRate"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/BorrowingRate"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/BorrowingRate"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/BorrowingRate"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 19-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:3mm">19</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" scope="row">
                    <div style="text-align-last:justify;font-weight:bold">
                    Interest expense allocation by separate currency
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">.......</span>
                    </div>
                    <b>pool.</b> Multiply line 17b by line 18c
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:2px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseAllocation"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:2px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/HomeCountryCurrency/InterestExpenseAllocation"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmount" style="padding-top:3mm;border-bottom-width:2px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnC/InterestExpenseAllocation"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="padding-top:3mm;border-bottom-width:2px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/OtherCurrencyColumnD/InterestExpenseAllocation"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 20-->
                <tr style="padding-top:1mm">
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:5.5mm">20</td>
                  <td class="sty1120FSchIStep3ContSepCurDesc" style="width:155mm" colspan="4">
                    <div style="text-align-last:justify">
                      <b>Interest expense allocable to ECI under the separate currency pools method.</b> Total the amounts on line 19, columns (a) through (d), and amounts from attached schedule, if any, and enter the result here and
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..................................</span>
                    </div>
                  on line 21
                </td>
                  <td class="sty1120FSchIStep3ContSepCurAmountLastCol" style="border-bottom-width:0;padding-top:6.5mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseSepCurPoolsMthd"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--END Step 3 (cont.) Separate Currency Pools Method-->
          <!--BEGIN Summary-->
          <!--Summary Header-->
          <div class="styBB" style="width:187mm">
            <div class="styPartDesc" style="padding-left:7.5mm">
            SUMMARY&#8212;Interest Expense Allocation and Deduction under Regulations Section 1.882-5
          </div>
          </div>
          <!--Summary Table-->
          <div class="styTBB" style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;font-size:7pt">
              <tbody>
                <!--Line 21-->
                <tr>
                  <td class="sty1120FSchIGenericNum">21</td>
                  <td class="sty1120FSchISummaryDescShort " scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..........</span>
                    </div>
                  Amount from line 15 or line 20, as applicable
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">21</td>
                  <td class="sty1120FSchISummaryAmount">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseSect18825dOr5e"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 22-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:3mm">22</td>
                  <td class="sty1120FSchISummaryDescShort " scope="row">
                    <div style="text-align-last:justify">
                    Enter the corporation’s interest expense directly allocable under Temp.
                  </div>

                  Regs. sec. 1.882-5T(a)(1)(ii). (Include total from Schedule P, line 14b.)
                </td>
                  <td class="sty1120FSchIGenericRightNumBox">22</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseSect18825Ta1ii"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 23-->
                <tr>
                  <td class="sty1120FSchIGenericNum">23</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">......</span>
                      <span style="width:1.5mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                    <b>Interest expense allocable to ECI under Regs. sec. 1.882-5.</b> Add lines 21 and 22
                </td>
                  <td class="sty1120FSchIGenericRightNumBox ">23</td>
                  <td class="sty1120FSchISummaryAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/InterestExpenseAllocableToECI"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 24a-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:3.5mm">24a</td>
                  <td class="sty1120FSchISummaryDescShort" style="text-align-last:justify" scope="row">
                    Amount of line 23 that is disallowed as a deduction under section 265 or under an income tax treaty (attach schedule&#8212;see instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AmtDisallowedUnderSect265"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24a</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-right:0">
                    <div style="float:right;clear:none;padding-top:3mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AmtDisallowedUnderSect265"/>
                      </xsl:call-template>)
                    </div>
                    <div style="text-align:left;padding-top:3mm">(</div>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24b-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:1.5mm">b</td>
                  <td class="sty1120FSchISummaryDescShort" style="padding-top:1.5mm" scope="row">
                    <div style="text-align-last:justify">
                    Deferred interest expense under section 163(e)(3), 163(j), or
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">........</span>
                    </div>
                  267(a)(3) (attach schedule&#8212;see instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/DefrdIntExpenseUndSect163Or267"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24b</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-top:3mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/DefrdIntExpenseUndSect163Or267"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24c-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-bottom:2mm">c</td>
                  <td class="sty1120FSchISummaryDescShort" style="padding-top:1.5mm" scope="row">
                    <div style="text-align-last:justify">
                    Amount of line 23 that is capitalized under section 263A (attach
                  </div>
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">..............</span>
                    </div>
                  schedule&#8212;see instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/AmtCapitalizedUnderSect263A"/>
                    </xsl:call-template>
                  </td>
                  <td class="sty1120FSchIGenericRightNumBox">24c</td>
                  <td class="sty1120FSchISummaryAmount" style="padding-right:0">
                    <div style="float:right;clear:none;padding-top:3mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AmtCapitalizedUnderSect263A"/>
                      </xsl:call-template>)
                    </div>
                    <div style="text-align:left;padding-top:3mm">(</div>
                  </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <!--Line 24d-->
                <tr>
                  <td class="sty1120FSchIGenericLetterDD" style="padding-top:1.5mm">d</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" style="padding-top:1.5mm" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">........................</span>
                    </div>
                  Combine lines 24a through 24c
                </td>
                  <td class="sty1120FSchIGenericRightNumBox ">24d</td>
                  <td class="sty1120FSchISummaryAmountLastCol">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/CombinedAmount"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--Line 25-->
                <tr>
                  <td class="sty1120FSchIGenericNum" style="padding-bottom:1.5mm">25</td>
                  <td class="sty1120FSchISummaryDesc" colspan="3" style="text-align-last:justify;padding-top:1.5mm" scope="row">
                    <b>Total interest expense deduction under Regs. sec. 1.882-5.</b> Combine lines 23 and 24d and enter here and on Form 1120F, Section II, line 18. The amount entered on line 25 may not exceed the
                </td>
                  <td class="sty1120FSchISummaryShadedRightNumBox ">
                    <span style="width:1px"/>
                  </td>
                  <td class="sty1120FSchISummaryShadedAmountLastCol">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="sty1120FSchIGenericNum"/>
                  <td class="sty1120FSchISummaryDesc" colspan="3" scope="row">
                    <div class="sty1120FSchIRightFloat">
                      <span class="sty1120FSchIDotLn">............</span>
                      <span style="width:1.5mm"/>
                      <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
                    </div>
                  total interest expense paid or accrued by the foreign corporation
                </td>
                  <td class="sty1120FSchIGenericRightNumBox" style="border-bottom-width:0">25</td>
                  <td class="sty1120FSchISummaryAmountLastCol" style="border-bottom-width:0">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalInterestExpenseDeduction"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--Begin Page 2 Footer-->
          <div style="width:187mm;clear:both;padding-top:0.5mm">
            <div style="float:right;" class="styGenericDiv">
              <b>Schedule I (Form 1120-F) 2008</b>
            </div>
          </div>
          <br/>
          <div class="pageEnd"/>
          <!-- End Page 2 Footer-->
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
