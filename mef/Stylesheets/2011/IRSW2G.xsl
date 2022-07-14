<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRSW2GStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormW2GData" select="$RtnDoc/IRSW2G"/>
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormW2GData)"/>
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
            <xsl:call-template name="IRSW2GStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="FormW2G">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styIRSW2GRowItem" style="width:187mm;height:90mm;padding:0px 0px 0px 0px;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;">
            <!-- BEGIN: Header  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GHeaderFrame">
              <!-- Header Number -->
              <div style="width:50%;text-align:center;padding-left:0px;font-family:Arial;float:left;padding-bottom:0px;">
                <span style="font-size:9pt">3232</span>
              </div>
              <!-- CORRECTED checkbox -->
              <div style="width:50%;padding-left:0px;font-family:Arial;padding-bottom:0px;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormW2GData/CorrectedW2GInd"/>
                    <xsl:with-param name="BackupName">IRSW2GCorrectedW2GInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="width:2mm;"/>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormW2GData/CorrectedW2GInd"/>
                    <xsl:with-param name="BackupName">IRSW2GCorrectedW2GInd</xsl:with-param>
                  </xsl:call-template>
                  <span style="font-size:9pt">CORRECTED</span>
                </label>
              </div>
            </div>
            <!-- END: Header    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Top Left  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GLeftTopFrame">
              <!-- ##@1st Row -->
              <div class="styIRSW2GRowItem">
                <!-- Payers Name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:78mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">PAYERS name</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayersName/BusinessNameLine1"/>
                    </xsl:call-template>
                    <xsl:if test="$FormW2GData/PayersName/BusinessNameLine2">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/PayersName/BusinessNameLine2"/>
                      </xsl:call-template>
                    </xsl:if>
                    <span style="width:2px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControl"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (1) Gross winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>1</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Gross winnings</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinGrossWinningAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (2) Federal income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>2</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Federal income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/FederalIncomeTaxWithheldAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@2nd Row -->
              <div class="styIRSW2GRowItem">
                <!-- Street address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Street address</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <xsl:choose>
                      <xsl:when test="$FormW2GData/PayersUSAddress">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/PayersUSAddress/AddressLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/PayersUSAddress/AddressLine2">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayersUSAddress/AddressLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/PayersForeignAddress/AddressLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/PayersForeignAddress/AddressLine2">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayersForeignAddress/AddressLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                    <!--<xsl:choose>
						<xsl:when test="$FormW2GData/PayersUSAddress">
						  <xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="$FormW2GData/PayersUSAddress"/>
						  </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:call-template name="PopulateForeignAddressTemplate">
							<xsl:with-param name="TargetNode" select="$FormW2GData/PayersForeignAddress"/>
						  </xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>-->
                  </div>
                </div>
                <!-- (3) Type of wager >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>3</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Type of wager</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinWagerTypeCd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (4) Date won >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>4</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Date won</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinningDt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@3rd Row -->
              <div class="styIRSW2GRowItem">
                <!-- City, state, and ZIP code >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">City, state, and ZIP code</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
					<xsl:call-template name="PopulateCityStateInfo">
						<xsl:with-param name="TargetNode" select="$FormW2GData/PayersUSAddress"/>
						<xsl:with-param name="ForeignAddressTargetNode" select="$FormW2GData/PayersForeignAddress"/>
					</xsl:call-template>
					<span style="width:7px;"/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/PayersForeignAddress/Country"/>
					</xsl:call-template>
                  </div>
                </div>
                <!-- (5) Transaction >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>5</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Transaction</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinningTransactionDesc"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (6) Date won >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>6</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Race</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinningEventDesc"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@4th Row -->
              <div class="styIRSW2GRowItem">
                <!-- Federal identification number/Telephone number >>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:78mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Federal identification number
                    <span style="width:13mm;"/>Telephone number</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <div class="styIRSW2GDataLTxtField" style="padding-left:0px;padding-right:10mm;border-bottom-width:1px;width:50%;text-align:center;float:left;">
                      <xsl:choose>
                        <xsl:when test="$FormW2GData/PayerSSN">
                          <xsl:call-template name="PopulateSSN">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayerSSN"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$FormW2GData/PayerEIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayerEIN"/>
                          </xsl:call-template>
                        </xsl:when>
                      </xsl:choose>
                    </div>
                    <div class="styIRSW2GDataLTxtField" style="padding-left:0px;padding-right:10mm;border-bottom-width:1px;width:49.9%;text-align:center;float:left;">
                      <xsl:call-template name="PopulatePhoneNumber">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/PayersTelephoneNumber"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                <!-- (7) Winnings from identical wagers >>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>7</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Winnings from identical wagers</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinFromIdentWagersAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (8) Cashier >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>8</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Cashier</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinCashierId"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@5th Row -->
              <div class="styIRSW2GRowItem">
                <!-- WINNER’S name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">WINNER’S name</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsName"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (9) Winner’s taxpayer identification no.>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>9</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Winner’s taxpayer identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsIdNumber"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (10) Window >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>10</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Window</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinWindowNum"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@6th Row -->
              <div class="styIRSW2GRowItem">
                <!-- Street address (including apt. no.) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Street address (including apt. no.)</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <xsl:choose>
                      <xsl:when test="$FormW2GData/RecipientsUSAddress">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsUSAddress/AddressLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/RecipientsUSAddress/AddressLine2">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsUSAddress/AddressLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsForeignAddress/AddressLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/RecipientsForeignAddress/AddressLine2">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsForeignAddress/AddressLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                </div>
                <!-- (11) First I.D.>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>11</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">First I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientFirstAddtionalIDNum"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (12) Second I.D. >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>12</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Second I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSecondAddtionalIDNum"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@7th Row -->
              <div class="styIRSW2GRowItem">
                <!-- City, state, and ZIP code >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">City, state, and ZIP code</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                        <xsl:call-template name="PopulateCityStateInfo">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsUSAddress"/>
                          <xsl:with-param name="ForeignAddressTargetNode" select="$FormW2GData/RecipientsForeignAddress"/>
                        </xsl:call-template>
                        <span style="width:7px;"/>
                        <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsForeignAddress/Country"/>
                        </xsl:call-template>
                  </div>
                </div>
                <!-- (13) State/Payer’s state identification no. >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>13</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State/Payer’s state identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayersStateIdNumber"/>
                    </xsl:call-template>
                    <span style="width:2px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">State Abbreviation Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormW2GData/StateAbbreviationCd"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (14) State income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>14</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">State income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="border-bottom-width:0px;text-align:right;padding-right:3px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/StateTaxWithheldAmt"/>
                    </xsl:call-template>
                    <span style="width:2px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
            </div>
            <!-- END: Top Left  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <!-- BEGIN: Top Right ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GRightTopFrame" style="width:31.8mm;">
              <div style="width:100%;text-align:right;float:right;">
                <div class="styOMB" style="height:2mm;font-size:7pt;border-bottom-width:0px;">OMB No. 1545-0238</div>
                <div class="styTY">20<span class="styTYColor">11</span>
                </div>
                <span style="font-family:Arial;font-size:10pt;">
                  <b>Form W-2G</b>
                </span>
                <br/>
                <br/>
                <span style="font-family:Arial;font-size:8pt;">
                  <b>Certain<br/>Gambling<br/>Winnings</b>
                </span>
                <br/>
                <br/>
                <br/>
                <span style="font-family:Arial;font-size:6.5pt;">
                    For Privacy Act and<br/>
                    Paperwork Reduction Act<br/>
                    Notice, see the <b>2011</b>
                  <br/>
                  <b>
                      General Instructions for<br/>
                      Certain Information<br/>
                      Returns.<br/>
                    <br/><br/>
                      File with Form 1096.
                    </b>
                </span>
              </div>
            </div>
            <!-- END: Top Right \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Bottom Left /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GLeftBottomFrame">
              <div style="width:100%;text-align:left;padding-left:4mm;padding-top:3px;">
                <span style="font-family:Arial;font-size:6.3pt;">
                    Under penalties of perjury, I declare that, to the best of my knowledge and belief, the name, address, and taxpayer identification number that I have furnished
                    correctly identify me as the recipient of this payment and any payments from identical wagers, and that no other person is entitled to any part of these payments<br/>
                </span>
                <br/>
                <b>Signature</b>
                <span style="width:3px;"/>
                <img src="{$ImagePath}/w2g_Bullet_Sm.gif" alt="SmallBullet"/>
                <span style="width:87mm;"/>
                <b>Date</b>
                <span style="width:3px;"/>
                <img src="{$ImagePath}/w2g_Bullet_Sm.gif" alt="SmallBullet"/>
              </div>
            </div>
            <!-- END: Bottom Left \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Bottom Right ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GRightBottomFrame" style="width:31.5mm;">
              <div style="width:100%;text-align:right;float:right;">
                <div style="font-family:Arial;font-size:7.7pt;padding-top:5px;float:right;">
                  <b>Copy A<br/>For Internal Revenue<br/>Service Center</b>
                </div>
              </div>
            </div>
            <!-- END: Bottom Right \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Footer  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styGenericDiv">
              <span style="font-family:Arial;font-size:7pt;">
                <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top-width:0px;">
                  <div style="float:left;padding-top:0px;"> 
                      Form <span class="styBoldText" style="font-size:8pt;">W-2G</span>
                  </div>
                  <div style="float:left;">
                    <span style="width:35mm;"/>  
                    Cat. No. 10138V
                  </div>
                  <div style="float:right;">
                    <span style="width:40px;"/>  
                    Department of the Treasury - Internal Revenue Service
                  </div>
                </div>
              </span>
            </div>            
            <!-- END: Footer    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
          </div>

          <div class="pageEnd"><br/></div>

          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormW2GData"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControl"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 13 - State Abbreviation Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/StateAbbreviationCd"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 14 - Standard Or Non Standard Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
