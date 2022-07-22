<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5471ScheduleMStyle.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="IRS5471ScheduleMData" select="$RtnDoc/IRS5471ScheduleM" />

<xsl:template match="/">

<html>
<head>

<title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($IRS5471ScheduleMData)"></xsl:with-param></xsl:call-template></title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Schedule M (Form 5471)"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>


<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
<xsl:call-template name="InitJS"></xsl:call-template>
<style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <!-- Form 5471ScheduleM CSS Styles are located in the template called below -->
    <xsl:call-template name="IRS5471ScheduleMStyle"></xsl:call-template>
    <xsl:call-template name="AddOnStyle"></xsl:call-template>
  </xsl:if>
</style>

<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS5471ScheduleM">
<!--   BEGIN WARNING LINE  -->
<xsl:call-template name="DocumentHeader"></xsl:call-template>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<div class="styBB" style="width:187mm;height:19mm;">
  <div class="styFNBox" style="width:29mm;height:19mm;">
    <div class="styFormNumber" style="font-size:10pt;">SCHEDULE M
      <br/>
      (Form 5471)
    </div>
    <div class="" style="padding-top:.5mm;font-size:6pt;">(Rev. December 2007)</div>
    <div class="styAgency" style="padding-top: .5mm;">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
  </div>
  <div class="styFTBox" style="width:129mm;height:19mm;">
    <div class="styMainTitle">Transactions Between Controlled Foreign Corporation and Shareholders or Other Related Persons</div>
    <span class="styFST">
    <br/>
      <img src="{$ImagePath}/5471SchM_Bullet.gif" alt="bullet"/><span style="width: 4px"></span> Attach to Form 5471.  See Instructions for Form 5471.
      <br/>
    </span>
  </div>
  <div class="styTYBox" style="width:28mm;height:19mm;">  
    <div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;font-size:6pt;">OMB No. 1545-0704</div>
  </div>
</div>
<!--   END FORM HEADER   -->

<!--   BEGIN TAXPAYER INFO   -->
<div style="width:187mm;float:left;clear:left;">
  <div class="styNameBox" style="width:144mm;height:8.5mm;font-size:6pt;">Name of person filing Form 5471
  <br/>
    <span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
      <xsl:if test="$IRS5471ScheduleMData/NameOfPersonFilingForm5471 != ''">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/NameOfPersonFilingForm5471" />
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$IRS5471ScheduleMData/NameOfBusinessFilingForm5471/BusinessNameLine1 != ''">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/NameOfBusinessFilingForm5471/BusinessNameLine1" />
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$IRS5471ScheduleMData/NameOfBusinessFilingForm5471/BusinessNameLine2 != ''">
        <xsl:if test="$IRS5471ScheduleMData/NameOfBusinessFilingForm5471/BusinessNameLine1 != ''"><br/></xsl:if>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/NameOfBusinessFilingForm5471/BusinessNameLine2" />
        </xsl:call-template>
      </xsl:if>
    </span>
  </div>
  <div class="styEINBox" style="width:42mm;height:8.5mm;padding-left:2mm;font-size:6pt;">Identifying number          <br/><br />
      <span style="font-weight:normal;font-size:7pt;">  
        <xsl:choose>
          <xsl:when test="$IRS5471ScheduleMData/SSN">
            <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SSN" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$IRS5471ScheduleMData/EIN">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/EIN" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/MissingSSNEINReason" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </span>
  </div>
</div>
<!--   END TAXPAYER INFO   -->

<!--   BEGIN NAME OF FOREIGN CORPORATION   -->
<div class="styBB" style="font-size:6pt;width:187mm;border-top-width:1px;" >
  <div class="styGenericDiv" style="font-size:6pt;height:5mm;">Name of foreign corporation
    <br />
    <span style="font-size:7pt;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode"   
        select="$IRS5471ScheduleMData/NameOfForeignCorporation/BusinessNameLine1" />
      </xsl:call-template>
      <br/>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode"   
        select="$IRS5471ScheduleMData/NameOfForeignCorporation/BusinessNameLine2" />
      </xsl:call-template>
     </span>
  </div>
</div>
<div class="styBB" style="width:187mm;">
  <div class="styGenericDiv"><b>Important:</b><i> Complete a <b>separate</b> Schedule M for each controlled 
  foreign corporation.  Enter the totals for each type of transaction that occurred during the annual accounting
  period between the foreign corporation and the persons listed in columns (b) through (f).  All amounts must be 
  stated in U.S. dollars translated from functional currency at the average exchange rate for the
  foreign corporation's tax year.  See instructions.</i>
  </div>
  <div class="styGenericDiv" style="padding-top:.5mm;">
    Enter the relevant functional currency and the exchange rate used throughout this schedule
      <img src="{$ImagePath}/5471SchM_Bullet.gif" alt="bullet"/>
      <span class="sty5471ScheduleMNBSP"></span>
      <span class="sty5471ScheduleMNBSP"></span>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/FunctionalCurrency" />
      </xsl:call-template>
      <span class="sty5471ScheduleMNBSP"></span>
      <span class="sty5471ScheduleMNBSP"></span>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ExchangeRate" />
      </xsl:call-template>
  </div>
</div>



<!--   BEGIN HEADER   -->
<div style="width: 187mm">
  <span class="sty5471ScheduleMColA" style="text-align: center; height: 16mm; border-bottom-width: 1px"><br/><b>(a)</b> Transactions<br/>of<br/>foreign corporation</span>
  <span class="sty5471ScheduleMCol" style="text-align: center; height: 16mm; padding-top: 0px;padding-right: 0px;"><br/><br/><b>(b)</b> U.S. person<br/>filing this return</span>
  <span class="sty5471ScheduleMCol" style="text-align: center; height: 16mm; padding-top: 3px;padding-right: 0px"><b>(c)</b> Any domestic<br/>corporation or<br/>partnership controlled<br/>by U.S. person filing<br/>this return</span>
  <span class="sty5471ScheduleMCol" style="text-align: center; height: 16mm; padding-top: 3px;padding-right: 0px"><b>(d)</b> Any other foreign<br/>corporation or<br/>partnership controlled<br/>by U.S. person filing<br/> this return</span>
  <span class="sty5471ScheduleMColEF" style="text-align: center; height: 16mm; padding-top: 3px;padding-right: 0px"><b>(e)</b> 10% or more U.S.<br/>shareholder of controlled<br/>foreign corporation<br/>(other than the U.S.<br/>person filing this return)</span>
  <span class="sty5471ScheduleMColEF" style="text-align: center; height: 16mm; padding-top: 3px;padding-right: 0px;width:30mm;"><b>(f)</b> 10% or more U.S.<br/>shareholder of any<br/>corporation<br/>controlling the<br/>foreign corporation</span>
</div>
<!--   END HEADER   -->

<!--   BEGIN LINE 1   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm;padding-top:1mm">
    <span class="sty5471ScheduleMLN">1</span>
  <span class="sty5471ScheduleMLine">Sales of stock in trade (inventory)<b></b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 6mm;padding-top: 3mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesInTradeUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 6mm; padding-top: 3mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesInTradeDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 6mm; padding-top: 3mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesInTradeOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 6mm; padding-top: 3mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesInTradeShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 6mm; padding-top: 3mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesInTradeShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>
<!--   END LINE 1   -->


<!--   BEGIN LINE 2   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 6mm;padding-top: 2mm">
    <span class="sty5471ScheduleMLN">2</span>
  <span class="sty5471ScheduleMLine">Sales of tangible property other than stock in trade
	<b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
             <span class="sty5471ScheduleMNBSP"></span>.
       </b>
</span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 9mm;padding-top: 5mm;" >
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SaleTangiblePropUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 9mm; padding-top: 5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SaleTangiblePropDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 9mm; padding-top: 5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SaleTangiblePropOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 9mm; padding-top: 5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SaleTangiblePropShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 9mm; padding-top: 5mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SaleTangiblePropShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 3   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 6mm;padding-top: 1mm">
    <span class="sty5471ScheduleMLN">3</span>
    <span class="sty5471ScheduleMLine">Sales of property rights (patents, trademarks, etc.)<b><span class="sty5471ScheduleMNBSP"></span>. <span class="sty5471ScheduleMNBSP"></span>. <span class="sty5471ScheduleMNBSP"></span>. <span class="sty5471ScheduleMNBSP"></span>. <span class="sty5471ScheduleMNBSP"></span>. <span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsSalesUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsSalesDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsSalesOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsSalesShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsSalesShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 4   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm">
    <span class="sty5471ScheduleMLN">4</span>
    <span class="sty5471ScheduleMLine">Buy-in payments received
    	<b>
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentRecvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentRecvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentRecvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentRecvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentRecvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 5   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm">
    <span class="sty5471ScheduleMLN">5</span>
    <span class="sty5471ScheduleMLine">Cost sharing payments received
    
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRecvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRecvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRecvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRecvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRecvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>


<!--   BEGIN LINE 6   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 12mm ;padding-top: 1mm">
    <span class="sty5471ScheduleMLN">6</span>
    <span class="sty5471ScheduleMLine">Compensation received for tech- nical, managerial, engineering, construction, or like services<b><span class="sty5471ScheduleMNBSP"></span>.</b><b><span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height:12mm;padding-top:9mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 12mm;padding-top:9mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 7   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm">
    <span class="sty5471ScheduleMLN">7</span>
    <span class="sty5471ScheduleMLine">Commissions received
    	<b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		
    	</b><b><span class="sty5471ScheduleMNBSP"></span>.
    </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 8   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm;padding-top:1mm">
    <span class="sty5471ScheduleMLN">8</span>
    <span class="sty5471ScheduleMLine">Rents, royalties, and license fees received
   	 <b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		
    	</b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 9   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 10mm;">
    <span class="sty5471ScheduleMLN">9</span>
    <span class="sty5471ScheduleMLine">Dividends received (exclude deemed distributions under subpart F and distributions of previously taxed income)   
    	<b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		
    	</b>
  </span>
</span>
 
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 14mm;padding-top:11mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>
<!--   BEGIN LINE 10   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm;padding-top:.5mm">
    <span class="sty5471ScheduleMLN" >10</span>
    <span class="sty5471ScheduleMLine">Interest received
    <b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
   		 <span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height:4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;height:4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 11   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:5mm;margin-top:1mm;">
    <span class="sty5471ScheduleMLN" >11</span>
    <span class="sty5471ScheduleMLine">Premiums received for insurance or reinsurance
    <b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    </b>
      </span>
  </span>
  <span class="sty5471ScheduleMCol" style="margin-top:0mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" >
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" >
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" >
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm" >
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 12   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 5mm; border-bottom-width: 1px; margin-top: 3mm">
    <span class="sty5471ScheduleMLN" >12</span>
    <span class="sty5471ScheduleMLine" >Add line 1 through 11<b>
    <span class="sty5471ScheduleMNBSP"></span>.
    <span class="sty5471ScheduleMNBSP"></span>.
    <span class="sty5471ScheduleMNBSP"></span>.
    <span class="sty5471ScheduleMNBSP"></span>.
    </b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfReceivedUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfReceivedDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfReceivedOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfReceivedShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfReceivedShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 13   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:4mm;margin-top:1mm">
    <span class="sty5471ScheduleMLN">13</span>
    <span class="sty5471ScheduleMLine">Purchases of stock in trade (inventory)
    <b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		
    </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsInTradeUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsInTradeDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsInTradeOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsInTradeShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsInTradeShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 14  -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:4mm;padding-top;1mm">
    <span class="sty5471ScheduleMLN">14</span>
    <span class="sty5471ScheduleMLine">Purchases of tangible property other than stock in trade
    	<b><span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		
    	</b>
    	</span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsShrOfCorpCtrl" />
    </xsl:call-template>
  </span>

</div>


<!--   BEGIN LINE 15  -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:4mm;padding-top: 1mm">
    <span class="sty5471ScheduleMLN">15</span>
    <span class="sty5471ScheduleMLine">Purchases of property rights (patents, trademarks, etc.)<b><span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsPrchsUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsPrchsDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsPrchsOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsPrchsShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRightsPrchsShrOfCorpCtrl" />
    </xsl:call-template>
  </span>

</div>

<!--   BEGIN LINE 16   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm">
    <span class="sty5471ScheduleMLN">16</span>
    <span class="sty5471ScheduleMLine">Buy-in payments paid
    	<b>
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentPaidOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentPaidShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BuyInPaymentPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 17   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm">
    <span class="sty5471ScheduleMLN">17</span>
    <span class="sty5471ScheduleMLine">Cost sharing payments paid
    <b>
    		<span class="sty5471ScheduleMNBSP"></span>.
   </b>
    </span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPaidOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPaidShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:1mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>


<!--   BEGIN LINE 18  -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 12mm; padding-top:1mm">
    <span class="sty5471ScheduleMLN">18</span>
    <span class="sty5471ScheduleMLine">Compensation paid for technical, managerial, engineering, construction, or like services<b><span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPaidOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPaidShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 12mm;padding-top:9mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 19  -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm; ">
    <span class="sty5471ScheduleMLN">19</span>
    <span class="sty5471ScheduleMLine">Commissions paid<b>
    <span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 20 -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:4mm;margin-top: 1mm">
    <span class="sty5471ScheduleMLN">20</span>
    <span class="sty5471ScheduleMLine">Rents, royalties, and license fees paid<b><span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPaidOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPaidShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 21 -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 4mm;padding-top:1mm">
    <span class="sty5471ScheduleMLN">21</span>
    <span class="sty5471ScheduleMLine">Dividends paid<b>
    <span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.<span class="sty5471ScheduleMNBSP"></span>.</b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidOtherForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 4mm;padding-top:.5mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidShrOfForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;height: 4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 22   -->
<div class="sty5471ScheduleMDescLine" >
  <span class="sty5471ScheduleMColA" style="height: 4mm;">
    <span class="sty5471ScheduleMLN" >22</span>
    <span class="sty5471ScheduleMLine" >Interest paid
      <b>
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
  		<span class="sty5471ScheduleMNBSP"></span>.
  	</b>
     </span>
  </span>

  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidOtherForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height:4mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidShrOfForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height:4mm;width:30mm;padding-top:1mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 23   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height:4mm;margin-top: 1mm">
    <span class="sty5471ScheduleMLN">23</span>
    <span class="sty5471ScheduleMLine">Premiums paid for insurance or
reinsurance<b>
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
<span class="sty5471ScheduleMNBSP"></span>.
</b></span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PremiumsPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PremiumsPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PremiumsPaidOtherForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PremiumsPaidShrOfForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PremiumsPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 24   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 5mm; margin-top: 3mm;border-bottom-width: 1px;">
    <span class="sty5471ScheduleMLN">24</span>
    <span class="sty5471ScheduleMLine">Add lines 13 through 23
   	 <b>
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
    		<span class="sty5471ScheduleMNBSP"></span>.
   	</b>
	</span>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfPaidUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfPaidDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfPaidOtherForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfPaidShrOfForeignCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalOfPaidShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 25   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 10.75mm; margin-top: 1mm">
    <span class="sty5471ScheduleMLN">25</span>
    <span class="sty5471ScheduleMLine">Amounts borrowed (enter the maximum loan balance during the year) 
    &#151; see instructions
    <b>
        <span class="sty5471ScheduleMNBSP"></span>.
    	 <span class="sty5471ScheduleMNBSP"></span>.
        <span class="sty5471ScheduleMNBSP"></span>.
    </b></span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 12mm;padding-top:9mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 12mm;padding-top:9mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN LINE 26   -->
<div class="sty5471ScheduleMDescLine">
  <span class="sty5471ScheduleMColA" style="height: 13mm; border-bottom-width: 1px; margin-top: 1mm">
    <span class="sty5471ScheduleMLN">26</span>
    <span class="sty5471ScheduleMLine">Amounts loaned (enter the
maximum quarterly average balance for the year) — see instructions
	<b><span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
		<span class="sty5471ScheduleMNBSP"></span>.
	</b>
</span>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedUSReturnFiler" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedDomCorpPrtshp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMCol" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedOtherFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 14mm;padding-top:11mm">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedShrOfFrgnCorp" />
    </xsl:call-template>
  </span>
  <span class="sty5471ScheduleMColEF" style="height: 14mm;padding-top:11mm;width:30mm;">
    <xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedShrOfCorpCtrl" />
    </xsl:call-template>
  </span>
</div>

<!--   BEGIN FORM FOOTER  -->
<div class="sty5471ScheduleMFormFooter">
  <div class="styGenericDiv" style="width:110mm;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
  <div class="styGenericDiv" style="width:19mm;">Cat. No. 49963O</div>
  <div style="width:55mm;text-align:right;font-weight:bold; text-align: right; float: left; clear: none">Schedule M(Form 5471) <span style="font-weight:normal">(Rev. 12-2007)</span></div>
</div>
<!--     END FORM FOOTER   -->
      <br/>
      <div class="pageEnd"></div>
      
      <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" 
          onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>        
      
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>    
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
