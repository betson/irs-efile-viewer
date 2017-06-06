<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1120ScheduleHStyle.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="IRS1120ScheduleHData" select="$RtnDoc/IRS1120ScheduleH" />

<xsl:template match="/">

<html>
<head>
<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($IRS1120ScheduleHData)"></xsl:with-param></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 1120 Schedule H"/>

<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
<xsl:call-template name="InitJS"></xsl:call-template>
<style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="IRS1120ScheduleHStyle"></xsl:call-template>
     <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>

 <xsl:call-template name="GlobalStylesForm"/>
</head>
 
<body class="styBodyClass">

<form name="IRS1120ScheduleH">

<!--   BEGIN WARNING LINE  -->
<xsl:call-template name="DocumentHeader"></xsl:call-template>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<div class="sty1120ScheduleHBB" style="width:187mm;height:17mm">
  <div class="sty1120ScheduleHFN"  style="height:17mm;">
    <div class="styFormNumber" style="width:29mm;font-size:9pt;">SCHEDULE H
      <br/>
      <span style="font-size:9pt;">(Form 1120)</span>
      <br/><span style="font-size:6pt;">(Rev. December 2006)</span>
	<br/>
    </div>
    <div class="sty1120ScheduleHAgency">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
  </div>
  <div class="sty1120ScheduleHFTBox" style="width:110mm;height:17mm;">
    <div class="styMainTitle" style="padding-left:10mm">Section 280H Limitations for a Personal Service Corporation (PSC)</div>
    <br/>
    <div class="sty1120ScheduleHFST">
      <img src="{$ImagePath}/1120SchH_Bullet.gif" width="4" height="7" alt="Bullet"/>Attach to PSC's income tax return if Part II is completed. 
    </div>
  </div>
  <div class="sty1120ScheduleHTYBox" style="width:29mm;height:17mm;">
    <div class="sty1120ScheduleHOMBNBB" style="height:8.5mm;padding-top:7mm;">OMB No. 1545-0123</div>
    <!--   <div class="sty1120ScheduleHTY" style="height:12mm">
      20<span class="styTYColor">05</span>
    </div> -->
  </div>
</div>
<!--   END FORM HEADER   -->

<!--   BEGIN TAXPAYER INFO   -->
<div style="width:187mm;float:left;clear:left;">
  <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-weight:normal;">
    Name<br/>
    <span>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
    </span>
  </div>
  <div class="styEINBox" style="width:51mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
    Employer identification number<br/><br/>
    <span style="width:25mm;text-align:left; font-weight:normal;">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>      
      </span>
  </div>
</div>
<!--   END TAXPAYER INFO   -->

<!--   BEGIN NOTE HEADER   -->
<div class="sty1120ScheduleHNoteHdr" style="float:left;clear:left;">
  <span class="sty1120ScheduleHNoteHdrTitle" style="width: 16mm; padding-bottom: 10mm">
    <span class="sty1120ScheduleHNoteHdrTitleSpanner"></span>Note:
  </span>
  <span style="padding-left: 2mm; width: 170mm">
  A newly organized PSC is considered to have met the section 280H distribution requirements for the first year of its existence and does not have to complete Schedule H. If, during the tax year, an existing 
  corporation becomes a PSC and makes a section 444 election, the corporation is treated as if it were a PSC for the 3 preceding tax years. See Temporary Regulations section 1.280H-1T(e).
  </span>

</div>
<!--   END NOTE HEADER   -->

<!--  BEGIN PART I HEADER   -->
<div class="sty1120ScheduleHPartHdr">
  <span style="width:15mm;">
    <span class="sty1120ScheduleHPartHdrSpanner"></span>
    <span class="sty1120ScheduleHPartHdrTitle">Part I</span>
    </span>Minimum Distribution Requirement
  <span class="sty1120ScheduleHSeeInstructionsTitle">(see instructions)</span>
</div>
<!--   END PART I HEADER   -->

<!--   BEGIN LINE 1   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">1</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter applicable amounts from preceding tax year
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
  </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ApplicableAmtFromPrecedingTY" />
    </xsl:call-template>
  </span>
  <span class="sty1120ScheduleHLNBox">1</span>
</div>
<!--   END LINE 1   -->

<!--   BEGIN LINE 2   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">2</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Divide number of months in deferral period of preceding tax year by number</span><span class="sty1120ScheduleHLNValBox" style="border-right-width: 0px; border-bottom-width: 0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">of months in preceding tax year.  Enter the result as a percentage
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
  </span>
  <span class="sty1120ScheduleHLNValBox" style="border-right-width: 0px;">
    <xsl:call-template name="PopulatePercent">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/DeferralPeriodOfPrecedingTY" />
    </xsl:call-template>
  </span>
  <span class="sty1120ScheduleHLNBox">2</span>
</div>
<!--   END LINE 2   -->

<!--   BEGIN LINE 3   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">3</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b>Amount figured under preceding year test.</b> Multiply line 1 by the percentage on line 2
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
  </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AmountFiguredPrecedingYearTest" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">3</span>
</div>
<!--   END LINE 3   -->

<!--   BEGIN LINE 4   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">4</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter applicable amounts from the deferral period of the applicable election year
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
  </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ElectionYearDeferralPeriodAmt" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">4</span></div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">If line 4 is less than line 3, go to line 5.  Otherwise, <b>stop here.</b>  The PSC has met the </span>
  <span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px;"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"> </span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">minimum distribution requirement.  <b>Do not</b> attach Schedule H to the PSC's income tax return. </span>
  <span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px;"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;background-color:lightgrey;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc"> Keep Schedule H with the PSC's tax records.  </span>
  <span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px;"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;background-color:lightgrey;"></span>
</div>
<!--  END LINE 4   -->

<!-- BEGIN LINE 5   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">5</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter applicable amounts from the:</span><span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;background-color:lightgrey;"></span>

  <!--   BEGIN LINE 5a   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">a</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">1st tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox" style="border-top-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ApplicableAmountPrecedingYear1" />
      </xsl:call-template>
    </span><span class="sty1120ScheduleHLNBox">5a</span>
  </div>
  <!--   END LINE 5a   -->

  <!--   BEGIN LINE 5b   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">b</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">2nd tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ApplicableAmountPrecedingYear2" />
      </xsl:call-template>
    </span><span class="sty1120ScheduleHLNBox">5b</span>
  </div>
  <!--   END LINE 5b   -->
  <!--   BEGIN LINE 5c   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">c</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">3rd tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ApplicableAmountPrecedingYear3" />
      </xsl:call-template>
      </span><span class="sty1120ScheduleHLNBox">5c</span>
  </div>
  <!--   END LINE 5c   -->
</div>
<!--   END LINE 5   -->

<!--   BEGIN LINE 6   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">6</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b>Total.</b><span style="width: 4px"></span> Add lines 5a through 5c
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/TotalApplicableAmtPrecedingYrs" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">6</span>
</div>
<!--   END LINE 6   -->

<!-- BEGIN LINE 7   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">7</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter adjusted taxable income for the:</span><span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;"></span>

  <!--   BEGIN LINE 7a   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">a</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">1st tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox" style="border-top-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AdjTaxableIncomePrecedingYear1" />
      </xsl:call-template>
    </span><span class="sty1120ScheduleHLNBox">7a</span>
  </div>
  <!--   END LINE 7a   -->

  <!--   BEGIN LINE 7b   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">b</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">2nd tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AdjTaxableIncomePrecedingYear2" />
      </xsl:call-template>
    </span><span class="sty1120ScheduleHLNBox">7b</span>
  </div>
  <!--   END LINE 7b   -->
  <!--   BEGIN LINE 7c   -->
  <div>
    <span class="sty1120ScheduleHLNLtMargin3"></span>
    <span class="sty1120ScheduleHLN">c</span>
    <span class="sty1120ScheduleHLNDesc" style="margin-left: 1mm;">3rd tax year before applicable election year
    <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
    </b>
    </span>
    <span class="sty1120ScheduleHLNValBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AdjTaxableIncomePrecedingYear3" />
      </xsl:call-template>
    </span><span class="sty1120ScheduleHLNBox">7c</span>
  </div>
  <!--   END LINE 7c   -->
</div>
<!--   END LINE 7   -->

<!--   BEGIN LINE 8   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">8</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b>Total.</b><span style="width: 4px"></span> Add lines 7a through 7c
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/TotalAdjTxblIncomePrecedingYrs" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">8</span>
</div>
<!--   END LINE 8   -->

<!--   BEGIN LINE 9   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLN">9</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Divide line 6 by line 8
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox" style="border-right-width: 0px;">
    <xsl:call-template name="PopulatePercent">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ApplicableAmountsRatio" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">9</span>
</div>
<!--   END LINE 9   -->

<!--   BEGIN LINE 10   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">10</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter the percentage from line 9 or 95%, whichever is smaller
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox" style="border-right-width: 0px;">
    <xsl:call-template name="PopulatePercent">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ReducedApplicableAmountsRatio" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">10</span>
</div>
<!--   END LINE 10   -->

<!--   BEGIN LINE 11   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">11</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter adjusted taxable income for the deferral period of the applicable election year
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
  </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AdjTaxableIncomeDeferralPeriod" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">11</span>
</div>
<!--   END LINE 11   -->

<!--   BEGIN LINE 12   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">12</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b>Amount figured under 3-year average test.</b><span style="width: 4px"></span> Multiply line 11 by line 10
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/AmountFigured3YearAverageTest" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">12</span>
</div>
<!--   END LINE 12   -->

<!--   BEGIN LINE 13   -->

<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN" style="height:3.5mm">13</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc" style="height:3.5mm"><b>Minimum distribution requirement.</b><span style="width: 4px"></span> Enter the smaller of line 3 or line 12
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/MinDistributionRequirement" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">13</span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin" style="width:4mm"></span>
  <img src="{$ImagePath}/1120SchH_Bullet_Round.gif" width="4" height="7" alt="Bullet" style="float: left; clear: none"/>
  <span class="sty1120ScheduleHLNDesc">If line 13 is <b>equal to or less</b> than line 4, <b>stop here.</b><span style="width: 4px"></span> 	The PSC has met the minimum</span>
  <span class="sty1120ScheduleHLNValBox" style="height:0mm;border-left-width:0px;border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;"></span>
  <span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span><span class="sty1120ScheduleHLNDesc">distribution requirement.  <b>Do not</b> complete 	Part II and <b>do not</b> attach Schedule H to the </span>
  <span class="sty1120ScheduleHLNValBox" style="border-left-width:0px;border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;"></span>
  <span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span><span class="sty1120ScheduleHLNDesc">PSC's income tax return.  Keep Schedule H with the PSC's tax records.</span>
 <span class="sty1120ScheduleHLNValBox" style="border-left-width:0px;border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;"></span>
 <span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin" style="width:4mm"></span>
  <img src="{$ImagePath}/1120SchH_Bullet_Round.gif" width="4" height="7" alt="Bullet" style="float: left; clear: none"/>
  <span class="sty1120ScheduleHLNDesc">If line 13 is <b>more than </b>line 4, the PSC's deduction for applicable amounts is limited</span>                 <span class="sty1120ScheduleHLNValBox" style="border-left-width:0px;border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;"></span>
 <span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc"> under section 280H.  Complete Part II to figure the maximum amount the PSC can deduct.</span>
  <span class="sty1120ScheduleHLNValBox" style="border-left-width:0px;border-bottom-width:0px;border-right-width:0px;background-color:lightgrey;"></span>
 <span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;background-color:lightgrey;"></span>
</div>
<!--   END LINE 13   -->

<!--  BEGIN PART II HEADER   -->
<div class="sty1120ScheduleHPartHdr" style="float:left;clear:left;">
  <span style="width:15mm;">
    <span class="sty1120ScheduleHPartHdrSpanner"></span>
    <span class="sty1120ScheduleHPartHdrTitle">Part II</span>
    </span>Maximum Deductible Amount
  <span class="sty1120ScheduleHSeeInstructionsTitle">(see instructions)</span>
</div>
<!--   END PART II HEADER   -->

<!--   BEGIN LINE 14   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">14</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter amount from line 4
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/ElectionYearDeferralPeriodAmt" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">14</span>
</div>
<!--   END LINE 14   -->

<!--   BEGIN LINE 15   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">15</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Enter number of months in deferral period of applicable election year
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="MaxSize" select="3" />
        <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/NumberOfMonthsInDeferralPeriod" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">15</span>
</div>
<!--   END LINE 15   -->

<!--   BEGIN LINE 16   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">16</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Divide line 14 by line 15
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/DeferralPeriodAvgMonthlyAmt" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">16</span>
</div>
<!--   END LINE 16   -->

<!--   BEGIN LINE 17   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">17</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b>Nondeferral period.</b> Subtract the number of months in the deferral period from</span><span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">the number of months in the applicable tax year.  Enter the result
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
  </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
    <xsl:with-param name="MaxSize" select="3" />
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/MonthsInNondeferralPeriod" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">17</span>
</div>
<!--   END LINE 17   -->

<!--   BEGIN LINE 18   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">18</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc">Multiply line 16 by line 17
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/NondeferralPeriodAvgMonthlyAmt" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox">18</span>
</div>
<!--   END LINE 18   -->

<!--   BEGIN LINE 19   -->
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLN">19</span>
  <span class="sty1120ScheduleHLNLtMargin"></span>
  <span class="sty1120ScheduleHLNDesc"><b> Maximum deductible amount.</b> <span style="width: 4px"></span> Add lines 14 and 18.  The PSC's deduction for applicable </span><span class="sty1120ScheduleHLNValBox" style="border-left-width:0px;border-bottom-width:0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">amounts paid or incurred to employee-owners is limited to this amount. <b>Attach Schedule</b></span><span class="sty1120ScheduleHLNValBox" style="border-bottom-width:0px"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc"><b>H to the PSC's income tax return.</b> Any amount not allowed because of the section</span><span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px;"></span><span class="sty1120ScheduleHLNBox" style="border-bottom-width:0px;"></span>
</div>
<div class="sty1120ScheduleHLineItem">
  <span class="sty1120ScheduleHLNLtMargin2"></span>
  <span class="sty1120ScheduleHLNDesc">280H(d) limitation is treated as paid or incurred in the PSC's succeeding tax year
  <b>
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
      <span class="sty1120ScheduleHNBSP"></span>.
  </b>
   </span>
  <span class="sty1120ScheduleHLNValBox" style="border-bottom-width: 0px;">
    <xsl:call-template name="PopulateAmount"> 
      <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData/MaximumDeductibleAmount" />
    </xsl:call-template>
  </span><span class="sty1120ScheduleHLNBox" style="border-bottom-width: 0px;">19</span>
</div>
<!--   END LINE 19   -->

<!--   BEGIN FORM FOOTER  -->
<div class="sty1120ScheduleHFormFooter">
    <span style="width:56mm;font-weight:bold;font-size:6pt;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the<br/>Instructions for Forms 1120 and 1120-A.</span>
    <span style="width:75mm;;font-weight:normal;font-size:6pt;text-align:center;" class="styGenericDiv">Cat. No. 14491P</span>
    <span style="width:56mm;text-align:right;font-weight:bold;font-size:6pt;" class="styGenericDiv" >Schedule H (Form 1120) (Rev. 12-2006)</span>          
</div>
<br/>
<div class="pageEnd"></div>

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
          <xsl:with-param name="TargetNode" select="$IRS1120ScheduleHData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>  
</form>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
