<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS6251Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS6251"/>
  <xsl:template match="/">
    <html lang="EN-US">
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
        <meta name="Description" content="IRS Form 6251"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS6251Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form6251">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:30mm;height:20mm;padding:bottom:0mm;">
                         Form<span style="width:1mm;"></span>
                            <span class="styFormNumber">6251</span>
                            <br/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template><br/>
              <div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;">Department of the Treasury<br/>
            Internal Revenue Service(99)
                            </div>
            </div>
    <div class="styFTBox" style="width:121mm;height:20mm;">           
      <div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">
        Alternative Minimum Tax&#8212;Individuals
      </div>
      <div class="styFBT" style="font-size:7pt;height:5mm;padding-top:1mm;">
        <img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Information about Form 6251 and its separate instructions is at <i>www.irs.gov/form6251</i>.<br/>
        <img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040 or Form 1040NR.
      </div>
    </div>
  <div class="styTYBox" style="width:35mm; height:20mm">
              <div style="padding-top:0mm;border-bottom:1 solid black;font:6pt;">OMB No. 1545-0074</div>
              <div>
                <span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">13</span></span>
              </div>
              <div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">32</b>
              </div>
            </div>
          </div>
          <!-- Name(s) shown on return -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:140mm; height:8mm">
                    Name(s) shown on Form 1040 or Form 1040NR<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template>
              <xsl:if test="$RtnHdrData/Filer//BusinessNameLine2">
				  <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
				  </xsl:call-template>
              </xsl:if>
              <div style="line-height:100%; font-family:verdana;font-size:7pt"/>
            </div>
                            <b> Your social security number</b><br/>
           <span style="font-weight:normal;text-align:center;width:100%">
			   <xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
           </span>
          </div>
          <!-- Part l -->
          <!-- Part I - Header -->
          <div style="width:187mm;height:0mm;border-bottom:1px solid black;float:left;padding-top:0mm;font-family:arial;">
            <span class="styPartName" style="height:4mm;width:15mm;font-size:13;">Part I</span>
            <span style="width:167mm;font-weight:normal;" class="styPartDesc">
              <span style="width:3mm;font-size:10pt;height:0mm;vertical-align:top;"/>
              <b>Alternative Minimum Taxable Income</b> (See instructions for how to complete each line.)
            </span>
          </div>
          <!-- End Part I Header -->
          <!-- Part I body -->
          <div  style="width:187mm;border-bottom:1px solid black;float:left;">
          <!-- Line 1 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">1
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                 If filing Schedule A (Form 1040), enter the amount from Form 1040, line 41, and go to line 2.
                            </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                 Otherwise, enter the amount from Form 1040, line 38, and go to line 7. (If less than zero, enter as a
                            </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">
                negative amount.)
                </span>
                <span class="styIRS6251DotLn">...........................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">1</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AGIOrAGILessDeductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 2 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">2
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                 Medical and dental. If you or your spouse was 65 or older, enter the <b>smaller</b> of Schedule A (Form
                            </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">
                1040), line 4, <b>or</b> 2.5% (.025) of Form 1040, line 38. If zero or less, enter -0-
                </span>
                <span class="styIRS6251DotLn">........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">2</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SmllrOfSchAMedDedOrCalAGIAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 3 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">3
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Taxes from Schedule A (Form 1040), line 9</span>
                <span class="styIRS6251DotLn">................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ScheduleATaxesAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 4 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">4
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
              Enter the home mortgage interest adjustment, if any, from line 6 of the worksheet in the instructions
                            </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">for this line</span>
                <span class="styIRS6251DotLn">.............................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">4</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CertainHomeMortgageInterestAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 5 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">5
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Miscellaneous deductions from Schedule A (Form 1040), line 27</span>
                <span class="styIRS6251DotLn">............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">5</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SchANetMiscellaneousDedsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 6 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">6
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
              <span style="float:left">If Form 1040, line 38, is $150,000 or less, enter -0-. Otherwise, see instructions</span> 
                <span class="styIRS6251DotLn">......</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">6</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/ItemizedDedWorkshtAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 7 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4.5mm;padding-bottom:0mm;padding-left: 4.1mm">7
              </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4.5mm;padding-bottom:0mm;">
                <span style="float:left">Tax refund from Form 1040, line 10 or line 21</span>
                <span class="styIRS6251DotLn">...................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;bottom-border-width:1px;">7</div>
              <div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 8 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">8
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Investment interest expense (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">..........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 9 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">9
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Depletion (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">.............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">9</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/DepletionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 10 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">10
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Net operating loss deduction from Form 1040, line 21. Enter as a positive amount</span>
                <span class="styIRS6251DotLn">.......</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">10</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 11 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">11
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Alternative tax net operating loss deduction</span>
                <span class="styIRS6251DotLn">...................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">11</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/AltTaxNetOperatingLossDedAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 12 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Interest from specified private activity bonds exempt from the regular tax</span>
                <span class="styIRS6251DotLn">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">12</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ExemptPrivateActivityBondsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 13 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">13
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Qualified small business stock (7% of gain excluded under section 1202)</span>
                <span class="styIRS6251DotLn">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">13</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/Section1202ExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 14 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">14
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Exercise of incentive stock options (excess of AMT income over regular tax income)</span>
                <span class="styIRS6251DotLn">......</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">14</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IncentiveStockOptionsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 15 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Estates and trusts (amount from Schedule K-1 (Form 1041), box 12, code A)</span>
                <span class="styIRS6251DotLn">........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">15</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 16 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">16
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Electing large partnerships (amount from Schedule K-1 (Form 1065-B), box 6)</span>
                <span class="styIRS6251DotLn">.......</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">16</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/LargePartnershipAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 17 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">17
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Disposition of property (difference between AMT and regular tax gain or loss)</span>
                <span class="styIRS6251DotLn">........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">17</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PropertyDispositionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 18 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">18
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Depreciation on assets placed in service after 1986 (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">..</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">18</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 19 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">19
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Passive activities (difference between AMT and regular tax income or loss)</span>
                <span class="styIRS6251DotLn">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">19</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/PassiveActivityAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 20 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">20
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Loss limitations (difference between AMT and regular tax income or loss)</span>
                <span class="styIRS6251DotLn">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">20</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/LossLimitationAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 21 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">21
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Circulation costs (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">..............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">21</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CirculationCostAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 22 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">22
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Long-term contracts (difference between AMT and regular tax income)</span>
                <span class="styIRS6251DotLn">..........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">22</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/LongTermContractAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 23 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">23
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Mining costs (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">...............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">23</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/MiningCostsAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 24 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">24
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Research and experimental costs (difference between regular tax and AMT)</span>
                <span class="styIRS6251DotLn">.........</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">24</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ResearchExperimentalCostAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 25 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">25
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Income from certain installment sales before January 1, 1987</span>
                <span class="styIRS6251DotLn">.............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">25</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateNegativeNumber">
                  <xsl:with-param name="TargetNode" select="$FormData/InstallmentSaleIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 26 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">26
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Intangible drilling costs preference</span>
                <span class="styIRS6251DotLn">.....................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">26</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/IntangibleDrillingCostAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 27 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">27
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">Other adjustments, including income-based related adjustments</span>
                <span class="styIRS6251DotLn">............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">27</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/RelatedAdjustmentAmt"/>
                </xsl:call-template>
              </div>
            </div>
          <!-- Line 28 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">28
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
              <b>Alternative minimum taxable income.</b> Combine lines 1 through 27. (If married filing separately, and
                            </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
          <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">line 28 is more than $238,550, see instructions.)</span>
                <span class="styIRS6251DotLn">.................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom;none">28</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Residual Interest In REMIC Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Part ll -->
          <!-- Part Il - Header -->
          <div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;">
            <span class="styPartName" style="height:4.5mm;width:18mm;font-size:13;font-family:arial;">Part II</span>
            <span style="width:167mm;font-weight:normal;" class="styPartDesc">
              <span style="width:3mm;font-size:10pt;height:4mm;"/>
              <b>Alternative Minimum Tax (AMT)</b>
            </span>
          </div>
          <!-- END Part ll Header-->

            <!-- Line 29 -->
           <!-- Line 29 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0;padding-left: 2.25mm">29</div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
                 Exemption. (If you were under age 24 at the end of 2013, see instructions.)
              </div>
              <div class="styLNRightNumBox" style="height:3mm;background-color: lightgrey; padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
            
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-left: 2.25mm"/>
              <div style="float:left;position:relative;">
                <div style="position:absolute;bottom:0;right:0;">
                  <span style="float:right;text-align:right;letter-spacing:3mm;font-weight:bold;margin-top:5mm;margin-left:2mm;margin-right:3mm;">..</span>
                  <img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif" style="float:right;"/>
                </div>
                <div style="float:left;font-weight:bold;">
                  <div class="styLNDesc" style="font-size:7pt;width:58mm;height:3mm;">
                    IF your filing status is...
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:37mm;height:3mm;text-align:right;padding-right:2mm;">
                     AND line 28 is not over...
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:40mm;height:3mm;text-align:right;padding-right:5mm;">
                     THEN enter on line 29...
                  </div>
                </div>
                <div style="float:left;padding-top:1mm;">
                  <div class="styLNDesc" style="font-size:7pt;width:58mm;height:3mm;">
                    Single or head of household<span style="text-align:right;letter-spacing:3mm;font-weight:bold;">.....</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;text-align:right;">
                     $115,400
                     <span style="text-align:right;letter-spacing:3mm;font-weight:bold;">......</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;text-align:right;padding-right:10mm;">
                     $51,900
                  </div>
                </div>
                <div style="float:left;padding-top:1mm;">
                  <div class="styLNDesc" style="font-size:7pt;width:58mm;height:3mm;">
                    Married filing jointly or qualifying widow(er)
                    <span style="text-align:right;letter-spacing:3mm;font-weight:bold;">.</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;text-align:right;">
                     153,900<span style="text-align:right;letter-spacing:3mm;font-weight:bold;">......</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;text-align:right;padding-right:10mm;">
                     80,800
                  </div>
                </div>
                <div style="float:left;padding-top:1mm;">
                  <div class="styLNDesc" style="font-size:7pt;width:58mm;height:3mm;padding-bottom:0mm;">
                    Married filing separately<span style="text-align:right;letter-spacing:3mm;font-weight:bold;">.......</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;padding-bottom:0mm;text-align:right;">
                     76,950<span style="text-align:right;letter-spacing:3mm;font-weight:bold;">......</span>
                  </div>
                  <div class="styLNDesc" style="font-size:7pt;width:35mm;height:3mm;padding-bottom:0mm;text-align:right;padding-right:10mm;">
                     40,400
                  </div>
                </div>
              </div>
              <div style="float:left;">
                <div class="styLNRightNumBox" style="height:16mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="clear:left;height:5mm;">29</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="width:36mm;height:16mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxExemptAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
                 If line 28 is <span class="styBoldText">over</span> the amount shown above for your filing status, see instructions.
              </div>
              <div class="styLNRightNumBox" style="height:3mm;padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>            
            <!-- Line 30 -->
            <div class="styGenericDiv" style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-bottom:0;padding-left: 2.25mm">30</div>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-bottom:0mm;">
                 Subtract line 29 from line 28. If more than zero, go to line 31. If zero or less, enter -0- here and on
                            </div>
              <div class="styLNRightNumBox" style="height:3mm;padding-bottom:0mm; border-bottom-width:0px;"/>
              <div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left"> lines 31, 33 and 35, and go to line 34</span>
                <span class="styIRS6251DotLn">....................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4.2mm;padding-bottom:0mm;">30</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">RPI Special Processing Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt"/>
                </xsl:call-template>
              </div>
            </div>
            
            <!-- Line 31 -->
            <div style="width:187mm;">
              <div style="float:left;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:26mm;padding-left: 2.25mm">31</div>
              </div>
              <div style="float:left;font-size:7pt;width:125mm;height:26mm;padding-top:.5mm;">
                <ul style="margin-left:2mm;padding-left:2mm;margin-bottom:0mm;padding-bottom:0mm;">
                  <li>If you are filing Form 2555 or 2555-EZ, see instructions for the amount to enter.</li>
                  <li>If you reported capital gain distributions directly on Form 1040, line 13; you reported qualified dividends on Form 1040, line 9b; <b>or</b> you had a gain on both lines 15 and 16 of Schedule D (Form 1040) (as refigured for the AMT, if necessary), complete Part III on the back and enter the amount from line 60 here.<br /><span style="height:2mm;"/></li>
                  <li><b>All others:</b> If line 30 is $179,500 or less ($89,750 or less if married filing separately), multiply line 30 by 26% (.26). Otherwise, multiply line 30 by 28% (.28) and subtract $3,590 ($1,795 if married filing separately) from the result.</li>
                </ul>
              </div>
              <div style="float:left;width:5mm;height:26mm;padding-top:4mm;">
                <img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_lg.gif"/>
              </div>
              <div style="float:left;width:5mm;height:26mm;padding-top:11mm;">
                <span style="letter-spacing:3mm;font-weight:bold;">..</span>
              </div>
              <div style="float:left;">
                <div class="styLNRightNumBox" style="border-bottom-width:0px;height:10mm;background-color:lightgrey;"/>
                <div class="styLNAmountBoxNBB" style="width:36mm;height:10mm;"/>
                <div class="styLNRightNumBox" style="clear:left;height:5mm;">31</div>             
                <div class="styLNAmountBox" style="height:5mm;width:36mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxOnAltMinTaxableIncAmt"/>
                    </xsl:call-template>
                </div>
                <div class="styLNRightNumBox" style="clear:left;height:14mm;background-color:lightgrey;border-bottom-width:0 px"/>
                <div class="styLNAmountBoxNBB" style="width:36mm;height:14mm;"/>
              </div> 
            </div>
            
            <!-- Line 32 -->
            <div class="styGenericDiv" style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">32
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Alternative minimum tax foreign tax credit (see instructions)</span>
                  <span class="styIRS6251DotLn">..............</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">32</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AMTForeignTaxCreditAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Line 33 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">33
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Tentative minimum tax. Subtract line 32 from line 31</span>
                  <span class="styIRS6251DotLn">................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">33</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TentativeAlternativeMinTaxAmt"/>
                  </xsl:call-template>
                </div>
              </div>

            <!-- Line 34 -->
            <div style="width:187mm;height:11.5mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:11.4mm;padding-left:2.25mm;width:8mm;">34</div>
                <div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:11.4mm;float:left;">
                  Tax from Form 1040, line 44 (minus any tax from Form 4972 and any foreign tax credit from Form<br/>
				  1040, line 47). If you used Schedule J to figure your tax, the amount from line 44 of Form 1040<br/>
				  must be refigured without using Schedule J (see instructions)
				  <span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
                </div>	
                <div class="styLNRightNumBox" style="height:7.5mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>				
				<div class="styLNAmountBox" style="height:7.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
				<div class="styLNRightNumBox" style="height:4mm;width:8mm;padding-bottom:1px;">34</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:1px;">
						  <xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$FormData/AdjustedRegularTaxAmt"/>
						  </xsl:call-template>
				</div>		
            </div>
            <!-- Line 35 -->
            <div style="width:187mm;height:4mm;border-bottom:1px solid black;">
              <div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;padding-bottom:0mm;padding-left: 2.25mm">35
              </div>
              <div class="styLNDesc" style="height:4mm;font-size:7pt;width:134.9mm;padding-bottom:0mm;">
                <span style="float:left"><b>AMT.</b> Subtract line 34 from line 33. If zero or less, enter -0-. Enter here and on Form 1040, line 45</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;">35</div>
              <div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom:none;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
                </xsl:call-template>
              </div>
            </div>

          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
              <span style="width:13mm;"/>                        
              Cat. No. 13600G
            </div>
            <div style="float:right;">
              <span style="width:40px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2013)
            </div>
          </div>
          
          <!-- END Page Break and Footer-->
          <!--Begin Page 2 -->
          <!-- Page Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 6251 (2013)<span style="width:148mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
              
            <!-- Part IlI - Header -->
            <div style="width:187mm;height:4mm;border-bottom:1px solid black;border-top:1px solid black;float:left;">
              <span class="styPartName" style="height:4.5mm;width:18mm;font-size:13;font-family:arial;">Part III</span>
              <span style="width:167mm;font-weight:normal;" class="styPartDesc">                
                <b>Tax Computation Using Maximum Capital Gains Rates</b> <br/>
                <span style="font-size:7.5pt;font-family:arial;">
                 Complete Part III only if you are required to do so by line 31 or by the Foreign Earned Income Tax Worksheet in the instructions.
					  </span>
              </span>
            </div>
            <!-- END Part llI Header-->
            <!-- Line 36 -->
            <div class="styGenericDiv" style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">36
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                   Enter the amount from Form 6251, line 30. If you are filing Form 2555 or 2555-EZ, 
                   enter the amount 
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">
                  from line 3 of the worksheet in the instructions for line 31
                </span>
                <span class="styIRS6251DotLn">..............</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">36</div>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ReportedAltMinTaxableIncAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Line 37 -->
            <div class="styGenericDiv" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 2.25mm">37</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the amount from line 6 of the Qualified Dividends and Capital Gain Tax 
                  Worksheet in the instructions for Form 1040, line 44, or the amount from 
                  line 13 of the Schedule D Tax Worksheet in the instructions for Schedule D 
                  (Form 1040), whichever applies (as refigured for the AMT, if necessary) 
                  (see instructions). If you are filing Form 2555 or 2555-EZ, 
                  see instructions for the amount to enter <span style="width:1mm;"/>
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.....................</span>
                </div>
              </div>
              <div style="float:left;">
                <div class="styLNRightNumBox" style="height:18.5mm;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">37</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:18.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CapitalGainsWorksheetAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:23.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:23.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            
            
            <!-- Line 38 -->
            <div class="styGenericDiv" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:15mm;font-size:7pt;padding-left: 2.25mm">38</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the amount from Schedule D (Form 1040), line 19 (as refigured for the AMT, 
                  if necessary) (see instructions). If you are filing Form 2555 
                  or 2555-EZ, see instructions for the amount to enter
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.....................</span>
                </div>
              </div>
              <div style="float:left;">
                <div class="styLNRightNumBox" style="height:10mm;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">38</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:10mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedS1250GainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:15mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:15mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 39 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:20mm;font-size:7pt;padding-left: 2.25mm">39</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  If you did not complete a Schedule D Tax Worksheet for the regular tax or the AMT, 
                  enter the amount from line 37. Otherwise, add lines 37 and 38, and enter the 
                  <b>smaller</b> of that result or the amount from line 10 of the Schedule D 
                  Tax Worksheet (as refigured for the AMT, if necessary). If you are filing 
                  Form 2555 or 2555-EZ, see instructions for the amount to enter
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...........</span>
                </div>
              </div>
              <div style="float:left;">
                <div class="styLNRightNumBox" style="height:15mm;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">39</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:15mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SumPlusUnrecapturedS1250Amt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:20mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:20mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 40 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">40
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Enter the <b>smaller</b> of line 36 or line 39</span>
                  <span class="styIRS6251DotLn">.....................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">40</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SmallerOfAltMinTxblIncOrSumAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Spacer Row -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;"/>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
              </div>
            <!-- Line 41 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">41
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Subtract line 40 from line 36</span>
                  <span class="styIRS6251DotLn">.....................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">41</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/AdjAltMinTaxableIncLessGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Line 42 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">42
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                   If line 41 is $179,500 or less ($89,750 or less if married filing separately), multiply line 41 by 26%
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
              </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">(.26). Otherwise, multiply line 41 by 28% (.28) and subtract $3,590 ($1,795 if married filing</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom:none;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
            </div>
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                 <span style="float:left;">separately) from the result</span><span class="styIRS6251DotLn">.......................<img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="padding:0mm 1mm"/></span>
                 
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom:1px solid black;">42</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NetAdjAltMinTxblIncTimesPctAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Line 43 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 2.25mm">43</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  <span style="float:right;text-align:right;letter-spacing:3mm;font-weight:bold;margin-top:8mm;margin-left:1mm;margin-right:2mm;">..</span>
                  <img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif" style="float:right;clear:none;margin-top:2mm;"/>
                  Enter:<br/>
                  <li>$72,500 if married filing jointly or qualifying widow(er),</li>
                  <li>$36,250 if single or married filing separately, or</li>
                  <li>$48,600 if head of household.</li>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:12mm;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">43</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:12mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/FilingStatusLimitAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:17mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:17mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 44 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:20mm;font-size:7pt;padding-left: 2.25mm">44</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the amount from line 7 of the Qualified Dividends and Capital Gain Tax Worksheet in the instructions for Form 1040, line 44, or the amount from line 14 of the Schedule D Tax Worksheet in the instructions for Schedule D (Form 1040), whichever applies (as figured for the regular tax). If you did not complete either worksheet for the regular tax, enter the amount from Form 1040, line 43; but do not enter less than -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">..............</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:18.5mm;padding-bottom:0mm;border-bottom:0;"/>
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">44</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:18.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/IncomeAboveThresholdWorkshtAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:23.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:23.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Spacer Row -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm"/>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;"/>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;border-bottom:none;"/>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:none;clear:left;"/>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 45 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">45</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Subtract line 44 from line 43. If zero or less, enter -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.....</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">45</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/FSAmtLessIncAboveThresholdAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Spacer Row -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm"/>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;"/>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;border-bottom:none;"/>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:none;clear:left;"/>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 46 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">46</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the <b>smaller</b> of line 36 or line 37
                  <span style="letter-spacing:3.2mm;font-weight:bold;">..........</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">46</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SmllrOfAdjustedAltMinOrSchDAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Spacer Row -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm"/>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;"/>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;border-bottom:none;"/>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:none;clear:left;"/>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 47 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">47</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the <b>smaller</b> of line 45 or line 46. This amount is taxed at 0%
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.</span>                  
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">47</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SmllrAbvThrshldOrAltMinGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Spacer Row -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm"/>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;"/>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;border-bottom:none;"/>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:none;clear:left;"/>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 48 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">48</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Subtract line 47 from line 46
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">48</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SmllrNetAdjAltMinOrNetGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- Line 49 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">49</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the amount from the Line 49 Worksheet in the instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.</span>
                </div>
                            </div>
                            <div style="float:left;">
                
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">49</div>
              </div>
              <div style="float:left;">                
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ApplcblCapGainsOrSchDWrkshtAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>             
            <!-- Line 50 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">50</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the smaller of line 48 or line 49
                  <span style="letter-spacing:3.2mm;font-weight:bold;">..........</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">50</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SmllrAdjNetGainOrTxblIncAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>  
            <!-- Line 51 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">51
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Multiply line 50 by 15% (.15)</span>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="padding:0mm 1mm;float:right;"/>
                  <span class="styIRS6251DotLn">.......................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">51</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
                  </xsl:call-template>
                </div>
              </div>              
              <!-- Line 52 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">52</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Add lines 47 and 50
                  <span style="letter-spacing:3.2mm;font-weight:bold;">................</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">52</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SumOfSmllrAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>            
            <!-- Text -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-weight:bold;font-size:6pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  If lines 52 and 36 are the same, skip lines 53 through 57 and go to line 58.  Otherwise, go to line 53.
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
              </div> 
              <!-- Line 53 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">53</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Subtract line 52 from line 46
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">53</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
            <!-- spacer 
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;"/>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
              </div>-->
              <!-- Line 54 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">54
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Multiply line 53 by 20% (.20)</span>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="padding:0mm 1mm;float:right;"/>
                  <span class="styIRS6251DotLn">.......................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">54</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumTimesPctAmt"/>
                  </xsl:call-template>
                </div>
              </div>              
              <!-- Text -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-weight:bold;font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  If line 38 is zero or blank, skip lines 55 through 57 and go to line 58. Otherwise, go to line 55.
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
              </div>              
            <!-- Line 55 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">55</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Add lines 41, 52 and 53
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">55</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalNetAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>             
            <!-- Line 56 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">56</div>
              <div style="float:left;">
                <div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Subtract line 55 from 36
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
                </div>
                            </div>
                            <div style="float:left;">
                <div class="styLNRightNumBox" style="height:5mm;clear:left;">56</div>
              </div>
              <div style="float:left;">
                <div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NetSmallerSchDOrAdjNetGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
              <div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
              <div style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
            </div>
             <!-- Line 57 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">57
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Multiply line 56 by 25% (.25)</span>
                  <img alt="bullet" src="{$ImagePath}/1040A_Bullet.gif" style="padding:0mm 1mm;float:right;"/>
                  <span class="styIRS6251DotLn">.......................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">57</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NetSchDOrAdjNetGainTimesPctAmt"/>
                  </xsl:call-template>
                </div>
              </div>            
              <!-- Line 58 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">58
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  <span style="float:left">Add lines 42, 51, 54, and 57</span>
                  <span class="styIRS6251DotLn">.......................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">58</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SumOfAltMinTaxPercentagesAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Line 59 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">59
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  If line 36 is $179,500 or less ($89,750 or less if married filing separately), multiply line 36 by 26%
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
              </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left"> (.26). Otherwise, multiply line 36 by 28% (.28) and subtract $3,590 ($1,795 if married filing</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom:none;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
            </div>
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                   <span style="float:left;"> separately) from the result</span><span class="styIRS6251DotLn">.........................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom:1px solid black;">59</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/NetAltMinTxblIncTimesFSPctAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            <!-- Line 60 -->
            <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">60
                </div>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                  Enter the <b>smaller</b> of line 58 or line 59 here and on line 31. If you are 
                  filing Form 2555 or 2555-EZ,
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
              </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
              <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                <span style="float:left">do not enter this amount on line 31. Instead, enter it on 
                line 4 of the worksheet in the instructions</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom:none;"/>
              <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
            </div>
            <div style="width:187mm;border-bottom:1px black solid;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                   <span style="float:left;">for line 31</span><span class="styIRS6251DotLn">.............................</span>
                </div>
                <div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom:none;">60</div>
                <div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxOnAlternativeMinimumGainAmt"/>
                  </xsl:call-template>
                </div>
              </div>
          <!-- Page Break and Footer-->
          <div style="width:187mm;text-align:right;margin-top:.5mm;">
          Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2013)
          </div>
          <!-- END Page Break and Footer-->

          <div class="pageEnd"/>
          
          
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Residual Interest In REMIC Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">RPI Special Processing Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
