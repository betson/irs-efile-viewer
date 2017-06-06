<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleSStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest    -->
  <xsl:param name="IRS1120FScheduleSData" select="$RtnDoc/IRS1120FScheduleS"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($IRS1120FScheduleSData)"/>
          </xsl:call-template>
        </title>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Cache-Control" content="private"/>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120F Schedule S"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120FScheduleSStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS1120F ScheduleS">
          <!--   BEGIN WARNING LINE  -->
          <xsl:call-template name="DocumentHeader"/>
          <!--   END WARNING LINE   -->
          <!--   BEGIN FORM HEADER   -->
          <div class="sty1120ScheduleHBB" style="width:187mm;height:18mm">
            <div class="sty1120ScheduleHFN" style="height:18mm;">
              <div class="styFormNumber" style="width:29mm;font-size:9pt;">
           SCHEDULE S<br/>
                <span style="font-size:9pt;">(Form 1120-F)</span>
                <br/>
                <span style="font-size:6pt;">Department of the Treasury</span>
                <br/>
              </div>
              <div style="font-size:6pt;">Internal Revenue Service
            </div>
            </div>
            <div class="sty1120ScheduleHFTBox" style="width:120mm;height:18mm;">
              <div class="styMainTitle" style="padding-left:10mm">Exclusion of Income From the International
           Operation of Ships or Aircraft Under Section 883</div>
              <br/>
              <div class="sty1120ScheduleHFST">
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
           Attach to Form 1120-F. 
            </div>
            </div>
            <!-- Tax Year Box -->
            <div class="styTYBox" style="height: 19mm;width:37mm;">
              <!-- OMB No. -->
              <div class="styOMB" style="text-align:center;">OMB No. 1545-0126</div>
              <!-- Tax Year -->
              <div class="styTY" style="text-align: center; padding-top: 2.5mm">
               20<span class="styTYColor">08</span>
              </div>
            </div>
          </div>
          <!--   END FORM HEADER   -->
          <!--   BEGIN TAXPAYER INFO   -->
          <div class="styBB" style="width:187mm;float:left;clear:left;">
            <div class="styNameBox" style="width:135mm;height:8mm;font-size:7pt;font-weight:normal;">
            Name of corporation<br/>
              <span>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NameOfCorporation/BusinessNameLine1"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NameOfCorporation/BusinessNameLine2"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styEINBox" style="width:51mm;height:4mm;padding-left:2mm;
          font-size:7pt;font-weight:bold;">Employer identification number<br/>
              <br/>
              <span style="width:25mm;text-align:left; font-weight:normal;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/EIN"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--   END TAXPAYER INFO   -->
          <!-- BEGIN PART I -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;">Part I</div>
            <div class="styPartDesc" style="width:164mm;">Qualified Foreign Corporation

          </div>
          </div>
          <!--   END PART I HEADER   -->
          <!-- Line 1a-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">1a</div>
            <div class="styLNDesc" style="width:128mm;height:4mm;">
                     Enter the name of the qualified foreign country in which the foreign corporation was organized
        <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:3mm;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:50mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/QualifiedForeignCountryName"/>
              </xsl:call-template>
            </div>
          </div>
          <!--    Line 1 b  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">1b</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Check one (and only one) of the following boxes to indicate
                          the type of equivalent exemption granted by the foreign country listed<br/>  in 1a above:</span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:146mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/DomesticLaw"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/DomesticLaw"/>
                </xsl:call-template>            
                        Domestic law
                </label>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ExchangeOfNotes"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ExchangeOfNotes"/>
                </xsl:call-template> 
                Exchange of notes
                         </label>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeTaxConvention"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeTaxConvention"/>
                </xsl:call-template>             
                Income tax convention
              </label>
            </div>
          </div>
          <!--    Line 1c  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">1c</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">
              Enter the applicable authority (i.e., the specific provision) of the 
                     equivalent exemption type indicated on line 1b (see instructions)</span>
              <span style="width:1mm;"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <br/>
              <div class="styUnderlineAmount" style="height:4mm;width:178mm;text-align:left">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ApplicableAuthority"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--   BEGIN LINE 2   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText"> Enter the gross income in each of the following categories
                of qualified income for which the exemption is being claimed:</span>
              <span style="width:1mm"/>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">
                <b>Note:</b> If an amount is not readily determinable, enter a reasonable estimate. 
                If an estimate is used on any of the lines below, check here</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:1mm"/>
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/EstimateUsed"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeCarriagePassengersCargo"/>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!-- Line 2a -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">a</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;">
                Income from the carriage of passengers and cargo
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
      
          </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2a</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm;">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncomeCarriagePassengersCargo)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeCarriagePassengersCargo"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeCarriagePassengersCargoF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;
           padding-right:3mm;">
        Time or voyage (full) charter income of a ship or wet lease income of an aircraft
        <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:25px;"/>.
                                <span style="width:16px;"/>.
                                <span style="width:16px;"/>.
                               <span style="width:16px;"/>.
                              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2b</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncomeShipOrAircraft)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeShipOrAircraft"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeShipOrAircraftF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:3mm">c</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;padding-right:3mm;">
          Bareboat charter income of a ship or dry charter income of an aircraft
       <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:25px;"/>.
                                <span style="width:16px;"/>.
                                <span style="width:16px;"/>.
                               <span style="width:16px;"/>.
                               <span style="width:16px;"/>.
                               <span style="width:16px;"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2c</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/CharterIncomeShipOrAircraft)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CharterIncomeShipOrAircraft"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CharterIncomeShipOrAircraftF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2d -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">d</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;padding-right:3mm;">
        Incidental bareboat charter income or incidental dry lease income of an aircraft
    <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:22px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                <span style="width:16px;"/>.
                </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2d</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncdtlCharterOrDryLeaseIncome)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncdtlCharterOrDryLeaseIncome"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncdtlCharterOrDryLeaseIncomeF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2e -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">e</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;padding-right:3mm;">
                   Incidental container-related income
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
                        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">2e</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncdtlContainerRelatedIncome)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncdtlContainerRelatedIncome"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncdtlContainerRelatedIncomeF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2f1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">f</div>
            <div class="styLNDesc" style="width:135mm;height:4mm;padding-right:3mm;">
               Income incidental to the international operation of ships or aircraft other than incidental income
      <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px"/>
            <div class="styLNAmountBox" style="height:4mm;width:35mm;border-bottom-width:0px"/>
          </div>
          <!-- Line 2f2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm"/>
            <div class="styLNDesc" style="width:135mm;height:4mm;padding-right:3mm;">
             described in Regulations sections 1.883-1(h)(2)(iv) and (v)
      <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:7px;"/>.
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
            <div class="styLNRightNumBox" style="height:4mm;">2f</div>
            <div class="styLNAmountBox" style="height:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncmIncdtlIntntlShipsArcrft)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncmIncdtlIntntlShipsArcrft"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncmIncdtlIntntlOprShipsArcrftF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2g -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:14mm;padding-left:3mm">g</div>
            <div class="styLNDesc" style="width:135mm;height:14mm;">
                Capital gains derived by a qualified foreign corporation engaged in the international operation of
                ships or aircraft from the sale, exchange or other disposition of a ship, aircraft, container or
                related equipment or other moveable property used by that qualified foreign corporation in the
                international operation of ships or aircraft
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
       <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">2g</div>
            <div class="styLNAmountBox" style="height:14mm;padding-top:10mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/CapitalGains)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CapitalGains"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CapitalGainsF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 2h -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:12mm;padding-left:3mm">h</div>
            <div class="styLNDesc" style="width:135mm;height:12mm;">
                 Income from participation in a pool, partnership, strategic alliance, joint operating agreement,
                 code-sharing arrangement, international operating agency, or other joint venture described in
                 Regulations section 1.883-1(e)(2)
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
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
      </span>
            </div>
            <div class="styLNRightNumBox" style="height:10mm;padding-top:4mm">2h</div>
            <div class="styLNAmountBox" style="height:10mm;;padding-top:4mm;width:35mm">
              <xsl:choose>
                <xsl:when test="normalize-space($RtnDoc/IRS1120FScheduleS/IncomeFromJointVenture)">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeFromJointVenture"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/IncomeFromJointVentureF"/>
                  </xsl:call-template>
                  <span style="width: 2px"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div style="width:187mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm"/>
            <div class="styLNDesc" style="width:139mm;height:4mm;font-size:8pt;">
              <b>
                   Stock ownership test of Regulations section 1.883-1(c)(2):</b>
            </div>
          </div>
          <!--    Line 3  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;">3</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Check one (and only one) of the following boxes to indicate the test under
                    which the stock ownership test of Regulations section 1.883-1(c)(2) was satisfied:</span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:146mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/PubliclyTradedTest"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/PubliclyTradedTest"/>
                </xsl:call-template>            
                   The publicly-traded test of Regulations section 1.883-2(a). <b>Complete Part II.</b>
              </label>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:158mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCStockOwnershipTest"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCStockOwnershipTest"/>
                </xsl:call-template> 
                        The CFC stock ownership test of Regulations section 1.883 -3(a). <b>Complete Part III.</b>
              </label>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftLtrBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/QualifiedShrStockOwnershipTest"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/QualifiedShrStockOwnershipTest"/>
                </xsl:call-template>             
                              The qualified shareholder stock ownership test of Regulations section 1.883-4(a). 
                             <b>Complete Part IV.</b>
              </label>
            </div>
          </div>
          <div style="width:187mm;"/>
          <!--   BEGIN LINE 4   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Check the box if none of the shares of the foreign corporation’s
               stock or the stock of any direct, indirect, or constructive shareholder relied on to satisfy 
               any of the stock ownership tests described in Regulations section 1.883-1(c)(2) are
                issued in bearer form</span>
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:17px;"/>.
              </span>
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NoSharesForeignStockHeld"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NoSharesForeignStockHeld"/>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <div style="width:187mm;"/>
          <!--   BEGIN LINE 5   -->
          <div class=" styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">If any such shares were issued in bearer form, check the box 
              if none of the bearer shares were relied on to satisfy any of the stock ownership tests 
              described in Regulations section 1.883-1(c)(2)</span>
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
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NoSharesIntermediaryEntityHeld"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/NoSharesIntermediaryEntityHeld"/>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!-- BEGIN PART II -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;">Part II</div>
            <div class="styPartDesc" style="width:164mm;">Stock Ownership Test for
             Publicly-Traded Corporations
            </div>
          </div>
          <!--   END PART II HEADER   -->
          <!-- Line 6-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">6</div>
            <div class="styLNDesc" style="width:93mm;height:4mm;">
                         Enter the name of the country in which the stock is primarily traded
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:86mm;text-align:left">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CountryStockPrimarilyTraded"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 7-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">7</div>
            <div class="styLNDesc" style="width:98mm;height:4mm;">
                        Enter the name of the securities market(s) on which the stock is listed
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:81mm;text-align:left">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/SecuritiesMarketStockListed"/>
              </xsl:call-template>
            </div>
          </div>
          <!--    Line 8   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText"> Enter a description of each class of stock relied upon to meet the
               requirements of Regulations section 1.883-2(d) (see instructions for</span>
              <span style="width:1mm"/>
            </div>
          </div>
          <!-- Line 8-2-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width:40mm;height:4mm;">
                           description requirements)
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:138mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ClassStockDescription"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 9  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm">9</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;padding-right:3mm;">
            Do one or more 5% shareholders (as defined in Regulations section 1.883-2(d)(3)) 
            own in aggregate 50% or more of the vote and value of the outstanding shares of any class 
            of stock for more than half the number of days during the tax year?.
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
                <span style="width:16px;"/>.
                 <span style="width:16px;"/>.
                 <span style="width:16px;"/>.
                 <span style="width:16px;"/>.
                 <span style="width:16px;"/>.
                </span>
              <br/> If "Yes," complete line 10. 
           <br/>If "No," skip line 10 and go to line 11. 
              
           </div>
            <div class="styLNDesc" style="width:12mm;height:4.5mm;text-align:right;padding-top:8mm">
              <span>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ShareholdersVote"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:8px"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ShareholdersVote"/>
                </xsl:call-template>          
                          Yes           
                        </label>
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;padding-top:8mm">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ShareholdersVote"/>
                </xsl:call-template>
              </input>
              <span style="width:8px"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/ShareholdersVote"/>
                </xsl:call-template>            
                      No            
                    </label>
            </div>
          </div>
          <!--    Line 10   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText"> For each class of stock relied upon
              to meet the “regularly traded test” of Regulations section 1.883-2(d),
               if one or more 5% shareholders (as defined in Regulations section 
               1.883-2(d)(3)(i)) own in the aggregate 50% or more of the vote and
               value of the outstanding shares of that class of stock for more than
                half the number of days during the tax year, indicate:</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
            </div>
          </div>
          <div style="width:187mm;"/>
          <!--    Line 10 a(i)   -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">a(i)</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">The days during the tax year of the corporation in which 
                     the stock was closely-held, without regard to the exception in Regulations section 1.883-2(d)(3)(ii)</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:2mm"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/DaysStockCloselyHeld"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice,
                             see Instructions for Form 1120-F</span>
              <span style="width:3mm;"/>Cat. No. 50766D 
                    </div>
            <div style="float:right;">
              <span style="width:2px;"/>
              <span class="styBoldText" style="font-size:6pt;">
                <b>Schedule S (Form 1120-F) 2008</b>
              </span>
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!--Begin Page 2 -->
          <!-- Page Header -->
          <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Schedule S (Form 1120-F) 2008)<span style="width:148mm;"/>
            </div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!--    Line 10 a(ii)   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm">(ii)</div>
            <div class="styLNDesc" style="width:156mm;height:4mm;">
                         The total percentage of the vote and value of the class of stock
               that is owned by 5% shareholders during such days
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:23mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/TotalPctAndValueStockOwned"/>
              </xsl:call-template>%
            </div>
          </div>
          <!--    Line 10 b  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">b</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">With respect to all qualified shareholders
               upon which the corporation intends to rely to satisfy the closely-held
               exception test, of Reglations section 1.883-2(d)(3), and who own 
               directly, indirectly, or by application of the attribution rules in Regulations
               section 1.883-4(c), stock in the closely-held block, enter:</span>
              <span style="width:1mm"/>
            </div>
          </div>
          <!--    Line 10 b(i)   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm">(i)</div>
            <div class="styLNDesc" style="width:125mm;height:4mm;">
                            The total number of qualified shareholders, as defined in Regulations section 1.883-4(b)(1)
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:54mm;text-align:left">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/TotalQualifiedShareholders"/>
              </xsl:call-template>
            </div>
          </div>
          <!--    Line 10 b(ii)   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">(ii)</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">The total percentage of the value of the shares owned, 
              directly or indirectly, by such qualified shareholders by country of
              residence (see instructions):</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
            <div class="styGenericDiv" style="width:6mm;height:4mm;padding-left:187mm;
                padding-top:6mm;font-size:7pt;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctValueSharesOwned"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctn' "/>
              </xsl:call-template>
            </div>
            <div class="styTableContainer" id="TPctn">
              <xsl:call-template name="SetInitialState"/>
              <table cellspacing="0">
                <thead>
                  <tr>
                    <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;"/>
                    <th class="styDepTblCell" scope="col" style="border-left-width:0px;width:60mm;
                              border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;font-weight:normal">
                              Country code (see instructions)
                              </th>
                    <th class="styDepTblCell" scope="col" style="width:20mm;border-left-width:0px;border-right:0px;
                                       border-top:0px;border-bottom:0px;"/>
                    <th class="styDepTblCell" scope="col" style="border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;
                                   font-weight:normal">Percentage</th>
                    <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;"/>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number of -->
                  <!-- elements is less than the container height, then also display all rows. -->
                  <xsl:if test="($Print != $Separated) 
                  or (count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt;= 5) ">
                    <xsl:for-each select="$IRS1120FScheduleSData/TotalPctValueSharesOwned">
                      <tr>
                        <xsl:attribute name="class"/>
                        <td style="width:25m;"/>
                        <td class="styUnderlineAmount" style="font-size:8pt;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CountryCode"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:10mm;text-align:right;"/>
                        <td class="styUnderlineAmount" style="text-align:right;font-size:8pt;" nowrap="yes">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Percentage"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:25m;"/>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt; 1 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt; 2 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/Total"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt; 3 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/Total"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt; 4 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/Total"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &lt; 5 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/Total"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                </tbody>
              </table>
              <div style="width:187mm;"/>
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctValueSharesOwned"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctn' "/>
              </xsl:call-template>
            </div>
            <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
          </div>
          <!--    Line 10 b(iii)   -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">(iii)</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">The days during the tax year of the corporation that such qualified 
                   shareholders owned, directly or indirectly, their shares in the closely-held block of stock</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:2mm"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/DaysShareholdersOwnedStock"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- BEGIN PART III -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;">Part III</div>
            <div class="styPartDesc" style="width:164mm;">Stock Ownership Test for 
            Controlled Foreign Corporations
          </div>
          </div>
          <!--   END PART III HEADER   -->
          <!--    Line 11   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">11</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Enter the percentage of the value of the shares of the CFC that is
         owned by all "qualified U.S. persons" identified in the qualified ownership statements required 
         under Temporary Regulations section 1.883-3T(c)(2), applying the attribution of ownership 
         rules of 
                  </span>
            </div>
          </div>
          <!-- Line 11A-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm"/>
            <div class="styLNDesc" style="width:68mm;height:4mm;">
           Temporary Regulations section 1.883-3T(b)(4)
            <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:1mm;"/>
            </div>
            <div class="styUnderlineAmount" style="height:4mm;width:5mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/PctValueSharesOwnedUSPersons"/>
              </xsl:call-template>%
            </div>
          </div>
          <!-- Line 12-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm">12</div>
            <div class="styLNDesc" style="width:125mm;height:4mm;">
                                 Enter the period during which such qualified U.S. persons held such stock (see instructions)
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <br/>
            <div class="styUnderlineAmount" style="height:4mm;width:186mm;text-align:left;padding-left:8mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/PeriodUSPersonsHeldStock"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 13-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:2mm">13</div>
            <div class="styLNDesc" style="width:112mm;height:4mm;">
                          Enter the period during which the foreign corporation was a CFC (see instructions)
                <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:16px;"/>
            </div>
            <br/>
            <div class="styUnderlineAmount" style="height:4mm;width:186mm;text-align:left;padding-left:8mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/PeriodForeignCorporationWasCFC"/>
              </xsl:call-template>
            </div>
          </div>
          <!--  Line 14  -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">14</div>
            <div class="styLNDesc" style="width:148mm;height:4.5mm;padding-right:3mm;">Is the CFC directly held by qualified U.S. persons?
                 <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:24px;"/>.
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
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
              <span>
                <input type="checkbox" class="styCkbox" name="Checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCDirectlyHeldUSPersons"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:8px"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCDirectlyHeldUSPersons"/>
                </xsl:call-template>          
                  Yes
            </label>
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCDirectlyHeldUSPersons"/>
                </xsl:call-template>
              </input>
              <span style="width:8px"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/CFCDirectlyHeldUSPersons"/>
                </xsl:call-template>            
                      No            
                    </label>
            </div>
          </div>
          <!-- BEGIN PART IV -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="width:23mm;">Part IV</div>
            <div class="styPartDesc" style="width:164mm;">Qualified Shareholder Stock 
            Ownership Test
          </div>
          </div>
          <!--   END PART IV HEADER   -->
          <!--   BEGIN LINE 15   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm;">15</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Check the box if more than 50% of the
               value of the outstanding shares of the corporation is owned (or treated as owned
               by reason of Regulations section 1.883-4(c)) by qualified shareholders for each category 
               of income for which the exemption is claimed</span>
              <!--Dotted Line-->
              <span class="styBoldText">
                <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
          </span>
              <input type="checkbox" class="styCkbox" name="Checkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/MoreThan50PctValueOutstdShares"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/MoreThan50PctValueOutstdShares"/>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!--   BEGIN LINE 16   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">16</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">With respect to all qualified 
              shareholders relied upon to satisfy the 50% ownership test 
              of Regulations section 1.883-4(a):</span>
            </div>
          </div>
          <div style="width:187mm;"/>
          <!--    Line 16a   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">a</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Enter the total number of such qualified
                           shareholders as defined in Regulations section 1.883-4(b)(1)</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width:2mm"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120FScheduleS/TotNumberQualifiedShareholders"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;"/>
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  -->
          <!--    Line 16b   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Enter the total percentage of the value of the 
                              outstanding shares owned, applying the attribution rules of Regulations
                               section 1.883-4(c), by such qualified shareholders by country of residence or
                               organization, whichever is applicable:</span>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
            <!--  ****************************************************************************************  -->
            <!--  ****************************************************************************************  -->
            <div class="styGenericDiv" style="width:6mm;height:4mm;padding-left:187mm;
                padding-top:6mm;font-size:6pt;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctn2' "/>
              </xsl:call-template>
            </div>
            <div class="styTableContainer" id="TPctn2">
              <xsl:call-template name="SetInitialState"/>
              <table cellspacing="0">
                <thead>
                  <tr>
                    <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;"/>
                    <th class="styDepTblCell" scope="col" style="border-left-width:0px;width:60mm;
                              border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;font-weight:normal">
                              Country code (see instructions)
                              </th>
                    <th class="styDepTblCell" scope="col" style="width:20mm;border-left-width:0px;border-right:0px;
                                       border-top:0px;border-bottom:0px;"/>
                    <th class="styDepTblCell" scope="col" style="border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;
                                   font-weight:normal">Percentage</th>
                    <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0px;
                              border-right:0px;border-top:0px;border-bottom:0px;"/>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number of -->
                  <!-- elements is less than the container height, then also display all rows. -->
                  <xsl:if test="($Print != $Separated) or
                   (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt;= 5) ">
                    <xsl:for-each select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned">
                      <tr>
                        <xsl:attribute name="class"/>
                        <td style="width:25m;"/>
                        <td class="styUnderlineAmount" style="font-size:8pt;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CountryCode"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:10mm;text-align:right;"/>
                        <td class="styUnderlineAmount" style="text-align:right;font-size:8pt;" nowrap="yes">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Percentage"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:25m;"/>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt; 1 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt; 2 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Code"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Percentage"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt; 3 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt; 4 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                  <!-- Display blank filler rows. If the Print parameter is Separated and the number of elements exceeds the -->
                  <!-- container height, then display a mesage in the first row directing the user to the additional data table -->
                  <xsl:if test="count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &lt; 5 or
                                     (($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned)&gt;5)) ">
                    <tr>
                      <xsl:attribute name="class"/>
                      <td class="styUnderlineAmount" style="text-align:center" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="width:63mm;text-align:left;font-size:6pt;font-weight:normal">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:10mm;text-align:right" nowrap="yes"/>
                      <td class="styUnderlineAmount" style="text-align:right" nowrap="yes">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Losses"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                </tbody>
              </table>
              <div style="width:187mm;"/>
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned"/>
                <xsl:with-param name="containerHeight" select="5"/>
                <xsl:with-param name="headerHeight" select="2"/>
                <xsl:with-param name="containerID" select=" 'TPctn2' "/>
              </xsl:call-template>
            </div>
          </div>
          <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
          <!--    Line 16c   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">c</div>
            <div class="styLNDesc" style="width:178mm;height:4.5mm;">
              <span class="styText">Enter the period during the tax year of the 
              foreign corporation that such stock was held by qualified shareholders</span>
              <span style="width:1mm"/>
              <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
              <span style="width=2mm"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/PeriodStockHeldShareholder"/>
              </xsl:call-template>
            </div>
          </div>
          <!--   BEGIN FORM FOOTER  -->
          <div class="sty1120ScheduleHFormFooter">
            <!-- Page Break and Footer-->
            <div class="pageEnd" style="width:187mm;padding-top:1mm;">
              <div style="float:left;">
                <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice,
                   see Instructions for Form 1120-F</span>
                <span style="width:3mm;"/>Cat. No. 50766D </div>
              <div style="float:right;">
                <span style="width:2px;"/>
                <span class="styBoldText" style="font-size:6pt;">
                  <b>Schedule S (Form 1120-F) 2008</b>
                </span>
              </div>
            </div>
            <!-- END Page Break and Footer-->
          </div>
          <br/>
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">Additional Data </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
          <!-- END Left Over Table -->
          <!-- Additional Data Table for Separated Data from Part II Line 9b (ii) -->
          <div style="width:187mm;"/>
          <div style="width:187mm;"/>
          <xsl:if test="($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctValueSharesOwned) &gt; 5) ">
            <span class="styRepeatingDataTitle">1120F Schedule S Part II, Line 10b (ii) - The total percentage of the value of the shares owned.
                   </span>
            <div style="width:187mm;"/>
            <table class="styDepTbl" style="font-size: 7pt; width: 92mm">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">
                  Country code (see instructions)
                 </th>
                  <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Percentage</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$IRS1120FScheduleSData/TotalPctValueSharesOwned">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:center;width:46mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CountryCode"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:right;width:46mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Percentage"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <div style="width:187mm;"/>
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctValueSharesOwned"/>
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="headerHeight" select="2"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
            <br/>
          </xsl:if>
          <!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
          <!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
          <!-- END Left Over Table -->
          <!-- Additional Data Table for Separated Data from 17b-->
          <div style="width:187mm;"/>
          <div style="width:187mm;"/>
          <xsl:if test="($Print = $Separated) and (count($IRS1120FScheduleSData/TotalPctOutstdSharesOwned) &gt; 5) ">
            <span class="styRepeatingDataTitle"> 1120 F Schedule S Part IV, Line 16b  - The total percentage of the value 
            outstanding shares owned.
                   </span>
            <div style="width:187mm;"/>
            <table class="styDepTbl" style="font-size: 7pt; width: 92mm">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">
                  Country code (see instructions)
                 </th>
                  <th class="styDepTblCell" style="width:46mm;font-weight:normal;" scope="col">Percentage</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:center;width:46mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CountryCode"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:right;width:46mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Percentage"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <div style="width:187mm;"/>
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$IRS1120FScheduleSData/TotalPctOutstdSharesOwned"/>
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="headerHeight" select="2"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
            <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <!--   BEGIN FORM FOOTER  -->
            <div class="sty1120ScheduleHFormFooter">
              <!-- Page Break and Footer-->
              <div style="width:187mm;padding-top:1mm;">
                <div style="float:left;">
                  <span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice,
                   see Instructions for Form 1120-F</span>
                  <span style="width:3mm;"/>Cat. No. 50766D </div>
                <div style="float:right;">
                  <span style="width:2px;"/>
                  <span class="styBoldText" style="font-size:6pt;">
                    <b>Schedule S (Form 1120-F) 2008</b>
                  </span>
                </div>
              </div>
              <!-- END Page Break and Footer-->
            </div>
          </xsl:if>
          <!--  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&   -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
