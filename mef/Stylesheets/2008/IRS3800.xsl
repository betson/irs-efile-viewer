<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS3800Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form3800Data" select="$RtnDoc/IRS3800"/>
  <xsl:param name="Form3800ScheduleAData" select="$RtnDoc/IRS3800/IRS3800ScheduleA"/>
  <!--   -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form3800Data)"/>
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
        <meta name="Description" content="IRS Form 3800"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        <!--Print statement-->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS3800Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form3800" style="font-size:7pt;">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:21mm;">
            <div class="styFNBox" style="width:34mm;height:21mm;">
              <div style="height:13mm;">
            Form<span class="styFormNumber">  3800</span>
                <br/>
              </div>
              <div style="height:8mm;padding-top:.75mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service <span style="padding-left:7mm;">(99)</span>
                </span>
              </div>
            </div>
            <div class="styFTBox" style="width:122mm;height:21mm;">
              <div class="styMainTitle" style="height:11mm;">
            General Business Credit
          </div>
              <div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
               See separate instructions.
              </div>
              <div class="styFST" style="height:4mm;font-size:7pt;padding-top:.5mm;">
                <img src="{$ImagePath}/3800_Bullet.gif" alt="bullet image"/>
            Attach to your tax return.
          </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:21mm;">
              <div class="styOMB" style="height:2mm;">
            OMB No. 1545-0895
          </div>
              <div class="styTaxYear" style="height:9mm;padding-top:0;">20<span class="styTYColor">08</span>
              </div>
              <div style="text-align:left;padding-left:3mm;">Attachment Sequence No. <span class="styBoldText">22</span>
              </div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:150mm;height:8mm;font-size:7pt;font-weight:normal;">
          Name(s) shown on return<br/>
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
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
          Identifying number<br/>
              <br/>
              <span style="width:25mm;text-align:left;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!-- Begin Part I (Tentative Credit) Section -->
          <div class="styBB" style="width:187mm;padding-top:2mm;padding-bottom:2mm;">
            <div class="styPartName" style="background-color:black;">Part I</div>
            <!-- Revisit:-->
            <div class="styPartDesc">
              <span style="width:8px;"/>Current Year Credit
        </div>
          </div>
          <!--Part I, Important Line -->
          <div class="styBB" style="width:187mm;">
            <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
              <div style="width:186mm;">
                <span class="styBoldText">Important:</span> You may not be required to complete and file a separate credit form (shown in parentheses below) to claim the credit. For details, see the instructions.</div>
              <!--<div style="width:186mm;">see the instructions.</div> -->
            </div>
            <!-- extra space -->
            <!--Part I, Line 1a -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;">1a
          <!-- Position makes the 'a' in "1a" line up with the other letters. -->
              </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Investment credit (Form 3468, Part II only) (attach Form 3468)
            <span style="width:3px;"/>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1a</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearInvestmentCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1b-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Welfare-to-work credit (Form 8861)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1b</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearWelfareToWorkCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1c-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Credit for increasing research activities (Form 6765)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYIncreasingResearchCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1d-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Low-income housing credit (Form 8586, Part I o nly) (enter EIN if claiming this credit from a pass-through entity: 
             <span style="border-style: solid; border-color: black;width:35mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                  <!--Choice of EIN or Missing EIN Reason-->
                  <xsl:if test="$Form3800Data/EINOfPassThroughEntityHsingCr">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/EINOfPassThroughEntityHsingCr"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form3800Data/MissingEINReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/MissingEINReason"/>
                    </xsl:call-template>
                  </xsl:if>
                </span> )
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;padding-top:4mm;">1d</div>
              <div class="styLNAmountBox" style="padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYLowIncomeHousingCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1e-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">e</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Disabled access credit (Form 8826) (do not enter more than $5,000)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
             <span style="width:16px;"/>.
              <span style="width:16px;"/>.
             <span style="width:16px;"/>.
              <span style="width:16px;"/>.
          </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1e</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearDisabledAccessCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1f-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">f</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Renewable electricity production credit (Form 8835, Part I only)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:10px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1f</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYRenewableElectricityCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1g-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">g</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Indian employment credit (Form 8845)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.    
              <span style="width:16px;"/>.   
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1g</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearIndianEmplmnCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1h-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">h</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Orphan drug credit (Form 8820)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:1px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.
              <span style="width:16px;"/>. 
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1h</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearOrphanDrugCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1i-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">i</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             New markets credit (Form 8874) (enter EIN if claiming this credit from a pass-through entity:<br/>
                <span style="border-style: solid; border-color: black;width:35mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                  <!--Choice of EIN or Missing EIN Reason -->
                  <xsl:if test="$Form3800Data/EINOfPassThruEntityNewMarketCr">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/EINOfPassThruEntityNewMarketCr"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form3800Data/NewMarketCrMissingEINReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/NewMarketCrMissingEINReason"/>
                    </xsl:call-template>
                  </xsl:if>
                </span> )
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:14px;"/>.
                  <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-top:4mm;">1i</div>
              <div class="styLNAmountBox" style="padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearNewMarketsCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1j-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">j</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Credit for small employer pension plan startup costs (Form 8881) (do not enter more than $500)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:8px;"/>.
                 <span style="width:8px;"/>.
             </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1j</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYSmallEmployerPensionPlanCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1k-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">k</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              Credit for employer-provided child care facilities and services (Form 8882) (enter EIN if claiming<br/>          
               this credit from a pass-through entity: <span style="border-style: solid; border-color: black;width:35mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                  <!--Choice EIN or Missing EIN Reason -->
                  <xsl:if test="$Form3800Data/EINOfPassThruEntChildCareCr">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/EINOfPassThruEntChildCareCr"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form3800Data/ChildCareCrMissingEINReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/ChildCareCrMissingEINReason"/>
                    </xsl:call-template>
                  </xsl:if>
                </span> )
               <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:6px;"/>
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
              </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-top:4mm;">1k</div>
              <div class="styLNAmountBox" style="padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYEmplrProvChildCareFcltsCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1l-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">l</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
		  Biodiesel and renewable diesel fuels credit (attach Form 8864)
	     <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:6px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
	        <span style="width:16px;"/>.
		 <span style="width:16px;"/>.
		 <span style="width:16px;"/>.
		 <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1l</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearBiodieselFuelCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1m-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">m</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Low sulfur diesel fuel production credit (Form 8896)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1m</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYLowSulfurDieselCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1n-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">n</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Distilled spirits credit (Form 8906)
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYLowSulfurDieselCredit"/>
                  <xsl:with-param name="TabOrder" select="2"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1n</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/DistilledSpiritsCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1o-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">o</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Nonconventional source fuel credit (Form 8907)
            <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/DistilledSpiritsCredit"/>
                  <xsl:with-param name="TabOrder" select="2"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1o</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYNonconventionalFuelCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1p-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">p</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Energy efficient home credit (Form 8908)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:8px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
               <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1p</div>
              <!-- Note - for 2004v2.0 and 2004v3.0 schemas this data is for line p on the old pdf -->
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYEnergyEfficientHomeCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1q-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">q</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
          Energy efficient appliance credit (Form 8909)
          <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:12px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1q</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYEnergyEfficientApplianceCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1r-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">r</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              Alternative motor vehicle credit (Form 8910) (enter EIN if claiming this credit from a pass-through entity:           
             <span style="border-style: solid; border-color: black;width:35mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                  <!--Choice EIN or Missing EIN Reason -->
                  <xsl:if test="$Form3800Data/EINOfPassThruEntChildCareCr">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/EINPassThroughEntAltMtrVehCr"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form3800Data/ChildCareCrMissingEINReason">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form3800Data/AltMtrVehCrMissingEINReason"/>
                    </xsl:call-template>
                  </xsl:if>
                </span> )
               <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:6px;"/>
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
                  <span style="width:16px;"/>.
              </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm; padding-top:4mm;">1r</div>
              <div class="styLNAmountBox" style="padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYAlternativeMotorVehicleCrdt"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1s-->
            <!-- No matching XML shcema for this -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">s</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Alternative fuel vehicle refueling property credit (Form 8911)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1s</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYAlternativeRefuelingCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1t-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">t</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
             Credits for affected Midwestern disaster area employers (Form 5884-A)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1t</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/MidwesternDisasterCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1u-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">u</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
          Mine rescue team training credit (Form 8923)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
             <span style="width:16px;"/>.   
             <span style="width:16px;"/>.
              <span style="width:16px;"/>.   
             <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1u</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/MineRescueTeamTrainingCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1v-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">v</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
              Agricultural chemicals security credit (Form 8931)
            <!--Dotted Line-->
                <span class="styBoldText"/>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1v</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AgriculturalChemicalsCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1w-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">w</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
          Credit for employer differential wage payments (Form 8932)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
                 <span style="width:16px;"/>.  
                 <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1w</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/DifferentialWagePaymentsCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1x-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">x</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Carbon dioxide sequestration credit (Form 8933)
             <span style="width:1mm;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/MineRescueTeamTrainingCredit"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
             <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
             <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1x</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CarbonDioxideCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1y-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">y</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
          Credit for contributions to selected community development corporations (Form 8847)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1y</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYCommunityContributionDevCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 1z-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">z</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
          General credits from an electing large partnership (Schedule K-1 (Form 1065-B))
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
              <span style="width:16px;"/>.  
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">1z</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CYGenBusCrElectingLargePrtshp"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 2-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Add lines 1a through 1z
            <span style="width:1px;"/>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:6px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">2</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearGeneralBusCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 3-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Passive activity credits included on line 2 (see instructions)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:10px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearPassiveActyCredits"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 4-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
            Subtract line 3 from line 2
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:7px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">4</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedCurrentYearGenBusCr"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 5-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                <!-- Revisit: Changing year 2002 to 2003 -->
                <!--Passive activity credits allowed for 2002-->
            Passive activity credits allowed for 2008 (see instructions)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/PssvActyCreditsAllowedCY"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 6-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                <!-- Revisit: Changing year 2002 to 2003 -->
                <!--Carryforward of general business credit to 2002. See
            instructions for the schedule to attach-->
            Carryforward of general business credit to 2008. See instructions for the schedule to attach
            <!-- setting the push pin image -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrCarryforwardCY"/>
                  <xsl:with-param name="TabOrder" select="2"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:14px;"/>
                  <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">6</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/GeneralBusCrCarryforwardCY"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 7-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                <!-- Revisit:Changing year from 2003 to 04.-->
                <!--Carryback of general business credit from 2003-->
            Carryback of general business credit from 2009 (see instructions)
            <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px;"/>
                  <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">7</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CarryBackGeneralBusinessCredit"/>
                </xsl:call-template>
              </div>
            </div>
            <!-- Part I, Line 8-->
            <div style="width:187mm;">
              <!--     Extra Space   -->
              <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
                <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
                <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
              </div>
              <!-- extra space -->
              <div class="styLNLeftNumBoxSD" style="height:4mm;">8</div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
                <span class="styBoldText">Current year credit. </span>
            Add lines 4 through 7
            <!-- Revisit: -->
                <!--span class="styBoldText">
              Current year general business credit
            </span-->
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:12px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            </span>
              </div>
              <div class="styLNRightNumBoxNBB" style="height:4mm;">8</div>
              <div class="styLNAmountBoxNBB">
                <xsl:call-template name="PopulateAmount">
                  <!--<xsl:with-param name="TargetNode" select="$Form3800Data/TentativeGeneralBusinessCredit" />-->
                  <!--Because of schema changes the name has been changed CurrentYearGeneralBusinessCr -->
                  <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearGeneralBusinessCr"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- End Part I -->
          <!--Page 1 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12392F</div>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2008)</div>
          </div>
          <!-- Page 2 Header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 3800 (2008)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
          <!--  Begin Part II Title -->
          <div class="styBB" style="width:187mm; padding-top:2mm;padding-bottom:2mm;">
            <div class="styPartName" style="background-color:black;">Part II</div>
            <div class="styPartDesc">
              <span style="width:8px;"/>Allowable Credit
        </div>
          </div>
          <!-- Part II, Line 9 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">9</div>
            <div class="styLNDesc" style="width:115mm;height:3mm;">
		       Regular tax before credits:
		       <li>Individuals. Enter the amount from Form 1040, line 44 or Form 1040NR, line 41 <span style="padding-left:2mm;letter-spacing:2.2mm;">.</span>
              </li>
              <li>Corporations. Enter the amount from Form 1120, Schedule J, line 2; or the
		       <span style="padding-left:4.6mm;"> applicable line of your return<span style="padding-left:2mm;letter-spacing:2.2mm;">........................</span>
                </span>
              </li>
              <li>Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G,<br/>
                <span style="padding-left:4.6mm;">lines 1a and 1b, or the amount from the applicable line of your return<span style="padding-left:2mm;letter-spacing:2.2mm;">......</span>
                </span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; height:3mm;padding-top:mm;">
              <img src="{$ImagePath}/3800_Bracket_Lger.gif" alt="Curly Bracket Image"/>
            </div>
            <span style="letter-spacing:3.3mm; font-weight:bold; float:left;width:18.9mm; height:14mm;padding-bottom:0mm;padding-top:8.5mm;">  
                            ....
                    </span>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:5mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
            <div class="styLNAmountBox" style="height:4.5mm;width:32.25mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RegularTaxBeforeCredits"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:9mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:9mm;"/>
          </div>
          <!-- Part II, Line 10 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">10</div>
            <div class="styLNDesc" style="width:115mm;height:4mm;">
                 Alternative minimum tax: 
                 <li>Individuals. Enter the amount from Form 6251, line 36<span style="padding-left:2mm;letter-spacing:2.2mm;">.............</span>
              </li>
              <li>Corporations. Enter the amount from Form 4626, line 14<span style="padding-left:2mm;letter-spacing:2.2mm;">............</span>
              </li>
              <li>Estates and trusts. Enter the amount from Schedule I (For m 1041), line 56<span style="padding-left:2mm;letter-spacing:2.2mm;">...</span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; height:2mm;">
              <img src="{$ImagePath}/3800_Bracket_Sm.gif" alt="Curly Bracket Image"/>
            </div>
            <span style="letter-spacing:3.3mm; font-weight:bold; float:left;width:18.9mm; height:14mm;padding-bottom:0mm;padding-top:4.5mm;">  
                            ....
                    </span>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;">10</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AlternativeMinimumTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;padding-top:2.5mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:2.5mm;"/>
          </div>
          <!-- Part II, Line 11 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">11</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Add lines 9 and 10
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:15px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">11</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedRegTaxBeforeCredits"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 12a -->
          <!-- The following form element does not have a matching element in the schema -->
          <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <!--    <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;background-color:red;"></div>  -->
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">12a</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Foreign tax credit
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">12a</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ForeignTaxCredit"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 12b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm">b</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Personal credits from Form 1040, lines 48 through 54 (or Form 1040NR, lines 45 through 49)
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:8px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">12b</div>
            <div class="styLNAmountBox" style="height:8.5mm;padding-top:4mm;">
              <!--<xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form3800Data/ForeignTaxCredit" />      
          </xsl:call-template>-->
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 12c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Credit from Form 8834
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:15px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">12c</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CreditFromForm8834"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 12d -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">d</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
         Non-business alternative motor vehicle credit (Form 8910, line 18)
                   <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:5px;"/>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">12d</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NonBusinessAlternativeMotorCr"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px:"/>
          </div>
          <!-- Part II, Line 12e -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">e</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Non-business alternative fuel vehicle refueling property credit (Form 8911, line 19)
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:9px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">12e</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NonBusinessAlternativeFuelCr"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px;padding-top:4.5mm;"/>
          </div>
          <!-- Part II, Line 12f -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">f</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Add lines 12a through 12e
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:4px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">12f</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TotalTaxCredits"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 13 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">13</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
              <span style="font-weight:bold;">Net income tax. </span>Subtract line 12f from line 11. If zero,
          skip lines 14 through 17 and enter -0- on line <br/>18a          
          <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:10px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">13</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/NetIncomeTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 14 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px; background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <div class="styLNLeftNumBox" style="height:4mm;">14</div>
          <div class="styLNDesc" style="width:99mm;height:4mm;">
            <span style="font-weight:bold;"> Net regular tax.</span> Subtract line 12f from line 9. 
          If zero or less, enter -0-
          <span class="styBoldText">
              <span style="width:10px;"/>.
          </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm; ">14</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form3800Data/NetRegularTax"/>
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          <!-- Part II, Line 15 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">15</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
              <span style="font-family:arial;">
            Enter 25% (.25) of the excess, if any, of line 14 over $25,000 (see instructions)</span>
              <span class="styBoldText">
                <span style="width:10px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ExcessNetRegularTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 16 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">16</div>
            <div class="styLNDesc" style="width:83mm;height:4mm;">
             Tentative minimum tax: 
              <li>Individuals. Enter the amount from Form 6251, line 34<span style="padding-left:2mm;letter-spacing:2.2mm;">..</span>
              </li>
              <li>Corporations. Enter the amount from Form 4626, line 12<span style="padding-left:2mm;letter-spacing:2.2mm;">.</span>
              </li>
              <li>Estates and trusts. Enter the amount from Schedule I <br/>
                <span style="padding-left:4.5mm;">(Form 1041), line 54</span>
                <span style="padding-left:2mm;letter-spacing:2.2mm;">.................</span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; height:2mm;padding-top:0mm;">
              <img src="{$ImagePath}/3800_Bracket.gif" alt="Curly Bracket Image"/>
            </div>
            <span style="letter-spacing:2.2mm; font-weight:bold; float:left;width:10.9mm; height:13mm;padding-bottom:0mm;padding-top:4.5mm;">  
                            ...
                    </span>
            <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;background-color:lightgrey;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;padding-top:0mm;"/>
            <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:0mm;background-color:lightgrey;"/>
            <div class="styLNAmountBoxNBB" style="height:4mm;padding-top:0mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">16</div>
            <div class="styLNAmountBox" style="height:4mm;padding-top:0mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/TentativeMinimumTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:14.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 17 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">17</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Enter the greater of line 15 or line 16
          <span class="styBoldText">
                <span style="width:11px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">17</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedExcessNetRegularTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 18a -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4.5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">18a</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Subtract line 17 from line 13. If zero or less,
          enter -0-
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">18a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AdjustedNetIncomeTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 18b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">b</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          For a corporation electing to accelerate the research credit, enter the bonus depreciation amount
          attributable to the research credit. (see instructions)
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">18b</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/ElectionToAccelResearchCr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 18c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Add lines 18a and 18b
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">18c</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SumOf18aAnd18b"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 19a -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">19a</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Enter the <b>smaller</b> of line 8 or line 18c
          <!--Pen and ink image -->
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Section 383 or Section 384 Indicator</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmallerOfLine8And18c/@sec383Or384Indicator"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">19a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmallerOfLine8And18c"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Part II, Line 19a Row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
              <span class="styBoldText">Individuals, estates, and trusts:</span>
                      See the instructions for line 19a if claiming the research credit.<br/>
              <span class="styBoldText">C corporations:</span> See the line 19 instructions if there has been an ownership change, acquisition, or reorganization.  
                 </div>
            <div class="styLNRightNumBox" style="height:7mm;border-bottom-width:0px;background-color:lightgrey;padding-top:7mm;"/>
            <div class="styLNAmountBox" style="height:7mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:7mm;"/>
          </div>
          <!--Part II, Line 19b Row 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:139mm;">
                       Enter the smaller of line 8 or line 18a. If you made an entry on line 18b, go to line 19c; otherwise, 
                 </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!--Part II, Line 19b Row 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:4.5mm;"/>
            <div class="styLNDesc" style="width:139mm;">
                  skip line 19c
                       <span style="padding-left:2mm;letter-spacing:2.2mm; font-weight:bold;">..................</span>
            </div>
            <div class="styLNRightNumBox" style="height:3mm;">19b</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmallerOfLine8OrLine18a"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Part II, Line 19c Row 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:139mm;">
                      Subtract line 19b from line 19a. This is the refundable amount for a corporation electing to accelerate 
                 </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!--Part II, Line 19c Row 2 -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;"/>
            <div class="styLNDesc" style="width:139mm;">
                      the research credit. Include this amount on line 32g of Form 1120 (or the applicable line of your return) 
                       <!--<span style="padding-left:2mm;letter-spacing:2.2mm; font-weight:bold;">..................</span>-->
            </div>
            <div class="styLNRightNumBoxNBB" style="height:4mm;">19c</div>
            <div class="styLNAmountBoxNBB" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RefundableAmtForACorporation"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Page 2 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2008)</div>
          </div>
          <!-- Page 3 Header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 3800 (2008)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
            </div>
          </div>
          <!--  Begin Part II Title -->
          <div class="styBB" style="width:187mm; padding-top:2mm;padding-bottom:2mm;">
            <div class="styPartName" style="background-color:black;">Part II</div>
            <div class="styPartDesc">
              <span style="width:8px;"/>Allowable Credit (Continued) 
        </div>
          </div>
          <!--Part II Continue, Note Line -->
          <div class="styBB" style="width:187mm;">
            <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
              <div style="width:186mm;">
                <span class="styBoldText">Note.</span> I f you are not filing Form 8844, skip lines 20 through 24 and enter -0- on line 25.</div>
              <!--<div style="width:186mm;">see the instructions.</div> -->
            </div>
          </div>
          <!-- Part II, Line 20 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">20</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
         Multiply line 16 by 75%
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">20</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/MuliplyLine16By75Pct"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 21 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">21</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Enter the greater of line 15 or line 20
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">21</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/GreaterOfLine15Line20"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 22 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">22</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Subtract line 21 from line 13. If zero or less, enter -0-
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">22</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SubtractLine21FromLine13"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 23 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">23</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Subtract line 19b from line 22. If zero or less, enter -0-
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">23</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SubtractLine19bFromLine22"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 24 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">24</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Enter the amount from Form 8844, line 10 or line 12
          <!-- Push Pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form3800Data/EnterAmountFromF8844"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">24</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/EnterAmountFromF8844"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 25 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">25</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
                 Empowerment zone and renewal community employment credit allowed. Enter the smaller of line 23 or
               </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
         line 24
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">25</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/EmpwrZoneAndComEmploymentCr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 26 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">26</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Subtract line 15 from line 13. If zero or less, enter -0-
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">26</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SubtractLine15FromLine13"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 27 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">27</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Add lines 19b and 25
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">27</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AddLines19bAnd25"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 28 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">28</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Subtract line 27 from line 26. If zero or less, enter -0-
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">28</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SubtractLine27FromLine26"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 29a -->
          <!-- The following form element does not have a matching element in the schema -->
          <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <!--    <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;background-color:red;"></div>  -->
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">29a</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the investment credit from Form 3468, Part II, line 18 (attach Form 3468)
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29a</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/InvestmentCredit"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">b</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the work opportunity credit from Form 5884, line 10 or line 12
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">29b</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/WorkOpportunityCreditFrom5884"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">c</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the alcohol and cellulosic biofuel fuels credit from Form 6478, line 15 or line 17
          <!-- Push Pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AlcoholAndCellulosicFuelCredit"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29c</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AlcoholAndCellulosicFuelCredit"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29d -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">d</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the low-income housing credit from Form 8586, Part II, line 18 or line 20
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
              <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29d</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/LowIncomeHousingCredit"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29e -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">e</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the renewable electricity, refined coal, and Indian coal
          production credit from Form 8835, Part II, line 36 or line 38
          <!-- Push Pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RnwblElecCoalCreditFromF8835"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29e</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/RnwblElecCoalCreditFromF8835"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29f -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">f</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the credit for employer social security and Medicare ta xes
          paid on certain employee tips from Form 8846, line 12
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29f</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CreditForEmployerSSMedicareTax"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 29g -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm;">g</div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
          Enter the qualified railroad track maintenance credit from Form 8900, line 12
          <span class="styBoldText">
                <span style="width:5px;"/>
                <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">29g</div>
            <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/QualifiedRailroadTrackMaint"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:8mm;width:8.2mm;border-right-width:1px"/>
          </div>
          <!-- Part II, Line 30 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">30</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Add lines 29a through 29g
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">30</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/AddLines29aThrough29g"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 31 -->
          <!--     Extra Space   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;"/>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;"/>
          </div>
          <!-- extra space -->
          <!-- check here -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">31</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Enter the <b>smaller</b> of line 28 or line 30
          <span class="styBoldText">
                <span style="width:14px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">31</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/SmallerOfLine28OrLine30"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Part II, Line 32 -->
          <div style="width:187mm;">
            <!--     Extra Space   -->
            <div class="styLNLeftNumBox" style="height:1mm;"/>
            <div class="styLNDesc" style="width:107mm;height:1mm;"/>
            <!--    <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;background-color:red;"></div>  -->
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:0px;"/>
            <div class="styLNRightNumBox" style="height:1mm;border-bottom-width:0px;padding-top:.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:1mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:.5mm;"/>
            <!-- extra space -->
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;">32</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
              <span style="styBoldText">
                <b>Credit allowed for the current year.</b>
              </span> Add lines 27 and 31. 
                 <!-- Push Pin image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowed"/>
              </xsl:call-template>
              <br/>
             Report the amount from line 32 (if smaller than the sum of lines 8, 24, and 30, see instructions)
          as indicated below or on the applicable line of your return: 
         </div>
            <div class="styLNRightNumBox" style="height:10.9mm;border-bottom-width:0px;padding-top:1.5mm;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:10.9mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1.5mm;"/>
          </div>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:115mm;height:4mm;">
              <li>Individuals. Form 1040, line 54 or Form 1040NR, line 49<span style="padding-left:2mm;letter-spacing:2.2mm;">...........</span>
              </li>
              <li>Corporations.Form 1120, Schedule J, line 5c<span style="padding-left:2mm;letter-spacing:2.2mm;">............</span>
              </li>
              <li>Estates and trusts.Form 1041, Schedule G, lin e 2c<span style="padding-left:2mm;letter-spacing:2.2mm;">...</span>
              </li>
            </div>
            <div class="styLNDesc" style="width:5mm; height:2mm;">
              <img src="{$ImagePath}/3800_Bracket_Sm.gif" alt="Curly Bracket Image"/>
            </div>
            <span style="letter-spacing:3.3mm; font-weight:bold; float:left;width:18.9mm; height:14mm;padding-bottom:0mm;padding-top:4.5mm;">  
                            ....
                    </span>
            <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;padding-top:1mm;"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;border-bottom-width:0px;border-left-width:1px;padding-top:1mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">32</div>
            <div class="styLNAmountBox">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form3800Data/CurrentYearCreditAllowed"/>
              </xsl:call-template>
            </div>
          </div>
          <!--Page 3 Footer -->
          <div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
            <div style="width:90mm;font-weight:bold;" class="styGenericDiv"/>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">3800</span> (2008)</div>
          </div>
          <!--ADDITIONAL DATA SECTION-->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form3800Data"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 19a - Section 383 or Section 384 Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Form3800Data/SmallerOfLine8And18c/@sec383Or384Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
