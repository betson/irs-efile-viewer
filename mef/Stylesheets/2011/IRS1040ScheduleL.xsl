<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exslt="http://icl.com/saxon">
  <xsl:import href="FormTools.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS4972Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1040ScheduleLData" select="$RtnDoc/IRS1040ScheduleL"/>
  <!-- tallest box on the form was beside 5 lines of text and was 21mm tall -->
  <xsl:variable name="lineHeight" select="21 div 5"/>
  <!-- estimate of 1px line height or width in mm is 0.22 -->
  <xsl:variable name="borderWidth" select="0.17"/>
  <xsl:variable name="borderWidth35" select="0.35"/>
  <xsl:variable name="pageWidth" select="187"/>
  <xsl:variable name="greyColor" select="'lightgrey'"/>
  <xsl:variable name="widths">
    <!-- lnbox = left number box, rnbox = right number box
         rcbox = right cents box, rbox = total width of right boxes
         rinbox = total width of inner-level right boxes (e.g. lines 13 or 14) -->
    <rec linetype="StdLn" lnbox="9.7" rnbox="7.5" rcbox="0" rbox="39.9" rinbox="39.6"/>
  </xsl:variable>
  <xsl:variable name="standardLine" select="'StdLn'"/>
  <!-- xsl:variable name="debuggingColors" select="true()"/>
  <xsl:variable name="displayLineHeights" select="true()"/ -->
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleLData)"/>
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
        <meta name="Description" content="IRS Form 1040 Schedule L"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS4972Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040ScheduleL">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:{$pageWidth}mm;border-bottom:{$borderWidth35}mm solid">
            <div class="styFNBox" style="width:33.5mm;height:17mm;padding:bottom:0mm;border-right:{$borderWidth35}mm solid">
              <span class="styFormNumber" style="font-size:9.5pt">SCHEDULE L<br/>(Form 1040A or 1040)</span>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData"/>
              </xsl:call-template>
              <div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;position:relative">
                Department of the Treasury<br/>
						    Internal Revenue Service <span style="position:absolute;right:0;padding-right:0.25em">(99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:{$pageWidth - 33.5 - 31.5}mm;height:17mm;">
              <div class="styMainTitle" style="height:4mm;padding-bottom:0mm;margin-bottom:0">Standard Deduction for Certain Filers<br/>
                <span style="height:1mm;font-size:6.5pt"/>
              </div>
              <div class="styFBT" style="font-size:7.5pt;height:5mm;padding-top:1mm;margin-top:0">
                <img src="{$ImagePath}/4972_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040A or 1040.
                <span style="width:11mm"/>
                <img src="{$ImagePath}/4972_Bullet.gif" alt="MediumBullet"/> See instructions on back.
              </div>
            </div>
            <div class="styTYBox" style="width:31mm; height:17mm;border-left:{$borderWidth35}mm solid">
              <div style="padding-top:0mm;border-bottom:1 solid black;font:7pt;height:4.5mm">
                <span style="vertical-align:-30%">OMB No. 1545-0074</span>
              </div>
              <div style="margin-top:-1.5mm">
                <span class="styTaxYear" style="line-height:75%;font-family:'Arial';font-size:20pt">20</span>
                <span class="styTYColor" style="line-height:75%;font-family:'Arial Black';font-size:20pt">
                  <b>10</b>
                </span>
              </div>
              <br/>
              <div class="stySequence" style="position:relative;font-size:6.5pt">
                <span style="float:left">Attachment<br/>Sequence No. </span>
                <span style="width:0.5em"/>
                <span>
                  <b style="font-size:11.5pt;font-family:'Arial';position:absolute;bottom:0">57</b>
                </span>
              </div>
            </div>
          </div>
          <!-- Name(s) shown on return -->
          <div class="styBB" style="width:{$pageWidth}mm;">
            <div class="styFNBox" style="width:{$pageWidth - 54}mm; height:8mm">
              Name(s) shown on return<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
              </xsl:call-template>
              <br/>
              <div style="line-height:100%; font-family:verdana;font-size:7.5pt"/>
            </div>
            <b> Your social security number</b>
            <br/>
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
            </xsl:call-template>
          </div>
          <!-- Caution Header -->
          <div style="width:{$pageWidth}mm;height:0mm;border-style:solid; border-bottom-width:{$borderWidth}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;float:left;line-height:normal">
            <span style="width:{exslt:node-set($widths)/rec[@linetype='StdLn']/@lnbox}mm;float:left">
              <img src="{$ImagePath}/Caution68.03x66.92mm.png" style="width:8.50mm;height:8.37mm;padding:0mm;border:0mm"/>
            </span>
            <em>File this form <b>only</b> if you are increasing your standard deduction by certain net
            disaster losses or new motor vehicle taxes paid<br/>
            in 2010 for certain vehicles purchased in 2009.<br/>
              <b>Form 1040 Filers Only:</b> It may be better for you to itemize your deductions instead. See
            the Instructions for Schedule A (Form 1040).</em>
          </div>
          <!-- Form Body -->
          <div style="width:{$pageWidth}mm;height:0mm;border-style:solid; border-bottom-width:{$borderWidth35}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;float:left;line-height:normal">
            <!-- Line 1 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'1'"/>
              <xsl:with-param name="linetext">
                <line>
                  Enter the amount shown below for your filing status.
                </line>
                <line>
                  &#8226;
                  Single or married filing separately&#8212;$5,700
                </line>
                <line>
                  &#8226;
                  Married filing jointly or Qualifying widow(er)&#8212;$11,400
                    <xsl:call-template name="makeCurlyBrace">
                    <xsl:with-param name="pstring" select="'img:1.30x9.47;space-above:-2.5mm'"/>
                    <xsl:with-param name="spanWidth" select="1.30"/>
                    <xsl:with-param name="absLeft" select="85"/>
                  </xsl:call-template>
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'2'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGreyAboveLastLine" select="true()"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line after 1 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linetext">&#8226; Head of household&#8212;$8,400</xsl:with-param>
              <xsl:with-param name="boxLevel" select="2"/>
              <xsl:with-param name="noBottomLine" select="true()"/>
              <xsl:with-param name="rnboxGrey" select="true()"/>
              <xsl:with-param name="verticalOffset" select="$borderWidth * 3"/>
            </xsl:call-template>
            <!-- Line 2 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'2'"/>
              <xsl:with-param name="linenum2" select="' '"/>
              <xsl:with-param name="linetext">
                <line>
                  Can you (or your spouse if filing jointly) be claimed as a dependent
                </line>
                <line>
                  on someone else&#8217;s return?
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/ClaimedAsDependentInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLClaimedAsDependentInd'"/>
                  </xsl:call-template>
                  Enter the amount from line 1 on line 4, skip line 3, and go
                </line>
                <line>
                  <span style="width:7.75mm"/>
                  to line 5.
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="isYes" select="true()"/>
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/ClaimedAsDependentInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLClaimedAsDependentInd'"/>
                  </xsl:call-template>
                  Go to line 3.
                </line>
              </xsl:with-param>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGrey" select="true()"/>
              <xsl:with-param name="noBottomLine" select="true()"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 3 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'3'"/>
              <xsl:with-param name="linetext">
                <line>
                  Is your earned income more than $650 (see instructions)?
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="isYes" select="true()"/>
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/EarnedIncomeOverLimitInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLEarnedIncomeOverLimitInd'"/>
                  </xsl:call-template>
                  Add $300 to your earned income. Enter the total
                  <xsl:call-template name="makeCurlyBrace">
                    <xsl:with-param name="pstring" select="'img:1.30x7.32;space-above:-1mm'"/>
                    <xsl:with-param name="spanWidth" select="1.30"/>
                    <xsl:with-param name="absLeft" select="85"/>
                  </xsl:call-template>
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'2'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGreyAboveLastLine" select="true()"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line after 3 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linetext">
                <xsl:call-template name="MakeYNCheckBox">
                  <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/EarnedIncomeOverLimitInd"/>
                  <xsl:with-param name="BackupName" select="'IRS1040SchedLEarnedIncomeOverLimitInd'"/>
                </xsl:call-template>
 Enter $950</xsl:with-param>
              <xsl:with-param name="noBottomLine" select="true()"/>
            </xsl:call-template>
            <!-- Line 4 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'4'"/>
              <xsl:with-param name="linetext">
                Enter the
                <b>smaller</b>
                of line 1 or line 3
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'20'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 5 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'5'"/>
              <xsl:with-param name="linetext">
                <line>
                  Multiply the number on Form 1040, line 39a, or Form 1040A, line 23a, by $1,100 ($1,400 if single
                </line>
                <line>
                  or head of household). If blank, enter -0-
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'18'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 6 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'6'"/>
              <xsl:with-param name="linetext">
                <line>
                  Form 1040 filers only, enter from your 2010 Form 4684, line 17, any loss from a disaster
                </line>
                <line>
                  declared a federal disaster after 2007 that occurred before 2010 (see instructions)
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'5'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 7 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'7'"/>
              <xsl:with-param name="linenum2" select="' '"/>
              <xsl:with-param name="linetext">
                <line>
                  Did you (or your spouse if filing jointly) pay any state or local sales or excise taxes in 2010 for the
                </line>
                <line>
                  purchase of any new motor vehicle(s)
                  <b>after</b>
                  February 16, 2009, and
                  <b>before</b>
                  January 1, 2010 (see
                </line>
                <line>
                  instructions)?
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehIncmOverLimitInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehIncmOverLimitInd'"/>
                  </xsl:call-template>
                  Skip lines 7 through 16, enter -0- on line 17, and go to line 18.
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="isYes" select="true()"/>
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehIncmOverLimitInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehIncmOverLimitInd'"/>
                  </xsl:call-template>
                  If Form 1040, line 38, or Form 1040A, line 22, is less than $135,000
                </line>
                <line>
                  <span style="width:7.75mm"/>
                  <span style="font-family:Verdana">
                ($260,000 if married filing jointly), enter the amount of these taxes paid.</span>
                </line>
              </xsl:with-param>
              <xsl:with-param name="noBottomLine" select="true()"/>
              <xsl:with-param name="rnboxGrey" select="true()"/>
            </xsl:call-template>
            <!-- Line after 7 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="''"/>
              <xsl:with-param name="linenum2" select="'7'"/>
              <xsl:with-param name="overlong" select="true()"/>
              <xsl:with-param name="linetext">
                <span style="width:7.75mm"/>
                <span style="font-family:Arial">Otherwise, skip lines 7 through 16, enter -0- on line 17, and go to line 18</span>
              </xsl:with-param>
              <xsl:with-param name="boxTopMissing" select="'1'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 8 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'8'"/>
              <xsl:with-param name="linetext">
                <line>Enter the purchase price (<b>before taxes</b>) of the new motor vehicle(s)</line>
                <line>(see instructions)</line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="16"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 9 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'9'"/>
              <xsl:with-param name="linetext">
                <line>
                  Is the amount on line 8 more than $49,500?
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehSalesOrExciseTaxInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehSalesOrExciseTaxInd'"/>
                  </xsl:call-template>
                  Enter the amount from line 7.
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="isYes" select="true()"/>
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehSalesOrExciseTaxInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehSalesOrExciseTaxInd'"/>
                  </xsl:call-template>
                  Figure the
                  <b>portion</b>
                  of the tax from line 7 that is
                </line>
                <line>
                  <span style="width:7.75mm"/>
                  attributable to the first $49,500 of the purchase price of each
                </line>
                <line>
                  <span style="width:7.75mm"/>
                  new motor vehicle and enter it here (see instructions)
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'2'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGreyAboveLastLine" select="true()"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 10 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'10'"/>
              <xsl:with-param name="linetext">
                Enter the amount from Form 1040, line 38, or Form 1040A, line 22
              </xsl:with-param>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 11 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'11'"/>
              <xsl:with-param name="linetext">
                <line>
                  Form 1040 filers only, enter the total of any&#8212;
                </line>
                <line>
                  &#8226;
                  Amounts from Form 2555, lines 45 and 50; Form 2555-EZ, line
                </line>
                <line>
                  18; and Form 4563, line 15, and
                </line>
                <line>
                  &#8226;
                  Exclusion of income from Puerto Rico
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'9'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGreyAboveLastLine" select="true()"/>
              <xsl:with-param name="verticalOffset" select="$borderWidth * -1"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 12 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'12'"/>
              <xsl:with-param name="linetext">
                Add lines 10 and 11
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'15'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 13 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'13'"/>
              <xsl:with-param name="linetext">
                Enter $125,000 ($250,000 if married filing jointly)
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'6'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 14 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'14'"/>
              <xsl:with-param name="linetext">
                <line>
                  Is the amount on line 12 more than the amount on line 13?
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehExcessPriceInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehExcessPriceInd'"/>
                  </xsl:call-template>
                  Skip lines 14 through 16, enter the amount from line 9 on
                </line>
                <line>
                  <span style="width:7.75mm"/>
                  line 17, and go to line 18.
                </line>
                <line>
                  <xsl:call-template name="MakeYNCheckBox">
                    <xsl:with-param name="isYes" select="true()"/>
                    <xsl:with-param name="spanStyle" select="'width:7.75mm'"/>
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/NewMtrVehExcessPriceInd"/>
                    <xsl:with-param name="BackupName" select="'IRS1040SchedLNewMtrVehExcessPriceInd'"/>
                  </xsl:call-template>
                  Subtract line 13 from line 12
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'9'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="rnboxGreyAboveLastLine" select="true()"/>
              <xsl:with-param name="verticalOffset" select="$borderWidth * -1"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 15 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'15'"/>
              <xsl:with-param name="linetext">
                <line>
                  Divide the amount on line 14 by $10,000. Enter the result as a
                </line>
                <line>
                  decimal (rounded to at least three places). If the result is 1.000 or
                </line>
                <line>
                  more, enter 1.000
                </line>
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'16'"/>
              <xsl:with-param name="percentageBox" select="'1'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 16 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'16'"/>
              <xsl:with-param name="linetext">
                Multiply line 9 by line 15
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'14'"/>
              <xsl:with-param name="boxLevel" select="'2'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 17 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'17'"/>
              <xsl:with-param name="linetext">
                Subtract line 16 from line 9
              </xsl:with-param>
              <xsl:with-param name="numdots" select="'23'"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
            <!-- Line 18 -->
            <xsl:call-template name="FormLine">
              <xsl:with-param name="linenum1" select="'18'"/>
              <xsl:with-param name="linetext">
                Add lines 4, 5, 6, and 17. Enter the total here and on Form 1040, line 40, or Form 1040A, line 24.
              </xsl:with-param>
              <xsl:with-param name="noBottomLine" select="true()"/>
              <xsl:with-param name="dataVal" select="''"/>
            </xsl:call-template>
          </div>
          <!-- Page Footer-->
          <div class="pageEnd" style="width:{$pageWidth}mm;padding-top:0mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
            </div>
            <div style="float:right;width:82mm;position:relative">
							Cat. No. 49875F
							<span style="width:3mm;"/>
              <span class="styBoldText" style="font-size:7pt;position:absolute;right:0">Schedule L (Form 1040A or 1040) 2010</span>
            </div>
          </div>
          <!-- BEGIN Left Over Table -->
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
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData"/>
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
              <xsl:with-param name="Desc">Part III, Line 17 - Waived Literal Short Method</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/PenaltyAmt/@waivedLiteralShortMethodCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part III, Line 17- Waived Short Method Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/PenaltyAmt/@waivedShortMethodAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part IV, Line 27 - Waived Literal Regular Method</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/TotalPenaltyAmt/@waivedLiteralRegularMethodCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Part IV, Line 27 - Waived Regular Method Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form1040ScheduleLData/TotalPenaltyAmt/@waivedRegularMethodAmt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
