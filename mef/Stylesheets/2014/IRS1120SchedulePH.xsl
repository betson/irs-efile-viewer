<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS1120SchedulePHStyle.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- Defines the stage of the data, e.g. original or latest  -->
    <xsl:param name="IRS1120SchedulePHData" select="$RtnDoc/IRS1120SchedulePH"/>
    <!-- Template to add blank rows to the table in Part IV Line 1. Adds rows until the maximum allowed number of rows  -->
    <!-- is reached. In the very first row, for separated print data, a message will be displayed directing the user to the -->
    <!-- additional data table -->
    <xsl:template name="AddRowsPartIV">
      <xsl:param name="NumOfRows"/>
      <xsl:param name="SOCount"/>
      <xsl:if test="$SOCount &lt; $NumOfRows">
        <tr>
          <td class="styIRS1120SchedulePHTableCellA" style="height: 6mm; text-align: left">
            <xsl:if test="$SOCount=0">
              <span class="styIRS1120SchedulePHLN">1</span>
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp"/>
              </xsl:call-template>
            </xsl:if>
            <span class="styIRS1120SchedulePHTableCellPad"/>
          </td>
          <td class="styIRS1120SchedulePHTableCellB" style="height: 6mm">
            <span class="styIRS1120SchedulePHTableCellPad"/>
          </td>
          <td class="styIRS1120SchedulePHTableCellC" style=" height: 6mm;text-align: right">
            %<span class="styIRS1120SchedulePHTableCellPad"/>
          </td>
          <td class="styIRS1120SchedulePHTableCellD" style="border-right-width: 0px; height: 6mm;text-align: right">
            %<span class="styIRS1120SchedulePHTableCellPad"/>
          </td>
        </tr>
        <xsl:call-template name="AddRowsPartIV">
          <xsl:with-param name="SOCount" select="$SOCount + 1"/>
          <xsl:with-param name="NumOfRows" select="$NumOfRows"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:template>
    <!--INSTRUCTION: Template to add blank rows to the table in Part V Line 1. Adds rows until the maximum allowed number of rows -->
    <!-- is reached. In the very first row, for separated print data, a message will be displayed directing the user to the -->
    <!-- additional data table -->
    <xsl:template name="AddRowsPartV">
      <xsl:param name="NumOfRows"/>
      <xsl:param name="EECount"/>
      <xsl:if test="$EECount &lt; $NumOfRows">
      <tr>
        <td class="styIRS1120SchedulePHTableCellA" style="width: 25mm">
          <xsl:if test="$EECount=0">
            <span class="styIRS1120SchedulePHLN">1</span>
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp"/>
              <xsl:with-param name="ShortMessage" select="'true'"/>
            </xsl:call-template>
          </xsl:if>
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellB" style="width: 17mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellC" style="width: 25mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellD" style="width: 25mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellE" style="width: 31mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellF" style="width: 25mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellG" style="width: 25mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
        <td class="styIRS1120SchedulePHTableCellH" style="width: 25mm">
          <span class="styIRS1120SchedulePHTableCellPad"/>
        </td>
      </tr>
      <xsl:call-template name="AddRowsPartV">
        <xsl:with-param name="EECount" select="$EECount + 1"/>
        <xsl:with-param name="NumOfRows" select="$NumOfRows"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template match="/">
  <html>
    <head>
      <title>
        <xsl:call-template name="FormTitle">
          <xsl:with-param name="RootElement" select="local-name($IRS1120SchedulePHData)"/>
        </xsl:call-template>
      </title>
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta http-equiv="Cache-Control" content="no-cache"/>
      <meta http-equiv="Expires" content="0"/>
      <meta http-equiv="Cache-Control" content="private"/>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="Description" content="IRS Form 1120 Schedule PH"/>
      <META name="GENERATOR" content="IBM WebSphere Studio"/>
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>
      <style type="text/css">
        <!--NOTE: Part IV table will display 8 rows of data per PDF and after 8 rows prior to scroll bar/separated format.
                       Part V table will display 6 rows of data per PDF prior to scroll bar/separated format. -->
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="IRS1120SchedulePHStyle"/>
          <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
      </style>
      <!-- Separated Print option End -->
      <xsl:call-template name="GlobalStylesForm"/>
    </head>
    <body class="styBodyClass">
      <form name="IRS1120SchedulePH">
      <!--   BEGIN WARNING LINE  -->
        <xsl:call-template name="DocumentHeader"/>
        <!--   END WARNING LINE   -->
        <!--   BEGIN FORM HEADER   -->
        <div class="styIRS1120SchedulePHBB">
          <div class="styIRS1120SchedulePHFN" style="height:19mm;">
            <div class="styFormNumber" style="width:29mm;font-size:9pt;">SCHEDULE PH
              <br/>
              <span style="font-size:9pt;">(Form 1120)</span>      
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData"/>
              </xsl:call-template>
              <span style="font-size:7pt;font-weight:normal;">
                <br/>(Rev. December 2013)
                <br/>
                <br/>
              </span>
            </div>
            <div class="styIRS1120SchedulePHAgency">
              Department of the Treasury
              <br/>Internal Revenue Service
            </div>
          </div>
          <!--Close 2nd div-->
          <div class="styIRS1120SchedulePHFTBox" style="width:110mm;height:12mm">
            <div class="styMainTitle" style="padding-left:10mm">U.S. Personal Holding Company (PHC) Tax</div>
            <br/>
            <div class="styIRS1120SchedulePHFST">
              <img src="{$ImagePath}/1120SchPH_Bullet.gif" alt="Bullet"/> Attach to tax return.  <br/>
              <img src="{$ImagePath}/1120SchPH_Bullet.gif" alt="Bullet"/>  Information about Schedule PH (Form 1120) and its separate instructions is at <a href="http://www.irs.gov/form1120">www.irs.gov/form1120</a>.
            </div>
          </div>
          <div class="styTYBox" style="width:47mm;height:19mm;">
            <div  style="text-align:center; padding-top:8mm;" >OMB No. 1545-0123</div>
          </div>
        </div>
        <!--  END FORM HEADER   -->
        <!--   BEGIN TAXPAYER INFO   -->
        <div style="width:187mm;float:left;clear:left;">
          <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-weight:normal;">
            Name<br/>
            <span>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>
            </span>
          </div>
          <div class="styEINBox" style="width:51mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
            Employer identification number<br/>
            <br/>
            <span style="width:42mm;text-align:left; font-weight:normal;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>      
            </span>
          </div>
        </div>
        <!-- END TAXPAYER INFO   -->
        <!--  BEGIN PART I HEADER   -->
        <div class="styIRS1120SchedulePHPartHdr">
          <span style="width:15mm;">
            <span class="styIRS1120SchedulePHPartHdrSpanner"/>
            <span class="styIRS1120SchedulePHPartHdrTitle">Part I</span>
          </span>Undistributed Personal Holding Company Income
          <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="width:30mm">(see instructions)</span>
        </div>
        <!--   END PART I HEADER   -->
        <!--   BEGIN LINES 1 THROUGH 4   -->
        <div style="width:187mm;">
          <span class="styIRS1120SchedulePHImg" style="width:6mm;height:22.3mm;text-align:center;">
            <img src="{$ImagePath}/1120SchPH_Additions.gif" alt="Additions" valign="center"/>
          </span>
          <!-- BEGIN LINE 1 -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">1</span>
              <span class="styLNDesc" style="width:133mm; ">
                Taxable income before net operating loss deduction and special deductions. Enter amount from
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height:4mm"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px;border-right-width: 0px; height:4mm"/>
            </span>
          </div>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD"/>
              <span class="styLNDesc" style="width:133mm;">
                <span style="float:left;">Form 1120, line 28 </span> 
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........................</span>
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4mm">1</span>
              <span class="styLNAmountBox" style="height: 4mm; border-right-width: 0px;">    
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableIncomeNetOprLossAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 1   -->
          <!--   BEGIN LINE 2  -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">2</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Contributions deducted in figuring line 1.  Enter amount from Form 1120, line 19 </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.......</span> 
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4mm;">2</span>
              <span class="styLNAmountBox" style="height: 4mm;border-right-width: 0px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ContributionsDeductedAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 2   -->
          <!--   BEGIN LINE 3   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
            <span class="styLNLeftNumBoxSD">3</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Excess expenses and depreciation under section 545(b)(6).  Enter amount from Part V, line 2
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDeprec545b6Amt"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.</span>  
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4.5mm;border-bottom-width: 1px;">3</span>
              <span class="styLNAmountBox" style="height: 4.5mm;border-right-width:0px;border-bottom-width:1px;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDeprec545b6Amt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--  END LINE 3   -->
          <!--   BEGIN LINE 4   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD" style="padding-top:.5mm;">4</span>
              <span class="styLNDesc" style="width:133mm;padding-top:.5mm;">
                <span style="float:left;">Total.  Add lines 1 through 3 </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.......................</span> 
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;padding-top:1mm;">4</span>
              <span class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalNetAdditionsAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--  END LINE 4   -->
        </div>
        <!--   END LINES 1 THROUGH 4   -->
        <!--   BEGIN LINES 5 THROUGH 13  -->
        <!-- BEGIN LINE 5   -->
        <div style="width:187mm;float:none;clear:none; border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px;">
          <span class="styIRS1120SchedulePHImg" style="width:6mm;height: 68.3mm;text-align:center;padding-top: 25mm; padding-bottom: 25mm;">
            <img src="{$ImagePath}/1120SchPH_Deductions.gif" alt="Deductions" valign="center"/>
          </span>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">5</span>
              <span class="styLNDesc" style="width: 133mm">
                Federal and foreign income, war profits, and excess profits taxes not deducted in figuring line 1
              </span>
            </span>
            <span style="float:right;clear:none:">
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4mm"/>
              <span class="styLNAmountBox" style="border-bottom-width:0px; height: 4mm"/>
            </span>
          </div>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD"/>          
              <span class="styLNDesc" style="width: 133mm; ">
                <span style="float:left;">(attach schedule)
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/OtherTaxesNotDeductedAmt"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........................</span>  
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4.5mm">5</span>
              <span class="styLNAmountBox" style="border-right-width: 0px; height: 4.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/OtherTaxesNotDeductedAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 5   -->
          <!--   BEGIN LINE 6   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">6</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Contributions deductible under section 545(b)(2).  See instructions for limitation </span> 
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">......</span> 
			  </span>
			</span>
			<span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4mm">6</span>
              <span class="styLNAmountBox" style="height: 4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ContributionsDedUnder545b5Amt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 6   -->
          <!-- BEGIN LINE 7   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">7</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Net operating loss for the preceding tax year deductible under section 545(b)(4) </span> 
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">......</span>
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4mm">7</span>
              <span class="styLNAmountBox" style="height: 4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NetOperatingLossPrecTYDedAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 7   -->
          <!--   BEGIN LINE 8   -->
          <!--   BEGIN LINE 8a  -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">8a</span>
              <span class="styLNDesc" style="width:92.50mm;">
                <span style="float:left;">Net capital gain from Schedule D (Form 1120), line 17 </span>  
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....</span>
              </span>
            </span>
            <span style="float:right;clear:none;">     
              <span class="styLNRightNumBox" style="height:4.5mm;">8a</span>
              <span class="styLNAmountBox" style="height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NetCapitalGainAmt"/>
                </xsl:call-template>
              </span>            
              <span class="styLNRightNumBox" style="border-bottom-width:0px;background-color: lightgrey; height: 4.5mm"/>
              <span class="styLNAmountBox" style="height: 4.5mm;border-bottom-width:0px"/>
            </span>
          </div>
          <!--   END LINE 8a   -->
          <!--   BEGIN LINE 8b   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</span>
              <span class="styLNDesc" style="width:92.50mm;">
                <b>Less: </b>Income tax on this net capital gain (see section 545(b)(5)) 
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px;border-left-width: 1px; height: 4.5mm"/>
              <span class="styLNRightNumBox" style="border-bottom-width:1px;border-right-width: 0px; background-color: lightgrey; height: 4.5mm"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px;border-left-width: 1px; height: 4.5mm"/>
            </span>
          </div>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD" style="padding-left:4mm;"/>          
              <span class="styLNDesc" style="width:92.50mm;">
                <span style="float:left;">(attach computation)     
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/IncomeTaxNetCapitalGainAmt"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............</span> 
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4.5mm">8b</span>
              <span class="styLNAmountBox" style="height: 4.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/IncomeTaxNetCapitalGainAmt"/>
                </xsl:call-template>
              </span>
              <span class="styLNRightNumBox" style="height: 4.5mm">8c</span>
              <span class="styLNAmountBox" style="height: 4.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NetCapitalGainLessIncomeTaxAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 8b  -->
          <!--   END LINE 8   -->
          <!--   BEGIN LINE 9   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBoxSD">9</span>
              <span class="styLNDesc" style="width: 133mm">
                Deduction for dividends paid (other than dividends paid after the end of the tax year).  Enter amount
                <span style="float:left;">from Part VI, line 5 </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........................</span>  
              </span> 
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 8mm;border-bottom-width:1px;padding-top:4mm;">9</span>
              <span class="styLNAmountBox" style="height: 8mm;border-right-width: 0px;border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DeductionDividendsPaidAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 9   -->
          <!--   BEGIN LINE 10   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox"/>
              <span class="styLNDesc" style="width: 133mm"/>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4mm"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px; height: 4mm"/>
            </span>
          </div>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox">10</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Total.  Add lines 5 through 9
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part I, Line 10 - Section 545 Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductionsAmt/@section545cCd"/>
                  </xsl:call-template>
                   <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Part I, Line 10 - Section 545 Amount</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductionsAmt/@section545cAmt"/>
                  </xsl:call-template>
                </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">......................</span> 
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="border-bottom-width:1px; height: 4.5mm;">10</span>
              <span class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductionsAmt"/>
                </xsl:call-template>
              </span>
            </span>          
          </div>
          <!--   END LINE 10   -->
          <!--   BEGIN LINE 11   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox"/>
              <span class="styLNDesc" style="width: 133mm"/>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height:4mm;"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px; height:4mm;"/>
			</span>
          </div>
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox">11</span>
              <span class="styLNDesc" style="width: 133mm">
                <span style="float:left;">Subtract line 10 from line 4 </span>
                <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.......................</span>  
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4.5mm;">11</span>
              <span class="styLNAmountBox" style="height: 4.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdditionsLessDeductionsAmt"/>
                </xsl:call-template>
              </span>
            </span>          
          </div>
          <!--   END LINE 11   -->
          <!--   BEGIN LINE 12   -->
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox">12</span>
              <span class="styLNDesc" style="width: 133mm">Dividends paid after the end of the tax year (other than deficiency dividends defined in section 
                <span style="float:left;"> 547(d)), but not more than the smaller of line 11 or 20% of Part VI, line 1 </span>
			    <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 8mm;border-bottom-width:1px;padding-top:4mm; ">12</span>
              <span class="styLNAmountBox" style=" height: 8mm;border-right-width: 0px;border-bottom-width:1px;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivPaidAfterEndOfTaxYearAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--   END LINE 12   -->
          <!--   BEGIN LINE 13 -->  
          <div class="styGenericDiv" style="width:181mm;">
            <span style="float:left;clear:none;">
              <span class="styLNLeftNumBox">13</span>
              <span class="styLNDesc" style="width: 133mm;">
                <span style="float:left;"><b>Undistributed PHC income. </b>Subtract line 12 from line 11. </span>
			    <!--Dotted Line-->
			    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............</span>
              </span>
            </span>
            <span style="float:right;clear:none;">
              <span class="styLNRightNumBox" style="height: 4.5mm;border-bottom-width:0px;padding-top:1mm;">13</span>
              <span class="styLNAmountBox" style="height: 4.5mm;border-bottom-width:0px;padding-top:1mm; ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/UndistributedPHCIncomeAmt"/>
                </xsl:call-template>
              </span>
            </span>
          </div>
          <!--     END LINE 13   -->
        </div>
        <!--   END LINES 5 THROUGH 13   -->
        <!--   BEGIN NOTE HEADER   -->
        <div class="styIRS1120SchedulePHNoteHdr">
          <span style="width:40px;">
            <span class="styIRS1120SchedulePHNoteHdrTitle">
              <span style="width: 1px;"/>Note:
            </span>
          </span>
          If the information in Part II and Part IV is not submitted with the return, the limitation period for assessment and
          <span style="padding-left: 10mm;"/>
          collection of the PHC tax is any time within 6 years after the return is filed.  See section 6501(f).
        </div>
        <!--   END NOTE HEADER   -->
        <!--  BEGIN PART II HEADER   -->
        <div class="styIRS1120SchedulePHPartHdr">
          <span style="width:15mm;">
            <span class="styIRS1120SchedulePHPartHdrSpanner"/>
            <span class="styIRS1120SchedulePHPartHdrTitle">Part II</span>
          </span>
          <span style="padding-left: 1mm;"/>Personal Holding Company Income
          <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="width:30mm">(see instructions)</span>
        </div>
        <!--   END PART II HEADER   -->
        <!--   BEGIN LINE 14   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">14</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Dividends </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">14</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DividendAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 14   -->
        <!--   BEGIN LINE 15   -->
        <!--   BEGIN LINE 15a  -->
        <div style="width:187mm;">
          <div style="float:left;clear:none;">
            <div class="styLNLeftNumBox">15a</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;">Interest </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....................</span>
		    </div>
		  </div>
		  <div style="float:right;clear:none;">
		    <div class="styLNRightNumBox" style="height: 4.5mm">15a</div>
            <div class="styLNAmountBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/InterestAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;background-color: lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;"/>
          </div>
        </div>
        <!--   END LINE 15a  -->
        <!--   BEGIN LINE 15b   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;"><b>Less:  </b>Amounts excluded (attach schedule)
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcludedInterestAmt"/>
                </xsl:call-template> 
              </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">15b</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcludedInterestAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 4mm">15c</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/InterestLessExcldInterestAmt"/>
              </xsl:call-template>
            </div>            
          </div>
        </div>
        <!--   END LINE 15b  -->
        <!--   END LINE 15   -->
        <!--   BEGIN LINE 16   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">16</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Royalties (other than mineral, oil, gas, or copyright royalties) </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">16</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RoyaltiesReceivedAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 16   -->
        <!--   BEGIN LINE 17   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">17</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Annuities </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">17</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AnnuitiesAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 17   -->
        <!--   BEGIN LINE 18   -->
        <!--   BEGIN LINE 18a  -->
        <div style="width:187mm;">
          <div style="float:left;clear:none;">
            <div class="styLNLeftNumBox">18a</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;">Rents </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">......................</span>
		    </div>
		  </div>
		  <div style="float:right;clear:none;">
		    <div class="styLNRightNumBox" style="height: 4.5mm">18a</div>
            <div class="styLNAmountBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RentsReceivedAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;background-color: lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;"/>
          </div>
        </div>
        <!--   END LINE 18a  -->
        <!--   BEGIN LINE 18b   -->
        <!--   BEGIN LINE 18b   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;"><b>Less: </b>Adjustments to rents (attach schedule)
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RentsAdjustmentAmt"/>
                </xsl:call-template> 
              </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4.5mm">18b</div>
            <div class="styLNAmountBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RentsAdjustmentAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 4.5mm">18c</div>
            <div class="styLNAmountBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RentsLessRentsAdjustmentAmt"/>
              </xsl:call-template>
            </div>            
          </div>
        </div>
        <!--   END LINE 18b  -->
        <!--   END LINE 18a   -->
        <!--   BEGIN LINE 19   -->
        <!--   BEGIN LINE 19a  -->
        <div style="width:187mm;">
          <div style="float:left;clear:none;">
            <div class="styLNLeftNumBox">19a</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;">Mineral, oil, and gas royalties </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...............</span>
		    </div>
		  </div>
		  <div style="float:right;clear:none;">
		    <div class="styLNRightNumBox" style="height: 4.5mm">19a</div>
            <div class="styLNAmountBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRoyaltiesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px;background-color: lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px;"/>
          </div>
        </div>
        <!--   END LINE 19a  -->
        <!--   BEGIN LINE 19b and 19c  -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:99mm;">
              <span style="float:left;"><b>Less: </b>Adjustments to mineral, oil, and gas royalties (attach schedule) 
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRoyaltiesAdjAmt"/>
                </xsl:call-template> 
              </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">19b</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRoyaltiesAdjAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height: 4mm">19c</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRyltsLessAdjAmt"/>
              </xsl:call-template>
            </div>            
          </div>
        </div>
        <!--   END LINE 19b and 19c -->
        <!--   END LINE 19   -->
        <!--   BEGIN LINE 20   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">20</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Copyright royalties </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...........................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">20</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/CopyrightRoyaltiesAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 20   -->
        <!--   BEGIN LINE 21   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">21</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Produced film rents </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...........................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">21</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ProducedFilmRentsAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 21   -->
        <!--   BEGIN LINE 22   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">22</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Compensation received for use of corporation property by 25% or more shareholder </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.......</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">22</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/CompensationCorpPropUseAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 22   -->
        <!--   BEGIN LINE 23   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">23</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Amounts received under personal service contracts and from their sale </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...........</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">23</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/PSCReceivedAndSaleAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 23   -->
        <!--   BEGIN LINE 24   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">24</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;">Amounts includible in taxable income from estates and trusts </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...........</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm">24</div>
            <div class="styLNAmountBox" style="height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/EstatesTrustsIncludibleIncmAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 24   -->
        <!--   BEGIN LINE 25   -->
        <div style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">25</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left;"><b>PHC income.</b>  Add lines 14 through 24 </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 4mm;border-bottom-width:0px;">25</div>
            <div class="styLNAmountBox" style="height: 4mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/PersonalHoldingCompanyIncmAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 25   -->
        <!--  BEGIN PART III HEADER   -->
        <div class="styIRS1120SchedulePHPartHdr" style="float:left;clear:left;border-top-width:1px">
          <span style="width:17mm;">
            <span class="styIRS1120SchedulePHPartHdrSpanner"/>
            <span class="styIRS1120SchedulePHPartHdrTitle">Part III</span>
          </span> 
          <span style="padding-left:1mm;"/>Tax on Undistributed Personal Holding Company Income 
          <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="width:30mm">(see instructions)</span>
        </div>
        <!--   END PART III HEADER   -->
        <!--   BEGIN LINE 26   -->
        <div class="styBB" style="width:187mm;">
          <div style="float:left;clear:none">
            <div class="styLNLeftNumBox">26</div>
            <div class="styLNDesc" style="width:139mm;">
              <b>PHC tax.</b>  Multiply the amount on line 13 by 20%. Enter the result here and on Schedule J (Form 1120), 
              <span style="float:left;">line 8, or on the proper line of the appropriate tax return. </span>
              <!--Dotted Line-->
			  <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">................</span>
			</div> 
          </div>
          <div style="float:right;clear:none;">
            <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;border-bottom-width:0px;">26</div>
            <div class="styLNAmountBox" style="height: 8mm;padding-top:4mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"   select="$IRS1120SchedulePHData/PersonalHoldingCompanyTaxAmt"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
        <!--   END LINE 26   -->
        <!--BEGIN FOOTER-->
        <div style="width:187mm;font-size:6pt;">
          <div style="float: left; clear: none;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for <br/>Form 1120.</span>
          </div>        
          <div style="float:right;">
            Cat. No. 11465P 
            <span style="width:18mm;"/>
            <span class="styBoldText">Schedule PH (Form 1120) (Rev. 12-2013)</span>
          </div>      
        </div>     
        <div class="pageEnd"/>
        <!--END FOOTER-->  
        <!--BEGIN HEADER-->
        <div class="styBB" style="width:187mm;border-bottom:0px solid black;">
          <div style="float: left; clear: none">Schedule PH (Form 1120) (Rev. 12-2013)</div>        
          <div style="float:right">
            Page <span class="styBoldText" style="font-size: 8pt">2</span>
          </div>      
        </div> 
        <!--END HEADER-->
        <!--   BEGIN Part IV   -->
        <div class="styIRS1120SchedulePHPartHdr" style="float: none; clear: both">
          <span style="width:15mm;">
            <span class="styIRS1120SchedulePHPartHdrSpanner"/>
            <span class="styIRS1120SchedulePHPartHdrTitle">Part IV</span>
          </span>
          <span style="padding-left: 1.5mm;"/>Stock Ownership Requirement Under Section 542(a)(2)
          <br/>
          <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="font-size:8pt">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 16mm"/>
              Enter the names and addresses of the individuals who together owned, directly or indirectly, at any time 
          </span>
          <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="font-size:8pt">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 16mm; "/>
            <span style="float:left;padding-left: 0.5mm;">
              during the last half of the tax year, more than 50% in value of the outstanding stock of the corporation. 
            </span>
            <span style="width:5mm;text-align:right; float: right; clear:none;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="containerID" select=" 'SOctn' "/>
              </xsl:call-template>
            </span>
          </span>
        </div>
        <!--   END PART IV  -->
        <!--   BEGIN PART IV  TABLE    -->
        <!--   BEGIN PART IV TABLE HEADER   -->
        <div class="styIRS1120SchedulePHTableContainer" style="float: none;clear: both" id="SOctn">
          <!--print logic-->
          <xsl:call-template name="SetInitialState"/>
          <!--end-->
          <table class="styIRS1120SchedulePHTable" cellspacing="0">
            <thead class="styIRS1120SchedulePHTableThead">
              <tr>
                <th scope="col" class="styIRS1120SchedulePHTableCellA" style="font-weight: normal" rowspan="2">
                  <b>(a)</b>Name</th>
                <th scope="col" class="styIRS1120SchedulePHTableCellB" style="font-weight: normal" rowspan="2">
                  <b>(b)</b>Address</th>
                <th scope="col" class="styIRS1120SchedulePHTableTopCell" style="font-weight: normal;" colspan="2">Highest percentage of shares owned during last half of tax year</th>
              </tr>
              <tr>
                <th scope="col" class="styIRS1120SchedulePHTableCellC" style="font-weight: normal;">
                  <b>(c)</b>Preferred</th>
                <th scope="col" class="styIRS1120SchedulePHTableCellD" style="border-right-width:0px; font-weight: normal;">
                  <b>(d)</b>Common</th>
              </tr>
            </thead>
          <tfoot/>
          <tbody>
          <!-- INSTRUCTION: When the Print parameter is not Separated display all the rows. If the Print parameter is Separated,  -->
          <!-- but the number of elements is fewer than the container height, then also display all the rows -->
          <xsl:if test="(($Print != $Separated) or (count($IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp) &lt;= 5))">
            <xsl:for-each select="$IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp">
              <tr>
                <td class="styIRS1120SchedulePHTableCellA" style="text-align: left">
                  <span class="styIRS1120SchedulePHLN" style="padding-left:1.75mm;">
                    <xsl:if test="position()=1">1</xsl:if>
                  </span>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="StockOwnerPersonNm"/>
                  </xsl:call-template>
                  <span class="styIRS1120SchedulePHTableCellPad"/>
                </td>
                <td class="styIRS1120SchedulePHTableCellB" style="text-align:left">
                  <xsl:choose>
                    <xsl:when test="USAddress">             
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
                      </xsl:call-template>
                      <span style="width=1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
                      </xsl:call-template>
                      <span style="width=1mm"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="ForeignAddress"/>
	                  </xsl:call-template> 
                    </xsl:otherwise>
                  </xsl:choose>
                  <span class="styIRS1120SchedulePHTableCellPad"/>
                </td>
                <td class="styIRS1120SchedulePHTableCellC" style="text-align: right">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="PreferredStockOwnedPercentRt"/>
                  </xsl:call-template>
                  <span class="styIRS1120SchedulePHTableCellPad"/>
                </td>
                <td class="styIRS1120SchedulePHTableCellD" style="border-right-width: 0px; text-align: right">
                  <xsl:call-template name="PopulatePercent">
                    <xsl:with-param name="TargetNode" select="CommonStockOwnedPercentRt"/>
                  </xsl:call-template>
                  <span class="styIRS1120SchedulePHTableCellPad"/>
                </td>
              </tr>
            </xsl:for-each>
            <xsl:call-template name="AddRowsPartIV">
              <xsl:with-param name="SOCount" select="count($IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp)"/>
              <xsl:with-param name="NumOfRows" select="5"/>
            </xsl:call-template>
          </xsl:if>
          <!-- INSTRUCTION: If the Print parameter is Separated and the number of elements exceeds the container height, display blank rows -->
          <!-- and a message in the first row directing users to the additional data table -->
          <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp) &gt; 5))">
            <xsl:call-template name="AddRowsPartIV">
              <xsl:with-param name="SOCount" select="0"/>
              <xsl:with-param name="NumOfRows" select="5"/>
            </xsl:call-template>
          </xsl:if>
        </tbody>
       </table>
    </div>
    <xsl:call-template name="SetInitialDynamicTableHeight">
      <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp"/>
      <xsl:with-param name="containerHeight" select="5"/>
      <xsl:with-param name="containerID" select=" 'SOctn' "/>
    </xsl:call-template>
    <!--   END PART IV TABLE   -->
    <!--   BEGIN LINE 2   -->
  <div class="styIRS1120SchedulePHLineItem" style="float: none; clear: both;width:187mm">
    <span class="styIRS1120SchedulePHLN" style="padding-top:4.5mm;padding-left: 1.75mm;">2</span>
    <span class="styIRS1120SchedulePHLNLtMargin"/>
    <span class="styIRS1120SchedulePHLNDesc" style="width: 139.25mm;padding-top:4.5mm;">
      <span style="float:left;">Add the amounts in columns (c) and (d) and enter the totals here </span>
      <!--Dotted Line-->
      <span style="font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">............</span> 
      <img src="{$ImagePath}/1120SchPH_Bullet.gif" alt="Bullet"/>
    </span>
    <span class="styIRS1120SchedulePHPreferred" style="border-right-width: 0px;width:19.73mm;">
      <xsl:call-template name="PopulatePercent">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/CommonStockOwnedPercentRt"/>
      </xsl:call-template>
    </span>
    <span class="styIRS1120SchedulePHCommon" style="border-left-width: 1px;">
      <xsl:call-template name="PopulatePercent">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/PreferredStockOwnedPercentRt"/>
      </xsl:call-template>
    </span>
  </div>
  <!--   END LINE 2   -->
  <!--   END PART IV   -->
  <!--  BEGIN PART V   -->
  <!--  BEGIN PART V HEADER   -->
  <div class="styIRS1120SchedulePHPartHdr">
    <span style="width:15mm;">
      <span class="styIRS1120SchedulePHPartHdrSpanner"/>
      <span class="styIRS1120SchedulePHPartHdrTitle">Part V</span>
    </span>
    <span style="padding-left: 1mm;"/>Excess of Expenses and Depreciation Over Income From Property Not Allowable 
    <span style="width:187mm;">
      <span style="float:left;"><span style="width:16mm"/>Under Section 545(b)(6)
        <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="width: 60mm">(see instructions for Part I, line 3)</span>
      </span>
      <span style="width:7mm;text-align:right;float:right; clear: none">
        <xsl:call-template name="SetDynamicTableToggleButton">
          <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'EEctn' "/>
        </xsl:call-template>
      </span>
    </span>
  </div>
  <!--   END PART V HEADER   -->
  <!--  BEGIN PART V TABLE HEADER  -->
  <div class="styIRS1120SchedulePHTableContainer" id="EEctn">
    <!--print logic-->
    <xsl:call-template name="SetInitialState"/>
    <!--end-->
    <table class="styIRS1120SchedulePHTable" cellspacing="0">
      <thead class="styIRS1120SchedulePHTableThead">
        <tr>
          <th scope="col" class="styIRS1120SchedulePHTableCellA" style="width:15mm; font-weight: normal;">
            <b>(a)</b>Description of property</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellB" style="width:17mm; font-weight: normal;">
            <b>(b)</b>Date<br/>acquired</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellC" style="width: 25mm;font-weight: normal;">
            <b>(c)</b>Cost or<br/>other basis</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellD" style="width:25mm; font-weight: normal;">
            <b>(d)</b>Depreciation<br/>deduction</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellE" style="width: 31mm; font-weight: normal;">
            <b>(e)</b>Repairs,<br/>insurance, and<br/>other expenses<br/>(section 162)<br/>(attach schedule)</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellF" style="width: 25mm; font-weight: normal;">
            <b>(f)</b>Total of<br/>columns (d)<br/>and (e)</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellG" style="width: 25mm; font-weight: normal;">
            <b>(g)</b>Income from<br/>rent or other<br/>compensation</th>
          <th scope="col" class="styIRS1120SchedulePHTableCellH" style="width: 25mm; font-weight: normal;">
            <b>(h)</b>Excess<br/>(col. (f) less<br/>col. (g))</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
      <!-- When the Print parameter is not Separated display all the rows. If the Print parameter is Separated,  -->
      <!-- but the number of elements is fewer than the container height, then also display all the rows -->
      <xsl:if test="(($Print != $Separated) or (count($IRS1120SchedulePHData/ExcessExpensesDepreciationGrp) &lt;= 6))">
        <xsl:for-each select="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp">
          <tr>
            <td class="styIRS1120SchedulePHTableCellA" style="width: 15mm; height: 4mm; text-align: left">
              <span class="styIRS1120SchedulePHLN">
                <xsl:if test="position()=1">1</xsl:if>
              </span>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PropertyDesc"/>
              </xsl:call-template>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellB" style="height: 4mm;width:17mm">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="AcquiredDt"/>
              </xsl:call-template>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellC" style="height: 4mm;width: 25mm; text-align: right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
              </xsl:call-template>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellD" style="height: 4mm;width:25mm; text-align: right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
              </xsl:call-template>  
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellE" style="height: 4mm; text-align: right; width: 31mm">
              <span style="float: left; clear:none">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="RepairsInsAndOtherExpensesAmt"/>
                </xsl:call-template>
              </span>
              <span style="width: 4px;"/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RepairsInsAndOtherExpensesAmt"/>
              </xsl:call-template>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellF" style="width: 25mm;height:4mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalDeprecAndDedExpensesAmt"/>
              </xsl:call-template>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellG" style="width:25mm;height:4mm; text-align:right">
              <xsl:choose>
                <xsl:when test="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp/RentIncomeAndOtherCompAmt != ''">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="RentIncomeAndOtherCompAmt"/>
                  </xsl:call-template>
                </xsl:when>
              </xsl:choose>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
            <td class="styIRS1120SchedulePHTableCellH" style="width:25mm; height:4mm;text-align:right">
              <xsl:choose>
                <xsl:when test="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp/ExcessAmt= ''">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ExcessAmt"/>
                  </xsl:call-template>
                </xsl:when>
              </xsl:choose>
              <span class="styIRS1120SchedulePHTableCellPad"/>
            </td>
          </tr>
        </xsl:for-each>
        <xsl:call-template name="AddRowsPartV">
          <xsl:with-param name="EECount" select="count($IRS1120SchedulePHData/ExcessExpensesDepreciationGrp)"/>
          <xsl:with-param name="NumOfRows" select="5"/>
        </xsl:call-template>
      </xsl:if>
      <!-- If the Print parameter is Separated and the number of elements exceeds the container height, display blank rows -->
      <!-- and a message in the first row directing users to the additional data table -->
      <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/ExcessExpensesDepreciationGrp) &gt; 5))">
       <!-- <xsl:call-template name="AddRowsPartV">
          <xsl:with-param name="EECount" select="0"/>
          <xsl:with-param name="NumOfRows" select="5"/>
        </xsl:call-template>-->
      </xsl:if>
    </tbody>
  </table>
</div>
<!--<xsl:call-template name="SetInitialDynamicTableHeight">
  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp"/>
  <xsl:with-param name="containerHeight" select="6"/>
  <xsl:with-param name="containerID" select=" 'EEctn' "/>
</xsl:call-template>-->
<!--   END PART V TABLE   -->
<!--   BEGIN LINE 2   -->
<div class="styIRS1120SchedulePHLineItem" style="float:none">
  <span class="styIRS1120SchedulePHLN">2</span>
  <span class="styIRS1120SchedulePHLNLtMargin"/>
  <span class="styIRS1120SchedulePHLNDesc" style="width: 156.50mm;">
    <b>Total excess of expenses and depreciation over rent or other compensation. </b>Add the amounts in column (h).
  </span>
  <span class="styIRS1120SchedulePHCommon" style="height: 4mm; width: 24.3mm;padding-top: 0px; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px"/>
</div>
<div class="styIRS1120SchedulePHLineItem">
  <span class="styIRS1120SchedulePHLNLtMargin" style="width: 6mm"/>
  <span class="styIRS1120SchedulePHLNDesc" style="width: 156.50mm;">
    <span style="float:left;">Enter the total here and on Part I, line 3
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalExcessExpensesDeprecAmt"/>
      </xsl:call-template>
    </span>
    <!--Dotted Line-->
    <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">........................</span> 
  </span>
  <span class="styIRS1120SchedulePHCommon" style="font-size: 6pt;height: 4mm; width: 24.3mm;padding-top: 0px; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalExcessExpensesDeprecAmt"/>
    </xsl:call-template>
  </span>
</div>
<div class="styIRS1120SchedulePHNoteHdr" style="border-top-width: 0px; border-bottom-width: 0px">
  <span class="styIRS1120SchedulePHNoteHdrTitle" style="margin-left: 6mm; width: 10mm; float: left; clear: none">Note:</span>
  <span style="width: 143mm; float: left; clear: none">Attach a statement showing the names and addresses of persons from whom rent or other compensation was received for the use of, or the right to use, each property.</span>
  <span class="styIRS1120SchedulePHCommon" style="height:8mm; width: 24.3mm; padding-top: 0mm; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; background-color: lightgrey"/>
</div>
<!--   END LINE 2   -->
<!--   END PART V   -->
<!--   BEGIN PART VI   -->
<!--   BEGIN PART VI HEADER   -->
<div class="styIRS1120SchedulePHPartHdr">
  <span style="width:15mm;">
    <span class="styIRS1120SchedulePHPartHdrSpanner"/>
    <span class="styIRS1120SchedulePHPartHdrTitle">Part VI</span>
  </span>Deduction for Dividends Paid Under Sections 561 and 562
</div>
<!--   END PART VI HEADER   -->
<!--   BEGIN LINE 1   -->
<div class="styIRS1120SchedulePHLineItem" style="width:187mm;">
  <div style="float:left;clear:none;">
    <div class="styLNLeftNumBox">1</div>
    <div class="styLNDesc" style="width:139mm;">
      Taxable dividends paid. Do not include dividends considered as paid in the preceding tax year under 
      <span style="float:left;">section 563 or deficiency dividends as defined in section 547 </span>
      <!--Dotted Line-->
      <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..............</span>    
    </div>
  </div>
  <div style="float:right;clear:none;">
    <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">1</div>
    <div class="styLNAmountBox" style="border-right-width: 0px; height: 8mm;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableDividendsPaidAmt"/>
      </xsl:call-template>
    </div>
  </div>
</div>
<!--  END LINE 1   -->
<!--   BEGIN LINE 2   -->
<div class="styIRS1120SchedulePHLineItem" style="width:187mm;">
  <div style="float:left;clear:none;">
    <div class="styLNLeftNumBox" style="padding-top:4mm;">2</div>
    <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
      <span style="float:left;">Consent dividends.  Attach Forms 972 and 973 </span>
      <!--Dotted Line-->
      <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...................</span>    
    </div>
  </div>
  <div style="float:right;clear:none;">
    <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">2</div>
    <div class="styLNAmountBox" style="border-right-width: 0px; height: 8mm;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivCyov1stAnd2ndPrecTaxYrsAmt/ConsentDividendsAmt"/>
      </xsl:call-template>
    </div>
  </div>
</div>
<!--   END LINE 2   -->
<!--   BEGIN LINE 3   -->
<div class="styIRS1120SchedulePHLineItem" style="width:187mm;">
  <div style="float:left;clear:none;">
    <div class="styLNLeftNumBox" style="padding-top:4mm;">3</div>
    <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
      <span style="float:left;">Taxable distributions.  Add lines 1 and 2 </span>
      <!--Dotted Line-->
      <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....................</span>    
    </div>
  </div>
  <div style="float:right;clear:none;">
    <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">3</div>
    <div class="styLNAmountBox" style="border-right-width: 0px; height: 8mm;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableDistributionAmt"/>
      </xsl:call-template>
    </div>
  </div>
</div>
<!--   END LINE 3   -->
<!--   BEGIN LINE 4   -->
<div class="styIRS1120SchedulePHLineItem" style="width:187mm;">
  <div style="float:left;clear:none;">
    <div class="styLNLeftNumBox" style="padding-top:4mm;">4</div>
    <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
      <span style="float:left;">Dividend carryover from first and second preceding tax years.  Attach computation 
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivCyov1stAnd2ndPrecTaxYrsAmt"/>
        </xsl:call-template>      
      </span>
      <!--Dotted Line-->
      <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">......</span>    
    </div>
  </div>
  <div style="float:right;clear:none;">
    <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;">4</div>
    <div class="styLNAmountBox" style="border-right-width: 0px; height: 8mm;padding-top:4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivCyov1stAnd2ndPrecTaxYrsAmt"/>
      </xsl:call-template>
    </div>
  </div>
</div>
<!--   END LINE 4  -->
<!--   BEGIN LINE 5   -->
<div class="styBB" style="width:187mm;">
  <div style="float:left;clear:none;">
    <div class="styLNLeftNumBox" style="padding-top:4mm;">5</div>
    <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
      <span style="float:left;"><b>Deduction for dividends paid.</b>  Add lines 3 and 4.  Enter the total here and on Part I, line 9
      </span>
      <!--Dotted Line-->
      <span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....</span>    
    </div>
  </div>
  <div style="float:right;clear:none;">
    <div class="styLNRightNumBox" style="height: 8mm;padding-top:4mm;border-bottom-width:0px;">5</div>
    <div class="styLNAmountBox" style="border-right-width: 0px; height: 8mm;padding-top:4mm;border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DeductionDividendsPaidAmt"/>
      </xsl:call-template>
    </div>
  </div>
</div>
<!--   END LINE 5   -->
<!--   BEGIN FORM FOOTER  -->
<div style="width: 187mm">
  <span style="float: left; width: 100mm"/>
  <span class="styBoldText" style="float: right">Schedule PH (Form 1120) (Rev. 12-2013)</span>
</div>
<!--   END FORM FOOTER   -->
<br/>
<div class="pageEnd"/>
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
    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
  <xsl:call-template name="PopulateLeftoverRow">
    <xsl:with-param name="Desc">Form 1120 Schedule PH, Part I Line 10 - Section 545 Indicator</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductionsAmt/@section545cCd"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
  <xsl:call-template name="PopulateLeftoverRowAmount">
    <xsl:with-param name="Desc">Form 1120 Schedule PH, Part I Line 10 - Section 545 Amount</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductionsAmt/@section545cAmt"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
</table>  
<!-- Additional Data Table for Separated Data from Part IV, Line 1 -->
<xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp) &gt; 5))">
  <span class="styRepeatingDataTitle">
    <br/>Form 1120 Schedule PH, Part IV, Line 1 - Stock Ownership Requirement Under Section 542(a)(2)<br/>
  </span>
  <table class="styDepTbl" style="font-size:7pt">
    <thead class="styTableThead">
      <tr class="styDepTblHdr">
        <th scope="col" class="styDepTblCell" style="width:66mm;" rowspan="2">(a)Name</th>
        <th scope="col" class="styDepTblCell" style="width:82mm;" rowspan="2">(b)Address</th>
        <th scope="col" class="styDepTblCell" style="width:38mm;" colspan="2">
          Highest percentage of shares owned during last half of tax year
        </th>
      </tr>
      <tr class="styDepTblHdr">
        <th scope="col" class="styDepTblCell" style="width: 19mm;">(c)Preferred</th>
        <th scope="col" class="styDepTblCell" style="width: 19mm;">(d)Common</th>
      </tr>
    </thead>
    <tfoot/>
    <tbody>
      <xsl:for-each select="$IRS1120SchedulePHData/StockOwnrRqrUndSect542a2Grp">
        <tr>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
              <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align: left">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="StockOwnerPersonNm"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:choose>
              <xsl:when test="USAddress">             
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="USAddress/City"/>
                </xsl:call-template>
                <span style="width=1mm"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="USAddress/State"/>
                </xsl:call-template>
                <span style="width=1mm"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddress"/>
	            </xsl:call-template> 
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="text-align: right">
            <xsl:call-template name="PopulatePercent">
              <xsl:with-param name="TargetNode" select="PreferredStockOwnedPercentRt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align: right">
            <xsl:call-template name="PopulatePercent">
              <xsl:with-param name="TargetNode" select="CommonStockOwnedPercentRt"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</xsl:if>
<!-- End of Part IV, Line 1 Separated Data -->
<!-- Additional Data Table for Separated Data from Part V, Line 1 -->
<xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/ExcessExpensesDepreciationGrp) &gt; 6))">
  <span class="styRepeatingDataTitle">
    <br/>Form 1120 Schedule PH, Part V, Line 1 - Excess of Expenses and Depreciation Over Income From Property 
    Not Allowable Under Section 545(b)(6):
  </span>
  <table class="styDepTbl" style="font-size:6pt">
    <thead class="styTableThead">
      <tr class="styDepTblHdr">
        <th scope="col" class="styDepTblCell" style="width:15mm; ">(a)Description of<br/>property</th>
        <th scope="col" class="styDepTblCell" style="width:17mm;">(b)Date<br/>acquired</th>
        <th scope="col" class="styDepTblCell" style="width: 25mm;">(c)Cost or<br/>other basis</th>
        <th scope="col" class="styDepTblCell" style="width:25mm;">(d)Depreciation<br/>deduction</th>
        <th scope="col" class="styDepTblCell" style="width: 31mm;" colspan="2">
          (e)Repairs,<br/>insurance, and<br/>other expenses<br/>(section 162)<br/>(attach schedule)
        </th>
        <th scope="col" class="styDepTblCell" style="width: 25mm;">(f)Total of<br/>columns (d)<br/>and (e)</th>
        <th scope="col" class="styDepTblCell" style="width: 25mm;">(g)Income from<br/>rent or other<br/>compensation</th>
        <th scope="col" class="styDepTblCell" style="width: 25mm;">(h)Excess<br/>(col. (f) less<br/>col. (g))</th>
      </tr>
    </thead>
  <tfoot/>
  <tbody>
    <xsl:for-each select="$IRS1120SchedulePHData/ExcessExpensesDepreciationGrp">
      <tr>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <td class="styDepTblCell" style="width:15mm;text-align: left">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PropertyDesc"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:17mm;text-align:center">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="AcquiredDt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 25mm; text-align:right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:25mm;text-align:right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DepreciationDeductionAmt"/>
          </xsl:call-template>  
        </td>
        <td class="styDepTblCell" style="border-right-width:0px;">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="RepairsInsAndOtherExpensesAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:31mm;border-left-width:0px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="RepairsInsAndOtherExpensesAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 25mm;text-align: right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="TotalDeprecAndDedExpensesAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 25mm;text-align: right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="RentIncomeAndOtherCompAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 25mm;text-align: right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ExcessAmt"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:for-each>
  </tbody>
</table>
</xsl:if>
<!-- End of Part V, Line 1 Separated Data -->
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>