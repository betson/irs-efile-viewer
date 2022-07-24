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
  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
    <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
    <body class="styBodyClass" style="width:187mm;">
      <form name="IRS5471ScheduleM">
      <!--   BEGIN WARNING LINE  -->
      <xsl:call-template name="DocumentHeader"/>
      <!--   END WARNING LINE   -->
      <!--   BEGIN FORM HEADER   -->
      <div class="styBB" style="width:187mm;height:19mm;border-bottom-width:2px;">
        <div class="styFNBox" style="width:29mm;height:19mm;border-right-width:2px;">
          <div class="styFormNumber" style="font-size:10pt;">SCHEDULE M
            <br/>
            (Form 5471)
          </div>
          <div class="" style="padding-top:.5mm;font-size:6.5pt;">(Rev. December 2018)</div>
          <div class="styAgency" style="padding-top: .5mm;">Department of the Treasury
            <br/>Internal Revenue Service
          </div>
        </div>
        <div class="styFTBox" style="width:129mm;height:19mm;">
          <div class="styMainTitle">Transactions Between Controlled Foreign Corporation<br/>and Shareholders or Other Related Persons</div>
            <span class="styFST">
              <div class="styFST" style="height:5mm;padding-top:2mm;font-size:6.5pt;">
              <span style="width:80mm;">
                  <img src="{$ImagePath}/5471SchM_Bullet.gif" alt="bullet"/><span style="width: 4px"/> Attach to Form 5471.
				</span>
				<br/>
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
                Go to
                <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form5471" title="Link to irs.gov">
                  <i>www.irs.gov/Form 5471</i> for instructions and the latest information.
                </a>                
              </div>
            </span>
          </div>
          <div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
            <div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
          </div>
        </div>
        <!--   END FORM HEADER   -->
        <!--   BEGIN TAXPAYER INFO   -->
        <div style="width:187mm;">
          <div class="styNameBox" style="width:110mm;height:9mm;font-size:7pt;">Name of person filing Form 5471
            <br/>
            <!-- Template below address a choice of input data and Return Header data for 1120, 99X, 1065, 1040/NR and 1041-->
			<xsl:call-template name="PopulateFilerName">
				<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData"/>
			</xsl:call-template>
          </div>
          <div class="styEINBox" style="width:75mm;height:9mm;padding-left:2mm;font-size:7pt;">Identifying number
            <span style="font-weight:normal;padding-top:3mm;width:60mm;">  
                <!-- Template below address a choice of input data and Return Header data for 1120, 99X, 1065, 1040/NR and 1041-->
               <xsl:choose>
					<!-- EIN-->
					<xsl:when test="$IRS5471ScheduleMData/EIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/EIN"/>
						</xsl:call-template>
					</xsl:when>
					<!-- SSN -->
					<xsl:when test="$IRS5471ScheduleMData/SSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/SSN"/>
						</xsl:call-template>
					</xsl:when>
					<!-- Missing SSN EIN Reason-->
					<xsl:when test="$IRS5471ScheduleMData/MissingSSNEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/MissingSSNEINReasonCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<!-- Pull Data from Return Header-->
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">SSN</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>		
            </span>
          </div>
        </div>
        <!--   END TAXPAYER INFO   -->
        <!--   BEGIN NAME OF FOREIGN CORPORATION   -->
        <div class="styBB" style="width:187mm;border-top-width:1px;">
          <div class="styNameBox" style="width:110mm;height:10mm;font-size:7pt;">Name of foreign corporation          
			<xsl:if test="not($IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine2Txt)">
				<br/>
			</xsl:if>
			<br/>			
				<xsl:choose>
				 <xsl:when test="$IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine2Txt">
				<!-- <xsl:attribute name="style">padding-top:1mm;font-size:6pt;</xsl:attribute>-->
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">padding-top:3mm;font-size:6pt;</xsl:attribute>
				</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine1Txt"/>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignCorporationName/BusinessNameLine2Txt"/>
				</xsl:call-template>			
          </div>
          <!--  Foreign EIN-->
          <div class="styNameBox" style="width:26mm;height:10mm;padding-left:2mm;font-size:7pt;">EIN (if any)   
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
          <div class="styNameBox" style="font-size:7pt;width:49mm;height:10mm;padding-left:2mm;border-left:none;border-right:none;">
            Reference ID number (see instructions) 
            <br/>
            <xsl:choose>
            <xsl:when test="string-length($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or
			   (count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
			   <!--8/29/17 WT: Modified code because display of max data was extending beyond right border -->
			   <!--<xsl:if test="(count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">-->
		        <span style="width:60mm;text-align:center;">-See Add'l Data-</span>
              </xsl:when>
              <xsl:otherwise>
                <span style="font-weight:normal;font-size:7pt;" nowrap="false">  
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
                  </xsl:call-template>
                </span>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <div class="styBB" style="width:187mm;">
          <div style="float:left;clear:none;height:10.5mm;">
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
          <span class="sty5471ScheduleMColA" style="text-align:center;height:19mm;border-bottom-width:1px;padding-top:2mm;">
            <br/><b>(a)</b> Transactions<br/>of<br/>foreign corporation
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:19mm;padding-top:0px;padding-right:0px;">
            <br/><br/><b>(b)</b> U.S. person filing this return
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:19mm;padding-top: 3px;padding-right:0px">
            <b>(c)</b> Any domestic corporation or partnership controlled by U.S. person filing this return
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:19mm;padding-top: 3px;padding-right:0px">
            <b>(d)</b> Any other foreign corporation or partnership controlled by U.S. person filing  this return
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:19mm;padding-top:3px;padding-right:0px">
            <b>(e)</b> 10% or more U.S. shareholder of controlled foreign corporation (other than the U.S. person filing this return)
          </span>
          <span class="sty5471ScheduleMCol" style="text-align:center;height:19mm;padding-top:2mm;padding-right:0px;">
            <b>(f)</b> 10% or more U.S. shareholder of any corporation controlling the foreign corporation
          </span>
        </div>
        <!-- END HEADER   -->
        <!--   BEGIN LINE 1   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">1</span>
            <span class="sty5471ScheduleMLine">Sales of stock in trade (inventory)</span>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InventorySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InventorySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InventorySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InventorySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InventorySalesAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!-- END LINE 1   -->
        <!--   BEGIN LINE 2   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">2</span>
            <span class="sty5471ScheduleMLine">Sales of tangible property other than stock in trade
              <span class="styDotLn" style="float:right;">......</span>
            </span>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/TangiblePropertySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/TangiblePropertySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/TangiblePropertySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/TangiblePropertySalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/TangiblePropertySalesAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 3   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">3</span>
            <div class="sty5471ScheduleMLine">Sales of property rights (patents,
              <span style="float:left;">trademarks, etc.)</span>
              <div class="styDotLn" style="float:right;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/PropertyRightsSalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/PropertyRightsSalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/PropertyRightsSalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/PropertyRightsSalesAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/PropertyRightsSalesAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 4   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">4</span>
            <div class="sty5471ScheduleMLine">Platform contribution transaction
              <span style="float:left;">payments received</span>
              <div class="styDotLn" style="float:right;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/PlatformContributionRcvdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/PlatformContributionRcvdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/PlatformContributionRcvdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/PlatformContributionRcvdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/PlatformContributionRcvdAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 5   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">5</span>
            <div class="sty5471ScheduleMLine">Cost sharing transaction 
              <span style="float:left;">payments received</span>
              <div class="styDotLn" style="float:right;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CostSharingReceivedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CostSharingReceivedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CostSharingReceivedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CostSharingReceivedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CostSharingReceivedAmt"/>
            </xsl:call-template>
          </span>
        </div>
        <!--   BEGIN LINE 6   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA" style="height:10mm;">
            <span class="sty5471ScheduleMLN">6</span>
            <div class="sty5471ScheduleMLine">Compensation received for technical, managerial, engineering, 
              <span style="float:left;">construction, or like services</span>
              <div class="styDotLn" style="float:right;">..</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CompensationRcvdForCrtnSrvcAmt"/>
            </xsl:call-template>
          </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CompensationRcvdForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CompensationRcvdForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CompensationRcvdForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CompensationRcvdForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 7   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">7</span>
          <div class="sty5471ScheduleMLine">
            <span style="float:left;">Commissions received</span>
            <div class="styDotLn" style="float:right;">....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CommissionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CommissionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CommissionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CommissionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CommissionsReceivedAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 8   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">8</span>
          <div class="sty5471ScheduleMLine">Rents, royalties, and license fees
            <span style="float:left;">received</span>
            <div class="styDotLn" style="float:right;">........</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/RentsRoyaltiesLcnsFeesRcvdAmt"/>
          </xsl:call-template>
        </span>
      </div>      
       <!--   BEGIN LINE 9   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">9</span>
          <div class="sty5471ScheduleMLine">Hybrid dividends received (see instructions)
            <div class="styDotLn" style="float:right;">.......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/HybridDividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/HybridDividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/HybridDividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/HybridDividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/HybridDividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
      </div>      
      <!--   BEGIN LINE 10   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">10</span>
          <div class="sty5471ScheduleMLine">Dividends received (exclude hybrid dividends, deemed distributions under subpart F, and distributions of previously taxed income)
            <div class="styDotLn" style="float:right;">...</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColQH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/DividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColQH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/DividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColQH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/DividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColQH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/DividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColQH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/DividendsReceivedAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 11   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">11</span>
          <div class="sty5471ScheduleMLine">
            <span style="float:left;">Interest received</span>
            <div class="styDotLn" style="float:right;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InterestReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InterestReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InterestReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InterestReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InterestReceivedAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 12   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">12</span>
          <div class="sty5471ScheduleMLine">Premiums received for insurance
            <span style="float:left;">or reinsurance</span>
            <div class="styDotLn" style="float:right;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InsReinsPremRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InsReinsPremRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InsReinsPremRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InsReinsPremRcvdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InsReinsPremRcvdAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 13   -->
      <div class="sty5471ScheduleMDescLine" style="border-bottom:1px solid black;">
        <span class="sty5471ScheduleMColA" style="height:4mm;">
          <span class="sty5471ScheduleMLN" style="height:4mm;">13</span>
          <div class="sty5471ScheduleMLine" style="height:4mm;">
            <span style="float:left;">Add line 1 through 12</span>
            <div class="styDotLn" style="float:right;">....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol"  style="border-bottom:0;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/TotalTransactionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol"  style="border-bottom:0;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/TotalTransactionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol"  style="border-bottom:0;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/TotalTransactionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol"  style="border-bottom:0;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/TotalTransactionsReceivedAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol"  style="border-bottom:0;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/TotalTransactionsReceivedAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 14   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">14</span>
          <div class="sty5471ScheduleMLine">Purchases of stock in trade
            <span style="float:left;">(inventory)</span>
            <div class="styDotLn" style="float:right;">.......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InventoryPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InventoryPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InventoryPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InventoryPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InventoryPurchaseAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 15  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">15</span>
          <div class="sty5471ScheduleMLine">Purchases of tangible property other
            <span style="float:left;">than stock in trade</span>
            <div class="styDotLn" style="float:right;">.....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/TangiblePropertyPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/TangiblePropertyPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/TangiblePropertyPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/TangiblePropertyPurchaseAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/TangiblePropertyPurchaseAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 16  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">16</span>
          <div class="sty5471ScheduleMLine">Purchases of property rights
            <span style="float:left;">(patents, trademarks, etc.)</span>
            <div class="styDotLn" style="float:right;">..</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/PropertyRightsPrchsAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/PropertyRightsPrchsAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/PropertyRightsPrchsAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/PropertyRightsPrchsAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/PropertyRightsPrchsAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 17   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">17</span>
          <div class="sty5471ScheduleMLine">Platform contribution transaction
            <span style="float:left;">payments paid</span>
            <div class="styDotLn" style="float:right;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/PlatformContributionPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/PlatformContributionPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/PlatformContributionPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/PlatformContributionPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/PlatformContributionPaidAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 18   -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">18</span>
          <div class="sty5471ScheduleMLine">Cost sharing transaction payments
            <span style="float:left;">paid</span>
            <div class="styDotLn" style="float:right;">.........</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CostSharingPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CostSharingPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CostSharingPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CostSharingPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CostSharingPaidAmt"/>
          </xsl:call-template>
        </span>
      </div>
	  <!--   BEGIN LINE 19  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">19</span>
          <div class="sty5471ScheduleMLine">Compensation paid for technical,
            <span style="float:left;">managerial, engineering,</span>
            <span style="float:left;">construction, or like services</span>
            <div class="styDotLn" style="float:right;">..</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CompensationPaidForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CompensationPaidForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CompensationPaidForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CompensationPaidForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColTH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CompensationPaidForCrtnSrvcAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 20  -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">20</span>
          <div class="sty5471ScheduleMLine">
            <span style="float:left;">Commissions paid</span>
            <div class="styDotLn" style="float:right;">.....</div>
          </div>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/CommissionsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/CommissionsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/CommissionsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/CommissionsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMCol">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/CommissionsPaidAmt"/>
          </xsl:call-template>
        </span>
      </div>
      <!--   BEGIN LINE 21 -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">21</span>
          <div class="sty5471ScheduleMLine">Rents, royalties, and license fees
            <span style="float:left;">paid</span>
            <div class="styDotLn" style="float:right;">.........</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/RentsRoyaltiesLicenseFeesPdAmt"/>
          </xsl:call-template>
        </span>
      </div>                
        <!--   BEGIN LINE 22   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">22</span>
            <div class="sty5471ScheduleMLine">Hybrid dividends paid (see instructions)
              <!--<span style="float:left;">reinsurance</span>-->
              <div class="styDotLn" style="float:right;">.......</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/HybridDividendsPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/HybridDividendsPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/HybridDividendsPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/HybridDividendsPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/HybridDividendsPaidAmt"/>
            </xsl:call-template>
          </span>
        </div>        
         <!--   BEGIN LINE 23 -->
      <div class="sty5471ScheduleMDescLine">
        <span class="sty5471ScheduleMColA">
          <span class="sty5471ScheduleMLN">23</span>
          <div class="sty5471ScheduleMLine">Dividends paid (exclude hybrid dividends paid)
            <div class="styDotLn" style="float:right;">......</div>
          </div>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/DividendsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/DividendsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/DividendsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/DividendsPaidAmt"/>
          </xsl:call-template>
        </span>
        <span class="sty5471ScheduleMColDH">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/DividendsPaidAmt"/>
          </xsl:call-template>
        </span>
       </div>        
       <!--   BEGIN LINE 24   -->
       <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">24</span>
            <div class="sty5471ScheduleMLine">
              <span style="float:left;">Interest paid</span>
              <div class="styDotLn" style="float:right;">.......</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InterestPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InterestPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InterestPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InterestPaidAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InterestPaidAmt"/>
            </xsl:call-template>
          </span>
        </div>
		<!--   BEGIN LINE 25   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">25</span>
            <div class="sty5471ScheduleMLine">Premiums paid for insurance or
              <span style="float:left;">reinsurance</span>
              <div class="styDotLn" style="float:right;">.......</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/InsReinsPremPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/InsReinsPremPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/InsReinsPremPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/InsReinsPremPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColDH" style="border-bottom-width:2px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/InsReinsPremPdAmt"/>
            </xsl:call-template>
          </span>
        </div>        
        <!--   BEGIN LINE 26   -->
        <div class="sty5471ScheduleMDescLine" style="border-bottom:1px solid black;">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">26</span>
            <div class="sty5471ScheduleMLine">
              <span style="float:left;">Add lines 14 through 25</span>
              <div class="styDotLn" style="float:right;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/TotalTransactionsPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/TotalTransactionsPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/TotalTransactionsPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/TotalTransactionsPdAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/TotalTransactionsPdAmt"/>
            </xsl:call-template>
          </span>
        </div>        
        <!--   BEGIN LINE 27   -->
       <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">27</span>
            <div class="sty5471ScheduleMLine">
              <span style="float:left;">Accounts Payable</span>
              <div class="styDotLn" style="float:right;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/AccountsPayableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/AccountsPayableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/AccountsPayableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/AccountsPayableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/AccountsPayableAmt"/>
            </xsl:call-template>
          </span>
        </div>        
        <!--   BEGIN LINE 28   -->
        <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">28</span>
            <div class="sty5471ScheduleMLine">Amounts borrowed (enter the
              <span style="float:left;">maximum loan balance during the</span>
              <span style="float:left;">year) — see instructions</span>
              <div class="styDotLn" style="float:right;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/BorrowedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/BorrowedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/BorrowedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/BorrowedAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/BorrowedAmt"/>
            </xsl:call-template>
          </span>
        </div>        
         <!--   BEGIN LINE 29   -->
       <div class="sty5471ScheduleMDescLine">
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">29</span>
            <div class="sty5471ScheduleMLine">
              <span style="float:left;">Accounts Receivable</span>
              <div class="styDotLn" style="float:right;">.....</div>
            </div>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/AccountsReceivableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/AccountsReceivableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/AccountsReceivableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/AccountsReceivableAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMCol">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/AccountsReceivableAmt"/>
            </xsl:call-template>
          </span>
        </div>        
        <!--   BEGIN LINE 30   -->
        <div class="styTBB">
        <div class="sty5471ScheduleMDescLine" >
          <span class="sty5471ScheduleMColA">
            <span class="sty5471ScheduleMLN">30</span>
            <div class="sty5471ScheduleMLine">Amounts loaned (enter the 
              <span style="float:left;">maximum loan balance during the</span>
              <span style="float:left;">year) — see instructions </span> <!--&#8212;-->
              <div class="styDotLn" style="float:right;">...</div>
            </div>
          </span>
          <span class="sty5471ScheduleMColTH" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/USPersonControlFrgnCorpGrp/LoanAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/DomCorpPrtshpUSPersonFilingGrp/LoanAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/OthFrgnCorpPrtshpUSPrsnFlngGrp/LoanAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrCtrlFrgnCorpGrp/LoanAmt"/>
            </xsl:call-template>
          </span>
          <span class="sty5471ScheduleMColTH" style="border-bottom:0;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$IRS5471ScheduleMData/TenPctMoreUSShrAnyCorpCtrlGrp/LoanAmt"/>
            </xsl:call-template>
          </span>
        </div>
        </div>
        <!--   BEGIN FORM FOOTER  -->
        <div class="sty5471ScheduleMFormFooter" style="border-top-width:1px;">
          <div class="styGenericDiv" style="width:110mm;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
          <div class="styGenericDiv" style="width:19mm;">Cat. No. 49963O</div>
          <div style="width:58mm;text-align:right;font-weight:bold; text-align: right;clear: none">Schedule M(Form 5471) 
            <span style="font-weight:normal">(Rev. 12-2018)</span>
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
        <xsl:if test="string-length($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or
		   (count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)"> 
   		<!--<xsl:if test="(count($IRS5471ScheduleMData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">-->
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