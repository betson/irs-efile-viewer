<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRSW2Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormW2Data" select="$RtnDoc/IRSW2"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormW2Data)"/>
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
        <meta name="Description" content="IRS Form W2"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRSW2Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="FormW2">
          <!-- WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- Big box covers entire form -->
          <div style="width:187mm;height:109mm;border-top:1px solid black;
            border-bottom:0px solid black;border-left:1px solid black;border-right:1px solid black">
            <!-- Box covers Blank box, Employee's ssn and OMB no.... -->
            <div class="styIRSW2leftBox" style="width:187mm;height:8.47mm;border-left:0px; 
              border-bottom:1px solid black;">
              <!-- Blank Box -->
              <div class="styIRSW2leftBox" style="width:30mm;height:8.47mm; 
                border-left:0px solid black;border-right:1px solid black">
                <span style="width:5px;padding-top:5mm"/>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Corrected Form W2 Indicator</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormW2Data/CorrectedW2Ind"/>
                </xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Standard or NonStandard Cd</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormW2Data/StandardOrNonStandardCd"/>
                </xsl:call-template>
              </div><!-- Closes Blank box -->
              <!-- Employee's ssn -->
              <div class="styIRSW2leftBox" style="width:52mm;height:8.47mm;border-top:2px solid black; 
                border-bottom:2px solid black;border-left:2px solid black;border-right:2px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">a 
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6.5pt">Employee's social security number</span>
                <br/>
                <span style="width:18px;"/>
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeSSN"/>
                </xsl:call-template>
              </div><!-- Closes employee's ssn -->
              <!-- OMB no... -->
              <div class="styIRSW2leftBox" style="width:32mm;height:8.47mm;border-left:1px solid black;
                border-right:0px solid black">
                <span style="padding-top:5mm;width:2.5mm"/>
                <span style="font-size: 6.5pt;">OMB No. 1545-0008</span>
              </div><!-- Closes OMB no -->
              <!-- Safe, accurate, FAST!  Use -->
              <div class="styIRSW2leftBox" style="width:22mm;height:8.47mm; 
                border-left:0px solid black;border-right:0px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold">Safe, accurate,</span>
                <br/>
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold">FAST!
                  <span style="width:1.5mm"/>Use</span>
              </div><!-- Closes Safe, accurate... -->
              <!-- IRS efile image -->
              <div class="styIRSW2leftBox" style="width:20mm;height:8.47mm;padding-top:1.5mm; 
                border-left:0px solid black;border-right:0px solid black">
                <span style="width:1.5mm;"/>
                <img src="{$ImagePath}/W2_efilelogo.gif" alt="efile"/>
              </div><!-- Closes IRS efile image -->
              <!-- Visit the IRS website... -->
              <div class="styIRSW2leftBox" style="width:31mm;height:8.47mm; 
                border-left:0px solid black;border-right:0px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;">Visit the IRS website</span>
                <br/>
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;">at <i>www.irs.gov/efile.</i>
                </span>
              </div><!-- Closes Visit the IRS website -->
            </div><!-- Closes Box for blank box, Employee's ssn, and OMB no -->
            <!-- Box covers Employer Id num, Box 1 and Box 2.... -->
            <div class="styIRSW2leftBox" style="width:187mm;height:8.47mm;border-left:0px; 
              border-bottom:1px solid black;">
              <!-- Employer Identification number (EIN) -->
              <div class="styIRSW2leftBox" style="width:105mm;height:8.47mm; 
                border-left:0px solid black;border-right:1px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">b                                     
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6.5pt">Employer identification number (EIN)</span>
                <br/>
                <span style="width:4.5mm;"/>
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerEIN"/>
                </xsl:call-template>
              </div><!-- Closes EIN -->
              <!-- Box 1 -->
              <div class="styIRSW2leftBox" style="width:41mm;height:8.47mm;border-left:1px solid black;
                border-right:1px solid black;border-top:1px solid black;border-bottom:1px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">1 
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6pt">Wages, tips, other compensation</span>
                <span style="padding-top:1mm;width:39.5mm;float:bottom;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/WagesAmt"/>
                  </xsl:call-template>
                </span>
              </div><!-- Closes Box 1-->
              <!-- Box 2 -->
              <div class="styIRSW2leftBox" style="width:41mm;height:8.47mm;border-left:1px solid black;
                border-right:1px solid black;border-top:1px solid black;border-bottom:1px solid black">
                <span style="width:2.3mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">2 
                  <span style="width:1.7mm"/>
                </span>
                <span style="font-size: 6pt">Federal income tax withheld</span>
                <span style="padding-top:1mm;width:37.9mm;float:bottom;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/WithholdingAmt"/>
                  </xsl:call-template>
                </span>
              </div><!-- Closes Box 2-->
            </div><!-- Closes Box for Employer Id num, Box 1 and Box 2 -->
            <!-- Box covers Employer's name, addr, zip and Boxes 3-8 -->
            <div class="styIRSW2leftBox" style="width:187mm;height:25.3mm;border-left:0px; 
              border-bottom:1px solid black;">
              <!-- Employer's name, address, and ZIP code -->
              <div class="styIRSW2leftBox" style="width:105mm;height:25.3mm; 
                border-left:0px solid black;border-right:1px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">c 
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6.5pt">Employer's name, address, and ZIP code</span>
                <br/>
                <span style="width:.5mm;"/>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Line C - Employer Name Control</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerNameControl"/>
                </xsl:call-template>
                <br/>
                <span style="width:3mm;"/>
                <span style="font-size: 6pt">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerName/BusinessNameLine1"/>
                  </xsl:call-template>
                </span>
                <br/>
                <span style="width:3mm;"/>
                <span style="font-size: 6pt">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerName/BusinessNameLine2"/>
                  </xsl:call-template>
                </span>
                <br/>
                <xsl:if test="$FormW2Data/EmployerUSAddress">
                  <span style="width:3mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerUSAddress/AddressLine1"/>
                  </xsl:call-template>
                  <br/>
                  <span style="width:3mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerUSAddress/AddressLine2"/>
                  </xsl:call-template>
                  <br/>
                  <span style="width:3mm;"/>
                  <xsl:call-template name="PopulateCityStateInfo">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerUSAddress"/>
                  </xsl:call-template>
                </xsl:if>
                <!--<xsl:if test="$FormW2Data/EmployerForeignAddress">
                                            <span style="width:4mm"/>
                                            <span style="font-size:6pt">
                                               <xsl:call-template name="PopulateForeignAddressTemplate">
                                                  <xsl:with-param name="TargetNode" 
                                                   select="$FormW2Data/EmployerForeignAddress"/>
                                               </xsl:call-template></span>
                                       </xsl:if>-->
                <xsl:if test="$FormW2Data/EmployerForeignAddress">
                  <span style="width:3mm;"/>
                  <span style="font-size:6pt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/AddressLine1"/>
                    </xsl:call-template>
                    <br/>
                    <span style="width:3mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/AddressLine2"/>
                    </xsl:call-template>
                    <br/>
                    <span style="width:3mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/City"/>
                    </xsl:call-template>, 
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/ProvinceOrState"/>
                    </xsl:call-template>&#160;
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/PostalCode"/>
                    </xsl:call-template>
                    <br/>
                    <span style="width:3mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerForeignAddress/Country"/>
                    </xsl:call-template>
                  </span>
                </xsl:if>
              </div><!-- Closes Employer's name, addr and ZIP code -->
              <!-- Box covers Boxes 3-8 -->
              <div class="styIRSW2leftBox" style="width:81.8mm;height:24.5mm;border-left:0px; 
                border-right:0px solid black;">
                <!-- Boxes 3 and 4 -->
                <div class="styIRSW2leftBox" style="width:81.8mm;height:8.33mm;
                  border-left:0px solid black;border-right:0px solid black;
                  border-bottom:1px solid black;">
                  <!-- Box 3 -->
                  <div class="styIRSW2leftBox" style="width:41mm;height:8.33mm;
                    border-left:0px solid black;border-right:1px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:1.5mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">3 
                      <span style="width:.5mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Social security wages</span>
                    <span style="padding-top:1mm;width:40mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/SocialSecurityWagesAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 3-->
                  <!-- Box 4 -->
                  <div class="styIRSW2leftBox" style="width:40mm;height:8.33mm;
                    border-left:0px solid black;border-right:0px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:2.3mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">4
                      <span style="width:1.7mm"/>
                    </span>
                    <span style="font-size: 6pt">Social security tax withheld</span>
                    <span style="padding-top:1mm;width:38mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/SocialSecurityTaxAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 4 -->
                </div><!-- Closes Boxes 3 and 4 -->
                <!-- Boxes 5 and 6 -->
                <div class="styIRSW2leftBox" style="width:81.8mm;height:8.33mm;
                  border-left:0px solid black;border-right:0px solid black;
                  border-bottom:1px solid black;">
                  <!-- Box 5 -->
                  <div class="styIRSW2leftBox" style="width:41mm;height:8.33mm;
                    border-left:0px solid black;border-right:1px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:1.5mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">5 
                      <span style="width:.5mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Medicare wages and tips</span>
                    <span style="padding-top:1mm;width:40mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/MedicareWagesAndTipsAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 5-->
                  <!-- Box 6 -->
                  <div class="styIRSW2leftBox" style="width:40mm;height:8.33mm;
                    border-left:0px solid black;border-right:0px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:2.3mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">6
                      <span style="width:1.7mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Medicare tax withheld</span>
                    <span style="padding-top:1mm;width:38mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/MedicareTaxWithheldAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 6 -->
                </div><!-- Closes Boxes 5 and 6 -->
                <!-- Boxes 7 and 8 -->
                <div class="styIRSW2leftBox" style="width:81mm;height:8.36mm; 
                  border-left:0px solid black;border-right:0px solid black;
                  border-bottom:0px solid black;">
                  <!-- Box 7 -->
                  <div class="styIRSW2leftBox" style="width:41mm;height:8.6mm;
                    border-left:0px solid black;border-right:1px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:1.5mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">7
                      <span style="width:.5mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Social security tips</span>
                    <span style="padding-top:1mm;width:40mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/SocialSecurityTipsAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 7-->
                  <!-- Box 8 -->
                  <div class="styIRSW2leftBox" style="width:40mm;height:8.36mm;
                    border-left:0px solid black;border-right:0px solid black;
                    border-top:0px solid black;border-bottom:0px solid black">
                    <span style="width:2.3mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">8
                      <span style="width:1.7mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Allocated tips</span>
                    <span style="padding-top:1mm;width:38mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/AllocatedTipsAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 8 -->
                </div><!-- Closes Boxes 7 and 8 -->
              </div><!-- Closes Boxes 3-8 -->
            </div><!-- Closes Employer's name, addr, zip and Boxes 3-8 -->
            <!-- Box covers Control number, Box 9 and Box 10.... -->
            <div class="styIRSW2leftBox" style="width:187mm;height:8.47mm;border-left:0px;
              border-bottom:1px solid black;">
              <!-- Control number -->
              <div class="styIRSW2leftBox" style="width:105mm;height:8.47mm; 
                border-left:0px solid black;border-right:1px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">d
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6.5pt">Control number</span>
                <br/>
                <span style="width:4mm;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormW2Data/ControlNumber"/>
                </xsl:call-template>
              </div><!-- Closes Control number -->
              <!-- Box 9 -->
              <div class="styIRSW2leftBox" style="width:41mm;height:8.47mm;border-left:1px solid black;
                border-right:1px solid black;border-top:1px solid black;border-bottom:1px solid black">
                <span style="width:1.5mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">9
                  <span style="width:.5mm"/>
                </span>
                <span style="font-size: 6.5pt">Advance EIC payment</span>
                <span style="padding-top:1mm;width:39.5mm;float:bottom;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/AdvanceEICPaymentAmt"/>
                  </xsl:call-template>
                </span>
              </div><!-- Closes Box 9-->
              <!-- Box 10 -->
              <div class="styIRSW2leftBox" style="width:41mm;height:8.47mm;border-left:1px solid black;
                border-right:0px solid black;border-top:0px solid black;border-bottom:0px solid black">
                <span style="width:.7mm"/>
                <span style="font-size: 6.5pt;font-weight:bold;">10 
                  <span style="width:1.7mm"/>
                </span>
                <span style="font-size: 6.5pt">Dependent care benefits</span>
                <span style="padding-top:1mm;width:37.5mm;float:bottom;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/DependentCareBenefitsAmt"/>
                  </xsl:call-template>
                </span>
              </div><!-- Closes Box 10-->
            </div><!-- Closes Box for Control num, Box 9 and Box 10 -->
            <!-- Box covers Boxes e and f (Employee's first name and initial, last name, suff and Employee's 
                  addr and zip) and Boxes 11-14 -->
            <div style="width:187mm;height:47mm;border-left:0px;
              border-bottom:1px solid black;">
              <!-- Big Box covers Boxes e and f (Employee's first name and initial, last name, suff. and 
                    Employee's addr and zip) -->
              <div class="styIRSW2leftBox" style="width:105mm;height:47.3mm;border-left:0px solid black;
                border-right:0px solid black">
                <!-- Box e (Employee's first name and initial, last name, suff.) -->
                <div class="styIRSW2leftBox" style="width:105mm;height:43.2mm;
                  border-left:0px solid black;border-right:0px solid black">
                  <span style="width:1.5mm"/>
                  <span style="font-size: 6.5pt;font-weight:bold;">e 
                    <span style="width:.5mm"/>
                  </span>
                  <span style="font-size: 6.5pt">Employee's first name and initial
                    <span style="width:10mm"/>Last name
                    <span style="width:20mm"/>Suff.</span>
                  <br/>
                  <span style="width:4mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeName"/>
                  </xsl:call-template>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <br/>
                  <xsl:if test="$FormW2Data/EmployeeUSAddress">
                    <span style="width:4mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeUSAddress/AddressLine1"/>
                    </xsl:call-template>
                    <br/>
                    <span style="width:4mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeUSAddress/AddressLine2"/>
                    </xsl:call-template>
                    <br/>
                    <span style="width:4mm;"/>
                    <xsl:call-template name="PopulateCityStateInfo">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeUSAddress"/>
                    </xsl:call-template>
                  </xsl:if>
                  <!--<xsl:if test="$FormW2Data/EmployeeForeignAddress">
                                                     <br/><span style="width:4mm;"/>
                                                     <span style="font-size:6pt">
                                                        <xsl:call-template name="PopulateForeignAddressTemplate">
                                                           <xsl:with-param name="TargetNode" 
                                                             select="$FormW2Data/EmployeeForeignAddress"/>
                                                        </xsl:call-template></span>
                                                 </xsl:if>-->
                  <xsl:if test="$FormW2Data/EmployeeForeignAddress">
                    <span style="width:4mm;"/>
                    <span style="font-size:6pt">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/AddressLine1"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:4mm;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/AddressLine2"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:4mm;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/City"/>
                      </xsl:call-template>, 
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/ProvinceOrState"/>
                      </xsl:call-template>&#160;
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/PostalCode"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:4mm;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/EmployeeForeignAddress/Country"/>
                      </xsl:call-template>
                    </span>
                  </xsl:if>
                </div><!-- Closes Box e-->
                <!-- Box f (Employee's address and zip code) -->
                <div class="styIRSW2leftBox" style="width:105mm;height:3.7mm; 
                  border-left:0px solid black;border-right:0px solid black">
                  <span style="width:1.5mm"/>
                  <span style="font-size: 6.5pt;font-weight:bold;">f 
                    <span style="width:.5mm"/>
                  </span>
                  <span style="font-size: 6.5pt">Employee's address and ZIP code</span>
                </div><!-- Closes Box f -->
              </div><!-- Closes Boxes e and f (Employee's first name and initial, last name, suff and 
                            Employee's addr and zip). -->
              <!-- Box covers Boxes 11, 12a, 12b, 12c, 12d, 13 and 14 -->
              <div class="styIRSW2leftBox" style="width:81.5mm;height:47mm;border-left:0px;
                border-right:0px solid black;float:left;clear:none">
                <!-- Box covers Boxes 11, 13, 14 -->
                <div class="styIRSW2leftBox" style="width:40.5mm;height:47mm;border-left:0px;
                  border-right:1px solid black;">
                  <!-- Boxes 11-->
                  <div class="styIRSW2leftBox" style="width:40.5mm;height:10.7mm;border-left:0px;
                    border-left:1px solid black;border-right:0px;border-top:0px;border-bottom:1px solid black">
                    <span style="width:.5mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">11 
                      <span style="width:.5mm"/>
                    </span>
                    <span style="font-size: 6.5pt">Nonqualified plans</span>
                    <span style="padding-top:1mm;width:39.5mm;float:bottom;text-align:right">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/NonqualifiedPlansAmt"/>
                      </xsl:call-template>
                    </span>
                  </div><!-- Closes Box 11-->
                  <!-- Box 13 -->
                  <div class="styIRSW2leftBox" style="width:40.5mm;height:10.7mm;border-left:0px;
                    border-right:0px;border-top:0px;border-bottom:1px solid black">
                     <div class="styIRSW2leftBox" style="width:14.5mm;height:10.7mm;border-left:1px solid black;
                       border-right:0px;border-top:0px;border-bottom:0px">                     
                        <span style="width:.3mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">13</span>
                        <label>
                           <xsl:call-template name="PopulateLabel">
                              <xsl:with-param name="TargetNode" select="$FormW2Data/StatutoryEmployeeInd"/>
                              <xsl:with-param name="BackupName">FormW2DataStatutoryEmployeeInd</xsl:with-param>
                           </xsl:call-template>
                           <span style="font-size: 6pt">Statutory</span>
                           <br/>
                           <span style="width:3.7mm"/>
                           <span style="font-size: 6pt">employee</span>
                        </label>
                        <br/>
                        <span style="width:3.5mm"/>
                        <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
                           <xsl:call-template name="PopulateCheckbox">
                              <xsl:with-param name="TargetNode" select="$FormW2Data/StatutoryEmployeeInd"/>
                              <xsl:with-param name="BackupName">FormW2DataStatutoryEmployeeInd</xsl:with-param>
                           </xsl:call-template>
                        </input>
                    </div>
                    <div class="styIRSW2leftBox" style="width:12.7mm;height:10.7mm;border-left:0px;
                       border-right:0px solid black;border-top:0px;border-bottom:0px solid black">                     
                       <span style="width:.5mm"/>
                       <label>
                          <xsl:call-template name="PopulateLabel">
                             <xsl:with-param name="TargetNode" select="$FormW2Data/RetirementPlanInd"/>
                             <xsl:with-param name="BackupName">FormW2DataRetirementPlanInd</xsl:with-param>
                          </xsl:call-template>
                          <span style="font-size: 6pt">Retirement</span>
                          <br/>
                          <span style="width:.5mm"/>
                          <span style="font-size: 6pt">plan</span>
                       </label>
                       <br/>
                       <span style="width:.5mm;"/>
                       <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
                          <xsl:call-template name="PopulateCheckbox">
                             <xsl:with-param name="TargetNode" select="$FormW2Data/RetirementPlanInd"/>
                             <xsl:with-param name="BackupName">FormW2DataRetirementPlanInd</xsl:with-param>
                          </xsl:call-template>
                       </input>
                    </div>
                    <div class="styIRSW2leftBox" style="width:13.3mm;height:10.7mm;border-left:0px;
                       border-right:0px solid black;border-top:0px;border-bottom:0px solid black">                     
                       <span style="width:.5mm"/>
                       <label>
                          <xsl:call-template name="PopulateLabel">
                             <xsl:with-param name="TargetNode" select="$FormW2Data/ThirdPartySickPayInd"/>
                             <xsl:with-param name="BackupName">FormW2DataThirdPartySickPayInd</xsl:with-param>
                          </xsl:call-template>
                          <span style="font-size: 6pt">Third-party</span>
                          <br/>
                          <span style="width:.5mm"/>
                          <span style="font-size: 6pt">sick pay</span>
                       </label>
                       <br/>
                       <span style="width:.5mm;"/>
                       <input type="checkbox" class="styCkbox" style="height:4mm;width:4mm;">
                          <xsl:call-template name="PopulateCheckbox">
                             <xsl:with-param name="TargetNode" select="$FormW2Data/ThirdPartySickPayInd"/>
                             <xsl:with-param name="BackupName">FormW2DataThirdPartySickPayInd</xsl:with-param>
                          </xsl:call-template>
                       </input>
                    </div>
                  </div><!-- Closes Box 13-->
                  <!-- Box 14 -->
                  <div class="styGenericDiv" style="width:35.5mm;height:4mm;font:size:6.5pt;border-left:1px solid black">
                    <span style="width:35.5mm;height:4mm;">                              
                      <span style="font-weight:bold;">14</span>      
                      <span style="width:.5mm"/>Other
                    </span>        
                  </div> 
                  <div style="float:right;width:3.2mm;height:4mm;padding-top:0px;">
                    <!--Button display logic-->
                    <xsl:call-template name="SetDynamicTableToggleButton">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/OtherDeductsBenefits"/>
                      <xsl:with-param name="containerHeight" select="2"/>
                      <xsl:with-param name="headerHeight" select="2"/>
                      <xsl:with-param name="containerID" select=" 'othDedBen' "/>      
                    </xsl:call-template>
                    <!--End button display logic-->
                  </div>
                  <!-- Line 14 inline print for when data is blank-->
                  <xsl:if test="($Print = 'inline') and (count($FormW2Data/OtherDeductsBenefits) &lt;1)">
                    <div class="styGenericDiv" style="width:40mm;height:22mm;font-size:7pt;
                      border-left:1px solid black">
                    </div>
                  </xsl:if> 
                  <!-- Line 14 inline print for all data except when blank-->
                  <xsl:if test="($Print = 'inline')">
                    <!--This next section was commented out due to display problems with inline printing.-->
                    <!--<div class="styTableContainer" style="width:40.5mm;height:22.5mm;border-right:0px;
                           border-bottom:0px solid black;border-left:1px solid black" id="othDedBen">-->
                      <!--print logic -->
                      <!--<xsl:call-template name="SetInitialState"/>-->
                      <!--end-->
                      <table class="styTable" cellspacing="0">
                        <!--<thead class="styTableThead">
                          <tr>
                            <th class="styTableCellHeader" scope="col" style="vertical-align:top;padding-top:0mm;
                              font-size:7pt;width:40.5mm;border-bottom-width:0px;border-right:0px;">
                            </th>
                          </tr>
                        </thead>-->
                        <tfoot/>
                        <tbody>
                          <xsl:if test="(count($FormW2Data/OtherDeductsBenefits) &gt;=1)">
                          <!--<xsl:if test="($Print != $Separated) or (count($FormW2Data/OtherDeductsBenefits) &lt;=1)">-->
                            <xsl:for-each select="$FormW2Data/OtherDeductsBenefits">
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;
                                  border-right:0px;border-left:1px solid black;font-size:6pt">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="Description"/>
                                  </xsl:call-template>
                                </td>
                              </tr>
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;font-size:6pt;
                                  text-align:right;padding-top:0px;border-right:0px;border-left:1px solid black;">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                  </xsl:call-template>
                                </td>
                              </tr>
                              <!-- Blank row to create space between line items-->
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;font-size:6pt;
                                  text-align:right;padding-top:0px;border-right:0px;border-left:1px solid black;">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="DummyAmount"/>
                                  </xsl:call-template> 
                                </td>
                              </tr>
                            </xsl:for-each>
                          </xsl:if>
                        </tbody>
                      </table>
                    <!--</div>--><!-- Closes Box 14 -->
                  </xsl:if>
                  <!-- Line 14 for all data that is not inline print and not separated print-->
                  <xsl:if test="($Print != 'inline') and ($Print !=$Separated)">
                    <div class="styTableContainer" style="width:40.5mm;height:22.5mm;border-right:0px;
                      border-bottom:0px solid black;border-left:1px solid black" id="othDedBen">
                      <!-- print logic -->
                      <xsl:call-template name="SetInitialState"/>
                      <!-- end-->
                      <table class="styTable" cellspacing="0">
                        <!--<thead class="styTableThead">
                          <tr>
                            <th class="styTableCellHeader" scope="col" style="vertical-align:top;padding-top:0mm;
                              font-size:7pt;width:40.5mm;border-bottom-width:0px;border-right:0px;">
                            </th>
                          </tr>
                        </thead>-->
                        <tfoot/>
                        <tbody>
                          <xsl:if test="($Print != $Separated) or (count($FormW2Data/OtherDeductsBenefits) &lt;=2)">
                            <xsl:for-each select="$FormW2Data/OtherDeductsBenefits">
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;
                                  border-right:0px;border-left:0px solid black;font-size:6pt">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="Description"/>
                                  </xsl:call-template>
                                </td>
                              </tr>
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;
                                  text-align:right;font-size:6pt;padding-top:0px;border-right:0px;border-left:0px solid black;">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="Amount"/>
                                  </xsl:call-template>
                                </td>
                              </tr>
                              <!-- Blank row to create space between line items-->
                              <tr>
                                <td class="styTableCellText" style="width:41mm;height:2mm;border-bottom:0px;
                                  text-align:right;font-size:6pt;padding-top:0px;border-right:0px;border-left:0px solid black;">
                                 <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="DummyAmount"/>
                                  </xsl:call-template> 
                                  </td>
                              </tr>
                            </xsl:for-each>
                          </xsl:if>
                        </tbody>
                      </table>
                    </div><!-- Closes Box 14 -->
                    <!-- Set Initial Height of Above Table -->
                    <xsl:call-template name="SetInitialDynamicTableHeight">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/OtherDeductsBenefits"/>
                      <xsl:with-param name="containerHeight" select="2"/>
                      <xsl:with-param name="headerHeight" select="2"/>
                      <xsl:with-param name="containerID" select=" 'othDedBen' "/>
                    </xsl:call-template>
                    <!-- End Set Initial Height of Above Table -->
                  </xsl:if>
                  <!-- Line 14 Code to See Additional Data Table for Separated Print and data > 2-->
                  <xsl:if test="($Print = $Separated) and (count($FormW2Data/OtherDeductsBenefits) &gt;2)">
                    <div class="styGenericDiv" style="width:40mm;height:22.7mm;font-size:7pt;
                      border-left:1px solid black">
                      <tbody>
                        <tr>
                          <td class="styTableCellText" style="width:40mm;height:22.7mm;font-size:7pt;
                            border-left:0px solid black">
                            <span style="width:2px"/>
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                              <xsl:with-param name="TargetNode" select="$FormW2Data/OtherDeductsBenefits"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </tbody>
                    </div>
                  </xsl:if>
                  <!-- Line 14 Code for Separated Print and data less than =2 -->
                  <xsl:if test="($Print = $Separated) and (count($FormW2Data/OtherDeductsBenefits) &lt;=2)">
                    <div class="styGenericDiv" style="width:40mm;height:22.1mm;font-size:7pt;
                      border-left:1px solid black">
                      <tbody>
                      </tbody>
                    </div>
                  </xsl:if>
                </div><!-- Closes Boxes 11, 13 and 14 -->
                
                <!-- Big Box 12 and Grey box  -->
                <!-- Code for No Data in Boxes 12a, 12b, 12c and 12d or less than 4 data items-->
                <xsl:if test="(count($FormW2Data/EmployersUseGrp) &lt;=4)">
                  <div class="styIRSW2leftBox" style="width:40.3mm;height:46.5mm; 
                    border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                    <!--<xsl:if test="($Print != $Separated) or (count($FormW2Data/EmployersUseGrp)&lt;= 4)">-->
                    <!-- Boxes 12a, 12b, 12c and 12d -->
                    <div class="styIRSW2leftBox" style="width:40.5mm;height:9.5mm;
                      border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                      <!-- Left Box 12a -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;
                        border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                        <span style="width:1mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12a</span>
                        <span style="width:.8mm;"/>
                        <span style="font-size:7.5">See instructions for box 12</span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px;
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                        <span style="font-size:6pt;padding-top:1mm;width:7mm;float:bottom;">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=1">
                                <span style="float:left">
                                   <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                   </xsl:call-template>
                                </span>
                                <br/>
                                <span style="float:right">
                                   <xsl:call-template name="PopulateAmount">
                                      <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                   </xsl:call-template>
                                </span>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes left box 12a-->
                      <!-- Right Box 12a -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                        <span style="padding-top:.2mm;width:27mm;float:bottom;text-align:right;font-size:6pt">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=1">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                </xsl:call-template>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Right Box 12a-->
                      <!-- Left Box 12b -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12b
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px; 
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                        <span style="font-size:6pt;padding-top:1mm;width:7mm;float:bottom;">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=2">
                                 <span style="float:left">
                                    <xsl:call-template name="PopulateText">
                                       <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                    </xsl:call-template>
                                 </span>
                                <br/>
                                <span style="float:right">
                                   <xsl:call-template name="PopulateAmount">
                                      <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                   </xsl:call-template>
                                </span>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Left Box 12b-->
                      <!-- Right Box 12b -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                        <span style="padding-top:.2mm;width:27mm;float:bottom;text-align:right;font-size:6pt">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=2">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                </xsl:call-template>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Right Box 12b-->
                      <!-- Left Box 12c -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12c
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px;
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                        <span style="font-size:6pt;padding-top:1mm;width:7mm;float:bottom;">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=3">
                                <span style="float:left">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                  </xsl:call-template>
                                </span>
                                <br/>
                                <span style="float:right">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                  </xsl:call-template>
                                </span>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Left Box 12c-->
                      <!-- Right Box 12c -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px; 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                        <span style="padding-top:.2mm;width:27mm;float:bottom;text-align:right;font-size:6pt">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=3">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                </xsl:call-template>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Right Box 12c-->
                      <!-- Left Box 12d -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px solid black;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12d
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px; 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                        <span style="font-size:6pt;padding-top:1mm;width:7mm;float:bottom;">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=4">
                                <span style="float:left">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                  </xsl:call-template>
                                </span>
                                <br/>
                                <span style="float:right">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                  </xsl:call-template>
                                </span>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Left Box 12d-->
                      <!-- Right Box 12d -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                        <span style="padding-top:.2mm;width:27mm;float:bottom;text-align:right;font-size:6pt">
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=4">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                </xsl:call-template>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </span>
                      </div><!-- Closes Right Box 12d-->
                    </div><!-- Closes Boxes 12a, 12b, 12c and 12d-->
                    <!-- Grey box -->
                    <div class="styIRSW2leftBox" style="width:40.5mm;height:5.2mm;border-top:0px; 
                      background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                    </div><!-- Closes Grey Box-->
                  </div><!-- Closes Boxes 12a, 12b, 12c, 12d and Grey box when No data or data less than 4 items-->
                </xsl:if>
                                
                <!-- Code for Separated Print Option to display See Additional Data Table (>4 items).  But uses code 
                      for No Data in Boxes 12a, 12b, 12c and 12d or less than 4 data items-->
                <xsl:if test="($Print = $Separated) and (count($FormW2Data/EmployersUseGrp)>4)">
                  <!-- Big Box covers boxes 12a, 12b, 12c, 12d and Grey box -->                
                  <div class="styIRSW2leftBox" style="width:40.3mm;height:46.5mm; 
                    border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                    <!-- Boxes 12a, 12b, 12c and 12d -->
                    <div class="styIRSW2leftBox" style="width:40.5mm;height:9.55mm;
                      border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                      <!-- Left Box 12a -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;
                        border-left:0px;border-right:0px;border-top:0px;border-bottom:0px">
                        <span style="width:1mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12a</span>
                        <span style="width:.8mm;"/>
                        <span style="font-size:7.5">See instructions for box 12</span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.55mm;border-top:0px;
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-left:.5mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c<br/>o<br/>d<br/>e</div>
                      </div><!-- Closes left box 12a-->
                      <!-- Right Box 12a -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.55mm;font-size:6pt;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                         <br/>
                         <span style="width:4px"/>
                         <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormW2Data/EmployersUseGrp"/>
                         </xsl:call-template>
                      </div><!-- Closes Right Box 12a-->
                      <!-- Left Box 12b -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12b
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.6mm;border-top:0px; 
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-left:.5mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c<br/>o<br/>d<br/>e</div>
                      </div><!-- Closes Left Box 12b-->
                      <!-- Right Box 12b -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.6mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                      </div><!-- Closes Right Box 12b-->
                      <!-- Left Box 12c -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12c
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px;
                        border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-left:.5mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c<br/>o<br/>d<br/>e</div>
                      </div><!-- Closes Left Box 12c-->
                      <!-- Right Box 12c -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px; 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                      </div><!-- Closes Right Box 12c-->
                      <!-- Left Box 12d -->
                      <div class="styIRSW2leftBox" style="width:40.5mm;height:2mm;border-top:0px;
                        border-left:0px solid black;border-right:0px;border-bottom:0px">
                        <span style="width:1.5mm"/>
                        <span style="font-size: 6.5pt;font-weight:bold;">12d
                           <span style="width:.5mm"/>
                        </span>
                      </div>
                      <div class="styIRSW2leftBox" style="width:12mm;height:7.5mm;border-top:0px; 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <div class="styUseLbl" style="font-size:5;width:2mm;padding-left:.5mm;padding-top:.1mm;
                          border-right-width:0px;padding-bottom:.1mm">c<br/>o<br/>d<br/>e</div>
                      </div><!-- Closes Left Box 12d-->
                      <!-- Right Box 12d -->
                      <div class="styIRSW2leftBox" style="width:28.7mm;height:7.5mm;border-top:0px 
                        border-left:0px;border-right:0px;border-bottom:1px solid black">
                        <br/>
                      </div><!-- Closes Right Box 12d-->
                    </div><!-- Closes Boxes 12a, 12b, 12c and 12d-->
                    <!-- Grey box -->
                    <div class="styIRSW2leftBox" style="width:40.5mm;height:5.2mm;border-top:0px; 
                      background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                    </div><!-- Closes Grey Box-->
                  </div><!-- Closes Big box that covers boxes 12a, 12b, 12c, 12d and grey box -->
                </xsl:if><!-- Closes Code for Separated Print Option to display See Additional Data Table (>4 items).
                                  But uses code for No Data in Boxes 12a, 12b, 12c and 12d or less than 4 data items-->
                 
                <!-- Code for inline print for boxes 12a, 12b, 12c and 12d when data is greater than 4 items -->
                <xsl:if test="(($Print = 'inline') and (count($FormW2Data/EmployersUseGrp)>4))">
                  <!-- Boxes 12a, 12b, 12c and 12d and Grey Box-->
                  <div class="styGenericDiv">
                    <div style="width:36.55mm;height:4mm;border-top:0px;
                      border-left:0px;border-right:0px;border-bottom:0px;clear:none;">
                      <!-- Header Box 12a -->
                      <!--<div class="styTableCellText" style="width:37mm;height:2mm;border-top:0px; 
                             border-left:0px;border-right:0px;border-bottom:0px;background-color:yellow">-->
                      <span style="width:1mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">12a</span>
                      <span style="width:.8mm"/>
                      <span style="font-size: 7">See instructions for box 12</span>
                      <span style="width:3.5mm;"/>
                    </div>
                    <!-- Code for Button display logic, div class="styTableContainer" and print logic to call SetInitialState
                          was deleted out for inline print-->
                    <!-- Big box for Box 12 and Grey Box-->
                    <table class="styTable" cellspacing="0">
                      <tfoot/>                              
                      <tbody>
                        <xsl:if test="($Print = 'inline') and (count($FormW2Data/EmployersUseGrp)>4)">
                          <!-- Box 12a-->
                          <tr>
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">              
                              <!-- Left Box 12a -->
                              <div style="width:11mm;height:8.3mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=1">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes left box 12a-->
                              <!-- Right Box 12a -->
                              <td class="styTableCellText" style="width:26mm;height:8.3mm;border-top:0px;
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/>
                                <span style="padding-top:.1mm;width:22mm;float:bottom;font-size:6pt;
                                  text-align:right;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=1">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12a -->
                            </td>
                          </tr><!-- Closes Box 12a -->
                          <!-- Box 12b-->                        
                          <tr>
                            <!-- Header Box 12b -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12b
                                <span style="width:.5mm"/>
                              </span>
                              <!--Left Box 12b-->
                              <div style="width:11mm;height:8.3mm;border-top:0px;
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=2">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12b -->
                            </td><!-- Closes Header 12b -->
                            <!-- Right Box 12b -->
                            <td class="styTableCellText" style="width:26mm;height:8.3mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <br/><br/>
                              <span style="padding-top:.2mm;width:22mm;float:bottom;font-size:6pt;
                                text-align:right;">
                                <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                  <xsl:choose>
                                    <xsl:when test="position()=2">
                                      <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                      </xsl:call-template>
                                    </xsl:when>
                                  </xsl:choose>
                                </xsl:for-each>
                              </span>
                            </td><!-- Closes Right Box 12b -->
                          </tr><!-- Closes Box 12b --> 
                          <!-- Box 12c -->
                          <tr>
                            <!-- Header Box 12c -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12c
                                <span style="width:.5mm"/>
                              </span>
                              <!-- Left Box 12c -->
                              <div style="width:11mm;height:8.35mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=3">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12c-->
                              <!-- Right Box 12c -->
                              <td class="styTableCellText" style="width:26mm;height:8.35mm;border-top:0px;
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/><br/>
                                <span style="padding-top:.2mm;width:22mm;float:bottom;
                                  text-align:right;font-size:6pt">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=3">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12c -->
                            </td><!-- Closes Header Box 12c -->
                          </tr><!-- Closes Box 12c -->
                          <!-- Box 12d -->
                          <tr>
                            <!-- Header Box 12d -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px; 
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12d
                                <span style="width:.5mm"/>
                              </span>
                              <!-- Left Box 12d -->
                              <div style="width:11mm;height:8.4mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=4">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12d -->
                              <!-- Right Box 12d -->
                              <td class="styTableCellText" style="width:26mm;height:8.4mm;border-top:0px; 
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/><br/>
                                <span style="padding-top:.2mm;width:22mm;float:bottom;
                                  text-align:right;font-size:6pt">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=4">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12d -->
                            </td><!-- Closes Header Box 12d -->
                          </tr><!-- Closes Box 12d -->
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=5">
                                <span class="styBoldText"/>
                                <!-- Box 12e -->
                                <tr>
                                  <!-- Header Box 12e -->
                                  <td class="styTableCellText" style="width:36mm;border-top:0px;
                                    height:2mm;border-left:0px;border-right:0px;border-bottom:1px solid black">
                                    <span style="width:1.5mm"/>
                                    <span style="font-size: 6.5pt;font-weight:bold;">
                                      12<xsl:call-template name="AlphaPosition">
                                            <xsl:with-param name="Position" select="position()"/>
                                          </xsl:call-template>
                                          <span style="width:.5mm"/>
                                    </span>
                                    <!-- Left Box 12e -->                                  
                                    <div style="width:11mm;height:8.4mm;
                                      border-left:0px;border-right:1px solid black;border-top:0px;
                                      border-bottom:0px solid black">
                                      <div class="styUseLbl" style="font-size:5;width:2mm;
                                        border-right-width:0px;padding-top:.1mm;padding-bottom:.1mm">c o d e</div>
                                      <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </span>
                                    </div><!-- Closes Left Box 12e-->
                                    <!-- Right Box 12e -->
                                    <td class="styTableCellText" style="width:26mm;height:8.4mm;
                                      border-left:0px;border-right:0px;border-top:0px;border-bottom:1px solid black">
                                      <span style="padding-top:.2mm;width:22mm;float:bottom;
                                        text-align:right;font-size:6pt">
                                        <br/><br/>
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </span>
                                    </td><!-- Closes Right Box 12e -->
                                  </td><!-- Closes Header 12e -->
                                </tr><!-- Closes Box 12e -->
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:choose>
                                  <xsl:when test="position()>=6">
                                    <!-- Boxes 12f and above -->                                  
                                    <tr>
                                      <!-- Header Boxes 12f and above -->
                                      <td class="styTableCellText" style="width:36mm;height:2mm;
                                        border-left:0px;border-right:0px;border-top:0px;border-bottom:1px solid black">
                                        <span style="width:1.5mm"/>
                                        <span style="font-size: 6.5pt;font-weight:bold;">
                                          12<xsl:call-template name="AlphaPosition">
                                                <xsl:with-param name="Position" select="position()"/>
                                              </xsl:call-template>
                                              <span style="width:.5mm"/>
                                        </span>
                                        <!-- Left Boxes 12f and above -->
                                        <div style="width:11mm;height:8.4mm;
                                          border-left:0px;border-top:0px;border-right:1px solid black;
                                          border-bottom:0px solid black">
                                          <div class="styUseLbl" style="font-size:5;padding-top:.1mm;
                                            width:2mm;border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                          <span style="font-size:6pt;padding-top:1mm; width:5mm;float:bottom;">
                                            <span style="float:left">
                                              <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                              </xsl:call-template>
                                            </span>
                                            <br/>
                                            <span style="float:right">
                                              <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                              </xsl:call-template>
                                            </span>
                                          </span>
                                        </div><!-- Closes Left Boxes 12f and above-->
                                        <!-- Right Boxes 12f and above -->
                                        <td class="styTableCellText" style="width:26mm;height:8.4mm;
                                          border-left:0px solid black;border-right:0px;border-top:0px;
                                          border-bottom:1px solid black">
                                          <br/><br/>
                                          <span style="padding-top:.2mm;width:22mm;
                                            float:bottom;text-align:right;font-size:6pt">
                                            <xsl:call-template name="PopulateAmount">
                                              <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                            </xsl:call-template>
                                          </span>
                                        </td><!-- Closes Right Boxes 12f and above -->
                                      </td><!-- Closes Header Boxes 12f and above -->
                                    </tr><!-- Closes Boxes 12f and above -->
                                  </xsl:when>
                                </xsl:choose>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </xsl:if>
                        <!-- Closes Boxes 12a, 12b, 12c, 12d-->
                        <!-- Grey box -->
                        <td class="styTableCellText" style="width:12mm;height:3.5mm;border-top:0px;
                          background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                        </td>
                        <td class="styTableCellText" style="width:21.7mm;height:3.5mm;border-top:0px;
                          background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                        </td><!--Closes Grey box-->
                      </tbody>
                    </table>
                  </div><!-- Closes Big Box 12 and Grey Box -->  
                </xsl:if>             
                
                <!-- Code for boxes 12a, 12b, 12c and 12d when data is greater than 4 items -->
                <xsl:if test="(($Print != $Separated) and ($Print !='inline') and (count($FormW2Data/EmployersUseGrp)>4))">
                  <!-- Boxes 12a, 12b, 12c and 12d -->
                  <div class="styGenericDiv" style="width:36.55mm;height:4mm;border-top:0px;
                    border-left:0px;border-right:0px;border-bottom:0px;">
                    <!-- Header Box 12a -->
                    <!--<div class="styTableCellText" style="width:37mm;height:2mm;border-top:0px; 
                           border-left:0px;border-right:0px;border-bottom:0px;background-color:yellow">-->
                    <span style="width:1mm"/>
                    <span style="font-size: 6.5pt;font-weight:bold;">12a</span>
                    <span style="width:.8mm"/>
                    <span style="font-size: 7">See instructions for box 12</span>
                    <span style="width:3.5mm;"/>
                  </div>
                  <div style="float:right;width:3.2mm">
                    <!--Button display logic -->
                    <xsl:call-template name="SetDynamicTableToggleButton">
                      <xsl:with-param name="TargetNode" select="$FormW2Data/EmployersUseGrp"/>
                      <xsl:with-param name="containerHeight" select="3"/>
                      <xsl:with-param name="headerHeight" select="1"/>
                      <xsl:with-param name="containerID" select=" 'empUseGrptbl' "/>
                    </xsl:call-template>
                    <!-- End Button display logic-->
                  </div>
                  <!-- Big box for Box 12 and Grey Box-->
                  
                  <div class="styTableContainer" style="width:40.50mm;height:47mm;float:left;
                    clear:none;border-right:0px;border-bottom:0px;border-left:0px;border-top:0px" id="empUseGrptbl">
                    <!-- print logic -->
                    <!--<xsl:call-template name="SetInitialState"/>-->
                    <!-- end-->
                    <table class="styTable" cellspacing="0">
                      <tfoot/>                              
                      <tbody>
                        <xsl:if test="($Print != $Separated) and (count($FormW2Data/EmployersUseGrp)>4)">
                          <!-- Box 12a-->
                          <tr>
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">              
                              <!-- Left Box 12a -->
                              <div class="styGenericDiv" style="width:11mm;height:8.3mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=1">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes left box 12a-->
                              <!-- Right Box 12a -->
                              <td class="styTableCellText" style="width:26mm;height:8.3mm;border-top:0px;
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/>
                                <span style="padding-top:.1mm;width:22mm;float:bottom;font-size:6pt;
                                  text-align:right;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=1">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12a -->
                            </td>
                          </tr><!-- Closes Box 12a -->
                          <!-- Box 12b-->                        
                          <tr>
                            <!-- Header Box 12b -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12b
                                <span style="width:.5mm"/>
                              </span>
                              <!--Left Box 12b-->
                              <div class="styGenericDiv" style="width:11mm;height:8.3mm;border-top:0px;
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=2">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12b -->
                            </td><!-- Closes Header 12b -->
                            <!-- Right Box 12b -->
                            <td class="styTableCellText" style="width:26mm;height:8.3mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <br/><br/>
                              <span style="padding-top:.2mm;width:22mm;float:bottom;font-size:6pt;
                                text-align:right;">
                                <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                  <xsl:choose>
                                    <xsl:when test="position()=2">
                                      <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                      </xsl:call-template>
                                    </xsl:when>
                                  </xsl:choose>
                                </xsl:for-each>
                              </span>
                            </td><!-- Closes Right Box 12b -->
                          </tr><!-- Closes Box 12b --> 
                          <!-- Box 12c -->
                          <tr>
                            <!-- Header Box 12c -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12c
                                <span style="width:.5mm"/>
                              </span>
                              <!-- Left Box 12c -->
                              <div class="styGenericDiv" style="width:11mm;height:8.35mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=3">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12c-->
                              <!-- Right Box 12c -->
                              <td class="styTableCellText" style="width:26mm;height:8.35mm;border-top:0px;
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/><br/>
                                <span style="padding-top:.2mm;width:22mm;float:bottom;
                                  text-align:right;font-size:6pt">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=3">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12c -->
                            </td><!-- Closes Header Box 12c -->
                          </tr><!-- Closes Box 12c -->
                          <!-- Box 12d -->
                          <tr>
                            <!-- Header Box 12d -->
                            <td class="styTableCellText" style="width:36mm;border-top:0px; 
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="width:1.5mm"/>
                              <span style="font-size: 6.5pt;font-weight:bold;">12d
                                <span style="width:.5mm"/>
                              </span>
                              <!-- Left Box 12d -->
                              <div class="styGenericDiv" style="width:11mm;height:8.4mm;border-top:0px; 
                                border-left:0px;border-right:1px solid black;border-bottom:0px solid black">
                                <div class="styUseLbl" style="font-size:5;width:2mm;padding-top:.1mm;
                                  border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=4">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </div><!-- Closes Left Box 12d -->
                              <!-- Right Box 12d -->
                              <td class="styTableCellText" style="width:26mm;height:8.4mm;border-top:0px; 
                                border-left:0px;border-right:0px;border-bottom:1px solid black">
                                <br/><br/>
                                <span style="padding-top:.2mm;width:22mm;float:bottom;
                                  text-align:right;font-size:6pt">
                                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                                    <xsl:choose>
                                      <xsl:when test="position()=4">
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                    </xsl:choose>
                                  </xsl:for-each>
                                </span>
                              </td><!-- Closes Right Box 12d -->
                            </td><!-- Closes Header Box 12d -->
                          </tr><!-- Closes Box 12d -->
                          <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                            <xsl:choose>
                              <xsl:when test="position()=5">
                                <span class="styBoldText"/>
                                <!-- Box 12e -->
                                <tr>
                                  <!-- Header Box 12e -->
                                  <td class="styTableCellText" style="width:36mm;border-top:0px;
                                    height:2mm;border-left:0px;border-right:0px;border-bottom:1px solid black">
                                    <span style="width:1.5mm"/>
                                    <span style="font-size: 6.5pt;font-weight:bold;">
                                      12<xsl:call-template name="AlphaPosition">
                                            <xsl:with-param name="Position" select="position()"/>
                                          </xsl:call-template>
                                          <span style="width:.5mm"/>
                                    </span>
                                    <!-- Left Box 12e -->                                  
                                    <div class="styGenericDiv" style="width:11mm;height:8.4mm;
                                      border-left:0px;border-right:1px solid black;border-top:0px;
                                      border-bottom:0px solid black">
                                      <div class="styUseLbl" style="font-size:5;width:2mm;
                                        border-right-width:0px;padding-top:.1mm;padding-bottom:.1mm">c o d e</div>
                                      <span style="font-size:6pt;padding-top:1mm;width:5mm;float:bottom;">
                                        <span style="float:left">
                                          <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                          </xsl:call-template>
                                        </span>
                                        <br/>
                                        <span style="float:right">
                                          <xsl:call-template name="PopulateAmount">
                                            <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                          </xsl:call-template>
                                        </span>
                                      </span>
                                    </div><!-- Closes Left Box 12e-->
                                    <!-- Right Box 12e -->
                                    <td class="styTableCellText" style="width:26mm;height:8.4mm;
                                      border-left:0px;border-right:0px;border-top:0px;border-bottom:1px solid black">
                                      <span style="padding-top:.2mm;width:22mm;float:bottom;
                                        text-align:right;font-size:6pt">
                                        <br/><br/>
                                        <xsl:call-template name="PopulateAmount">
                                          <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                        </xsl:call-template>
                                      </span>
                                    </td><!-- Closes Right Box 12e -->
                                  </td><!-- Closes Header 12e -->
                                </tr><!-- Closes 12e -->
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:choose>
                                  <xsl:when test="position()>=6">
                                    <!-- Boxes 12f and above -->                                  
                                    <tr>
                                      <!-- Header Boxes 12f and above -->
                                      <td class="styTableCellText" style="width:36mm;height:2mm;
                                        border-left:0px;border-right:0px;border-top:0px;border-bottom:1px solid black">
                                        <span style="width:1.5mm"/>
                                        <span style="font-size: 6.5pt;font-weight:bold;">
                                          12<xsl:call-template name="AlphaPosition">
                                                <xsl:with-param name="Position" select="position()"/>
                                              </xsl:call-template>
                                              <span style="width:.5mm"/>
                                        </span>
                                        <!-- Left Boxes 12f and above -->
                                        <div class="styGenericDiv" style="width:11mm;height:8.4mm;
                                          border-left:0px;border-top:0px;border-right:1px solid black;
                                          border-bottom:0px solid black">
                                          <div class="styUseLbl" style="font-size:5;padding-top:.1mm;
                                            width:2mm;border-right-width:0px;padding-bottom:.1mm">c o d e</div>
                                          <span style="font-size:6pt;padding-top:1mm; width:5mm;float:bottom;">
                                            <span style="float:left">
                                              <xsl:call-template name="PopulateText">
                                                <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                              </xsl:call-template>
                                            </span>
                                            <br/>
                                            <span style="float:right">
                                              <xsl:call-template name="PopulateAmount">
                                                <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                              </xsl:call-template>
                                            </span>
                                          </span>
                                        </div><!-- Closes Left Boxes 12f and above-->
                                        <!-- Right Boxes 12f and above -->
                                        <td class="styTableCellText" style="width:26mm;height:8.4mm;
                                          border-left:0px solid black;border-right:0px;border-top:0px;
                                          border-bottom:1px solid black">
                                          <br/><br/>
                                          <span style="padding-top:.2mm;width:22mm;
                                            float:bottom;text-align:right;font-size:6pt">
                                            <xsl:call-template name="PopulateAmount">
                                              <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                                            </xsl:call-template>
                                          </span>
                                        </td><!-- Closes Right Boxes 12f and above -->
                                      </td><!-- Closes Header Boxes 12f and above -->
                                    </tr><!-- Closes Boxes 12f and above -->
                                  </xsl:when>
                                </xsl:choose>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </xsl:if>
                        <!--</div>--><!-- Closes Boxes 12a, 12b, 12c, 12d-->
                        <!-- Grey box -->
                        <td class="styTableCellText" style="width:12mm;height:3.5mm;border-top:0px;
                          background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                        </td>
                        <td class="styTableCellText" style="width:21.7mm;height:3.5mm;border-top:0px;
                          background-color:lightgrey;border-left:0px;border-right:0px;border-bottom:0px">
                        </td>
                        <!--Closes Grey box-->
                      </tbody>
                    </table>
                  </div><!-- Closes Big Box 12 and Grey Box -->
                  <!-- Set Initial Height of Above Table -->
                  <xsl:call-template name="SetInitialDynamicTableHeight">
                    <xsl:with-param name="TargetNode" select="$FormW2Data/EmployersUseGrp"/>
                    <xsl:with-param name="containerHeight" select="3"/>
                    <xsl:with-param name="headerHeight" select="1"/>
                    <xsl:with-param name="containerID" select=" 'empUseGrptbl' "/>        
                  </xsl:call-template>
                  <!-- End Set Initial Height of Above Table --> 
                </xsl:if>
              </div><!-- Closes Boxes 11, 12a, 12b, 12c, 12d, 13 and 14 -->
            </div><!-- Closes Employee's first name and initial, last name, suff and Boxes 11-14 -->
            <!-- Big Box covers boxes 15-20 -->
            <div style="width:187mm;font-size:6.3pt;border-left:0px;
              border-right:0px;border-top:0px;border-bottom:0px">
              <!-- Separated Print code  to See Additional Data Message for Boxes 15-17 (data>=3) 
                    but using code for no data in boxes 15-17-->
              <xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &gt;=3) and ($Print = $Separated)">
                <!-- Big Box covers boxes 15-17 -->
                <div class="styIRSW2leftBox" style="width:103mm;height:12mm;border-left:0px; 
                  border-right:0px;border-top:0px;border-bottom:0px">
                  <!--<xsl:if test="($Print != $Separated) or (count($FormW2Data/W2StateLocalTaxGrp) &lt;= 2)">-->
                    <!-- Top Box 15 State -->
                    <div class="styIRSW2leftBox" style="width:11mm;height:3mm; border-left:0px;
                                   border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.2mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">15
                                       <span style="width:.3mm"/>
                      </span>
                      <span style="font-size: 6pt;">State</span>
                    </div><!-- Closes Top Box 15 State-->
                    <!-- Top Box 15 Employer's State ID Number-->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:1.5mm"/>
                      <span style="font-size: 6pt">Employer's state ID number</span>
                    </div><!-- Closes Top Box 15 Employer's State ID Number-->
                    <!-- Top Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">16
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State wages, tips, etc.</span>
                    </div><!-- Closes Top Box 16-->
                    <!-- Top Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm; 
                      border-left:0px solid black;border-right:1px solid black;
                      border-top:0px solid black;border-bottom:0px solid black">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">17
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State income tax</span>
                    </div><!-- Closes Top Box 17-->
                    <br/>
                    <!-- First row Bottom Box 15 State-->
                    <div class="styIRSW2leftBox" style="width:11mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!-- Closes First row Bottom Box 15 State-->
                    <!-- First row Bottom Box 15 Employer's State ID Number -->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <br/>
                      <span style="width:4px"/>
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp"/>
                      </xsl:call-template>
                    </div><!-- Closes First row Bottom Box 15 Employer's State ID Number-->
                    <!-- First row Bottom Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes First row Bottom Box 16-->
                    <!-- Bottom Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes First row Bottom box 17-->
                    <!-- 2nd Row Bottom Box 15 State -->
                    <div class="styIRSW2leftBox" style="width:11mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!-- Closes Second row Bottom Box 15 State-->
                    <!-- Second row Bottom Box 15 Employer's State ID Number -->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!-- Closes Second row Bottom box 15 Employer's State ID Number-->
                    <!-- Second row Bottom Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes Second row Bottom box 16-->
                    <!-- Second row Bottom Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes Second row bottom box 17-->
                </div><!-- Closes Big Box that covers boxes 15-17 -->
                <!-- Separated Print code  to See Additional Data Message for Boxes 18-20 (data>=3) 
                    but using code for no data in boxes 18-20-->
                <!--<xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &lt;=2)">-->
                <!-- Big Box covers boxes 18-20 -->
                <div class="styIRSW2leftBox" style="width:84mm;border-left:0px;
                  border-right:0px;border-top:0px;border-bottom:0px">
                  <!--<xsl:if test="($Print != $Separated) or (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &lt;= 2)">-->
                    <!-- Top Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">18
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local wages, tips, etc.</span>
                    </div><!-- Closes top box 18-->
                    <!-- Top Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px;">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">19
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local income tax</span>
                    </div><!-- Closes top box 19-->
                    <!-- Top Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:3mm;border-left:0px;
                      border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">20
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Locality name</span>
                    </div><!-- Closes top box 20-->
                    <br/>
                    <!-- First row Bottom Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes First row bottom box 18-->
                    <!-- First row Bottom Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!-- Closes First row Bottom Box 19-->
                    <!-- First row Bottom Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:0px;border-bottom:1px solid black">
                    </div><!-- Closes First row Bottom Box 20 -->
                    <!-- Second row Bottom Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!--Closes Second row bottom box 18-->
                    <!-- Second row Bottom Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    </div><!-- Closes Second row Bottom Box 19-->
                    <!-- Second row Bottom Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:6mm;border-top:0px;
                      border-left:0px;border-right:0px;border-bottom:1px solid black">
                    </div><!-- Closes Second row Bottom Box 20 -->
                </div><!-- Closes Boxes 18-20 -->
              </xsl:if> 
              
              <!-- Code for No Data in Boxes 15, 16, 17 or less than 2 data items-->
              <xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &lt;=2)">
                <!-- Big Box covers boxes 15-17 -->
                <div class="styIRSW2leftBox" style="width:103mm;height:12mm;border-left:0px; 
                  border-right:0px;border-top:0px;border-bottom:0px">
                  <xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &lt;= 2)">
                    <!-- Top Box 15 State -->
                    <div class="styIRSW2leftBox" style="width:11mm;height:3mm; border-left:0px;
                      border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.2mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">15
                        <span style="width:.3mm"/>
                      </span>
                      <span style="font-size: 6pt;">State</span>
                    </div><!-- Closes Top Box 15 State-->
                    <!-- Top Box 15 Employer's State ID Number-->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:1.5mm"/>
                      <span style="font-size: 6pt">Employer's state ID number</span>
                    </div><!-- Closes Top Box 15 Employer's State ID Number-->
                    <!-- Top Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">16
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State wages, tips, etc.</span>
                    </div><!-- Closes Top Box 16-->
                    <!-- Top Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm; 
                      border-left:0px solid black;border-right:1px solid black;
                      border-top:0px solid black;border-bottom:0px solid black">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">17
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State income tax</span>
                    </div><!-- Closes Top Box 17-->
                    <br/>
                    <!-- First row Bottom Box 15 State-->
                    <div class="styIRSW2leftBox" style="width:11mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:10mm;float:bottom;text-align:left">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!-- Closes First row Bottom Box 15 State-->
                    <!-- First row Bottom Box 15 Employer's State ID Number -->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:31mm;float:bottom;text-align:left">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="EmployersStateIdNumber"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!-- Closes First row Bottom Box 15 Employer's State ID Number-->
                    <!-- First row Bottom Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:28mm;float:bottom;
                        text-align:right;font-size: 6pt;">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="StateWagesAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!--Closes First row Bottom Box 16-->
                    <!-- Bottom Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:28mm;float:bottom;
                        text-align:right;font-size: 6pt;">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="StateIncomeTaxAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!--Closes First row Bottom box 17-->
                  </xsl:if>
                  <!-- 2nd Row Bottom Box 15 State -->
                  <div class="styIRSW2leftBox" style="width:11mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:10mm;float:bottom;text-align:left">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!-- Closes Second row Bottom Box 15 State-->
                  <!-- Second row Bottom Box 15 Employer's State ID Number -->
                  <div class="styIRSW2leftBox" style="width:32.5mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:31mm;float:bottom;text-align:left">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EmployersStateIdNumber"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!-- Closes Second row Bottom box 15 Employer's State ID Number-->
                  <!-- Second row Bottom Box 16 -->
                  <div class="styIRSW2leftBox" style="width:30mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:28mm;float:bottom;
                      text-align:right;font-size: 6pt;">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="StateWagesAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!--Closes Second row Bottom box 16-->
                  <!-- Second row Bottom Box 17 -->
                  <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:28mm;float:bottom;
                      text-align:right;font-size: 6pt;">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="StateIncomeTaxAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!--Closes Second row bottom box 17-->
                </div><!-- Closes Boxes 15-17-->
                <!-- Code for No Data in Boxes 18, 19, 20 or less than 2 data items-->
                <!--<xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp) &lt;=2)">-->
                <!-- Big Box covers boxes 18-20 -->
                <div class="styIRSW2leftBox" style="width:84mm;border-left:0px;
                  border-right:0px;border-top:0px;border-bottom:0px">
                  <xsl:if test="(count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp) &lt;= 2)">
                    <!-- Top Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">18
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local wages, tips, etc.</span>
                    </div><!-- Closes top box 18-->
                    <!-- Top Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px;">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">19
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local income tax</span>
                    </div><!-- Closes top box 19-->
                    <!-- Top Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:3mm;border-left:0px;
                      border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">20
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Locality name</span>
                    </div><!-- Closes top box 20-->
                    <br/>
                    <!-- First row Bottom Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:28mm;float:bottom;
                        text-align:right;font-size: 6pt;">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="LocalWagesAndTipsAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!--Closes First row bottom box 18-->
                    <!-- First row Bottom Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:23mm;float:bottom;
                        text-align:right;font-size:6pt">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!-- Closes First row Bottom Box 19-->
                    <!-- First row Bottom Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:5.7mm;border-top:0px;
                      border-left:0px;border-right:0px;border-bottom:1px solid black">
                      <span style="padding-top:1mm;width:29mm;float:bottom;
                        text-align:left;font-size:6pt">
                        <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                          <xsl:choose>
                            <xsl:when test="position()=1">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="NameOfLocality"/>
                              </xsl:call-template>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                      </span>
                    </div><!-- Closes First row Bottom Box 20 -->
                  </xsl:if>
                  <!-- Second row Bottom Box 18 -->
                  <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:28mm;float:bottom;
                      text-align:right;font-size: 6pt;">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="LocalWagesAndTipsAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!--Closes Second row bottom box 18-->
                  <!-- Second row Bottom Box 19 -->
                  <div class="styIRSW2leftBox" style="width:24mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:23mm;float:bottom;
                      text-align:right;font-size:6pt">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!-- Closes Second row Bottom Box 19-->
                  <!-- Second row Bottom Box 20 -->
                  <div class="styIRSW2leftBox" style="width:30.7mm;height:6mm;border-top:0px;
                    border-left:0px;border-right:0px;border-bottom:1px solid black">
                    <span style="padding-top:1mm;width:29mm;float:bottom;
                      text-align:left;font-size:6pt">
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                        <xsl:choose>
                          <xsl:when test="position()=2">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="NameOfLocality"/>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                    </span>
                  </div><!-- Closes Second row Bottom Box 20 -->
                </div><!-- Closes Boxes 18-20 -->
              <!--</xsl:if>-->
              </xsl:if>
              
              <!--Code for 3 or more data lines for Boxes 15-17-->
              <xsl:if test="($Print != $Separated) and (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &gt;=3)">
                <!-- Big Box covers boxes 15-17 -->
                <div class="styIRSW2leftBox" style="width:103mm;border-left:0px; 
                  border-right:0px;border-top:0px;border-bottom:0px">
                  <xsl:if test="($Print != $Separated) or (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &gt;= 3)">
                    <!-- Top Box 15 State -->
                    <div class="styIRSW2leftBox" style="width:11mm;height:3mm; border-left:0px;
                      border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.2mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">15
                        <span style="width:.3mm"/>
                      </span>
                      <span style="font-size: 6pt;">State</span>
                    </div><!-- Closes Top Box 15 State-->
                    <!-- Top Box 15 Employer's State ID Number-->
                    <div class="styIRSW2leftBox" style="width:32.5mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:1.5mm"/>
                      <span style="font-size: 6pt">Employer's state ID number</span>
                    </div><!-- Closes Top Box 15 Employer's State ID Number-->
                    <!-- Top Box 16 -->
                    <div class="styIRSW2leftBox" style="width:30mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">16
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State wages, tips, etc.</span>
                    </div><!-- Closes Top Box 16-->
                    <!-- Top Box 17 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm;border-top:0px;
                      border-left:0px;border-right:1px solid black;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">17
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">State income tax</span>
                    </div><!-- Closes Top Box 17-->
                    <br/>
                    <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                      <xsl:choose>
                        <xsl:when test="position()=1">
                          <!-- First row Bottom Box 15 State-->
                          <div class="styIRSW2leftBox" style="width:11mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                            <span style="padding-top:1mm;width:10mm;float:bottom;text-align:left">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                              </xsl:call-template>
                            </span>
                          </div><!-- Closes First row Bottom Box 15 State-->
                          <div>
                            <!-- First row Bottom Box 15 Employer's State ID Number -->
                            <div class="styIRSW2leftBox" style="width:32.5mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:31mm;float:bottom;text-align:left">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="EmployersStateIdNumber"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes First row Bottom Box 15 Employer's State ID Number-->
                            <!-- First row Bottom Box 16 -->
                            <div class="styIRSW2leftBox" style="width:30mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="StateWagesAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes First row Bottom Box 16-->
                            <!-- First row Bottom Box 17 -->
                            <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="StateIncomeTaxAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes First row Bottom box 17-->
                          </div>
                        </xsl:when>
                        <xsl:otherwise>
                          <div style="width:102.7mm">
                            <!-- Second row Bottom Box 15 State -->
                            <div class="styIRSW2leftBox" style="width:11mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:10mm;float:bottom;text-align:left">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes Second row Bottom Box 15 State-->
                            <!-- Second row Bottom Box 15 Employer's State ID Number -->
                            <div class="styIRSW2leftBox" style="width:32.5mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:31mm;float:bottom;text-align:left">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="EmployersStateIdNumber"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes Second row Bottom box 15 Employer's State ID Number-->
                            <!-- Second row Bottom Box 16 -->
                            <div class="styIRSW2leftBox" style="width:30mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="StateWagesAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes Second row Bottom box 16-->
                            <!-- Second row Bottom Box 17 -->
                            <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="StateIncomeTaxAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes Second row bottom box 17-->
                          </div>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </xsl:if>
                </div><!--Closes Boxes 15-17 (3 or more data lines)-->
                <!--Code for 3 or more data lines for Boxes 18-20-->
                <!--<xsl:if test="($Print != $Separated) and 
                (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp) &gt;=3)">-->
                <!-- Big Box covers boxes 18-20 -->
                <div class="styIRSW2leftBox" style="width:84mm;height:12mm;border-left:0px;
                  border-right:0px;border-top:0px;border-bottom:0px;">
                  <xsl:if test="($Print != $Separated) or 
                    (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp) &gt;= 3)">
                    <!-- Top Box 18 -->
                    <div class="styIRSW2leftBox" style="width:29mm;height:3mm;border-top:0px; 
                      border-left:0px;border-right:1px solid black;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">18
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local wages, tips, etc.</span>
                    </div><!-- Closes top box 18-->
                    <!-- Top Box 19 -->
                    <div class="styIRSW2leftBox" style="width:24mm;height:3mm;border-left:0px;
                      border-right:1px solid black;border-top:0px;border-bottom:0px;">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">19
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Local income tax</span>
                    </div><!-- Closes top box 19-->
                    <!-- Top Box 20 -->
                    <div class="styIRSW2leftBox" style="width:30.7mm;height:3mm;border-left:0px;
                      border-right:0px;border-top:0px;border-bottom:0px">
                      <span style="width:.5mm"/>
                      <span style="font-size: 6.5pt;font-weight:bold;">20
                        <span style="width:.5mm"/>
                      </span>
                      <span style="font-size: 6pt">Locality name</span>
                    </div><!-- Closes top box 20-->
                    <br/>
                    <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                      <xsl:choose>
                        <xsl:when test="position()=1">
                          <!-- First row Bottom Box 18 -->
                          <div>
                            <div class="styIRSW2leftBox" style="width:29mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="LocalWagesAndTipsAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes First row bottom box 18-->
                            <!-- First row Bottom Box 19 -->
                            <div class="styIRSW2leftBox" style="width:24mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:23mm;float:bottom;
                                text-align:right;font-size:6pt">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes First row Bottom Box 19-->
                            <!-- First row Bottom Box 20 -->
                            <div class="styIRSW2leftBox" style="width:30.7mm;height:5.7mm;border-top:0px;
                              border-left:0px;border-right:0px;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:29mm;float:bottom;
                                text-align:left;font-size:6pt">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes First row Bottom Box 20 -->
                          </div>
                        </xsl:when>
                        <xsl:otherwise>
                          <div style="width:83.9mm">
                            <!-- Second row Bottom Box 18 -->
                            <div class="styIRSW2leftBox" style="width:29mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:28mm;float:bottom;
                                text-align:right;font-size: 6pt;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="LocalWagesAndTipsAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!--Closes Second row bottom box 18-->
                            <!-- Second row Bottom Box 19 -->
                            <div class="styIRSW2leftBox" style="width:24mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:1px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:23mm;float:bottom;
                                text-align:right;font-size:6pt">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes Second row Bottom Box 19-->
                            <!-- Second row Bottom Box 20 -->
                            <div class="styIRSW2leftBox" style="width:30.7mm;height:6mm;border-top:0px;
                              border-left:0px;border-right:0px solid black;border-bottom:1px solid black">
                              <span style="padding-top:1mm;width:29mm;float:bottom;
                                text-align:left;font-size:6pt">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="NameOfLocality"/>
                                </xsl:call-template>
                              </span>
                            </div><!-- Closes Second row Bottom Box 20 -->
                          </div>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </xsl:if>
                </div><!-- Closes Boxes 18-20 (3 or more data lines)-->
              <!--</xsl:if>-->
              </xsl:if>
            </div><!-- Closes Boxes 15-20-->
          </div><!-- Closes Big box for entire form -->
          <!-- Last lines under form -->
          <div class="styBB" style="width:187mm;border-bottom:0px solid black;">
            <div class="styFNBox" style="width:28mm;height:6mm;border-right:0px solid black;">Form 
                          <span class="styFormNumber">W-2</span>
            </div>
            <div class="styIRSW2leftBox" style="width:26mm;height:6mm;border-left:0px solid black;
              border-right:0px solid black;padding:top:5mm">
              <span style="font-size: 9pt;font-weight:bold;">Wage and Tax</span>
              <br/>
              <span style="font-size: 9pt;font-weight:bold;">Statement</span>
              <br/>
            </div>
            <div class="styIRSW2leftBox" style="width:50mm;height:6mm;border-left:0px solid black;
               border-right:0px solid black">
              <span style="width:30mm;"/>
              <span class="styTY" style="height:8mm;">2009</span>
            </div>
            <div class="styIRSW2leftBox" style="width:82.2mm;height:6mm;border-left:0px solid black;
               border-right:0px solid black">
              <span style="width:22mm;"/>
              <span style="font-size: 6pt;">
                             Department of the Treasury<img src="{$ImagePath}/W2_Longdash.gif" alt="longdash"/>Internal Revenue Service</span>
            </div>
            <br/>
            <div class="styIRSW2leftBox" style="width:105mm;height:6mm;border-left:0px;
               border-right:0px solid black">
              <span style="font-size: 7pt;">
                <b>Copy B</b>
                <img src="{$ImagePath}/W2_Longdash.gif" alt="longdash"/>
                <b>To Be Filed With Employee's FEDERAL Tax Return.</b>
              </span>
              <br/>
              <span style="font-size: 6.5pt;"> 
                            This information is being furnished to the Internal Revenue Service.</span>
            </div>
            <br/>
            <div class="pageEnd" style="width:187mm;"/>
            <!-- BEGIN Left Over Table -->
            <div class="styLeftOverTitleLine" id="LeftoverData">
              <div class="styLeftOverTitle">
                            Additional Data</div>
              <div class="styLeftOverButtonContainer">
                <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
              </div>
            </div>
            <table class="styLeftOverTbl">
              <xsl:call-template name="PopulateCommonLeftover">
                <xsl:with-param name="TargetNode" select="$FormW2Data"/>
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
              <!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
              <xsl:if test="$FormW2Data/CorrectedW2Ind">
                <tr>
                  <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/CorrectedW2Ind"/>
                        <xsl:with-param name="BackupName">CorrectedW2Ind</xsl:with-param>
                      </xsl:call-template>
                      Corrected W2 Indicator:
                    </label>
                  </td>
                  <td class="styLeftOverTableRowAmount" style="width:87mm;">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormW2Data/CorrectedW2Ind"/>
                        <xsl:with-param name="BackupName">CorrectedW2Ind</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </td>
                </tr>
              </xsl:if>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Standard or NonStandard Cd</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormW2Data/StandardOrNonStandardCd"/>
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Line C - Employer Name Control</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$FormW2Data/EmployerNameControl"/>
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
            </table>
            <br/>
            <!-- Optional Separated Print for Repeating Data Table for Line 12 -->
            <xsl:if test="($Print = $Separated) and (count($FormW2Data/EmployersUseGrp) &gt;4)">
              <span class="styRepeatingDataTitle"> Form W2, Line 12</span>
              <table class="styDepTbl" style="width:77mm;font-size:7pt;">
                <thead class="styTableThead">
                  <!--Label the Column Headers-->
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" align="left" style="width:40mm;">See instructions for box 12</th>
                    <th class="styDepTblCell" scope="col" align="left" style="width:33mm;"/>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Box 12 -->
                  <xsl:for-each select="$FormW2Data/EmployersUseGrp">
                    <tr style="border-color:black;">
                      <!-- Define background colors to the rows -->
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <!-- Left Box 12 -->
                      <td class="styDepTblCell" style="width:5mm;">
                        <xsl:if test="position()>=1">
                          <div class="styGenericDiv">
                            <span style="font-size: 7pt;font-weight:bold;width:5mm">
                          12<xsl:call-template name="AlphaPosition">
                                <xsl:with-param name="Position" select="position()"/>
                              </xsl:call-template>
                            </span>
                          </div>
                          <div class="styIRSW2leftBox" style="font-size:7pt;width:11mm;height:5mm;
                            border-left:0px;">
                            <div class="styIRSW2leftBox" style="font-size:7pt;width:2.5mm;border-left:0px;
                              border-right-width:0px;padding-top:.1mm;padding-bottom:.1mm;">
                              <img src="{$ImagePath}/W2_code2.gif" alt="code"/>
                            </div>
                            <br/>
                            <span style="font-size:7pt;padding-top:1mm;">
                              <span style="float:left">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="EmployersUseCd"/>
                                </xsl:call-template>
                              </span>
                              <br/>
                              <span style="float:right">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="PriorYearUserraContribution"/>
                                </xsl:call-template>
                              </span>
                            </span>
                          </div>
                        </xsl:if>
                      </td><!-- Closes Left Box 12-->
                      <!-- Right Box 12 -->
                      <td class="styDepTblCell" style="width:32.7mm;">
                        <span style="padding-top:.2mm;width:31.7mm;float:bottom;
                                            text-align:right;font-size:7pt">
                          <br/>
                          <br/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="EmployersUseAmt"/>
                          </xsl:call-template>
                        </span>
                      </td><!-- Closes Right Box 12-->
                    </tr>
                  </xsl:for-each><!-- Closes Box 12-->
                </tbody>
              </table>
            </xsl:if>
            <br/>
            <!-- Optional Separated Print for Repeating Data Table for Line 14 Other -->
            <xsl:if test="($Print = $Separated) and (count($FormW2Data/OtherDeductsBenefits) &gt;2)">
              <span class="styRepeatingDataTitle"> Form W2, Line 14 Other</span>
              <table class="styDepTbl" style="width:50mm;font-size:7pt;">
                <thead class="styTableThead">
                  <!--Label the Column Headers-->
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" align="left" style="font-weight:normal">
                      <b>14</b> Other </th>
                    <!--<td rowspan="2" class="styDepTblHdr" scope="col" style="vertical-align:top;
                                          padding-top:0mm;font-size:7pt;width:40mm;
                        border-bottom-width:0px;border-right:0px;">
                      <div class="styGenericDiv">
                        <span style="width:.5mm"/>
                        <span style="font-size: 7pt;font-weight:bold;">14 </span>
                        <span style="width:.5mm"/>
                        <span style="font-size: 7pt">Other</span>
                      </div>
                     </td>-->
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <xsl:for-each select="$FormW2Data/OtherDeductsBenefits">
                    <tr style="border-color:black;">
                      <!--Define background colors to rows-->
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styDepTblCell" style="width:41mm;height:2mm;text-align:left;
                                         border-bottom:0px;border-right:0px;font-size:7pt">
                        <xsl:if test="Description">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="Description"/>
                            </xsl:call-template>
                        </xsl:if>
                      </td>
                    </tr>
                    <tr>
                      <td class="styDepTblCell" style="width:41mm;height:2mm;font-size:7pt;
                       border-bottom:0px;text-align:right;padding-top:0px;border-right:0px;">
                        <xsl:if test="Amount">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                        </xsl:if>
                      </td>
                    </tr>
                    <!-- Blank row to create space between line items-->
                    <!--<tr>
                          <td class="styDepTblCell" style="width:41mm;height:2mm;
                            border-bottom:0px;border-right:0px"/>
                     </tr>-->
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            <br/>
            
            <!-- Optional Separated Print for Repeating Data Table for Lines 15, 16, 17, 18, 19 and 20 -->
            <br/>
            <div>
              <xsl:if test="($Print = $Separated) and (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp) &gt;2)">
                <div style="float:left">
                  <span class="styRepeatingDataTitle" style="width:80mm"> Form W2, Lines 15, 16, 17</span>
                  <table class="styDepTbl" style="width:50mm; font-size:6pt;">
                    <thead class="styTableThead">
                      <!-- Label the Column Headers -->
                      <tr class="styDepTblHdr">
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>15</b> State</th>
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          Employer's state ID number</th>
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>16</b> State wages, tips, etc.</th>
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>17</b> State income tax</th>
                      </tr>
                    </thead>
                    <tfoot/>
                    <tbody>
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp">
                        <tr style="border-color:black;">
                          <!-- Define background colors to the rows -->
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                          <!-- First Column -->
                          <td class="styDepTblCell" align="left">
                            <div style="width:9.5mm;">
                                <xsl:if test="StateAbbreviationCd">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                          <!-- Second Column -->
                          <td class="styDepTblCell" align="left">
                            <div style="width:31mm;">
                                <xsl:if test="EmployersStateIdNumber">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="EmployersStateIdNumber"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                          <!-- Third Column -->
                          <td class="styDepTblCell" align="right">
                            <div style="width:28mm;">
                                <xsl:if test="StateWagesAmt">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="StateWagesAmt"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                          <!-- Fourth Column -->
                          <td class="styDepTblCell" align="justify">
                            <div style="width:24mm;">
                              <span style="float:right">
                                <xsl:if test="StateIncomeTaxAmt">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="StateIncomeTaxAmt"/>
                                  </xsl:call-template>
                                </xsl:if>
                              </span>
                            </div>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                    <!--</thead>-->
                  </table>
                </div>
              </xsl:if>
              <!--</div>-->
              <xsl:if test="($Print = $Separated) and (count($FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp) &gt;2)">
                <div style="float:left;">
                  <span class="styRepeatingDataTitle" style="width:80mm"> Form W2, Lines 18, 19 and 20</span>
                  <!--<div class="styIRSW2leftBox" style="width:30mm;">-->
                  <table class="styDepTbl" style="font-size:6pt; width:50mm">
                    <thead class="styTableThead">
                      <!-- Label the Column Headers -->
                      <tr class="styDepTblHdr">
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>18</b> Local wages, tips, etc.</th>
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>19</b> Local income tax</th>
                        <th class="styDepTblCell" scope="col" valign="baseline" style="font-weight:normal">
                          <b>20 </b>Locality name</th>
                      </tr>
                    </thead>
                    <tfoot/>
                    <tbody>
                      <xsl:for-each select="$FormW2Data/W2StateLocalTaxGrp/W2StateTaxGrp/W2LocalTaxGrp">
                        <tr style="border-color:black;">
                          <!-- Define background colors to the rows -->
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                          <!-- Fifth Column -->
                          <td class="styDepTblCell" align="right">
                            <div style="width:27.7mm;">
                                <xsl:if test="LocalWagesAndTipsAmt">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="LocalWagesAndTipsAmt"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                          <!-- Sixth Column -->
                          <td class="styDepTblCell" align="right">
                            <div style="width:21.9mm;">
                                <xsl:if test="LocalIncomeTaxAmt">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                          <!-- Seventh Column -->
                          <td class="styDepTblCell" align="left">
                            <div style="width:23.9mm;">
                                <xsl:if test="NameOfLocality">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="NameOfLocality"/>
                                  </xsl:call-template>
                                </xsl:if>
                            </div>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
              </xsl:if>
            </div>
            <!-- Closes Separated Print for Lines 15-20 -->
          </div>
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="AddPositionNumber">
    <span class="styBoldText">
      <xsl:number value="position()" format="a"/>
    </span>
  </xsl:template>
  <xsl:template name="AlphaPosition">
    <xsl:param name="Position"/>
    <xsl:variable name="FirstAlphaPos" select='format-number(($Position div 26), "###.##") '/>
    <xsl:if test="$FirstAlphaPos > 1">
      <xsl:value-of select="substring('abcdefghijklmnopqrstuvwxyz',$FirstAlphaPos,1)"/>
      <xsl:variable name="SecondAlphaPos" select='format-number(($Position - 26), "###") '/>
      <xsl:value-of select="substring('abcdefghijklmnopqrstuvwxyz',$SecondAlphaPos,1)"/>
    </xsl:if>
    <xsl:if test="$FirstAlphaPos &lt; 1.1">
      <xsl:value-of select="substring('abcdefghijklmnopqrstuvwxyz',$Position,1)"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
