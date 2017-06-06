<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1120SchedulePHStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
<!-- Defines the stage of the data, e.g. original or latest -->
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
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnership"/>
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
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciation"/>
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
      <!-- Separated Print option Begin -->
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
        <div class="styIRS1120SchedulePHFN" style="height:18mm;">
          <div class="styFormNumber" style="width:29mm;font-size:9pt;">SCHEDULE PH
          <br/>
          <span style="font-size:9pt;">(Form 1120)</span>      
          <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData"/>
          </xsl:call-template>
                <span style="font-size:6pt;">
                  <br/>
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
          <img src="{$ImagePath}/1120SchPH_Bullet.gif" alt="Bullet"/> See separate instructions.  Attach to tax return.
        </div>
        </div>
        <div class="styTYBox" style="width:47mm;height:12mm;">
          <div class="styOMB" style="height:2mm;">OMB No. 1545-0123</div>
              <div class="styTY" style="height:11mm;padding-top:3mm;">20<span class="styTYColor">09</span>
              </div>
        </div>
      </div>
      <!--  END FORM HEADER   -->
      <!--   BEGIN TAXPAYER INFO   -->
      <div style="width:187mm;float:left;clear:left;">
        <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name<br/>
          <span>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
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
      <div style="width:187mm;float:none;clear:none">
        <span class="styIRS1120SchedulePHImg" style="height:27mm;padding-top:6mm;">
          <img src="{$ImagePath}/1120SchPH_Additions.gif" alt="Additions"/>
        </span>
        <!-- BEGIN LINE 1 -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">1</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="width:132mm; height: 4.5mm">
            Taxable income before net operating loss deduction and special deductions. Enter amount from
          </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px;border-right-width: 0px; height: 4.5mm"/>
        </div>
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLNDesc" style="width:131.5mm; margin-left:9mm; height: 4.5mm">
            Form 1120, line 28
            <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm">1</span>
          <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm; border-right-width: 0px;">    
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableIncomeBeforeNetOprLoss"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   END LINE 1   -->
        <!--   BEGIN LINE 2  -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">2</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">
            Contributions deducted in figuring line 1.  Enter amount from Form 1120, line 19 
            <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styLNRightNumBox" style="height: 4.5mm;width:6.5mm;">2</span>
          <span class="styLNAmountBox" style="height: 4.5mm">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ContributionsDeducted"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   END LINE 2   -->
        <!--   BEGIN LINE 3   -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">3</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">
            Excess expenses and depreciation under section 545(b)(6).  Enter amount from Part V,
          </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 131.5mm; margin-left:9mm">line 2
            <b>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDeprec545b6"/>
              </xsl:call-template>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 1px; height: 4.5mm;">3</span>
          <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width: 1px; height: 4.5mm;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDeprec545b6"/>
            </xsl:call-template>
          </span>
        </div>
        <!--  END LINE 3   -->
        <!--   BEGIN LINE 4   -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm;">4</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">Total.  Add lines 1 through 3
            <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm; border-bottom-width: 0px;">4</span>
          <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm; border-bottom-width: 0px">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalAdditions"/>
            </xsl:call-template>
          </span>
        </div>
        <!--  END LINE 4   -->
      </div>
      <!--   END LINES 1 THROUGH 4   -->
      <!--   BEGIN LINES 5 THROUGH 13  -->
      <!-- BEGIN LINE 5   -->
      <div style="width:187mm;float:none;clear:none; border-style: solid; border-top-width: 1px; border-bottom-width: 0px; border-right-width: 0px; border-left-width: 0px;">
            <span class="styIRS1120SchedulePHImg" style="height: 72.5mm; padding-top: 30mm; padding-bottom: 20mm;">
          <img src="{$ImagePath}/1120SchPH_Deductions.gif" alt="Deductions"/>
        </span>
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm; margin-left: 2.25mm">5</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">
            Federal and foreign income, war profits, and excess profits taxes not deducted in figuring
          </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:0px; height: 4.5mm"/>
        </div>
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 131.5mm; margin-left:9mm">line 1 (attach schedule)
            <b>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/OtherTaxesNotDeducted"/>
              </xsl:call-template>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm">5</span>
          <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; height: 4.5mm">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/OtherTaxesNotDeducted"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   END LINE 5   -->
        <!--   BEGIN LINE 6   -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">6</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">Contributions deductible under section 545(b)(2).  See instructions for limitation
            <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>. 
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm">6</span>
          <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ContributionsDeductible"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   END LINE 6   -->
        <!-- BEGIN LINE 7   -->
        <div class="styGenericDiv">
          <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">7</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
          <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">Net operating loss for the preceding tax year deductible under section 545(b)(4)
            <b>
                  <span class="styIRS1120SchedulePHNBSP"/>. 
              <span class="styIRS1120SchedulePHNBSP"/>.
              <span class="styIRS1120SchedulePHNBSP"/>. 
              <span class="styIRS1120SchedulePHNBSP"/>.
            </b>
          </span>
          <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm">7</span>
            <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm">
              <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NOLPrecedingTaxYearDeductible"/>
              </xsl:call-template>
            </span>
        </div>
        <!--   END LINE 7   -->
        <!--   BEGIN LINE 8   -->
        <!--   BEGIN LINE 8a  -->
        <div class="styGenericDiv">
          <span class="styLNLeftNumBox" style="padding-left:3.5mm;height: 4.5mm;">8a</span>
          <span class="styLNDesc" style="width:92.5mm; height: 4.5mm;padding-left:1mm;">
            Net capital gain from Schedule D (Form 1120), line 13 
            <span class="styBoldText">
                  <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
          </span>
        </div>
      <div>
        <span class="styLNRightNumBox" style="height: 5mm">8a</span>
        <span class="styLNAmountBox" style="height: 5mm">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NetCapitalGain"/>
          </xsl:call-template>
        </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:0px;background-color: lightgrey; height: 5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="height: 5mm;border-bottom-width:0px"/>
      </div>
      <!--   END LINE 8a   -->
      <!--   BEGIN LINE 8b   -->
      <div class="styGenericDiv">
        <span class="styLNLeftNumBox" style="height: 4.5mm;padding-left:5mm;">b</span>
              <span class="styLNDesc" style="width:92.70mm; height: 4.5mm;padding-left:2.5mm;">
                <b>Less:  </b>Income tax on this net capital gain (see section 545(b)(5)) </span>
              <span class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styLNAmountBox" style="border-bottom-width: 0px;border-left-width: 1px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px;background-color: lightgrey; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px;border-left-width: 0px; height: 4.5mm"/>
        <span class="styLNDesc" style="height: 4.5mm; width: 100.5mm;padding-left:10mm;">(attach computation)
          <b>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/IncomeTaxOnNetCapitalGain"/>
            </xsl:call-template>
                  <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
          </b>
        </span>
       <span class="styLNRightNumBox" style="height: 4.5mm">8b</span>
       <span class="styLNAmountBox" style="height: 4.5mm">
         <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/IncomeTaxOnNetCapitalGain"/>
         </xsl:call-template>
              </span>
              <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm">8c</span>
              <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/NetCapitalGainMinusIncomeTax"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   END LINE 8b  -->
      <!--   END LINE 8   -->
      <!--   BEGIN LINE 9   -->
      <div class="styGenericDiv">
        <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:2.25mm">9</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132mm">Deduction for dividends paid (other than dividends paid after the end of the tax </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; height: 4.5mm"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; margin-left: 9mm; width: 131.5mm">year).  Enter amount from Part VI, line 5
          <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
          </b>
        </span>
        <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px; height: 4.5mm">9</span>
        <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width:1px; height: 4.5mm;">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DeductionForDividendsPaid"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   END LINE 9   -->
      <!--   BEGIN LINE 10   -->
      <div class="styGenericDiv">
              <span class="styIRS1120SchedulePHLNLtMargin" style="width: 140.5mm; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; height: 4.5mm"/>
      </div>
      <div class="styGenericDiv">
        <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left: .5mm">10</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm;"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 130mm">Total.  Add lines 5 through 9
               <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 10 - Section 545 Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductions/@section545cIndicator"/>
                  </xsl:call-template>
          <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
          </b>
        </span>
        <span class="styIRS1120SchedulePHLNValBox" style="width: 32.5mm; margin-right: 1mm; border-right-width: 0px;border-bottom-width:1px; height: 4.5mm; float: right; clear: none;">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductions"/>
          </xsl:call-template>
              </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px; height: 4.5mm; float: right; clear: none">10</span>
      </div>
      <!--   END LINE 10   -->
      <!--   BEGIN LINE 11   -->
      <div class="styGenericDiv">
              <span class="styIRS1120SchedulePHLNLtMargin" style="width: 140.5mm; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm"/>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; height: 4.5mm"/>
      </div>
      <div class="styGenericDiv" style="float:right;clear:none;">
        <span class="styIRS1120SchedulePHLN" style="height: 4.5mm; margin-left: .5mm">11</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm;"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 130mm">Subtract line 10 from line 4
          <b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
            <span class="styIRS1120SchedulePHNBSP"/>.
          </b>
        </span>
        <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm; float: right; clear: none; width: 32.5mm; margin-right: 1mm;">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdditionsMinusDeductions"/>
          </xsl:call-template>
        </span>
        <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm; float: right; clear: none">11</span>
      </div>
      <!--   END LINE 11   -->
      <!--   BEGIN LINE 12   -->
      <div class="styGenericDiv" style="float:right;clear:none;">
        <span class="styIRS1120SchedulePHLN" style="height: 4.5mm; margin-left: .5mm">12</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 130mm">Dividends paid after the end of the tax year (other than deficiency dividends defined</span>
              <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; height: 4.5mm; float: right; clear: none; width: 33.5mm"/>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; height: 4.5mm; float: right; clear: none"/>
              <span class="styIRS1120SchedulePHLNLtMargin" style="width:8mm; height: 4.5mm"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 132.5mm">in section 547(d)), but not more than the smaller of line 11 or 20% of Part VI, line 1<b>
                  <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
              </span>
              <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px; height: 4.5mm">12</span>
        <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width:1px; height: 4.5mm">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DividendsPaidAfterEndOfTaxYear"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   END LINE 12   -->
      <!--   BEGIN LINE 13 -->  
      <div class="styGenericDiv">
        <span class="styIRS1120SchedulePHLN" style="height: 4.5mm;margin-left:.25mm">13</span>
              <span class="styIRS1120SchedulePHLNLtMargin" style="height: 4.5mm"/>
        <span class="styIRS1120SchedulePHLNDesc" style="height: 4.5mm; width: 133mm;font-weight:bold;">Undistributed PHC income.
          <span style="font-weight:normal">Subtract line 12 from line 11.</span>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </span>
        <span class="styIRS1120SchedulePHLNBox" style="height: 4.5mm;border-bottom-width:0px">13</span>
        <span class="styIRS1120SchedulePHLNValBox" style="height: 4.5mm;border-bottom-width:0px ">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/UndistributedPHCIncome"/>
          </xsl:call-template>
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
      <span style="padding-left: 10mm;"/>collection of the PHC tax is any time within 6 years after the return is filed.  See section 6501(f).
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
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">14</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 140mm">Dividends
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/Dividends"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">14</span>
    </div>
    <!--   END LINE 14   -->
    <!--   BEGIN LINE 15   -->
    <!--   BEGIN LINE 15a  -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">15a</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.75mm"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">Interest
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px;float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px;background-color: lightgrey; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/Interest"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">15a</span>
    </div>
    <!--   END LINE 15a  -->
    <!--   BEGIN LINE 15b   -->
    <div class="styIRS1120SchedulePHLineItem"> 
            <span class="styIRS1120SchedulePHLNLtMargin" style=" width: 3.5mm; height: 4mm"/>
      <span class="styIRS1120SchedulePHLN">b</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.75mm"/>
            <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">
              <b>Less:  </b>Amounts excluded (attach schedule)
        <b>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AmountsExcluded"/>
                </xsl:call-template>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/InterestMinusAmountsExcluded"/>
              </xsl:call-template>
            </span>
            <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">15c</span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AmountsExcluded"/>
          </xsl:call-template>
        </span>
        <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">15b</span>
    </div>
    <!--   END LINE 15b  -->
    <!--   END LINE 15   -->
    <!--   BEGIN LINE 16   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">16</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Royalties (other than mineral, oil, gas, or copyright royalties)
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/Royalties"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm;">16</span>
    </div>
    <!--   END LINE 16   -->
    <!--   BEGIN LINE 17   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">17</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Annuities
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/Annuities"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">17</span>
    </div>
    <!--   END LINE 17   -->
    <!--   BEGIN LINE 18   -->
    <!--   BEGIN LINE 18a  -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">18a</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.75mm"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">Rents
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px;float:right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px;background-color: lightgrey; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/Rents"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">18a</span>
    </div>
    <!--   END LINE 18a  -->
    <!--   BEGIN LINE 18b   -->
    <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style=" width: 3.5mm; height: 4mm"/>
     <span class="styIRS1120SchedulePHLN">b</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.75mm"/>
            <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">
              <b>Less:  </b>Adjustments to rents (attach schedule)
       <b>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdjustmentsToRents"/>
                </xsl:call-template>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/RentsMinusAdjustmentsToRents"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">18c</span>
     <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
       <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdjustmentsToRents"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">18b</span>
    </div>
    <!--   END LINE 18b  -->
    <!--   END LINE 18a   -->
    <!--   BEGIN LINE 19   -->
    <!--   BEGIN LINE 19a  -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">19a</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.5mm"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">Mineral, oil, and gas royalties
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:0px;background-color: lightgrey; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRoyalties"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">19a</span>
    </div>
    <!--   END LINE 19a  -->
    <!--   BEGIN LINE 19b and 19c  -->
    <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style=" width: 3.5mm; height: 4mm"/>
     <span class="styIRS1120SchedulePHLN">b</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.5mm"/>
            <span class="styIRS1120SchedulePHLNDesc" style="width: 100mm">
              <b>Less:  </b>Adjustments to mineral, oil, and gas royalties </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-left-width:0px;border-bottom-width:0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px;background-color: lightgrey; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px;border-left-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
          </div>
          <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width:10mm;"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 96.75mm">(attach schedule)
        <b>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdjToMineralOilGasRoyalties"/>
          </xsl:call-template>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/MineralOilGasRoyaltiesMinusAdj"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">19c</span>
      <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
        <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AdjToMineralOilGasRoyalties"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">19b</span>
    </div>
    <!--   END LINE 19b and 19c -->
    <!--   END LINE 19   -->
    <!--   BEGIN LINE 20   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">20</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Copyright royalties
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
           <span class="styIRS1120SchedulePHNBSP"/>.
           <span class="styIRS1120SchedulePHNBSP"/>.
           <span class="styIRS1120SchedulePHNBSP"/>.
           <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/CopyrightRoyalties"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">20</span>
    </div>
    <!--   END LINE 20   -->
    <!--   BEGIN LINE 21   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">21</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Produced film rents
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ProducedFilmRents"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">21</span>
    </div>
    <!--   END LINE 21   -->
    <!--   BEGIN LINE 22   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">22</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Compensation received for use of corporation property by 25% or more shareholder
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
      </span>
      <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
        <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/CompensationForCorpPropertyUse"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">22</span>
    </div>
    <!--   END LINE 22   -->
    <!--   BEGIN LINE 23   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">23</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Amounts received under personal service contracts and from their sale
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/AmountsReceivedUnderPSC"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">23</span>
    </div>
    <!--   END LINE 23   -->
    <!--   BEGIN LINE 24   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">24</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
      <span class="styIRS1120SchedulePHLNDesc">Amounts includible in taxable income from estates and trusts
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
      </span>
      <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:1px; float: right; height: 4mm">
        <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/IncludiblesFromEstatesTrusts"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:1px; float: right; height: 4mm">24</span>
    </div>
    <!--   END LINE 24   -->
    <!--   BEGIN LINE 25   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">25</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
            <span class="styIRS1120SchedulePHLNDesc">
              <b>PHC income.</b>  Add lines 14 through 24
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
      </span>
      <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:0px; float: right; height: 4mm">
        <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/PHCIncome"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:0px; float: right; height: 4mm">25</span>
    </div>
    <!--   END LINE 25   -->
    <!--  BEGIN PART III HEADER   -->
    <div class="styIRS1120SchedulePHPartHdr" style="float:left;clear:left;border-top-width:1px">
      <span style="width:17mm;">
              <span class="styIRS1120SchedulePHPartHdrSpanner"/>
        <span class="styIRS1120SchedulePHPartHdrTitle">Part III</span>
      </span> 
            <span style="padding-left:1mm;"/>Tax on Undistributed Personal Holding Company Income
    </div>
    <!--   END PART III HEADER   -->
    <!--   BEGIN LINE 26   -->
    <div class="styIRS1120SchedulePHLineItem">
      <span class="styIRS1120SchedulePHLN">26</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
            <span class="styIRS1120SchedulePHLNDesc">
              <b>PHC tax.</b>
        Enter 15% of line 13 here and on Schedule J (Form 1120), line 8, or on the proper line of the
      </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
    </div>
    <div class="styIRS1120SchedulePHLineItem" style="border-style: solid; border-left-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-top-width: 0px">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 8.25mm"/>
      <span class="styIRS1120SchedulePHLNDesc" style="width: 130mm">
        appropriate tax return 
        <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
      </span>
      <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; border-bottom-width: 0px; float: right; height: 4mm">
        <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/PHCTax"/>
        </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm">26</span>
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
        <span class="styBoldText">Schedule PH (Form 1120) (2009)</span>
      </div>      
    </div>     
          <div class="pageEnd"/>
    <!--END FOOTER-->  
    <!--BEGIN HEADER-->
    <div class="styBB" style="width:187mm;border-bottom:0px solid black;">
      <div style="float: left; clear: none">Schedule PH (Form 1120) (2009)</div>        
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
              <span class="styIRS1120SchedulePHLNLtMargin" style="width: 15mm"/>
          Enter the names and addresses of the individuals who together owned, directly or indirectly, at any time 
        </span>
        <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="font-size:8pt">
              <span class="styIRS1120SchedulePHLNLtMargin" style="width: 15mm"/>
            during the last half of the tax year, more than 50% in value of the outstanding stock of the corporation.
            <span style="width:5mm;text-align:right; float: right; clear:none">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnership"/>
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
                  <th class="styIRS1120SchedulePHTableCellA" style="font-weight: normal" rowspan="2">
                    <b>(a)</b>Name</th>
                  <th class="styIRS1120SchedulePHTableCellB" style="font-weight: normal" rowspan="2">
                    <b>(b)</b>Address</th>
           <th class="styIRS1120SchedulePHTableTopCell" style="font-weight: normal;" colspan="2">Highest percentage of shares owned during last half of tax year</th>
         </tr>
         <tr>
                  <th class="styIRS1120SchedulePHTableCellC" style="font-weight: normal;">
                    <b>(c)</b>Preferred</th>
                  <th class="styIRS1120SchedulePHTableCellD" style="border-right-width:0px; font-weight: normal;">
                    <b>(d)</b>Common</th>
         </tr>
        </thead>
        <tfoot/>
        <tbody>
        <!-- INSTRUCTION: When the Print parameter is not Separated display all the rows. If the Print parameter is Separated,  -->
        <!-- but the number of elements is fewer than the container height, then also display all the rows -->
        <xsl:if test="(($Print != $Separated) or (count($IRS1120SchedulePHData/StockOwnership) &lt;= 5))">
          <xsl:for-each select="$IRS1120SchedulePHData/StockOwnership">
            <tr>
              <td class="styIRS1120SchedulePHTableCellA" style="text-align: left">
                        <span class="styIRS1120SchedulePHLN">
                          <xsl:if test="position()=1">1</xsl:if>
                        </span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Name"/>
                        </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellB" style="text-align:left">
                <xsl:choose>
                  <xsl:when test="Address">             
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/AddressLine1"/>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/AddressLine2"/>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/City"/>
                    </xsl:call-template>
                            <span style="width=1mm"/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/State"/>
                            </xsl:call-template>
                            <span style="width=1mm"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/ZIPCode"/>
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
                          <xsl:with-param name="TargetNode" select="HighestPercentOfPreferredStock"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellD" style="border-right-width: 0px; text-align: right">
                <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="HighestPercentOfCommonStock"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:call-template name="AddRowsPartIV">
                    <xsl:with-param name="SOCount" select="count($IRS1120SchedulePHData/StockOwnership)"/>
                    <xsl:with-param name="NumOfRows" select="5"/>
          </xsl:call-template>
        </xsl:if>
        <!-- INSTRUCTION: If the Print parameter is Separated and the number of elements exceeds the container height, display blank rows -->
        <!-- and a message in the first row directing users to the additional data table -->
        <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/StockOwnership) &gt; 5))">
          <xsl:call-template name="AddRowsPartIV">
                    <xsl:with-param name="SOCount" select="0"/>
                    <xsl:with-param name="NumOfRows" select="5"/>
          </xsl:call-template>
        </xsl:if>
      </tbody>
    </table>
  </div>
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/StockOwnership"/>
    <xsl:with-param name="containerHeight" select="5"/>
    <xsl:with-param name="containerID" select=" 'SOctn' "/>
  </xsl:call-template>
  <!--   END PART IV TABLE   -->
  <!--   BEGIN LINE 2   -->
  <div class="styIRS1120SchedulePHLineItem" style="float: none; clear: both;width:187mm">
    <span class="styIRS1120SchedulePHLN" style="padding-top:4.5mm;padding-left: 1.75mm;">2</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
    <span class="styIRS1120SchedulePHLNDesc" style="width: 139.25mm;padding-top:4.5mm;">Add the amounts in columns (c) and (d) and enter the totals here
      <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
      </b>
      <img src="{$ImagePath}/1120SchPH_Bullet.gif" alt="Bullet"/>
    </span>
    <span class="styIRS1120SchedulePHPreferred" style="border-right-width: 0px;
">
      <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalHighestPercentCommonStock"/>
      </xsl:call-template>
    </span>
    <span class="styIRS1120SchedulePHCommon" style="border-left-width: 1px;">
      <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalHighestPercentPrefStock"/>
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
      <br/>
            <span style="width:15mm"/>Under Section 545(b)(6)
      <span class="styIRS1120SchedulePHSeeInstructionsTitle" style="width: 60mm">(see instructions for Part I, line 3)</span>
      <span style="width:7mm;text-align:right;float:right; clear: none">
        <xsl:call-template name="SetDynamicTableToggleButton">
          <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciation"/>
          <xsl:with-param name="containerHeight" select="6"/>
          <xsl:with-param name="containerID" select=" 'EEctn' "/>
        </xsl:call-template>
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
                  <th class="styIRS1120SchedulePHTableCellA" style="width:15mm; font-weight: normal;">
                    <b>(a)</b>Description of property</th>
                  <th class="styIRS1120SchedulePHTableCellB" style="width:17mm; font-weight: normal;">
                    <b>(b)</b>Date<br/>acquired</th>
                  <th class="styIRS1120SchedulePHTableCellC" style="width: 25mm;font-weight: normal;">
                    <b>(c)</b>Cost or<br/>other basis</th>
                  <th class="styIRS1120SchedulePHTableCellD" style="width:25mm; font-weight: normal;">
                    <b>(d)</b>Depreciation<br/>deduction</th>
                  <th class="styIRS1120SchedulePHTableCellE" style="width: 31mm; font-weight: normal;">
                    <b>(e)</b>Repairs,<br/>insurance, and<br/>other expenses<br/>(section 162)<br/>(attach schedule)</th>
                  <th class="styIRS1120SchedulePHTableCellF" style="width: 25mm; font-weight: normal;">
                    <b>(f)</b>Total of<br/>columns (d)<br/>and (e)</th>
                  <th class="styIRS1120SchedulePHTableCellG" style="width: 25mm; font-weight: normal;">
                    <b>(g)</b>Income from<br/>rent or other<br/>compensation</th>
                  <th class="styIRS1120SchedulePHTableCellH" style="width: 25mm; font-weight: normal;">
                    <b>(h)</b>Excess<br/>(col. (f) less<br/>col. (g))</th>
         </tr>
        </thead>
        <tfoot/>
        <tbody>
        <!-- When the Print parameter is not Separated display all the rows. If the Print parameter is Separated,  -->
        <!-- but the number of elements is fewer than the container height, then also display all the rows -->
        <xsl:if test="(($Print != $Separated) or (count($IRS1120SchedulePHData/ExcessExpensesDepreciation) &lt;= 6))">
          <xsl:for-each select="$IRS1120SchedulePHData/ExcessExpensesDepreciation">
            <tr>
              <td class="styIRS1120SchedulePHTableCellA" style="width: 15mm; height: 4mm; text-align: left">
                <span class="styIRS1120SchedulePHLN">
                  <xsl:if test="position()=1">1</xsl:if>
                </span>
                <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellB" style="height: 4mm;width:17mm">
                <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="DateAcquired"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellC" style="height: 4mm;width: 25mm; text-align: right">
                <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellD" style="height: 4mm;width:25mm; text-align: right">
                <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="DepreciationDeduction"/>
                </xsl:call-template>  
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellE" style="height: 4mm; text-align: right; width: 31mm">
                <span style="float: left; clear:none">
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="RepairsInsuranceOtherExpenses"/>
                  </xsl:call-template>
                </span>
                        <span style="width: 4px;"/>
                <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="RepairsInsuranceOtherExpenses"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellF" style="width: 25mm; height: 4mm;  text-align: right">
                <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TotalDeprecDeductionExpenses"/>
                </xsl:call-template>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellG" style="width: 25mm; height: 4mm; text-align: right">
                <xsl:choose>
                  <xsl:when test="$IRS1120SchedulePHData/ExcessExpensesDepreciation/RentIncomeOtherCompensation != ''">
                    <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="RentIncomeOtherCompensation"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
              <td class="styIRS1120SchedulePHTableCellH" style="width: 25mm; height: 4mm; text-align: right">
                <xsl:choose>
                  <xsl:when test="$IRS1120SchedulePHData/ExcessExpensesDepreciation/Excess != ''">
                    <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Excess"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                        <span class="styIRS1120SchedulePHTableCellPad"/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:call-template name="AddRowsPartV">
                    <xsl:with-param name="EECount" select="count($IRS1120SchedulePHData/ExcessExpensesDepreciation)"/>
                    <xsl:with-param name="NumOfRows" select="6"/>
          </xsl:call-template>
        </xsl:if>
        <!-- If the Print parameter is Separated and the number of elements exceeds the container height, display blank rows -->
        <!-- and a message in the first row directing users to the additional data table -->
        <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/ExcessExpensesDepreciation) &gt; 5))">
          <xsl:call-template name="AddRowsPartV">
                    <xsl:with-param name="EECount" select="0"/>
                    <xsl:with-param name="NumOfRows" select="6"/>
          </xsl:call-template>
        </xsl:if>
      </tbody>
    </table>
  </div>
  <xsl:call-template name="SetInitialDynamicTableHeight">
    <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ExcessExpensesDepreciation"/>
    <xsl:with-param name="containerHeight" select="6"/>
    <xsl:with-param name="containerID" select=" 'EEctn' "/>
  </xsl:call-template>
  <!--   END PART V TABLE   -->
  <!--   BEGIN LINE 2   -->
  <div class="styIRS1120SchedulePHLineItem" style="float:none">
    <span class="styIRS1120SchedulePHLN">2</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
            <span class="styIRS1120SchedulePHLNDesc" style="width: 153.50mm;">
              <b>Total excess of expenses and depreciation over rent or other compensation. </b>Add the amounts in column (h).</span>
            <span class="styIRS1120SchedulePHCommon" style="height: 4mm; width: 23.40mm;padding-top: 0px; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px"/>
          </div>
          <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 6mm"/>
    <span class="styIRS1120SchedulePHLNDesc" style="width: 153.50mm;">  Enter the total here and on Part I, line 3
      <b>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalExcessExpensesDeprec"/>
        </xsl:call-template>
                <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
        <span class="styIRS1120SchedulePHNBSP"/>.
      </b>
     </span>
     <span class="styIRS1120SchedulePHCommon" style="font-size: 6pt;height: 4mm; width: 23.40mm;padding-top: 0px; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
       <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalExcessExpensesDeprec"/>
       </xsl:call-template>
     </span>
   </div>
   <div class="styIRS1120SchedulePHNoteHdr" style="border-top-width: 0px; border-bottom-width: 0px">
     <span class="styIRS1120SchedulePHNoteHdrTitle" style="margin-left: 6mm; width: 10mm; float: left; clear: none">Note:</span>
     <span style="width: 143mm; float: left; clear: none">Attach a statement showing the names and addresses of persons from whom rent or other compensation was received for the use of, or the right to use, each property.</span>
            <span class="styIRS1120SchedulePHCommon" style="height:8mm; width: 23.40mm; padding-top: 0mm; border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; background-color: lightgrey"/>
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
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width:1mm;"/>
     <span class="styIRS1120SchedulePHLN">1</span>
            <span class="styIRS1120SchedulePHLNLtMargin" style="width: 1.5mm"/>
     <span class="styIRS1120SchedulePHLNDesc">Taxable dividends paid.  Do not include dividends considered as paid in the preceding</span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width: 0px; border-right-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width:5.75mm"/>
     <span class="styIRS1120SchedulePHLNDesc">tax year under section 563 or deficiency dividends as defined in section 547
       <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
       </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableDividendsPaid"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">1</span>
   </div>
   <!--  END LINE 1   -->
   <!--   BEGIN LINE 2   -->
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLtMargin4"/>
     <span class="styIRS1120SchedulePHLN">2</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
     <span class="styIRS1120SchedulePHLNDesc">Consent dividends.  Attach Forms 972 and 973
       <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
         <span class="styIRS1120SchedulePHNBSP"/>.
       </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/ConsentDividends"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">2</span>
   </div>
   <!--   END LINE 2   -->
   <!--   BEGIN LINE 3   -->
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLtMargin4"/>
     <span class="styIRS1120SchedulePHLN">3</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
     <span class="styIRS1120SchedulePHLNDesc">Taxable distributions.  Add lines 1 and 2
       <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
            </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; float: right; height: 4mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TaxableDistributions"/>
       </xsl:call-template>
      </span>
      <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">3</span>
   </div>
   <!--   END LINE 3   -->
   <!--   BEGIN LINE 4   -->
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLtMargin4"/>
     <span class="styIRS1120SchedulePHLN">4</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
     <span class="styIRS1120SchedulePHLNDesc">Dividend carryover from first and second preceding tax years.  Attach computation
       <b>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivCyovFrom1stAnd2ndPrecTxYr"/>
          </xsl:call-template>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
     </span>
     <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; float: right; height: 4mm">
       <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DivCyovFrom1stAnd2ndPrecTxYr"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="float: right; height: 4mm">4</span>
   </div>
   <!--   END LINE 4  -->
   <!--   BEGIN LINE 5   -->
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px; border-bottom-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem">
            <span class="styIRS1120SchedulePHLtMargin4"/>
     <span class="styIRS1120SchedulePHLN">5</span>
            <span class="styIRS1120SchedulePHLNLtMargin"/>
            <span class="styIRS1120SchedulePHLNDesc">
              <b>Deduction for dividends paid.</b>  Add lines 3 and 4.  Enter the total here and on </span>
            <span class="styIRS1120SchedulePHLNValBox" style="border-right-width: 0px;border-bottom-width: 0px; float: right; height: 4mm"/>
            <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width: 0px; float: right; height: 4mm"/>
   </div>
   <div class="styIRS1120SchedulePHLineItem" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
            <span class="styIRS1120SchedulePHLNLtMargin" style="width:5.75mm"/>
     <span class="styIRS1120SchedulePHLNDesc">Part I, line 9
       <b>
                <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
          <span class="styIRS1120SchedulePHNBSP"/>.
        </b>
     </span>
     <span class="styIRS1120SchedulePHLNValBox" style="border-bottom-width:0px;border-right-width: 0px; float: right; height: 4mm">
       <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/DeductionForDividendsPaid"/>
       </xsl:call-template>
     </span>
     <span class="styIRS1120SchedulePHLNBox" style="border-bottom-width:0px; float: right; height: 4mm">5</span>
   </div>
   <!--   END LINE 5   -->
   <!--   BEGIN FORM FOOTER  -->
   <div style="width: 187mm">
            <span style="float: left; width: 100mm"/>
     <span class="styBoldText" style="float: right">Schedule PH (Form 1120) (2009)</span>
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
              <xsl:with-param name="Desc">Form 1120 Schedule PH, Part I Line 10 - Section 545 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductions/@section545cIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120 Schedule PH, Part I Line 10 - Section 545 Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$IRS1120SchedulePHData/TotalDeductions/@section545cAmount"/>
       <xsl:with-param name="DescWidth" select="100"/>
     </xsl:call-template>
   </table>  
   <!-- Additional Data Table for Separated Data from Part IV, Line 1 -->
   <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/StockOwnership) &gt; 5))">
     <span class="styRepeatingDataTitle">
       <br/>Form 1120 Schedule PH, Part IV, Line 1 - Stock Ownership Requirement Under Section 542(a)(2)<br/>
     </span>
     <table class="styDepTbl" style="font-size:7pt">
       <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width:66mm;" rowspan="2">(a)Name</th>
            <th class="styDepTblCell" style="width:82mm;" rowspan="2">(b)Address</th>
            <th class="styDepTblCell" style="width:38mm;" colspan="2">
              Highest percentage of shares owned during last half of tax year
            </th>
          </tr>
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width: 19mm;">(c)Preferred</th>
            <th class="styDepTblCell" style="width: 19mm;">(d)Common</th>
          </tr>
        </thead>
        <tfoot/>
        <tbody>
          <xsl:for-each select="$IRS1120SchedulePHData/StockOwnership">
          <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
            <td class="styDepTblCell" style="text-align: left">
               <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Name"/>
               </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left">
                  <xsl:choose>
                  <xsl:when test="Address">             
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/AddressLine1"/>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/AddressLine2"/>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/City"/>
                    </xsl:call-template>
                            <span style="width=1mm"/>
                    <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/State"/>
                            </xsl:call-template>
                            <span style="width=1mm"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Address/ZIPCode"/>
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
                        <xsl:with-param name="TargetNode" select="HighestPercentOfPreferredStock"/>
               </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align: right">
               <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="HighestPercentOfCommonStock"/>
               </xsl:call-template>
             </td>
           </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:if>
  <!-- End of Part IV, Line 1 Separated Data -->
  <!-- Additional Data Table for Separated Data from Part V, Line 1 -->
  <xsl:if test="(($Print = $Separated) and (count($IRS1120SchedulePHData/ExcessExpensesDepreciation) &gt; 6))">
     <span class="styRepeatingDataTitle">
       <br/>Form 1120 Schedule PH, Part V, Line 1 - Excess of Expenses and Depreciation Over Income From Property 
         Not Allowable Under Section 545(b)(6):
     </span>
     <table class="styDepTbl" style="font-size:6pt">
       <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" style="width:15mm; ">(a)Description of<br/>property</th>
            <th class="styDepTblCell" style="width:17mm;">(b)Date<br/>acquired</th>
            <th class="styDepTblCell" style="width: 25mm;">(c)Cost or<br/>other basis</th>
            <th class="styDepTblCell" style="width:25mm;">(d)Depreciation<br/>deduction</th>
            <th class="styDepTblCell" style="width: 31mm;" colspan="2">
              (e)Repairs,<br/>insurance, and<br/>other expenses<br/>(section 162)<br/>(attach schedule)
            </th>
            <th class="styDepTblCell" style="width: 25mm;">(f)Total of<br/>columns (d)<br/>and (e)</th>
            <th class="styDepTblCell" style="width: 25mm;">(g)Income from<br/>rent or other<br/>compensation</th>
            <th class="styDepTblCell" style="width: 25mm;">(h)Excess<br/>(col. (f) less<br/>col. (g))</th>
          </tr>
        </thead>
        <tfoot/>
        <tbody>
          <xsl:for-each select="$IRS1120SchedulePHData/ExcessExpensesDepreciation">
            <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
               <td class="styDepTblCell" style="width:15mm;text-align: left">
                 <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="PropertyDescription"/>
                  </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width:17mm;text-align:center">
                 <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="DateAcquired"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width: 25mm; text-align:right">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CostOrOtherBasis"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width:25mm;text-align:right">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="DepreciationDeduction"/>
                  </xsl:call-template>  
               </td>
               <td class="styDepTblCell" style="border-right-width:0px;">
                 <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="RepairsInsuranceOtherExpenses"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="text-align:right;width:31mm;border-left-width:0px;">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RepairsInsuranceOtherExpenses"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width: 25mm;text-align: right">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalDeprecDeductionExpenses"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width: 25mm;text-align: right">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RentIncomeOtherCompensation"/>
                 </xsl:call-template>
               </td>
               <td class="styDepTblCell" style="width: 25mm;text-align: right">
                 <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Excess"/>
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