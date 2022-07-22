<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120SScheduleDStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Commented by Ravi Venigalla on 06/28/03 to resolve duplicate global variable declaration error-->
  <!--  <xsl:param name="Print"></xsl:param>   -->
  <xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleD"/>
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
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120S Schedule D"/>
        <!-- javascript include -->
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120SScheduleDStyle"/>
            <xsl:call-template name="AddOnStyle"/>
         </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <!-- Standard Warning Line -->
        <xsl:call-template name="DocumentHeader"/>
        <!-- BEGIN FORM HEADER -->
        <div class="styBB" style="width: 187mm">
          <!-- Form Name -->
          <div class="styFNBox" style="height: 19mm;width:30mm;">
            <span class="styFormNumber" style="font-size:10pt;">SCHEDULE D</span>
            <br/>
            <span class="styFormNumber" style="font-size:10pt;">(Form 1120S)
     <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
            </span>
            <br/>
            <div class="styAgency" >Department of the Treasury<br/>Internal Revenue Service</div>
            <!--xsl:call-template name="LinkToLeftoverDataTable">
        <xsl:with-param name="TargetNode" select="$FormData/@softwareId"/>
        <xsl:with-param name="Desc">Software ID</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="LinkToLeftoverDataTable">
        <xsl:with-param name="TargetNode" select="$FormData/@softwareVersion"/>
        <xsl:with-param name="Desc">Software Version</xsl:with-param>
        <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
      </xsl:call-template-->
          </div>
          <!-- Form Title Box -->
          <div class="styFTBox" style="height: 19mm;width:123mm;">
            <!-- Form Title -->
            <span class="styMainTitle">Capital Gains and Losses and Built-in Gains</span>
            <!--    <span class="IRS1120SScheduleD_styFMT">Capital Gains and Losses and Built-In Gains</span>-->
            <!-- Form Subtitle -->
            <br/>
            <span style="font-weight:bold">
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>  Attach to Form 1120S. 
       <br/>
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>  See separate instructions.
    </span>
          </div>
          <!-- Tax Year Box -->
          <div class="styTYBox" style="height: 19mm;width:33mm;">
            <!-- OMB No. -->
            <div class="styOMB" style="text-align:center;">OMB No. 1545-0130</div>
            <!-- Tax Year -->
            <div class="styTY" style="text-align: center; padding-top: 2.5mm">
       20<span class="styTYColor">10</span>
            </div>
          </div>
        </div>
        <!-- Name and Address -->
        <div class="styBB" style="width:187mm;border-bottom-width:0px;">
          <div class="styNameBox" style="width:137mm;height:8mm;font-size:7pt;">
      Name<br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
      Employer identification number <br/>
            <br/>
            <span style="width:40mm;text-align:left;font-weight:normal;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </span>
          </div>
        </div>
        <!--Part I -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
                      Short-Term Capital Gains and Losses&#151;Assets Held One Year or Less
                 </div>
          <div style="float:right;">
            <!-- button display logic -->
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
              <xsl:with-param name="containerHeight" select="4"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'stctn' "/>
            </xsl:call-template>
            <!-- end button display logic -->
          </div>
        </div>
        <!-- part I table header -->
        <div class="styTableContainerNBB" name="stctn" id="stctn">
          <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
          <!-- end -->
          <table class="IRS1120SScheduleD_styTable" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr style="font-size: 6pt">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares<br/>of Z Co.)</th>
              <th class="IRS1120SScheduleD_DateCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)</th>
              <th class="IRS1120SScheduleD_DateCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(d)</span> Sales price</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center; width: 37mm" scope="col">
                <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center;border-right-width: 0px" scope="col">
                <span style="font-weight:bold;">(f) Gain or (loss)</span>
                <br/>(Subtract (e) from (d))</th>
            </tr>
            <!-- part I body -->
            <xsl:if test="($Print != $Separated) or (count($FormData/ShortTermCapitalGainAndLoss/PropertyDescription) &lt;5)">
              <xsl:for-each select="$FormData/ShortTermCapitalGainAndLoss">
                <tr>
                  <td class="IRS1120SScheduleD_DescCol" scope="row" style="width:43mm;">
                    <span class="IRS1120SScheduleD_IndexCol">
                      <xsl:if test="position()=1">1</xsl:if>
                    </span>
                    <span class="IRS1120SScheduleD_DescColBody" style="width:36mm;">
                      <!-- Push pin to attachment -->
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                      <span style="width:2px;"/>
                      <!-- Property Description data -->
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS1120SScheduleD_DateCol" style="text-align:center;width:20mm;">
                    <!-- If DateAcquired exists, display DataAcquired data. If DateAcquiredVarious exists, display its data. -->
                    <xsl:if test="DateAcquired">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateAcquired"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="DateAcquiredVarious">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td class="IRS1120SScheduleD_DateCol" style="text-align:center;width:20mm;">
                    <!-- If DateSold exists, display DataSold data. If DateSoldVarious exists, display its data. -->
                    <xsl:if test="DateSold">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateSold"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="DateSoldVarious">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol" style="text-align:right;">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="SalesPrice"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol" style="text-align:right; width: 37mm">
                    <span style="float: left; clear:none">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                      </xsl:call-template>
                    </span>
                    <span>
                      <span class="IRS1120SScheduleD_styTableCellPad" style="text-align:right"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol" style="text-align:right;border-right-width: 0px">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:if>
            <xsl:if test="(count($FormData/ShortTermCapitalGainAndLoss) &lt; 1) or (($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_IndexCol">1</span>
                  <span style="width: 2mm"/>
                  <xsl:if test="($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;4)">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss/PropertyDescription"/>
                      <xsl:with-param name="ShortMessage">true</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/ShortTermCapitalGainAndLoss) &lt; 2) or (($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/ShortTermCapitalGainAndLoss) &lt; 3) or (($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/ShortTermCapitalGainAndLoss) &lt; 4) or (($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
          </table>
        </div>
        <xsl:call-template name="SetInitialDynamicTableHeight">
          <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainAndLoss"/>
          <xsl:with-param name="containerHeight" select="4"/>
          <xsl:with-param name="headerHeight" select="1"/>
          <xsl:with-param name="containerID" select="'stctn'"/>
        </xsl:call-template>
        <!-- line 2 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">2</div>
          <div class="styLNDesc" style="width:139mm;">Short-term capital gain from installment sales from Form 6252, line 26 or 37
           <span class="styDotLn" style="float:none">.........</span>
          </div>
          <div class="styLNRightNumBox">2</div>
          <div class="styLNAmountbox" style="">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapGainInstalSales"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 3 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">3</div>
          <div class="styLNDesc" style="width:139mm;">Short-term capital gain or (loss) from like-kind exchanges from Form 8824
           <span class="styDotLn" style="float:none">.........</span>
          </div>
          <div class="styLNRightNumBox">3</div>
          <div class="styLNAmountbox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/ShortTermGainLossFromLikeKind"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 4 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">4</div>
          <div class="styLNDesc" style="width:139mm;">Combine lines 1 through 3 in column (f)
           <span class="styDotLn" style="float:none">.....................</span>
          </div>
          <div class="styLNRightNumBox">4</div>
          <div class="styLNAmountbox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalShortTermGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 5 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">5</div>
          <div class="styLNDesc" style="width:139mm;">Tax on short-term capital gain included on line 21 below
           <span class="styDotLn" style="float:none">................</span>
          </div>
          <div class="styLNRightNumBox">5</div>
          <div class="styLNAmountbox">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnShortTermCapitalGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 6 double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">6</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold;">Net short-term capital gain or (loss). </span> Combine lines 4 and 5. Enter here and on Form</div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountboxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD"/>
          <div class="styLNDesc" style="width:139mm;">1120S, Schedule K, line 7 or 10
           <span class="styDotLn" style="float:none">........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">6</div>
          <div class="styLNAmountboxNBB" style="">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetShortTermCapitalGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- part II header -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
                 Long-Term Capital Gains and Losses&#151;Assets Held More Than One Year
                </div>
          <div style="float:right;">
            <!-- button display logic -->
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
              <xsl:with-param name="containerHeight" select="4"/>
              <xsl:with-param name="containerID" select="'ltctn'"/>
            </xsl:call-template>
            <!-- end button display logic -->
          </div>
        </div>
        <!-- part II table header -->
        <div class="styTableContainerNBB" name="ltctn" id="ltctn">
          <!-- print related logic -->
          <xsl:call-template name="SetInitialState"/>
          <!-- end printing logic -->
          <table class="IRS1120SScheduleD_styTable" cellspacing="0">
            <tr style="font-size: 6pt">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares<br/>of Z Co.)</th>
              <th class="IRS1120SScheduleD_DateCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)</th>
              <th class="IRS1120SScheduleD_DateCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center;" scope="col">
                <span style="font-weight:bold;">(d)</span> Sales price</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center;width:37mm;" scope="col">
                <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)</th>
              <th class="IRS1120SScheduleD_MoneyCol" style="font-weight:normal;text-align:center;border-right-width: 0px" scope="col">
                <span style="font-weight:bold;">(f) Gain or (loss)</span>
                <br/>(Subtract (e) from (d))</th>
            </tr>
            <!-- part II body -->
            <xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($FormData/LongTermCapitalGainAndLoss) &lt; 5))">
              <xsl:for-each select="$FormData/LongTermCapitalGainAndLoss">
                <tr>
                  <td class="IRS1120SScheduleD_DescCol" scope="row">
                    <span class="IRS1120SScheduleD_IndexCol">
                      <xsl:if test="position() = 1">7</xsl:if>
                    </span>
                    <span class="IRS1120SScheduleD_DescColBody">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS1120SScheduleD_DateCol">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:if test="DateAcquired">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateAcquired"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="DateAcquiredVarious">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td class="IRS1120SScheduleD_DateCol">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:if test="DateSold">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateSold"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="DateSoldVarious">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="SalesPrice"/>
                    </xsl:call-template>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol" style="width: 37mm;">
                    <span style="float: left; clear:none">
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                      </xsl:call-template>
                    </span>
                    <span>
                      <span class="IRS1120SScheduleD_styTableCellPad" style="text-align:right;"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:if>
            <xsl:if test="(count($FormData/LongTermCapitalGainAndLoss) &lt; 1) or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_IndexCol">7</span>
                  <span style="width: 2mm"/>
                  <xsl:if test="($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4)">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss/PropertyDescription"/>
                      <xsl:with-param name="ShortMessage">true</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/LongTermCapitalGainAndLoss) &lt; 2) or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/LongTermCapitalGainAndLoss) &lt; 3) or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(count($FormData/LongTermCapitalGainAndLoss) &lt; 4) or (($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4))">
              <tr>
                <td class="IRS1120SScheduleD_DescCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_DateCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
                <td class="IRS1120SScheduleD_MoneyCol" style="border-right-width: 0px">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                </td>
              </tr>
            </xsl:if>
          </table>
        </div>
        <xsl:call-template name="SetInitialDynamicTableHeight">
          <xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainAndLoss"/>
          <xsl:with-param name="containerHeight" select="4"/>
          <xsl:with-param name="headerHeight" select="1"/>
          <xsl:with-param name="containerID" select="'ltctn'"/>
        </xsl:call-template>
        <!-- line 8 (f) & (g) -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD">8</div>
          <div class="styLNDesc" style="width:139mm;">Long-term capital gain from installment sales from Form 6252, line 26 or 37<span class="styDotLn" style="float:none">.........</span>
          </div>
          <div class="styLNRightNumBox">8</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LongTermCapGainInstalSales"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 9 (f) & (g) -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD">9</div>
          <div class="styLNDesc" style="width:139mm;">Long-term capital gain or (loss) from like-kind exchanges from Form 8824
          <span class="styDotLn" style="float:none">.........</span>
          </div>
          <div class="styLNRightNumBox">9</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LongTermGainLossFromLikeKind"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 10 (f) & (g) -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">10</div>
          <div class="styLNDesc" style="width:139mm;">Capital gain distributions
          <span style="width:3px;"/>
            <span class="styDotLn" style="float:none">..........................</span>
          </div>
          <div class="styLNRightNumBox">10</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributions"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 11 (f) -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">11</div>
          <div class="styLNDesc" style="width:139mm;">Combine lines 7 through 10 in column (f)
        <span style="width:3px;"/>
            <span class="styDotLn" style="float:none">.....................</span>
          </div>
          <div class="styLNRightNumBox">11</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalLongTermGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 12 (f) -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">12</div>
          <div class="styLNDesc" style="width:139mm;">Tax on long-term capital gain included on line 21 below
          <span class="styDotLn" style="float:none">................</span>
          </div>
          <div class="styLNRightNumBox">12</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnLongTermCapitalGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 13 (f), double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">13</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold;">Net long-term capital gain or (loss). </span> Combine lines 11 and 12.  Enter here and on Form 1120S,
        </div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountBoxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox"/>
          <div class="styLNDesc" style="width:139mm;">
          Schedule K, line 8a or 10
          <span class="styDotLn" style="float:none">...........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">13</div>
          <div class="styLNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetLongTermCapitalGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- part III header-->
        <!--          
            <div class="styBB" style="width:187mm;border-top-width:1px">
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
              Information on Donated Property&#151;<span class="styNormalText">If you need more space, attach a statement.</span>
            </div>
            <div style="float:right;">
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form8283Data/InformationOnDonatedProperty"/>    
                  <xsl:with-param name="containerHeight" select="5"/>
                  <xsl:with-param name="headerHeight" select="1"/>      
                  <xsl:with-param name="containerID" select=" 'TPctn' "/>
                </xsl:call-template>  
            </div>
          </div>  
       -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
 Built-In Gains Tax
          <span class="styNormalText">(See instructions
         <span class="styBoldText">before</span>
       completing this part.)</span>
          </div>
        </div>
        <!-- line 14 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">14</div>
          <div class="styLNDesc" style="width:139mm;">Excess of recognized built-in gains over recognized built-in losses (attach computation schedule)
      <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLosses"/>
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBox">14</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLosses"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 15 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">15</div>
          <div class="styLNDesc" style="width:139mm;">Taxable income (attach computation schedule)
      <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncome"/>
            </xsl:call-template>
            <span style="width:15px;"/>
            <span class="styDotLn" style="float:none">.................</span>
          </div>
          <div class="styLNRightNumBox">15</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncome"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 16 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">16</div>
          <div class="styLNDesc" style="width:139mm;">Net recognized built-in gain. Enter the smallest of line 14, line 15, or line 6 of Schedule B
          <span style="width:4px;"/>
            <span class="styDotLn" style="float:none">....</span>
          </div>
          <div class="styLNRightNumBox">16</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetRecognizedBuiltInGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 17 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">17</div>
          <div class="styLNDesc" style="width:139mm;">Section 1374(b)(2) deduction
            <span class="styDotLn" style="float:none">.........................</span>
          </div>
          <div class="styLNRightNumBox">17</div>
          <div class="styLNAmountBox" style="border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Section1374b2Deduction"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 18 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">18</div>
          <div class="styLNDesc" style="width:139mm;">Subtract line 17 from line 16. If zero or less, enter -0- here and on line 21
            <span style="width:4px;"/>
            <span class="styDotLn" style="float:none">..........</span>
          </div>
          <div class="styLNRightNumBox">18</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLess1374b2Ded"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 19 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">19</div>
          <div class="styLNDesc" style="width:139mm;">Enter 35% of line 18
            <span class="styDotLn" style="float:none">...........................</span>
          </div>
          <div class="styLNRightNumBox">19</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLess1374b2Ded35"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 20 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">20</div>
          <div class="styLNDesc" style="width:139mm;">Section 1374(b)(3) business credit and minimum tax credit carryforwards from C corporation years</div>
          <div class="styLNRightNumBox">20</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BusinessAndMinimumTaxCredits"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 21 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">21</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold">Tax.</span>
         Subtract line 20 from line 19 (if zero or less, enter -0-). Enter here and on Form 1120S, page 1,
        </div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountBoxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox"/>
          <div class="styLNDesc" style="width:139mm;">line 22b
         <span class="styDotLn" style="float:none">...............................</span>
          </div>
          <div class="styLNRightNumBoxNBB">21</div>
          <div class="styLNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTax"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- footer line -->
        <div class="IRS1120SScheduleD_LineContainer" style="font-size:6pt;border-top:1 solid black;">
          <div style="font-weight:bold;width:123mm;float:left;">
            For Paperwork Reduction Act Notice, see the Instructions for Form 1120S.
          </div>
          <div style="width:23mm;float:left;">
            Cat. No. 11516V
          </div>
          <div style="width:41mm;text-align:right;float:left;">
            <b>Schedule D (Form 1120S) 2010</b>
          </div>
        </div>
        <!-- Left over data -->
        <br/>
        <br class="pageEnd"/>
        <!-- BEGIN Left Over Table -->
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
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
        </table>
        <!-- END Left Over Table -->
        <xsl:if test="($Print = $Separated) and (count($FormData/ShortTermCapitalGainAndLoss/PropertyDescription) &gt;4)">
          <br/>
          <span class="styRepeatingDataTitle">Form 1120S Schedule D Part I Line 1 - Short-Term Capital Gains and Losses—Assets Held One Year or Less:</span>
          <table class="styDepTbl" style="font-size: 6pt">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width: 39mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares<br/>of Z Co.)</th>
                <th class="styDepTblCell" style="width: 20mm; font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)</th>
                <th class="styDepTblCell" style="width: 20mm; font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(d)</span> Sales price</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal;" scope="col">
                  <span style="font-weight:bold;">(f)</span> Gain or (loss)<br/>(Subtract (e) from (d))</th>
              </tr>
            </thead>
            <!-- part I body -->
            <xsl:for-each select="$FormData/ShortTermCapitalGainAndLoss">
              <tr>
                <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                <td class="styDepTblCell" style="text-align: left" scope="row">
                  <span class="IRS1120SScheduleD_IndexCol">
                    <xsl:if test="position()=1">1</xsl:if>
                  </span>
                  <!-- Push pin to attachment -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:Center;">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                  <xsl:if test="DateAcquired">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="DateAcquired"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="DateAcquiredVarious">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                    </xsl:call-template>
                  </xsl:if>
                </td>
                <td class="styDepTblCell" style="text-align:Center;">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                  <xsl:if test="DateSold">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="DateSold"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="DateSoldVarious">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                    </xsl:call-template>
                  </xsl:if>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="SalesPrice"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                  </xsl:call-template>
                  <span class="IRS1120SScheduleD_styTableCellPad" style="text-align:right"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <span class="IRS1120SScheduleD_styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>
        <xsl:if test="($Print = $Separated) and (count($FormData/LongTermCapitalGainAndLoss) &gt;4)">
          <br/>
          <span class="styRepeatingDataTitle">Form 1120S Schedule D Part II Line 7 - Long-Term Capital Gains and Losses—Assets Held More Than One Year:</span>
          <table class="styDepTbl" style="font-size:  6pt">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width: 39mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(a)</span> Description of property<br/>(Example: 100 shares<br/>of Z Co.)</th>
                <th class="styDepTblCell" style="width: 19mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(b)</span> Date acquired<br/>(mo., day, yr.)</th>
                <th class="styDepTblCell" style="width: 19mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(c)</span> Date sold<br/>(mo., day, yr.)</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(d)</span> Sales price</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(e)</span> Cost or other<br/>basis (see<br/>instructions)</th>
                <th class="styDepTblCell" style="width: 26mm; font-weight:normal" scope="col">
                  <span style="font-weight:bold;">(f)</span> Gain or (loss)<br/>(Subtract (e) from (d))</th>
              </tr>
            </thead>
            <!-- part II body -->
            <tbody>
              <xsl:for-each select="$FormData/LongTermCapitalGainAndLoss">
                <tr>
                  <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                  <td class="styDepTblCell" scope="row" style="text-align: left;">
                    <span class="IRS1120SScheduleD_IndexCol">
                      <xsl:if test="position() = 1">7</xsl:if>
                    </span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:if test="DateAcquired">
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateAcquired"/>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="DateAcquiredVarious">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DateAcquiredVarious"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td class="styDepTblCell">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="DateSold"/>
                    </xsl:call-template>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="DateSoldVarious"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="text-align: right;">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="SalesPrice"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="text-align: right;">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                    </xsl:call-template>
                    <span class="IRS1120SScheduleD_styTableCellPad" style="text-align:right;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                    </xsl:call-template>
                  </td>
                  <td class="styDepTblCell" style="text-align: right;">
                    <span class="IRS1120SScheduleD_styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="GainOrLoss"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
