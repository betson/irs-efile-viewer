<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8816Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8816"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
        <!-- HINTS:  -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      	<body class="styBodyClass" style="width:187mm">
        <form name="Form8816">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 21mm;">
            <div class="styFNBox" style="height: 21mm; width:31mm;font-size: 7pt;">
              Form <span class="styFormNumber">8816</span><br/>(Rev. September 2018)
             <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template> 
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm; height: 21mm">
				<div class="styMainTitle" style="height:12mm; font-weight: bold; padding-top: 2mm;">Special Loss Discount Account and Special<br/>Estimated Tax Payments for Insurance Companies</div>
				<div class="styFST" style="height:4mm;font-size:7pt;margin-left:3mm;font-weight:bold; ">
					<img src="{$ImagePath}/8816_Bullet.gif" alt="MediumBullet"/>Attach to tax return.
				</div><br/>
				<div  class="styFST" style="height:4mm;font-size:7pt;border:0px;">
					<img src="{$ImagePath}/8816_Bullet.gif" alt="Bullet Image"/>Go to <a  style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8816" title="Link to IRS.gov/Form8816"><i>www.irs.gov/Form8816</i></a> for the latest information.
				</div>
            </div>
            <div class="styTYBox" style="width:31mm; height: 21mm">
              <div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0123</div>
            </div>
          </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styTBB" style="width:187mm">
            <div class="styNameBox" style="width:125mm;height:10mm;font-size:7pt;font-weight:normal;">
      Name<br/>
              <div>
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/EmployerName) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine1Txt"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space($FormData/EmployerName/BusinessNameLine2Txt)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine2Txt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
            <div class="styEINBox" style="padding-left:2mm;font-size:7pt;font-weight:bold;">
              <span class="BoldText">Employer Identification Number</span><br/>
              <div style="text-align:left; padding-top:3mm;font-weight:normal;">
                <xsl:choose>
                  <xsl:when test="normalize-space($FormData/EIN) != ''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$FormData/EIN"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="normalize-space($FormData/MissingEINReasonCd) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
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
          <xsl:if test="(($Print != $Separated) or (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &lt;= 5))">
            <xsl:for-each select="$FormData/SpclLossDscntAndEstTxPymntsGrp">
              <xsl:variable name="pos" select="position()"/>
              <xsl:if test="(position() mod 5)=1">
                <div class="styIRS8816TableContainer" id="Spcctn">
                  <!--print logic-->
                  <xsl:call-template name="SetInitialState"/>
                  <!--end-->
                  <table class="styTable" cellspacing="0" style="width:187mm;">
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
                        <td class="styTableCell" style="width: 48mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <span class="styBoldText">Accident year</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; text-align: center; font-size: 7pt">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;1">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;2">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm;  text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;3">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;4">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black;border-right:0;">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;5">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <!--  Line 1   -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Undiscounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 2  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Discounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 3  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Special loss discount <br/>
                            <span style="width: 4mm"/> limitation. Subtract line 2 from <br/>
                            <span style="float:left;">
                            <span style="width: 5mm"/>line 1</span>
														<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
													</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
 <!--                         <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
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
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
                          <span style="float:left;">
                            <span style="width: 5mm"/>the year</span>
														<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
													</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 5  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                         <span style="float:left;">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;">Additions&#8209;section 847(4)</span>
                          </span>
                          <span class="styDotLn" style="float:right;padding-right:2mm;">.</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="AdditionsSection847Amt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/AdditionsSection847Amt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/AdditionsSection847Amt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/AdditionsSection847Amt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/AdditionsSection847Amt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size:7pt; padding-left: 2mm">6</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Subtractions&#8209;section 847(5)</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">7</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the end of the year.<br/>
                            <span style="width: 5mm"/>Add lines 4 and 5 and<br/>
                            <span style="width: 5mm"/>subtract line 6 from the result</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/EndYearBalanceAmt"/>
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
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
                            <span style="float:left;">
                            <span style="width: 5mm"/>the year</span>
                            <span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
                            </span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 9  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                        <span style="float:left;">
                          <span class="styBoldText" style="font-size: 7pt; padding-left:2mm">9</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments made for year</span>
                        </span>
						<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 10  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width: 48mm">
                          <span class="styBoldText" style="font-size: 7pt">10</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Prior section 847 payments<br/>
													<span style="width: 5mm"/>transferred to current year.
												</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
<!--                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
-->                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 11  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                        <span style="float:left;">
                          <span class="styBoldText" style="font-size: 7pt">11</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments applied for year</span>
                          </span>
<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>

                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 12  -->
                      <tr style="height: 8mm">
                        <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 48mm">
                          <span class="styBoldText" style="font-size: 7pt">12</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the end of the year.<br/>
                            <span style="width: 5mm"/>Add lines 8 through 10 and<br/>
                            <span style="width: 5mm"/>subtract line 11 from the result</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPEndYearBalanceAmt"/>
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
          <xsl:if test="(count($FormData/SpclLossDscntAndEstTxPymntsGrp)=0) or (($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &gt; 5))">
            <div class="styTableContainer" style="overflow:hidden; height:  auto; border-bottom-width: 0px" id="GDctn">
              <!--print logic-->
              <xsl:call-template name="SetInitialState"/>
              <!--end-->
              <table class="styTable" cellspacing="0" style="width:187mm;">
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
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px;">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Undiscounted unpaid losses.</span>
                    </td>
                    <xsl:choose>
                      <!-- Display "Additional Data" message if Print is set to separated and there are more than 5 elements -->
                      <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &gt; 5))">
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp"/>
                            <xsl:with-param name="ShortMessage" select="'true'"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                          <span class="styTableCellPad"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 2  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Discounted unpaid losses.</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 3  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm;vertical-align:top;">3</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Special loss discount <br/>
                        limitation. Subtract line 2 from <br/>
                        line 1</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
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
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
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
                      <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &gt; 5))">
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp"/>
                            <xsl:with-param name="ShortMessage" select="'true'"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styTableCellPad"/>
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
                  <!-- Line 5  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Additions—section 847(4)</span>
                      <b>
                        <span class="styNBSP"/>.
          </b>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 6  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
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
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm;vertical-align:top;">7</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the end of the year.<br/>
                        Add lines 4 and 5 and<br/>
                        subtract line 6 from the result</span>
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
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
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
                      <xsl:when test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &gt; 5))">
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp"/>
                            <xsl:with-param name="ShortMessage" select="'true'"/>
                          </xsl:call-template>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styTableCellPad"/>
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
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt; padding-left:2mm">9</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Payments made for year</span>
                      <b>
                        <span class="styNBSP"/>.
          </b>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 10  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                      <span class="styBoldText" style="font-size: 7pt;float:left;">10</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Prior section 847 payments<br/>
                        transferred to current year.</span>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;background-color:lightgrey;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!-- Line 11  -->
                  <tr style="height: 8mm">
                    <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
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
                    <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 48mm">
                      <span class="styBoldText" style="font-size: 7pt;vertical-align:top;">12</span>
                      <span style="width: 1mm"/>
                      <span style="font-size: 7pt">Balance at the end of the year.<br/>
                        Add lines 8 through 10 and<br/>
                        subtract line 11 from the result</span>
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
              <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
            </div>
            <div style="float:right">
              Cat. No. 41382N 
              <span style="width:35px"/>
              Form <b style="font-size:8pt;">8816</b> (Rev. 9-2018)
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
          <xsl:if test="(($Print = $Separated) and (count($FormData/SpclLossDscntAndEstTxPymntsGrp) &gt; 5))">
            <xsl:for-each select="$FormData/SpclLossDscntAndEstTxPymntsGrp">
              <xsl:variable name="pos" select="position()"/>
              <xsl:if test="(position() mod 5)=1">
                <div id="Spcctn2">
                  <br/>
                  <br/>
                  <span class="styRepeatingDataTitle">Form IRS8816, Part I - Special Loss Discount Amount:</span>
                  <table class="styDepTbl" style="width:187mm;font-size:7pt">
                    <thead class="styTableThead">
                      <tr class="styDepTblHdr" style="height: 8mm">
                        <td class="styDepTblCell" style="width: 48mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: center; font-size: 7pt">
                          <span class="styBoldText">Accident year</span>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; border-color: black; text-align: center; font-size: 7pt">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;1">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;2">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm;  text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;3">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;4">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/AccidentYr"/>
                                </xsl:call-template>
                              </span>
                              <span class="styTableCellPad"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td class="styDepTblCell" style="width: 28mm; text-align: center; font-size: 7pt; border-color: black;border-right:0;">
                          <xsl:choose>
                            <xsl:when test="count($FormData/SpclLossDscntAndEstTxPymntsGrp)&lt;5">________</xsl:when>
                            <xsl:otherwise>
                              <span class="styUnderlinedText">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/AccidentYr"/>
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
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Undiscounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/UndiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 2  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">2</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Discounted unpaid losses</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/DiscountedUnpaidLossesAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 3  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Special loss discount <br/>
                            <span style="width: 5mm"/>limitation. Subtract line 2 from <br/>
                            <span style="width: 5mm"/>line 1</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SpecialLossDiscountLmtAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
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
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">4</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
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
                            <xsl:with-param name="TargetNode" select="BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/BeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 5  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">5</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Additions?section 847(4)</span>
                          <b/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="AdditionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/AdditionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/AdditionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/AdditionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/AdditionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 6  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size:7pt; padding-left: 2mm">6</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Subtractions?section 847(5)</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SubtractionsSection847Amt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 7  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px">
                          <div class="styBoldText" style="font-size: 7pt;float:left;padding-left:2mm;">7</div>
                          <div style="padding-left:1mm;font-size:7pt;">Balance at the end of the year. <br />Add lines 4 and 5 and <br />subtract line 6 from the result</div>
                          <!--span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">7</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 5mm"/>Add lines 4 and 5 and<br/>
                            <span style="width: 5mm"/> subtract line 6 from the result</span-->
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/EndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <br/>
                  <span class="styRepeatingDataTitle">Form IRS8816, Part III - Special Estimated Tax Payments:</span>
                  <table class="styDepTbl" style="font-size:7pt">
                    <thead class="styTableThead"/>
                    <tfoot/>
                    <tbody>
                      <!--  Line 8   -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">8</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt;display:inline;">Balance at the beginning of<br/>
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
                              <xsl:with-param name="TargetNode" select="SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPBeginningYearBalanceAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPBeginningYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 9  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
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
                              <xsl:with-param name="TargetNode" select="PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <span style="padding-right: 2mm">
                            <xsl:call-template name="SetFormLinkInline">
                              <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsMadeForYearAmt"/>
                            </xsl:call-template>
                          </span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsMadeForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 10  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt;float:left;">10</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Prior section 847 payments<br/>transferred to current year.</span>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PriorSect847PymtTrnsfrToCYAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 11  -->
                      <tr class="styDepTblRow1" style="height: 8mm">
                        <td class="styTableCell" style="width: 48mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px">
                          <span class="styBoldText" style="font-size: 7pt">11</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Payments applied for year</span>
                          <b>
                            <span class="styNBSP"/>.
          </b>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/PaymentsAppliedForYearAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                      </tr>
                      <!-- Line 12  -->
                      <tr class="styDepTblRow2" style="height: 8mm">
                        <td class="styTableCell" style="text-align: left; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width: 48mm">
                          <!--span class="styBoldText" style="font-size: 7pt">12</span>
                          <span style="width: 1mm"/>
                          <span style="font-size: 7pt">Balance at the end of the year.<br/>
                            <span style="width: 4mm"/>Add lines 8 through 10 and<br/>
                            <span style="width: 4mm"/>subtract line 11 from the result</span-->
                          <div class="styBoldText" style="font-size: 7pt;float:left;">12</div>
                          <div style="font-size: 7pt;padding-left:1mm;">Balance at the end of the year. <br/>Add lines 8 through 10 and <br/>subtract line 11 from the result</div>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 1]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 2]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 3]/SETPEndYearBalanceAmt"/>
                          </xsl:call-template>
                          <span class="styTableCellPad"/>
                        </td>
                        <td class="styTableCellSmall" style="width: 28mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;font-size:6pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/SpclLossDscntAndEstTxPymntsGrp[$pos + 4]/SETPEndYearBalanceAmt"/>
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