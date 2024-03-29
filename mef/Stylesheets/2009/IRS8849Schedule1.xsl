<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<!-- Corrections made to lines 6a and 7a per ITAMS 5988578  SKM  7/27/09
     Made corrections as per defect #25184 JSN 01-15-2010-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Schedule1Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule1"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="IRS8849Schedule1"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8849Schedule1Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      
      <body class="styBodyClass">
        <form name="IRS8849Schedule1">
          <xsl:call-template name="DocumentHeader"/>
          
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 23mm;">
            <div class="styFNBox" style="height: 23mm; padding-bottom:0mm;width:31mm;font-size: 7pt">
              <br/>
              <span class="styFormNumber" style="font-size:10pt; font-weight:bold">Schedule 1</span>
              <br/>
              <span class="styFormNumber" style="font-size:10pt; font-weight:bold">(Form 8849)</span>
              <span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">(Rev. January 2009)</span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">Department of the Treasury</span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt;font-weight:bold">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm; height: 23mm">
              <div class="styMainTitle" style="height:10mm; font-weight: bold; padding-top: 1mm">Nontaxable Use of Fuels</div>
              <div class="styFST" style="height:5mm;font-size:8pt;margin-left:3mm;font-weight:normal; padding-top: 1mm">
                <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/> Attach to Form 8849.
              </div>
              <div class="styFST" style="height:5mm;font-size:8pt;margin-left:3mm;font-weight:normal; padding-top: 1mm">
                <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/> See instructions.
              </div>
            </div>
            <div class="styTYBox" style="width:31mm; height: 23mm">
              <div style="padding-top:8mm; font-size:7pt">OMB No. 1545-1420</div>
            </div>
          </div>
          <!--  End title of Form  -->
          
          <!--  Name / Employer identification number / Total Refund  -->
          <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
            <tr>
              <td class="styNameBox" style="width:107mm;font-size:7pt;font-weight:normal; height:10mm">Name as shown on Form 8849<br/>
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/NameOfEmployer) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine1"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space($FormData/NameOfEmployer/BusinessNameLine2)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine2"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm;">
                <span class="BoldText" style="width:33mm;">EIN or SSN</span>
                <div style="text-align:left; padding-top:2mm;font-weight:normal;">
                  <xsl:choose>
                    <xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="($RtnHdrData/Filer/EIN)">
                        <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
                        <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
              </td>
              <td valign="top" class="styEINBox" style="padding-left:2mm;font-size:7pt;font-weight:normal;">
                <span class="BoldText">Total refund (see instructions)</span>
                <div style="text-align:right; padding-top:2mm;font-weight:normal;">
                  <span style="float:left;">$</span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalRefund"/>
                  </xsl:call-template>
                </div>
              </td>
            </tr>
          </table>
          <!--  Name / Employer identification number / Total Refund  -->
          
          <!--  Begin Sentence -->
          <div style="width:187mm;">
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="font-size:7pt;font-family:verdana;">
                <tbody style="font-size:7pt;font-family:verdana;">
                  <tr>
                    <td style="border-top:1px black solid;border-bottom:1px black solid">
                      <span style="padding-left:5.5mm; padding-right:2mm"/>
                    </td>
                    <td colspan="5" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                      <b>Caution. </b>
                      <span style="width:2px;"/>
                      <i>Claimant has the name and address of the person who sold the fuel to the claimant and the dates of purchase. For claims on lines 1a and 2b (type of use 13 and 14), 3d, 4c, and 5, claimant has not waived the right to make the claim. For claims on lines 1a and 2b (types of use 13 and 14), claimant certifies that a certificate has not been provided to the credit card issuer.</i>
                      <br/>
                      <br/>
                      <b>Period of Claim:</b>  Enter month, day, and year<br/>
                      <span style="padding-left:22mm;">in <i>MMDDYYYY</i> format.</span>
                      <span style="padding-left:35mm;font-size:8pt;margin-left:3mm;font-weight:bold; padding-top: 1mm">
                        <b>From  </b>
                        <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                      </span>
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimFromDate"/>
                      </xsl:call-template>
                      <span style="padding-left:30mm;font-size:8pt;margin-left:3mm;font-weight:bold; padding-top: 1mm">
                        <b>To  </b>
                        <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                      </span>
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="$FormData/PeriodOfClaimToDate"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </tbody>
              </thead>
            </table>
          </div>
          <!--  End Sentence -->
          
          <!-- Begin Table 1  -->
          <div style="width:187mm;">
            <table cellspacing="0">
              <thead style="font-size:7pt;font-family:verdana;">
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom-width:0px; border-color: black" scope="col">
                    <span class="styTableCellPad">1</span>
                  </th>
                  <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom-width:0px; border-color: black" scope="col">
                    <b>Nontaxable Use of Gasoline</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; padding-left:1mm;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:25mm; text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:37mm; font-size:6.25pt;text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom-width:0px; border-color: black; border-right:0px" scope="col">
                    <b>(e)<br/> CRN</b>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody style="font-size:7pt;font-family:verdana;">
              
                <!-- Begin Table 1, section a  -->
                <xsl:choose>
                  <xsl:when test="$FormData/NontaxableUseOfGasoline/Gasoline">
                    <xsl:for-each select="$FormData/NontaxableUseOfGasoline/Gasoline">
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position()= 1">
                            <td style="border-top: 1px black solid">
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td>
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Gasoline (see <b>Caution</b> above line 1)</td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rate"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                      <xsl:choose>
                        <xsl:when test="position()= 1">
                          <td style="border-top: 1px black solid">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>a</b>
                            </span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>a</b>
                            </span>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Gasoline (see <b>Caution</b> above line 1)</td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rate"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CRN"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 1, section a  -->
                
                <!-- Begin Table 1, section b  -->
                <xsl:choose>
                  <xsl:when test="$FormData/NontaxableUseOfGasoline/GasolineExported">
                    <xsl:for-each select="$FormData/NontaxableUseOfGasoline/GasolineExported">
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>b</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background=lightgrey">
                          <span style="width:1px"/>
                        </td>
                        <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rate"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                      <td>
                        <span style="padding-left:4mm; padding-right:2mm">
                          <b>b</b>
                        </span>
                      </td>
                      <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background=lightgrey">
                        <span style="width:1px"/>
                      </td>
                      <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rate"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CRN"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 1, section b -->
                <!--  End Table 1  -->
                
                <!-- Begin Table 2 -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">2</span>
                  </th>
                  <th colspan="7" style="width:89mm; font-weight:bold; text-align:left; border-top:1px black solid;  border-bottom:0px;" scope="col">Nontaxable Use of Aviation Gasoline</th>
                </tr>
                
                <!-- Begin Table 2, section a  -->
                <tr>
                  <td valign="top">
                    <span style="border-top:1px black solid;padding-left:4mm; padding-right:2mm">
                      <b>a</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    Use in commercial aviation<br/> (other than foreign trade)
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/ComAir/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/ComAir/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/ComAir/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/ComAir/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section a  -->
                
                <!-- Begin Table 2, section b  -->
                <xsl:choose>
                  <xsl:when test="$FormData/NontaxableUseOfAviationGas/OtherNontaxableUse">
                    <xsl:for-each select="$FormData/NontaxableUseOfAviationGas/OtherNontaxableUse">
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>b</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          Other nontaxable use (see <b>Caution</b> above line 1)
                        </td>
                        <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rate"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                      <td>
                        <span style="padding-left:4mm; padding-right:2mm">
                          <b>b</b>
                        </span>
                      </td>
                      <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          Other nontaxable use (see <b>Caution</b> above line 1)
                        </td>
                      <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                      </td>
                      <td style="padding-top:1mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rate"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                      </td>
                      <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                      <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CRN"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 2, section b  -->
                
                <!-- Begin Table 2, section c  -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>c</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background=lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:1mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section c -->
                
                <!-- Begin Table 2, section d  -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>d</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">LUST tax on aviation fuels used in foreign trade</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background=lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:1mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section d -->
                
                <!-- Begin Table 3  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">3</span>
                  </th>
                  <th colspan="7" style="width:89mm; font-weight:bold; text-align:left; border-top:1px black solid;  border-bottom:0px;" scope="col">
                    <b>Nontaxable Use of Undyed Diesel Fuel</b>
                  </th>
                </tr>
                <tr>
                  <td style="border-top=1px black solid">
                    <span style="padding-left:4mm; padding-right:2mm"/>
                  </td>
                  <td colspan="6" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    Claimant certifies that the diesel fuel did not contain visible evidence of dye.  <br/>
                    <b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain visible evidence of dye, attach a detailed explanation and check here
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exception"/>
                    </xsl:call-template>
                    
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.                
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                    </span>
                    <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                  </td>
                  <td style="text-align: center; padding-top: 6mm; border-top:1px black solid; border-bottom:0px black solid; border-left-width: 0px; border-right-width: 0px">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exception"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1Exception</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exception"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1Exception</xsl:with-param>
                      </xsl:call-template>
                    </label>
                  </td>
                </tr>
                <!-- End Exception Text -->
                
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 0px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm;padding-right:2mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:25mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;text-align:center;font-weight:normal;border-top-width:1px; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) CRN</b>
                  </th>
                </tr>
                
                <!-- Begin Table 3, section a  -->
                <xsl:choose>
                  <xsl:when test="$FormData/NontaxableUseUndyedDieselFuel/NontaxableUse">
                    <xsl:for-each select="$FormData/NontaxableUseUndyedDieselFuel/NontaxableUse">
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position()= 1">
                            <td style="border-top: 0px black solid">
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td>
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          Nontaxable use
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rate"/>
                          </xsl:call-template>
                        </td>
                        <td style="width: 35mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <xsl:choose>
                          <xsl:when test="position()=count($FormData/NontaxableUseUndyedDieselFuel/NontaxableUse) and position() &gt; 1">
                            <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:choose>
                              <xsl:when test="position()= 1">
                                <xsl:choose>
                                  <xsl:when test="count($FormData/NontaxableUseUndyedDieselFuel/NontaxableUse) = 1">
                                    <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                                    </td>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <span style="width:1px"/>
                                    </td>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                          <xsl:when test="position()= 1">
                            <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;"/>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="padding-left:4mm; padding-right:2mm"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td style="border-top: 0px black solid">
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use</td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Rate"/>
                      </xsl:call-template>
                    </td>
                    <td style="width: 35mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                    </td>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="padding-left:4mm; padding-right:2mm"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 3, section a  -->
                
                <!-- Begin Table 3, section b  -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>b</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use on a farm for farming purposes</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/FarmingPurposes/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/FarmingPurposes/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/FarmingPurposes/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 3, section b  -->
                
                <!-- Begin Table 3, section c -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>c</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use in trains </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px;"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UseInTrains/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UseInTrains/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UseInTrains/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UseInTrains/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 3, section c -->
                
                <!-- Begin Table 3, section d -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>d</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use in certain intercity and local buses <br/> (see <b>Caution</b> above line 1)</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/IntercityAndLocalBuses/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Begin Table 3, section d -->
                
                <!-- End Table 3, section e -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>e</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exported/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exported/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exported/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Exported/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 3, section e -->
                <!-- End Table 3 -->
                
                <!-- Begin Table 4  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">4</span>
                  </th>
                  <th colspan="7" style="width:187mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                    <b>Nontaxable use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</b>
                  </th>
                </tr>
                <tr>
                  <td style="border-top:1px black solid">
                    <span style="padding-left:4mm; padding-right:2mm"/>
                  </td>
                  <td colspan="6" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    Claimant certifies that the kerosene did not contain visible evidence of dye.  <br/>
                    <b>Exception.</b> If any of the kerosene included in this claim <b>did</b> contain visible evidence of dye, attach a detailed explanation and check here 
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception"/>
                    </xsl:call-template>
                    
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.                
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.            
                    </span>
                    <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/><br/>
                    <b>Caution. </b>
                    <i> Claims cannot be made on line 4 for kerosene sales from a blocked pump. Only registered ultimate vendors may make those claims using Schedule 2.</i>
                  </td>
                  <td style="text-align: center; padding-top: 1mm; border-top:1px black solid; border-bottom:0px black solid; border-left-width: 0px; border-right-width: 0px">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1KeroseneException</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exception"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1KeroseneException</xsl:with-param>
                      </xsl:call-template>
                    </label>
                  </td>
                </tr>
                <!-- End Exception text -->
                
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 0px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:25mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;border-top-width:1px;text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) CRN</b>
                  </th>
                </tr>
                
                <!-- Begin Table 4, section a  -->
                <xsl:choose>
                  <xsl:when test="$FormData/UndyedKerosene/NontaxableUseTaxedAt244">
                    <xsl:for-each select="$FormData/UndyedKerosene/NontaxableUseTaxedAt244">
                      <tr>
                      <xsl:choose>
                        <xsl:when test="position()= 1">
                          <td style="border-top: 0px black solid">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>a</b>
                            </span>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>a</b>
                            </span>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use taxed at $.244</td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rate"/>
                        </xsl:call-template>
                      </td>
                      <td style="width: 35mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Gallons"/>
                        </xsl:call-template>
                      </td>
                      <xsl:choose>
                        <xsl:when test="position()=count($FormData/UndyedKerosene/NontaxableUseTaxedAt244) and position() &gt; 1">
                          <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:choose>
                            <xsl:when test="position()= 1">
                              <xsl:choose>
                                <xsl:when test="count($FormData/UndyedKerosene/NontaxableUseTaxedAt244) = 1">
                                  <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                    <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                                  </td>
                                </xsl:when>
                                <xsl:otherwise>
                                  <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                    <span style="width:1px"/>
                                  </td>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:when>
                          </xsl:choose>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="position()= 1">
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="padding-left:4mm; padding-right:2mm"/>
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CRN"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <tr>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td style="border-top: 0px black solid">
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use taxed at $.244</td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TypeOfUse"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Rate"/>
                      </xsl:call-template>
                    </td>
                    <td style="width: 35mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                    </td>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="padding-left:4mm; padding-right:2mm"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 4, section a  -->
                
                <!-- Begin Table 4, section b  -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>b</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use on a farm for farming purposes</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/FarmingPurposes/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/FarmingPurposes/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/FarmingPurposes/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 4, section b  -->
                
                <!-- Begin Table 4, section c -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>c</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Use in certain intercity and local buses<br/>(see <b>Caution </b>above line 1)</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/IntercityAndLocalBuses/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/IntercityAndLocalBuses/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/IntercityAndLocalBuses/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/IntercityAndLocalBuses/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 4, section c -->
                
                <!-- Begin Table 4, section d -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>d</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exported/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exported/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exported/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/Exported/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section d -->
                
                <!-- Begin Table 4, section e -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>e</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use taxed at $.044</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUseAt044/TypeOfUse"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUseAt044/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUseAt044/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUseAt044/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUseAt044/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section e -->
                
                <!-- Begin Table 4, section f -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>f</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use taxed at $.219</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUsedAt219/TypeOfUse"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUsedAt219/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUsedAt219/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUsedAt219/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/UndyedKerosene/NontaxableUsedAt219/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section f -->
                
                <!-- Begin Table 5  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">5</span>
                  </th>
                  <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                    <b>Kerosene Used in Aviation</b> (see <b>Caution</b> above line 1)</th>
                </tr>
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:25mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;border-top-width:1px;text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) CRN</b>
                  </th>
                </tr>
                
                <!-- Begin Table 5, section a  -->
                <tr>
                  <xsl:choose>
                    <xsl:when test="position()= 1">
                      <td valign="top" style="border-top: 0px black solid">
                        <span style="padding-left:4mm; padding-right:2mm">
                          <b>a</b>
                        </span>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td valign="top">
                        <span style="padding-left:4mm; padding-right:2mm">
                          <b>a</b>
                        </span>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;font-size:7pt">Kerosene used in commercial aviation <br/> (other than foreign trade) taxed at $.244</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right;padding-right:2mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt244/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt244/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt244/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt244/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section a  -->
                
                <!-- Begin Table 5, section b  -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>b</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; font-size:7pt">Kerosene used in commercial aviation <br/> (other than foreign trade) taxed at $.219</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background: lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt219/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt219/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt219/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/KeroseneTaxedAt219/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section b  -->
                
                <!-- Begin Table 5, section c  -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>c</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;font-size:7pt">Nontaxable use (other than use by state or <br/> local government) taxed at $.244</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/TypeOfUse"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right;padding-right:2mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section c  -->
                
                <!-- Begin Table 5, section d  -->
                <tr>
                  <td valign="top">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>d</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;font-size:7pt">Nontaxable use (other than by state or local <br/> government) taxed at $.219</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/TypeOfUse"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section d -->
                
                <!-- Begin Table 5, section e  -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>e</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">LUST tax on aviation fuels used in foreign trade</td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Rate"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Gallons"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Amount"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/CRN"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section e -->
                <!-- End Table 5 -->
                
                <!-- Begin Footer -->
                <tr>
                  <td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
                    <div style="float: left; clear: none;">
                      <span class="styBoldText" style="font-size:6.5pt">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</span>
                      <span style="padding-left:4mm;width:27mm; font-size:6pt">Cat. No. 27449T </span>
                      <span class="styBoldText">
                        <span style="width:2px"/> Schedule 1 (Form 8849) </span>(Rev. 1-2009)
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="pageEnd"/>
          <!-- End Footer -->
          
          <!-- Begin page 2 Header -->
          <div style="width:187mm;">
            <div style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 2px">
              <div style="float: left; clear: none">Schedule 1 (Form 8849) (Rev. 1-2009)</div>
              <div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">2</span></div>
            </div>
            <!-- End page 2 Header -->
            
            <!--  Begin Table 6   -->
            <div style="width:187mm;">
              <table class="styTable" cellspacing="0">
                <thead style="font-size:7pt;font-family:verdana;">
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:0px black solid; border-bottom:0px; " scope="col">
                      <span class="styTableCellPad">6</span>
                    </th>
                    <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:0px black solid;" scope="col">
                      <b>Nontaxable Use of Alternative Fuel </b>
                    </th>
                  </tr>
                  <tr>
                    <td style="border-top:1px black solid">
                      <span style="padding-left:4mm; padding-right:2mm"/>
                    </td>
                    <td colspan="7" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <b>Caution. </b>
                      <i> There is a reduced credit rate for use in certain intercity and local buses (type of use 5).  See page 4 for the credit rate. </i>
                    </td>
                  </tr>
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 0px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:11mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(a) Type of use</b>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(b) Rate</b>
                    </th>
                    <th colspan="2" class="styTableCellHeader" style="width:35mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(c) Gallons or gasoline gallon eqivalents (GGE)</b>
                    </th>
                    <th class="styTableCellHeader" style="padding-left:1mm;width:35mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(d) Amount of refund</b>
                      <br/>
                      <i>Multiply col. <b>(b)</b> by col. <b>(c)</b></i>
                    </th>
                    <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                      <b>(e) CRN</b>
                    </th>
                  </tr>
                  
                  <!-- Begin Table 6, section a -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LPG">
                      <xsl:for-each select="$FormData/AlternativeFuels/LPG">
                        <tr>
                          <xsl:choose>
                            <xsl:when test="position()= 1">
                              <td style="border-top: 0px black solid">
                                <span style="padding-left:4mm; padding-right:2mm">
                                  <b>a</b>
                                </span>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td>
                                <span style="padding-left:4mm; padding-right:2mm">
                                  <b>a</b>
                                </span>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied petroleum gas (LPG)</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LPG/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;">$</span>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position()= 1">
                            <td style="border-top: 0px black solid">
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td>
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied petroleum gas (LPG)</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LPG/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LPG/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section a -->
                  
                  <!-- Begin Table 6, section b -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/PSeriesFuels">
                      <xsl:for-each select="$FormData/AlternativeFuels/PSeriesFuels">
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>b</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">"P Series" fuels</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>b</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">"P Series" fuels</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/PSeriesFuels/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section b -->
                  
                  <!-- Begin Table 6, section c -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/CNG">
                      <xsl:for-each select="$FormData/AlternativeFuels/CNG">
                        <tr>
                          <td valign="top">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>c</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Compressed natural gas (CNG) (GGE=126.67 cu. ft.)</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/CNG/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td valign="top">
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>c</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Compressed natural gas (CNG) (GGE=126.67 cu. ft.)</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/CNG/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/CNG/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section c -->
                  
                  <!-- Begin Table 6, section d -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LiquefiedHydrogen">
                      <xsl:for-each select="$FormData/AlternativeFuels/LiquefiedHydrogen">
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>d</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied hydrogen</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>d</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied hydrogen</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedHydrogen/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section d -->
                  
                  <!-- Begin Table 6, section e -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LiquidFuelFromCoal">
                      <xsl:for-each select="$FormData/AlternativeFuels/LiquidFuelFromCoal">
                        <tr>
                          <td valign="top">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>e</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Any liquid fuel derived from coal (including peat) <br/>through the Fischer-Tropsch process</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td valign="top">
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>e</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Any liquid fuel derived from coal (including peat) <br/>through the Fischer-Tropsch process</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromCoal/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section e -->
                  
                  <!-- Begin Table 6, section f -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LiquidFuelFromBiomass">
                      <xsl:for-each select="$FormData/AlternativeFuels/LiquidFuelFromBiomass">
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>f</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquid fuel derived from biomass</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>f</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquid fuel derived from biomass</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquidFuelFromBiomass/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section f -->
                  
                  <!-- Begin Table 6, section g -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LNG">
                      <xsl:for-each select="$FormData/AlternativeFuels/LNG">
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>g</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied natural gas (LNG)</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LNG/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>g</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied natural gas (LNG)</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LNG/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LNG/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section g -->
                  
                  <!-- Begin Table 6, section h -->
                  <xsl:choose>
                    <xsl:when test="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass">
                      <xsl:for-each select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass">
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>h</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied gas derived from biomass</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>h</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied gas derived from biomass</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuels/LiquefiedGasDerivedFromBiomass/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section h -->
                  <!-- End Table 6 -->
                  
                  <!--  Begin Table 7   -->
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                      <span class="styTableCellPad">7</span>
                    </th>
                    <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                      <b>Nontaxable Use of a Diesel-Water Fuel Emulsion</b>
                    </th>
                  </tr>
                  <tr>
                    <td style="border-top:1px black solid">
                      <span style="padding-left:4mm; padding-right:2mm"/>
                    </td>
                    <td colspan="7" style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <b>Caution. </b>
                      <i> There is a reduced credit rate for use in certain intercity and local buses (type of use 5).  See page 4 for the credit rate. </i>
                    </td>
                  </tr>
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 0px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(a) Type of use</b>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(b) Rate</b>
                    </th>
                    <th colspan="2" class="styTableCellHeader" style="width:25mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(c) Gallons</b>
                    </th>
                    <th class="styTableCellHeader" style="padding-left:1mm;width:35mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(d) Amount of refund</b>
                      <br/>
                      <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                      </i>
                    </th>
                    <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                      <b>(e) CRN</b>
                    </th>
                  </tr>
                  
                  <!-- Begin Table 7, section a -->
                  <xsl:choose>
                    <xsl:when test="$FormData/DieselWaterFuelEmulsion/NontaxableUse">
                      <xsl:for-each select="$FormData/DieselWaterFuelEmulsion/NontaxableUse">
                        <tr>
                          <xsl:choose>
                            <xsl:when test="position()= 1">
                              <td style="border-top: 0px black solid">
                                <span style="padding-left:4mm; padding-right:2mm">
                                  <b>a</b>
                                </span>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td>
                                <span style="padding-left:4mm; padding-right:2mm">
                                  <b>a</b>
                                </span>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Nontaxable use</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther/TypeOfUse"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/BUSWriteIn"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/TypeOfUse"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/Rate"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Gallons"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;">$</span>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amount"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CRN"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <xsl:choose>
                          <xsl:when test="position()= 1">
                            <td style="border-top: 0px black solid">
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td>
                              <span style="padding-left:4mm; padding-right:2mm">
                                <b>a</b>
                              </span>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Nontaxable use</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther/TypeOfUse"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUseOther/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/BUSWriteIn"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/TypeOfUse"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/NontaxableUse/TypeOfUse5/Rate"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Gallons"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amount"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CRN"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 7, section a -->
                  
                  <!-- Begin Table 7, section b -->
                  <tr>
                    <td>
                      <span style="padding-left:4mm; padding-right:2mm">
                        <b>b</b>
                      </span>
                    </td>
                    <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                      <span style="width:1px"/>
                    </td>
                    <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/Exported/Rate"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/Exported/Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/Exported/Amount"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/DieselWaterFuelEmulsion/Exported/CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <!-- End Table 7, section b -->
                  <!-- End Table 7 -->
                  
                  <!--  Begin Table 8  -->
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                      <span class="styTableCellPad" >8</span>
                    </th>
                    <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                      <b>Exported Dyed Fuels and Gasoline Blendstocks</b>
                    </th>
                  </tr>
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:89mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(a) Type of use</b>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(b) Rate</b>
                    </th>
                    <th colspan="2" class="styTableCellHeader" style="width:25mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(c) Gallons</b>
                    </th>
                    <th class="styTableCellHeader" style="width:35mm; padding-left:1mm;font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(d) Amount of refund</b>
                      <br/>
                      <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                      </i>
                    </th>
                    <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                      <b>(e) CRN</b>
                    </th>
                  </tr>
                  
                  <!-- Begin Table 8, section a -->
                  <tr>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td valign="top">
                          <span style="border-top: 0px black solid;padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>a</b>
                          </span>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001</td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                      <span style="width:1px"/>
                    </td>
                    <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedDieselFuel/Rate"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedDieselFuel/Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedDieselFuel/Amount"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedDieselFuel/CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <!-- End Table 8, section a -->
                  
                  <!-- Begin Table 8, section b -->
                  <tr>
                    <td>
                      <span style="padding-left:4mm; padding-right:2mm">
                        <b>b</b>
                      </span>
                    </td>
                    <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported dyed kerosene</td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                      <span style="width:1px"/>
                    </td>
                    <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedKerosene/Rate"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedKerosene/Gallons"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedKerosene/Amount"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExportedDyedFuelsGasBlndstocks/ExportedDyedKerosene/CRN"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <!-- End Table 8, section b -->
                  <!-- End Table 8 -->
                  
                  <!-- Begin Page 2 Footer -->
                  <tr>
                    <td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
                      <div style="float: right; clear: none;">
                        <span class="styBoldText">
                          <span style="width:4px"/> Schedule 1 (Form 8849) </span>(Rev. 1-2009)
                      </div>
                    </td>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="pageEnd"/>
            
            <!-- Begin Left Over Data Table -->
            <!-- Begin Additonal Data Title Bar and Button -->
            <div class="styLeftOverTitleLine" id="LeftoverData">
              <div class="styLeftOverTitle">
                Additional Data        
              </div>
              <div class="styLeftOverButtonContainer">
                <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage	();"/>
              </div>
            </div>
            <!-- End Additional Data Title Bar and Button -->
            
            <table class="styLeftOverTbl">
              <xsl:call-template name="PopulateCommonLeftover">
                <xsl:with-param name="TargetNode" select="$FormData"/>
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
            </table>
            <!-- End Left Over Table -->
            
          </div>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
