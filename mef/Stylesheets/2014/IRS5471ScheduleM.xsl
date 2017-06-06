<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS5471ScheduleMStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="IRS5471ScheduleMData" select="$RtnDoc/IRS5471ScheduleM"/>
  <xsl:template match="/">
  <html>
    <head>
      <title>
        <xsl:call-template name="FormTitle">
          <xsl:with-param name="RootElement" select="local-name($IRS5471ScheduleMData)"/>
        </xsl:call-template>
      </title>
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta http-equiv="Cache-Control" content="no-cache"/>
      <meta http-equiv="Expires" content="0"/>
      <meta http-equiv="Cache-Control" content="private"/>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="Description" content="IRS Schedule M (Form 5471)"/>
      <META name="GENERATOR" content="IBM WebSphere Studio"/>
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>
      <style type="text/css">
      <!--NOTE: there is no separate format for this form.-->
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="IRS5471ScheduleMStyle"/>
          <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
      </style>
      <xsl:call-template name="GlobalStylesForm"/>
    </head>
    <body class="styBodyClass" style="font-family:verdana, arial,sans-serif;font-size:7pt;">
      <form name="IRS5471ScheduleM">
      <!--   BEGIN WARNING LINE  -->
      <xsl:call-template name="DocumentHeader"/>
      <!--   END WARNING LINE   -->
      <!--   BEGIN FORM HEADER   -->
      <div class="styBB" style="width:187mm;height:19mm;">
        <div class="styFNBox" style="width:29mm;height:19mm;">
          <div class="styFormNumber" style="font-size:10pt;">SCHEDULE M
            <br/>
            (Form 5471)
          </div>
          <div class="" style="padding-top:.5mm;font-size:6pt;">(Rev. December 2012)</div>
          <div class="styAgency" style="padding-top: .5mm;">Department of the Treasury
            <br/>Internal Revenue Service
          </div>
        </div>
        <div class="styFTBox" style="width:129mm;height:19mm;">
          <div class="styMainTitle">Transactions Between Controlled Foreign Corporation and Shareholders or Other Related Persons</div>
            <span class="styFST">
              <div class="styFST" style="height:5mm;font-size:6pt;padding-top:1mm;">
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                Information about Schedule M (Form 5471) and its instructions is at 
                <a href="http://www.irs.gov/form5471" title="Link to irs.gov">
                  <i>www.irs.gov/form5471 </i>
                </a>
                <span style="width:80mm;">
                  <img src="{$ImagePath}/5471SchM_Bullet.gif" alt="bullet"/><span style="width: 4px"/> Attach to Form 5471. </span>
              </div>
            </span>
          </div>
          <div class="styTYBox" style="width:28mm;height:19mm;">  
            <div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;font-size:6pt;">OMB No. 1545-0704</div>
          </div>
        </div>
        <!--   END FORM HEADER   -->
        <!--   BEGIN TAXPAYER INFO   -->
        <div style="width:187mm;">
          <div class="styNameBox" style="width:144mm;height:8.5mm;;">Name of person filing Form 5471
            <br/>
            <xsl:choose>
              <xsl:when test="$IRS5471ScheduleMData/BusinessName/BusinessNameLine1Txt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/BusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>                
              </xsl:when>
              <xsl:otherwise>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PersonNm"/>
                </xsl:call-template>                
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <div class="styEINBox" style="width:42mm;height:8.5mm;padding-left:2mm;">Identifying number
            <br/><br/>
            <span style="font-weight:normal;">  
              <xsl:choose>
                <xsl:when test="$IRS5471ScheduleMData/SSN">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SSN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$IRS5471ScheduleMData/EIN">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/EIN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/MissingSSNEINReasonCd"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </div>
        </div>
        <!--   END TAXPAYER INFO   -->
        <!--   BEGIN NAME OF FOREIGN CORPORATION   -->
        <div class="styBB" style="width:187mm;border-top-width:1px;">
          <div class="styNameBox" style="width:90mm;height:8mm;">Name of foreign corporation
            <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine2Txt"/>
              </xsl:call-template>
          </div>
          <!--  Foreign EIN-->
          <div class="styNameBox" style="width:26mm;height:8mm;padding-left:2mm;">EIN (if any)   
            <br/><br/>
            <span style="font-weight:normal;">  
              <xsl:choose>
                <xsl:when test="$IRS5471ScheduleMData/ForeignCorporationEIN">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignCorporationEIN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$IRS5471ScheduleMData/MissingEINReasonCd">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/MissingEINReasonCd"/>
                  </xsl:call-template>
                </xsl:when>
              </xsl:choose>
            </span>
          </div>
          <!--Reference Number ID-->
          <div class="styNameBox" style="width:71mm;height:8mm;padding-left:2mm;border-left-width:0px;border-right-width:0px;">
            Reference ID number (see instructions) 
            <br/><br/>
            <xsl:choose>
		      <xsl:when test="(count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
		        <span style="width:30mm;padding-left:5mm;">-See Add'l Data-</span>
              </xsl:when>
              <xsl:otherwise>
                <span style="font-weight:normal;" nowrap="false">  
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
                  </xsl:call-template>
                </span>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <div class="styBB" style="width:187mm;">
          <div style="float:left;clear:none;">
            <b>Important:</b><i> Complete a <b>separate</b> Schedule M for each controlled 
            foreign corporation.  Enter the totals for each type of transaction that occurred during the annual accounting
            period between the foreign corporation and the persons listed in columns (b) through (f).  All amounts must be 
            stated in U.S. dollars translated from functional currency at the average exchange rate for the
            foreign corporation's tax year.  See instructions.</i>
          </div>
          <div class="styGenericDiv" style="padding-top:.5mm;">
            Enter the relevant functional currency and the exchange rate used throughout this schedule
            <img src="{$ImagePath}/5471SchM_Bullet.gif" alt="bullet"/>
            <span class="sty5471ScheduleMNBSP"/>
            <span class="sty5471ScheduleMNBSP"/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/FunctionalCurrencyDesc"/>
            </xsl:call-template>
            <span class="sty5471ScheduleMNBSP"/>
            <span class="sty5471ScheduleMNBSP"/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ExchangeRt"/>
            </xsl:call-template>
          </div>
        </div>
        <!--   BEGIN HEADER   -->
        <div style="width: 187mm">
          <span class="sty5471ScheduleMColA" style="text-align:center;height:16mm;border-bottom-width:1px">
            <br/><b>(a)</b> Transactions<br/>of<br/>foreign corporation
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;text-align:center;height:16mm;padding-top:0px;padding-right:0px;">
            <br/><br/><b>(b)</b> U.S. person<br/>filing this return
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:16mm;padding-top: 3px;padding-right:0px">
            <b>(c)</b> Any domestic<br/>corporation or<br/>partnership controlled<br/>by U.S. person filing<br/>this return
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:16mm;padding-top: 3px;padding-right:0px">
            <b>(d)</b> Any other foreign<br/>corporation or<br/>partnership controlled<br/>by U.S. person filing<br/> this return
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;text-align:center;height:16mm;padding-top:3px;padding-right:0px">
            <b>(e)</b> 10% or more U.S.<br/>shareholder of controlled<br/>foreign corporation<br/>(other than the U.S.<br/>person filing this return)
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;text-align:center;height:16mm;padding-top:3px;padding-right:0px;">
            <b>(f)</b> 10% or more U.S. shareholder of any<br/>corporation<br/>controlling the<br/>foreign corporation
          </span>
        </div>
        <!-- END HEADER   -->
        <!--   BEGIN LINE 1   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN" style="padding-top:3mm;">1</span>
            <span class="sty5471ScheduleMLine"  style="padding-top:3mm;">Sales of stock in trade (inventory)</span>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesTradeUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesTradeDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesTradeFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesTradeShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockSalesTradeShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!-- END LINE 1   -->
        <!--   BEGIN LINE 2   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">2</span>
            <div class="sty5471ScheduleMLine">Sales of tangible property other 
              <span style="float:left;">than stock in trade</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;vertical-align:bottom">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropertySalesUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropertySlsDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropertySlsFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropSlsShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropSlsShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 3   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">3</span>
            <div class="sty5471ScheduleMLine">Sales of property rights (patents,
              <span style="float:left;">trademarks, etc.)</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsSalesUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsSalesDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsSalesFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRghtsSlsShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRghtsSlsShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 4   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">4</span>
            <div class="sty5471ScheduleMLine">Platform contribution transaction
              <span style="float:left;">payments received</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PlatformTransPymtRcvdUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmTransPymtRcvdDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmTransPymtRcvdFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmPymtRcvdShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmPymtRcvdShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 5   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">5</span>
            <div class="sty5471ScheduleMLine">Cost sharing transaction 
              <span style="float:left;">payments received</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtRcvdUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtRcvdDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtRcvFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRcvdShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtRcvdShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 6   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" style="height:10mm;">
            <span class="sty5471ScheduleMLN">6</span>
            <div class="sty5471ScheduleMLine">Compensation received for tech-
              <span style="float:left;">nical, managerial, engineering, </span>
              <span style="float:left;">construction, or like services</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechnicalSrvcCompRcvdUSPrsnAmt"/>
            </xsl:call-template>
          </span>
        <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompRcvdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 7   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN" style="padding-top:3mm;">7</span>
          <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
            <span style="float:left;">Commissions received</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsReceivedUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsReceivedDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsReceivedFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsRcvdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 8   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">8</span>
          <div class="sty5471ScheduleMLine">Rents, royalties, and license
            <span style="float:left;">fees received</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesRcvdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeeRcvdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeeRcvdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 9   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" style="height:13mm;">
          <span class="sty5471ScheduleMLN">9</span>
          <div class="sty5471ScheduleMLine">Dividends received (exclude 
            <span style="float:left;">deemed distributions under </span>
            <span style="float:left;">subpart F and distributions of</span>
            <span style="float:left;">previously taxed income)</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;height:13mm;padding-top:10mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="height:13mm;padding-top:10mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="height:13mm;padding-top:10mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsReceivedFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;height:13mm;padding-top:10mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsRcvdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;height:13mm;padding-top:10mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsRcvdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 10   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN" style="padding-top:3mm;">10</span>
          <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
            <span style="float:left;">Interest received</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestReceivedShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 11   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">11</span>
          <div class="sty5471ScheduleMLine">Premiums received for insurance
            <span style="float:left;">or reinsurance</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremRcvdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 12   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" style="border-bottom-width:1px;padding-top:3.5mm; ">
          <span class="sty5471ScheduleMLN">12</span>
          <div class="sty5471ScheduleMLine">
            <span style="float:left;">Add line 1 through 11</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalReceivedUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalReceivedDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalReceivedFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalReceivedShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalReceivedShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 13   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">13</span>
          <div class="sty5471ScheduleMLine">Purchases of stock in trade
            <span style="float:left;">(inventory)</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPurchasesTradeUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPurchasesTradeDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPurchasesTradeFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsTrdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/StockPrchsTrdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 14  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">14</span>
          <div class="sty5471ScheduleMLine">Purchases of tangible property
            <span style="float:left;">other than stock in trade</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropertyPrchsUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropPrchsDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TangiblePropPrchsFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TngblPropPrchsShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 15  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">15</span>
          <div class="sty5471ScheduleMLine">Purchases of property rights
            <span style="float:left;">(patents, trademarks, etc.)</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsPrchsUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsPrchsDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropertyRightsPrchsFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRghtsPrchsShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PropRghtsPrchsShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 16   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">16</span>
          <div class="sty5471ScheduleMLine">Platform contribution transaction
            <span style="float:left;">payments paid</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PlatformTransPymtPdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PlatformTransPymtPdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PlatformTransPymtPdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmPymtPdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/PltfrmPymtPdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 17   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">17</span>
          <div class="sty5471ScheduleMLine">Cost sharing transaction 
            <span style="float:left;">payments paid</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtPdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtPdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrTransPymtPdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CostShrPymtPdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
	  <!--   BEGIN LINE 18  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">18</span>
          <div class="sty5471ScheduleMLine">Compensation paid for technical,
            <span style="float:left;">managerial, engineering,</span>
            <span style="float:left;"> construction</span>
            <span style="float:left;">, or like services</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechnicalSrvcCompPdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechnicalSrvcCompPdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechnicalSrvcCompPdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;height:10mm;padding-top:7mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TechSrvcCompPdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 19  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN" style="padding-top:3mm;">19</span>
          <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
            <span style="float:left;">Commissions paid</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/CommissionsPaidShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 20 -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN">20</span>
          <div class="sty5471ScheduleMLine">Rents, royalties, and license fees
            <span style="float:left;">paid</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPdUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPdDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPdFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPdShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/RntsRyltsFeesPdShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 21 -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA" >
          <span class="sty5471ScheduleMLN" style="padding-top:3mm;">21</span>
          <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
            <span style="float:left;">Dividends paid</span>
            <div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol" style="width:28mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidUSPrsnAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidDomCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColEF" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidShrFrgnCorpAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" style="width:29mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DividendsPaidShrCorpCtrlAmt"/>
          </xsl:call-template>
        </span>
       </div>
       <!--   BEGIN LINE 22   -->
       <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN" style="padding-top:3mm;">22</span>
            <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
              <span style="float:left;">Interest paid</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style=";width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InterestPaidShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 23   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">23</span>
            <div class="sty5471ScheduleMLine">Premiums paid for insurance or
              <span style="float:left;">reinsurance</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremPdUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremPdDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremPdFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremPdShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/InsReinsPremPdShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
          <div class="pageEnd"/>
        </div>
        <!--   BEGIN LINE 24   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN" style="padding-top:3mm;">24</span>
            <div class="sty5471ScheduleMLine" style="padding-top:3mm;">
              <span style="float:left;">Add lines 13 through 23</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalPaidUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalPaidDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalPaidFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalPaidShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="width:29mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TotalPaidShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 25   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">25</span>
            <div class="sty5471ScheduleMLine">Amounts borrowed (enter the
              <span style="float:left;">maximum loan balance during the</span>
              <span style="float:left;">year) — see instructions</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="width:29mm;height:10mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsBorrowedShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 26   -->
        <div class="styTBB">
        <div class="sty5471ScheduleMDescLine" >
          <span class="sty5471ScheduleMColA" >
            <span class="sty5471ScheduleMLN">26</span>
            <div class="sty5471ScheduleMLine">Amounts loaned (enter the 
              <span style="float:left;">maximum loan balance during the</span>
              <span style="float:left;">year) — see instructions</span>
              <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="width:28mm;height:10mm;padding-top:7mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedUSPrsnAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedDomCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="height:10mm;padding-top:7mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColEF" style="width:29mm;height:10mm;padding-top:7mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoandedShrFrgnCorpAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="width:29mm;height:10mm;padding-top:7mm;border-bottom-width:0px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/AmountsLoanedShrCorpCtrlAmt"/>
            </xsl:call-template>
          </span>
        </div>
        </div>
        <!--   BEGIN FORM FOOTER  -->
        <div class="sty5471ScheduleMFormFooter" style="border-top-width:1px;">
          <div class="styGenericDiv" style="width:110mm;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
          <div class="styGenericDiv" style="width:19mm;">Cat. No. 49963O</div>
          <div style="width:55mm;text-align:right;font-weight:bold; text-align: right; float: left; clear: none">Schedule M(Form 5471) 
            <span style="font-weight:normal">(Rev. 12-2012)</span>
          </div>
        </div>
        <!--     END FORM FOOTER   -->
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
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
        </table>  
        <!-- Reference ID number table-->  
   		<xsl:if test="(count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
		  <span class="styRepeatingDataTitle">
			<br/>
		  </span>
		  <table class="styDepTbl" style="font-size:7pt">
			<thead class="styTableHead">
			  <tr class="styDepTblHdr">
				<th class="styDepTblCell" style="text-align:left">
				  Reference ID number (see instructions)
                </th>
			  </tr>
			</thead>
			<tbody>
		      <xsl:for-each select="$IRS5471ScheduleMData/ForeignEntityIdentificationGrp">
				<tr>
				  <!--Define background colors to the rows -->
				  <xsl:attribute name="class">
				    <xsl:choose>
				      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
				      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
				    </xsl:choose>
				  </xsl:attribute>
				  <td class="styDepTblCell" style="text-align:left;">
					<span style="font-family:verdana;font-size:6pt;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
					  </xsl:call-template>
					</span>
					<br/>
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