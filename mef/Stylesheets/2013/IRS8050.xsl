<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8050Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8050Data" select="$RtnDoc/IRS8050"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8050Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form 8050"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8050Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form style="font-family:arial; font-size:9pt" name="Form8050">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm">
            <div class="styFNBox" style="width:31mm; height:19mm">
              <div style="font-size:7pt">

          Form &nbsp; <span class="styFormNumber">8050</span>
                <br/>(December 2001)<br/>
                <div style="font-size:6pt; padding-top:1mm">        

            Department of the Treasury<br/>Internal Revenue Service

          </div>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm">
              <div class="styMainTitle" style="padding-top:1mm; font-size:12pt">Direct Deposit of Corporate Tax Refund</div>
              <div class="styFBT" style="margin-top:4mm; font-size:8pt">
                <img src="{$ImagePath}/8050_Bullet.gif" alt="Arrow Bullet"/> Attach to Form 1120, 1120-A, or 1120S.

        </div>
            </div>
            <div class="styTYBox" style="width:31mm; height:19mm">
              <div style="height:11mm; padding-top:8mm; font-size:7pt">OMB No. 1545-1762</div>
            </div>
          </div>
          <div class="styBB" style="width:187mm; font-size:8pt">
            <div style="float:left">
              <div>Name of corporation (as shown on tax return)</div>
              <div style="font-weight:normal;font-size:7pt;font-family: verdana">
                <!--<xsl:choose>
                  <xsl:when test="normalize-space($Form8050Data/Name) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8050Data/Name/BusinessNameLine1"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space($Form8050Data/Name/BusinessNameLine2)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8050Data/Name/BusinessNameLine2"/>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>-->
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  <!--</xsl:otherwise>
                </xsl:choose>-->
              </div>
            </div>
            <div style="width:50mm; border-left:1 solid black; float:right; padding-left:2mm; height:10.5mm;">
              <div style="font-weight:bold; padding-bottom:1mm">Employer identification number</div>
              <div style="width:100%; font-weight:normal;">
                <!--<xsl:choose>
                  <xsl:when test="normalize-space($Form8050Data/IdentifyingNumber) != ''">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$Form8050Data/IdentifyingNumber"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>-->
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                  <!--</xsl:otherwise>
                </xsl:choose>-->
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm; background-color:lightgrey">
            <div style="float:left"/>
            <div style="height:8.5mm; background-color:white; width:50mm; font-size:8pt; border-left:1 solid black; padding-left:2mm; float:right">
              <div style="padding-bottom:0.5mm">Phone number (optional)</div>
              <!--xsl:choose>

            <xsl:when test="string-length($Form8050Data/TelephoneNumber) > 0">

              (<xsl:call-template name="PopulatePhoneNumber"><xsl:with-param name="TargetNode" select="substring($Form8050Data/TelephoneNumber,1,3)" /></xsl:call-template>)

            </xsl:when>

               <xsl:otherwise>    

              (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)

            </xsl:otherwise>

          </xsl:choose>

        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="substring($Form8050Data/TelephoneNumber,4)" /></xsl:call-template -->
              <xsl:choose>
                <xsl:when test="normalize-space($Form8050Data/PhoneNum)=''">

            (<span style="width:9mm"/>)

          </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulatePhoneNumber">
                    <xsl:with-param name="TargetNode" select="$Form8050Data/PhoneNum"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
          <div class="styTBB" style="height:34mm; width:187mm">
            <div style="padding-top:2mm">  

        &nbsp;&nbsp; <b>1. &nbsp;&nbsp; Routing number (must be nine digits).</b> The first two digits must be between 01 and 12 or 21 through 32.

      </div>
            <div class="styGenericDiv" style="width:122mm">
              <xsl:call-template name="PopulateRoutingNumber">
                <xsl:with-param name="TargetNode" select="$Form8050Data/RoutingTransitNum"/>
              </xsl:call-template>
              <br/>                                              

        &nbsp;&nbsp; <b>2. &nbsp;&nbsp; Account number (include hyphens but omit spaces and special symbols):</b>
              <br/>
              <xsl:call-template name="PopulateAccountNumber">
                <xsl:with-param name="TargetNode" select="$Form8050Data/BankAccountNum"/>
              </xsl:call-template>
            </div>
            <div class="styGenericDiv" style="width:57mm; padding-top:2mm">
              <b>3.<span style="width:8px"/>Type of account (one box<br/>
                <span style="width:19px;"/>must be checked):</b>
              <br/>
              <div class="styGenericDiv" style="padding-top:2mm; padding-left:1mm; text-align:center">
                <input type="checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8050Data/CheckingAccountInd"/>
                   <xsl:with-param name="BackupName">Checking</xsl:with-param> 
                  </xsl:call-template>
                </input>
                <br/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8050Data/CheckingAccountInd"/>
                    <xsl:with-param name="BackupName">Checking</xsl:with-param>
                  </xsl:call-template>

            Checking

          </label>
              </div>
              <div class="styGenericDiv" style="padding-top:2mm; width:30mm; text-align:center">
                <input type="checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8050Data/SavingsAccountInd"/>
                    <xsl:with-param name="BackupName">Savings</xsl:with-param>
                  </xsl:call-template>
                </input>
                <br/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form8050Data/SavingsAccountInd"/>
                    <xsl:with-param name="BackupName">Savings</xsl:with-param>
                  </xsl:call-template>

            Savings

          </label>
              </div>
            </div>
          </div>
          <div style="width:187mm">
            <div style="float:right; font-size:7pt">

        Cat. No. 30211X 

        <span style="width:20mm"/>

        Form <b style="font-size:9pt">8050</b> (12-2001)

      </div>
          </div>
          <p style="page-break-before:always"/>
          <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">

        Additional Data        

      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8050Data"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="PopulateRoutingNumber">
    <xsl:param name="TargetNode"/>
    <table class="styIRS8050NumGridTable" cellpadding="0" cellspacing="0" summary="Routing number">
      <tr align="center">
        <xsl:attribute name="id"><xsl:call-template name="PopulateID"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template></xsl:attribute>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'1,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'2,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'3,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'4,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'5,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'6,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'7,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'8,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'9,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template name="PopulateAccountNumber">
    <xsl:param name="TargetNode"/>
    <table class="styIRS8050NumGridTable" cellpadding="0" cellspacing="0" summary="Account number">
      <tr align="center">
        <xsl:attribute name="id"><xsl:call-template name="PopulateID"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template></xsl:attribute>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'1,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'2,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'3,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'4,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'5,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'6,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'7,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'8,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'9,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'10,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'11,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'12,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'13,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'14,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'15,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'16,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
        <td class="styIRS8050NumGridTD">
          <span style="height:1mm">
            <xsl:if test="$TargetNode">
              <xsl:call-template name="PopulateChgHistory">
                <xsl:with-param name="targetNode" select="$TargetNode"/>
                <xsl:with-param name="subString" select="'17,1'"/>
              </xsl:call-template>
            </xsl:if>
          </span>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>