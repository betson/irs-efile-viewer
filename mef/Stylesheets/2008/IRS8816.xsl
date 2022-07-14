<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8816Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8816"/>
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
        <meta name="Description" content="Form IRS 8816"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
         <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''"> 
          <xsl:call-template name="AddOnStyle"/>
          </xsl:if> 
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8816">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 21mm">
            <div class="styFNBox" style="height: 21mm; width:31mm;font-size: 7pt">
      Form <span class="styFormNumber">8816</span>
              <span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </span>
              <br/>
      (Rev. December 2003)
      <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm; height: 21mm">
              <div class="styMainTitle" style="height:16mm; font-weight: bold; padding-top: 2mm">Special Loss Discount Account and Special<br/>Estimated Tax Payments for Insurance Companies</div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold; padding-top: 1.5mm">
                <img src="{$ImagePath}/8816_Bullet.gif" alt="MediumBullet"/> 
        Attach to tax return.
      </div>
            </div>
            <div class="styTYBox" style="width:31mm; height: 21mm">
              <div style="padding-top:8mm; font-size:7pt">OMB No. 1545-1130</div>
            </div>
          </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styTBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;font-weight:normal;">
      Name<br/>
              <div>
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
              </div>
            </div>
            <div class="styEINBox" style="padding-left:2mm;font-size:7pt;font-weight:bold;">
              <span class="BoldText">Employer Identification Number</span>
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
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          <xsl:if test="(($Print != $Separated) or (count($FormData/SpclLossDscntAndEstTaxPymnts) &lt;= 5))">
            <xsl:for-each select="$FormData/SpclLossDscntAndEstTaxPymnts">
              <xsl:variable name="pos" select="position()"/>
              <xsl:if test="(position() mod 5)=1">
                <div class="styIRS8816TableContainer" id="Spcctn">
                  <!--print logic-->
                  <xsl:call-template name="SetInitialState"/>
                  <!--end-->
                  <table class="styTable" cellspacing="0">
                    <thead class="styTableThead">
                      <tr>
                        <th/>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
                          <span style="width: 187mm; padding-top:6px; padding-bottom:6px">
                            <span class="styPartName">Part I</span>
                            <span class="styPartDesc">Special Loss Discount Amount</span>
                          </span>
                        </td>
                      </tr>
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <span class="styBoldText">Accident year</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; text-align: center; font-size: 7pt">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;1">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;2">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm;  text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;3">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;4">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black;border-right:0;">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;5">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--  Line 1   -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Undiscounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 2  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Discounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 3  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 6pt">Special loss discount limitation.<br/>
                            <span style="width: 5mm"/>Subtract line 2 from line 1</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
                          <span style="width: 187mm; padding-top:6px; padding-bottom:6px">
                            <span class="styPartName">Part II</span>
                            <span class="styPartDesc">Special Loss Discount Account <span class="styNormalText"> (See instructions.)</span>
                            </span>
                          </span>
                        </td>
                      </tr>
                      <!--  Line 4   -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the beginning of<br/>
                            <span style="width: 5mm"/> the year</span>
                          <b>
                            <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
            </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 5  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Additions&#151;section 847(4)</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size:7pt; padding-left: 2mm">6</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Subtractions&#151;section 847(5)</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">7</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 5mm"/>Add lines 4 and 5 and<br/>
                            <span style="width: 5mm"/> subtract line 6 from the result</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: left">
                          <span style="width: 187mm; padding-top:6px; padding-bottom:6px">
                            <span class="styPartName">Part III</span>
                            <span class="styPartDesc">Special Estimated Tax Payments <span class="styNormalText"> (See instructions.)</span>
                            </span>
                          </span>
                        </td>
                      </tr>
                      <!--  Line 8   -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the beginning of<br/>
                            <span style="width: 5mm"/>the year</span>
                          <b>
                            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 9  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left:2mm">9</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments made for year</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 10  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt">10</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Prior section 847 payments<br/>
                            <span style="width: 4mm"/>transferred to current year.</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 11  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt">11</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments applied for year</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 12  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 47mm">
                          <span class="styBoldText" style="font-size: 7pt">12</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 4mm"/>Add lines 8 through 10 and<br/>
                            <span style="width: 4mm"/>subtract line 11 from the result</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </xsl:if>
            </xsl:for-each>
          </xsl:if>
          <!-- Display if there are no elements, or if print is set to separated and there are more than 5 elements -->
          <xsl:if test="(count($FormData/SpclLossDscntAndEstTaxPymnts)=0) or (($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTaxPymnts) &gt; 5))">
            <div class="styTableContainer" style="overflow:hidden; height:  132.5mm; border-bottom-width: 0px" id="GDctn">
              <!--print logic-->
              <xsl:call-template name="SetInitialState"/>
              <!--end-->
              <table class="styTable" cellspacing="0">
                <thead class="styTableThead">
                  <tr>
                    <th class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: left">
                      <span class="styBB" style="width: 187mm; padding-top:6px; padding-bottom:6px">
                        <span class="styPartName">Part I</span>
                        <span class="styPartDesc">Special Loss Discount Amount</span>
                      </span>
                    </th>
                  </tr>
                  <tr style="height: 8mm">
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt; width: 70mm">
                      <span class="styBoldText">Accident year</span>
                    </th>
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">________</th>
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">________</th>
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">________</th>
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">________</th>
                    <th class="styTableCellSmall" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">________</th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--  Line 1   -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Undiscounted unpaid losses.</span>
                    </td>
                      <xsl:choose>
                        <!-- Display "Additional Data" message if Print is set to separated and there are more than 5 elements -->
                        <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTaxPymnts) &gt; 5))">
                          <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts"/>
                            <xsl:with-param name="ShortMessage" select="'true'"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"/></td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 2  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Discounted unpaid losses.</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 3  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Special loss discount limitation.<br/>
                        <span style="width: 5mm"/>Subtract line 2 from line 1.</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: left">
                      <span class="styBB" style="width: 187mm; padding-top:6px; padding-bottom:6px">
                        <span class="styPartName">Part II</span>
                        <span class="styPartDesc">Special Loss Discount Account <span class="styNormalText"> (See instructions.)</span>
                        </span>
                      </span>
                    </td>
                  </tr>
                  <!--  Line 4   -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the beginning of<br/>
                        <span style="width: 5mm"/> the year</span>
                      <b>
                        <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
            </b>
                    </td>
                    <xsl:choose>
                      <!-- Display "Additional Data" message if Print is set to separated and there are more than 5 elements -->
                      <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTaxPymnts) &gt; 5))">
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts"/>
                          <xsl:with-param name="ShortMessage" select="'true'"/>
                        </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"/></td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 5  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Additions—section 847(4)</span>
                      <b>
                        <span class="styNBSP"/>.
          </b>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 6  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size:7pt; padding-left: 2mm">6</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Subtractions—section 847(5)</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 7  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">7</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the end of the year.<br/>
                        <span style="width: 5mm"/>Add lines 4 and 5 and<br/>
                        <span style="width: 5mm"/> subtract line 6 from the result</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="styTableCellSmall" colspan="6" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px; text-align: left">
                      <span class="styBB" style="width: 187mm; padding-top:6px; padding-bottom:6px">
                        <span class="styPartName">Part III</span>
                        <span class="styPartDesc">Special Estimated Tax Payments <span class="styNormalText"> (See instructions.)</span>
                        </span>
                      </span>
                    </td>
                  </tr>
                  <!--  Line 8   -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the beginning of<br/>
                        <span style="width: 5mm"/>the year</span>
                      <b>
                        <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
            <span class="styNBSP"/>.
          </b>
                    </td>
                    <xsl:choose>
                      <!-- Display "Additional Data" message if Print is set to separated and there are more than 5 elements -->
                      <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTaxPymnts) &gt; 5))">
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts"/>
                          <xsl:with-param name="ShortMessage" select="'true'"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px"><span class="styTableCellPad"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 9  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left:2mm">9</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Payments made for year</span>
                      <b>
                        <span class="styNBSP"/>.
          </b>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 10  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt">10</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Prior section 847 payments<br/>
                        <span style="width: 4mm"/>transferred to current year.</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 11  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt">11</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Payments applied for year</span>
                      <b>
                        <span class="styNBSP"/>.
          </b>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 12  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 47mm">
                      <span class="styBoldText" style="font-size: 7pt">12</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the end of the year.<br/>
                        <span style="width: 4mm"/>Add lines 8 through 10 and<br/>
                        <span style="width: 4mm"/>subtract line 11 from the result</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <div style="width:187mm">
            <div style="float: left; clear: none;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see back of Form.</span>
            </div>
            <div style="float:right">
      Cat. No. 41382N 
      <span style="width:35px"/>
      Form <b style="font-size:8pt;">8816</b> (Rev. 12-2003)
    </div>
          </div>
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          
          
          <!-- Additional Data Table for Separated Data from Part I; displayed if more than 5 elements and Print is set to separated-->
          <xsl:if test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTaxPymnts) &gt; 5))">
            <xsl:for-each select="$FormData/SpclLossDscntAndEstTaxPymnts">
              <xsl:variable name="pos" select="position()"/>
              <xsl:if test="(position() mod 5)=1">
                <div id="Spcctn2">
                  <br/>
                  <br/>
                  <span class="styRepeatingDataTitle">Form IRS8816, Part I - Special Loss Discount Amount:</span>
                  <table class="styDepTbl" style="font-size:7pt">
                    <thead class="styTableThead">
                      <tr class="styDepTblHdr" style="height: 8mm">
                        <td class="styDepTblCell" style="width: 47mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <span class="styBoldText">Accident year</span>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; border-color: black; text-align: center; font-size: 7pt">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;1">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;2">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm;  text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;3">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;4">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black;border-right:0;">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTaxPymnts)&lt;5">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/AccidentYear"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      </thead>
                      <tfoot/>
                      <tbody>
                      <!--  Line 1   -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Undiscounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/UndiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                      <!-- Line 2  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Discounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/DiscountedUnpaidLosses"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                      </tr>
                      <!-- Line 3  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 6pt">Special loss discount limitation.<br/>
                            <span style="width: 5mm"/>Subtract line 2 from line 1</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                           <span class="styTableCellPad"></span>
                       </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SpecialLossDiscountLimitation"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"></span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <br/>
                  <span class="styRepeatingDataTitle">Form IRS8816, Part II - Special Loss Discount Amount:</span>
                  <table class="styDepTbl" style="font-size:7pt">
                    <thead class="styTableThead"/>
                    <tfoot/>
                    <tbody>
                      <!--  Line 4   -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the beginning of<br/>
                            <span style="width: 5mm"/> the year</span>
                          <b>
                            <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
              <span class="styNBSP"/>.
            </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/BalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>

                      <!-- Line 5  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Additions&#151;section 847(4)</span>
                          <b>
                            
                          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/AdditionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size:7pt; padding-left: 2mm">6</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Subtractions&#151;section 847(5)</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SubtractionsSection847"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                        	<div class="styGenericdiv" style="padding-left:2mm;font-weight:bold;">7</div>
                        	<div class="styGenericdiv" style="padding-left:1mm;">Balance at the end of the year.
Add lines 4 and 5 and
subtract line 6 from the result</div>
                          <!--span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">7</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 5mm"/>Add lines 4 and 5 and<br/>
                            <span style="width: 5mm"/> subtract line 6 from the result</span-->
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/BalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <br />
                  <span class="styRepeatingDataTitle">Form IRS8816, Part III - Special Estimated Tax Payments:</span>
                  <table class="styDepTbl" style="font-size:7pt">
                    <thead class="styTableThead" />
                    <tfoot/>
                    <tbody>
                      <!--  Line 8   -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the beginning of<br/>
                            <span style="width: 5mm"/>the year</span>
                          <b>
                            <span class="styNBSP"/>.
                            <span class="styNBSP"/>.
                            <span class="styNBSP"/>.
                            <span class="styNBSP"/>.
                          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtBeginningOfYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtBeginningOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 9  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left:2mm">9</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments made for year</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsMadeForYear"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsMadeForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 10  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt">10</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Prior section 847 payments<br/>
                            <span style="width: 4mm"/>transferred to current year.</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PriorSection847PaymentsTrnsfr"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 11  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 47mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt">11</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments applied for year</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/PaymentsAppliedForYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 12  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 47mm">
                          <!--span class="styBoldText" style="font-size: 7pt">12</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 4mm"/>Add lines 8 through 10 and<br/>
                            <span style="width: 4mm"/>subtract line 11 from the result</span-->
                       	<div class="styGenericdiv" style="padding-left:0mm;font-weight:bold;">12</div>
                        	<div class="styGenericdiv" style="padding-left:1mm;">Balance at the end of the year.  Add lines 8 through 10 and subtract line 11 from the result</div>
                            
                            
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 1]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 2]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 3]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTaxPymnts[$pos + 4]/SETPBalanceAtEndOfYear"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </xsl:if>
            </xsl:for-each>

          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
